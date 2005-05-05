Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTa28-0007h9-UZ
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 02:40:30 -0400
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Ryan B. Lynch" <rlynch@bway.net>
Message-ID: <20050505064027.GA30976@wohnheim.fh-wedel.de>
References: <4279BBD2.7090408@bway.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4279BBD2.7090408@bway.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Setting up multiple 'blkmtd' devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 05 May 2005 06:40:31 -0000


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, 5 May 2005 06:23:14 +0000, Ryan B. Lynch wrote:
> 
> I've been using the 'blkmtd' driver as a module, and I understand that 
> the only way to set up the device association and create a 
> 'dev/mtdblock/*' device is to load the module with the option 
> 'device=/dev/xxx'.
> 
> Couple of questions:
> 
>    - Is it possible to load more than one device during the 'modprobe' 
> command, with something like multiple "device=xxx" options?  I tried 
> that exactly, and it doesn't seem to work--it only loads the first 
> device listed.

Nope, but that should work for block2mtd.  If it doesn't work, it's a
bug and I'll fix it.

>    - Is it possible to set up additional blkmtd devices after the 
> module has loaded?  If I issue the command 'modprobe blkmtd 
> device=/dev/hdc1', is it possible to add another device later without 
> unloading the module?

Works for block2mtd.  If not, see above.

>    - When I've compiled the 'blkmtd' driver into the kernel, I 
> understand that I can associate the block device at boot time with the 
> boot parameter "blkmtd_device=/dev/xxx".  If I don't pass a 
> "blkmtd_device=" parameter at boot-time, is there any way to associate a 
> device later on?

For block2mtd there is.

>    - Given the compiled-in scenario for the 'blkmtd' driver, is it 
> possible to bring in multiple devices, regardless of whether the 
> boot-time parameter is passed?

dito

>    - Is there a userspace tool, along the lines of 'losetup' or 
> 'brctl', that allows you to manipulate/query blkmtd devices without 
> using the module options?

This doesn't exist for block2mtd yet.  Not sure if that's really
necessary.

> I hope these are straightforward enough.  Thanks for the time.

Blkmtd is old and completely broken wrt. parameter handling.  Imo,
it's unfixably broken, so I fixed things up in a new driver.  But I
broke things as well, so you need to apply a patch to 2.6.11 for it to
work.  Should be attached to this mail.

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="block2mtd_embarrassment.patch"
Content-Transfer-Encoding: 8bit



Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 drivers/mtd/devices/block2mtd.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.11cow/drivers/mtd/devices/block2mtd.c~block2mtd_embarrassment	2005-03-07 21:19:16.000000000 +0100
+++ linux-2.6.11cow/drivers/mtd/devices/block2mtd.c	2005-03-07 21:24:47.000000000 +0100
@@ -4,7 +4,6 @@
  * block2mtd.c - create an mtd from a block device
  *
  * Copyright (C) 2001,2002	Simon Evans <spse@secret.org.uk>
- * Copyright (C) 2004		Gareth Bult <Gareth@Encryptec.net>
  * Copyright (C) 2004,2005	Jörn Engel <joern@wh.fh-wedel.de>
  *
  * Licence: GPL
@@ -157,7 +156,7 @@ static int block2mtd_read(struct mtd_inf
 	struct block2mtd_dev *dev = mtd->priv;
 	struct page *page;
 	int index = from >> PAGE_SHIFT;
-	int offset = from & (PAGE_SHIFT-1);
+	int offset = from & (PAGE_SIZE-1);
 	int cpylen;
 
 	if (from > mtd->size)

--PEIAKu/WMn1b1Hv9--
