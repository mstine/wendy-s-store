package com.mattstine.wendysstore.domain

import com.mattstine.wendysstore.domain.User

/**
 * Authority domain class.
 */
class Role implements Serializable {

	static hasMany = [people: User]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
