From: btuch@usa.net (Brian T.)
Date: Thu, 13 Mar 2003 07:06:44 -0600
Subject: Unable to open console /start init - more info (jffs2)
References: <003901c2e7ef$6ef75c60$150a0ac0@jbmsoft.com> <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com> <200303120954.55244.tglx@linutronix.de> <001501c2e8c4$fbadca60$150a0ac0@jbmsoft.com>
Message-ID: <001301c2e961$65c7d610$0200a8c0@athlon1200>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I got it working.  It was the way the devices were not being created with
mknod, but with "touch /dev/@console,c,5,1"...etc.....

Don't know  why it stopped working with a newer version kernel/jffs2 image
maker, but I'm happy now.  Thanks for the help!

-Brian


----- Original Message -----
From: "Brian T." <btuch@usa.net>
To: <tglx@linutronix.de>; <linux-mtd@lists.infradead.org>
Sent: Wednesday, March 12, 2003 12:27 PM
Subject: Re: Unable to open console /start init - more info (jffs2)


> Thanks for the reply.
>
> > - The kernel was compiled without support for virtual terminals.
> I tried adding in virtual console support, and I just get a bunch of
> pc_keyb: controller jammed (0x17) errors, and then it times out
> and keeps booting, eventually with the same end result.
>
> > - /dev/ttyX is not there
>  /dev/console and /dev/ttyS0 *should* be there.  I haven't changed
anything
> with the that part of the Makefile which creates those files, all though
> maybe thats
> part of the problem; maybe this newer version of JFFS2 doesn't like the
way
> they
> are created.  All the /dev/ files are created with example: "touch
> ./somedir/dev/@console,c,5,1"
> which worked fine with the older distro I'm using. The jffs2 images is
then
> made
> on ./somedir/.
>
> > - Wrong root partition
> My root partition is MTD partition #1.  When the kernel comes up, so I
need
> to specify which partition to use as root?  Or does it scan them and use
the
> first one it finds?  If I need to specify which one is to be mounted as
the
> root partition, any idea how I do that?
>
> If I removed /sbin/init from the build and put my flash image on the
ROMFS,
> then main.c gets past the first init trial, and attempts the others, and
> then fails.  If I
> leave it there, then it stops at /sbin/init, which I believe proves that
it
> is mounting the right MTD partition; but am still unsure.
>
> Kind regards,
>
> -Brian
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>





>From Gregg  Thu Mar 13 19:50:56 2003
From: Gregg (Gregg)
Date: Thu, 13 Mar 2003 19:50:56 -0500
Subject: DoC image building and Linux, and something else
Message-ID: <000001c2e9c3$c8c8e9e0$f8a6580c@who5>

Hello from Gregg C Levine
I am having a few problems reconciling the ideas behind building the
DoC image from Linux tools. I use the Slackware distributions, whereas
M-Sys staff chose Red Hat, notably the 6.2 distribution. So, has
anyone on this list, used the tools found in the Slackware
distributions too build a DoC image?=20

I am surmising that the methods are the same, but I am inviting
comments from the group as to the right or wrong of this surmise.
Also, the same problems that surfaced regarding M-Sys, and the image,
are surfacing for GRUB, and the DoC image. I just follow the
instructions contained within the read me file that was created,
right?

Now the "something else" issue. The modules directory for 2.4.20,
contain one named library, and they contain the zlib library, as
constructed during those steps. Are those the ones that the mtd
directory is concerning itself with? And how can I get around the
crc32 complaints during the building of the utilities? If anyone needs
to see evidence of that problem please ask, and I shall produce a
script file which indicates it.
-------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
