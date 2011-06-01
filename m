Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRk6L-0000y7-8F
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 12:00:43 +0000
Received: by fxm14 with SMTP id 14so4937797fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 05:00:39 -0700 (PDT)
Subject: Re: U-Boot: using nand write to flash an ubi image, ubi part fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>, u-boot@lists.denx.de
In-Reply-To: <891190.21758.qm@web30201.mail.mud.yahoo.com>
References: <891190.21758.qm@web30201.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 14:56:15 +0300
Message-ID: <1306929375.4405.116.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-01 at 00:57 -0700, Lars Michael wrote:
> Hello,
> 
> Using mkfs.ubifs and ubinize I have created an image with 5 volumes.
> In Linux I could flash it using "ubiformat /dev/mtd1 -f /root/ubi.img"
> and attach it using "ubiattach /dev/ubi_ctrl -m 1". It worked.

OK.

> In production I would prefer to write the image from U-Boot. So in
> U-Boot I used "nand erase" then "nand write" to flash the image. Then
> I want to attach by "ubi part" command - but this fails: "UBI error:
> ubi_init: UBI error: cannot initialize UBI, error -17"

Sorry, I'm not familiar with U-boot, so probably cc-ing U-boot mailing
list would be a good idea.

> Then I booted Linux (via nfs) and tried to re-format+attach, but now
> it fails. Format complains about eraseblock contents and missing erase
> counters: 
> 
> ubiformat: warning!: 1099 of 2036 eraseblocks contain non-ubifs data
> ubiformat: warning!: only 937 of 2036 eraseblocks have valid erase
> counter

OK, this means that many eraseblocks in the flash contain some data
which does not look like UBI headers.

> 
> The ubiattach now reports lots of:
> ...
> UBI error: check_corruption: PEB 0 contains corrupted VID header, and
> the data does not contain all 0xFF, this may be a non-UBI PEB or a
> severe VID header corruption which requires manual inspection
> 
> UBI warning: process_eb: valid VID header but corrupted EC header at
> PEB 4
> ...

OK.

> I realize that the U-Boot 'nand erase' does not preserve the erase
> counters. So what would be the correct way to erase and write in
> U-Boot?

I do not know, you need to ask U-boot-aware people. I've CCed some.

>  And why is the ubiformat not able to correct the problems?

It should be able to format any flash. Probably this is a bug. Can you
reproduce this with nandsim please? Just insmod nandsim on your PC (see
http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim or
modinfo nandsim), write some garbage there or your image, and try to
format it.

If you can describe how I can reproduce this in my PC, I might look at
this. Or you can just debug ubiformat yourself.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
