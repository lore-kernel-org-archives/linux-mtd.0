Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UEfp-0003bz-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 22:18:17 +0000
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: <robert@schwebel.de>, <linux-mtd@lists.infradead.org>
Subject: RE: Cf Card vs DiskOnChip
Date: Fri, 25 Jan 2002 17:28:26 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKGEEOCCAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0201251422090.30477-100000@callisto.local>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

You do not really need 128m.  You may be starting from the worng direction.

I've seen 2 approaches to embedded stuff..

First:

Start with an install of RedHAt 7.2 and strip it down!

Second:

Start with a empty directory and add to it.


99% of the time the First method will yield a huge image of stuff not
needed.  Including libraries.

If you are missing something in the second methiod then you'll know real
fast.  And add it.

I'm a little curious as to what people are doing with JFFS2.  I have 2
partions on my flash.  1 is ext2.  2nd is raw.  Raw is used to store
configs, data etc..
ext2 is used to store kernel, initrd and software image.  At boot initrd
reads the image and loads to a ramdisk.  Kernel mounts that ramdisk as root.
User never deals with the DOC2000 unless they flash and upgrade, save a
config, get ssh keys, or get serial number.  The sw image is an encrypted
ext2 disk image.

Questions:

Why do you need to mount your flash as r/w?
What else are you using the JFFS2 for?

If my box looses power then it comes back up no damage.  If you delete every
file, it comes back up now damage.

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Robert Schwebel
Sent: Friday, January 25, 2002 8:23 AM
To: linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip


On Fri, 25 Jan 2002, Ramya Ravichandran wrote:
> > > With 128MB I need to get the whole thing running.
> >
> > Why on earth do you need so much storage?
> >
> I need to have an application running on it with
> serial communication

If you don't need anything else 2 MB flash are enough. Remember, this is
Linux, not <beeeeep!> :-)

Robert
--
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
