From: hno@marasystems.com (Henrik Nordstrom)
Date: Wed, 26 Feb 2003 01:31:11 +0100
Subject: "Hot" updating root-mounted mtd partitions
In-Reply-To: <3E5C016C.4070700@elitedvb.net>
References: <3E5C016C.4070700@elitedvb.net>
Message-ID: <200302260131.11190@henrik.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 26 February 2003 00.51, Felix Domke wrote:

> Of course updating it (be it from internet, from satellite or
> whatever) includes erasing and rewriting the root. This naturally
> causes troubles. How can i avoid this?

Have the system load the filesystem into ram at startup, and run from 
there.. can very easily by done by loading the root as an initrd.. 
this obviously assumes your root is relatively small.

or have two partitions, and only update the one not currently running 
and then update the boot loader nvram to load the "other" image after 
a successful upgrade.

> Possibilities are:
>   - remount rootfs using an in-memory-copy (ramfs), but i don't
> think this is possible, since there are many open files in the old
> fs. - including ugly hacks in the flash driver, mainly by copying
> the partition to RAM and redirect accesses to that backup while
> flashing the rootfs
>
> both possibilities suck.

Of these, a devise layer hack sounds most appealing, but you should 
also consider what happens on partial upgrades etc..

You might actually be able to pivot_root into a ram based rootfs while 
upgrading, but almost certainly involves a near complete shutdown to 
terminate all applications before the actual upgrade starts..

Regards
Henrik
