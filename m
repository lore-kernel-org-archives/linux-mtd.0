Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTGYU-0006s8-LO
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 16:19:47 +0000
Received: by bwz14 with SMTP id 14so3656589bwz.30
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Dec 2010 08:19:45 -0800 (PST)
Subject: Re: Static UBI volumes and ubiupdatevol ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Dec 2010 18:19:13 +0200
Message-ID: <1292516353.2364.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-15 at 09:06 +0100, Ricard Wanderlof wrote:
> Hi,
> 
> I've looked through the documentation on 
> http://www.linux-mtd.infradead.org but I can't find the answer to the 
> following question(s):
> 
> Using 'static' UBI volumes seems to be the preferred way of creating read 
> only file systems.

No, I think the _original_ idea behind static volumes was storing some
important r/o blobs there without any FS. So UBI static volumes simplify
this by making the volume size being = the contents size, even if the
contents size is not multiple of LEB size, and static volumes also
protect the data with CRC-32.

But UBIFS has its own CRC32 protection, so does not need UBI static
volume services.

> While it seems possible to use ubinize to make a complete ubi image 
> containing static volumes and then write it to the flash using ubiformat, 
> is it possible to update just a single volume using ubiupdatevol
> 
> I've tried using ubimkvol to create a static volume, then using 
> ubiupdatevol to write an ubifs image to it. That works, but when I try to 
> mount it subsequently I get things like
> 
> [ 6656.114000] UBIFS: static UBI volume - read-only mode
> [ 6656.129000] UBIFS error (pid 866): mount_ubifs: can't format empty UBI 
> volume: read-only UBI volume
> mount: mounting ubi1_0 on /volume1/ failed: Read-only file system
> 
> which in a way makes sense to me; if the volume is static = read only then 
> it shouldn't be possible to write to it.

This should work. You somehow wiped the volume instead of updating it,
may be used the -t option for ubiupdatevol.

> A related question: With static volumes, I assume you still get the 
> benefit of scrubbing, which in turn means that UBI can move the data 
> around if it deems necessary?

Yes, sure.

> Which begs a final question: is it possible to verify the integrity of a 
> static UBI volume?

All eraseblocks are protected with CRC-32. Fist time the static volume
is openend, it is checked. See the 'ubi_check_volume()' function. It is
also checked after it has been updated.

To force checking, you need to detach the whole mtd device, and
re-attach it. Or implement an ioctl for this, which is trivial to do.

>  Even with JFFS2, if mounted readonly the flash in that 
> particular partition is never written to,

The same with UBIFS - we never write when we are mounted R/O. There are
many ubifs_assert()s to check this as well.

>  so it is possible to use a 
> simple checksum to verify data integrity.

You can do this with UBIFS I think, did not try though.

>  With JFFS2 this can be 
> important, as missing JFFS2 nodes don't necessarily result in mount time 
> or run time failures, it just results in missing files or parts of files.

Yeah, I think UBIFS will yell and  switch to R/O mode if one of the
nodes is missing or corrupted.

The difference between JFFS2 and UBIFS is that JFFS2 cannot distinguish
between nodes corrupted because of power cuts, and nodes corrupted
because something bad happened to the flash. UBIFS does better job here
- it recovers only from errors which could possibly be caused by power
cuts, and it switches to R/O mode for other errors.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
