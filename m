From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 12 Mar 2003 09:54:55 +0100
Subject: Unable to open console /start init - more info (jffs2)
In-Reply-To: <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com>
References: <003901c2e7ef$6ef75c60$150a0ac0@jbmsoft.com>
 <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com>
Message-ID: <200303120954.55244.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 11 March 2003 20:30, Brian T. wrote:
>
> But I don't see any JFFS2 output (formatting the blocks...etc...) on the
> 2.4.20 kernel I'm trying to get running:
> VFS: Mounted root (jffs2 filesystem) readonly.
Your root-fs is mounted with JFFS2-Filesystem

> Freeing unused kernel memory: 60k freed
> Warning: unable to open an initial console.

This message appears when your system tries to open /dev/ttyX and it is not 
there. The possible reasons for this are:
- Wrong root partition
- /dev/ttyX is not there
- The kernel was compiled without support for virtual termainals.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
