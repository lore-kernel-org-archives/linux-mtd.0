Received: from web52701.mail.yahoo.com ([206.190.39.152])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CfRL5-0000xD-CL
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 18:16:49 -0500
Message-ID: <20041217231645.79122.qmail@web52701.mail.yahoo.com>
Date: Fri, 17 Dec 2004 15:16:45 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Rootfs choice ideas
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.  I was wondering if you could comment on some of my ideas
regarding a root filesystem choice.  I did some simple searches on
google, but didn't find what I was looking for.  I thought this
list was the most appropriate to post to.

I have an embedded system, using only NAND flash.  This stores my
bootloader, kernel, and root filesystem.  The bootloader and kernel
are protected by using the same block ECC mechanisms that JFFS2
uses. I write them (mtd0 and mtd1) with nandwrite -j, and read them
(correcting bits using the ECC as necessary) in my bootloader.  I
could further protect them (in case of powerfail during updating)
by having another copy (either mirrored or failsafe) of each, using
a CRC or similar to check the validity of the entire image.

Now, I'm unclear as to the best way to protect the root filesystem
and its files against accidental corruption; Either by flash errors
or by a logical error (e.g. in the update procedure).

Currently, we're using JFFS2 as the root filesystem, in read-write
mode.  It's nice, as it provides power-fail safety, wear levelling
and such.  And we can modify files freely.

However, there seem to be some disadvantages:
 1. Instead of versioning a fixed filesystem image (which you could
do  with cramfs or initrd), you now manage a collection of files
each of which could change independently.
 2. It would be hard or impractical to check the entire image for
consistency, as you could with a cramfs image.
 3. I could perhaps run into problems when updating it, for
instance if the update fails part-way through.
 4. There seems to be some overhead in scanning the rootfs at boot
time (yeah, there are recent changes that speed this up), and
garbage collection running in the background. (which is a seperate
issue)

So, it's acting very much like a desktop (which can possibly
develope cruft), and very little like an embedded device (which
typically can't change).

Does anyone share some of these same concerns (or perhaps others as
well)?  What schemes have you used or seen, and how do they
compare?

These are some ideas I've been throwing around:

1. Use a non-changing cramfs or initrd root filesystem, mounting
/var and /tmp in ram, using tmpfs.
Then I can verify and version this rootfs as a whole, perhaps
storing multiple copies.

2. Use JFFS2 only for logs, application data and config (and
perhaps the application itself).

3. Allow updating when booting (the static rootfs in idea #1 could
check for the existance of an update file (I'm going to use a USB
flash drive), and use that to update the system while it's safe to
overwrite anything and everything.

4. If any base OS files need to change (modules, /etc/*, ...), they
can be stored on the JFFS2 rootfs and overwrite the base ones.
(kind of like Knoppix or DSL do)


How do these ideas sound?
Am I too paranoid?  going about this the wrong way?  misinformed?

Any feedback would be great.
Thanks in advance.
Mike
