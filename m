Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKUkk-0001hZ-7x
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 12:12:30 +0000
Received: by ewy3 with SMTP id 3so476200ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 05:12:24 -0700 (PDT)
Subject: Re: UBI bad image sequence number error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alex Levin <s.alex.levin@gmail.com>
In-Reply-To: <BANLkTi=0DP6QE9eLK6wS4L3gNv2Mb9ib+A@mail.gmail.com>
References: <BANLkTi=0DP6QE9eLK6wS4L3gNv2Mb9ib+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 15:09:00 +0300
Message-ID: <1305202140.2713.113.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-11 at 17:56 +0300, Alex Levin wrote:
> Hi,
> 
> I am working on a mips embedded system, and I'm trying to do is to
> read a ubifs image(that went through mkfs and ubinize) from ram - the
> CPU that linux runs on doesn't aware that its not from the NAND - I
> have changed the NAND access API implementation.
> I use a 6 MB static volume (when ubinizing) and I use a 10MiB ram, and
> that is the size I pass to the mtd device.

Did not understand this, sorry.

> After trying to attach I get the following error:
> UBI: attaching mtd0 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI error: process_eb: bad image sequence number 1726164069 in PEB 47,
> expected 648536469
> UBI error: ubi_init: cannot attach mtd0
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -22

This error means that the flash or whatever you feed to UBI contains
more than one UBI image. It is easier to explain why we added this image
sequence number thing. We had subtle bugs because of the following:

1. flash is contains UBI and used for some time.
2. you flash a new image incorrectly - you do not erase _whole_ flash
3. you flash a new image - by erasing only the erase blocks where you
write, but not erasing the rest of eraseblock.

Result is - you have your new image, and then pieces of the old image.
UBI thinks that the pieces of the old image are parte of your new image
and you get various nasty effects.

The image sequence number makes UBI notice that situation and complain.

Use ubiformat to flash your images - it will get things right:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img

Or use 'flash_eraseall' before writing your image.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
