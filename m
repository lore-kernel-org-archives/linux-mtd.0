From: btuch@usa.net (Brian T.)
Date: Wed, 12 Mar 2003 12:27:04 -0600
Subject: Unable to open console /start init - more info (jffs2)
References: <003901c2e7ef$6ef75c60$150a0ac0@jbmsoft.com> <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com> <200303120954.55244.tglx@linutronix.de>
Message-ID: <001501c2e8c4$fbadca60$150a0ac0@jbmsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thanks for the reply.

> - The kernel was compiled without support for virtual terminals.
I tried adding in virtual console support, and I just get a bunch of
pc_keyb: controller jammed (0x17) errors, and then it times out
and keeps booting, eventually with the same end result.

> - /dev/ttyX is not there
 /dev/console and /dev/ttyS0 *should* be there.  I haven't changed anything
with the that part of the Makefile which creates those files, all though
maybe thats
part of the problem; maybe this newer version of JFFS2 doesn't like the way
they
are created.  All the /dev/ files are created with example: "touch
./somedir/dev/@console,c,5,1"
which worked fine with the older distro I'm using. The jffs2 images is then
made
on ./somedir/.

> - Wrong root partition
My root partition is MTD partition #1.  When the kernel comes up, so I need
to specify which partition to use as root?  Or does it scan them and use the
first one it finds?  If I need to specify which one is to be mounted as the
root partition, any idea how I do that?

If I removed /sbin/init from the build and put my flash image on the ROMFS,
then main.c gets past the first init trial, and attempts the others, and
then fails.  If I
leave it there, then it stops at /sbin/init, which I believe proves that it
is mounting the right MTD partition; but am still unsure.

Kind regards,

-Brian
