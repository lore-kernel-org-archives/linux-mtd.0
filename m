Received: from mail-fx0-f217.google.com ([209.85.220.217])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NqkV5-0000J7-TA
	for linux-mtd@lists.infradead.org; Sun, 14 Mar 2010 09:52:55 +0000
Received: by fxm9 with SMTP id 9so2648303fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Mar 2010 01:52:43 -0800 (PST)
Subject: Re: read error with 64 byte erase counter header & 2048 Byte
	mtd->writesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shivdas Gujare <shivdas.tech@gmail.com>
In-Reply-To: <cf70f0211002221600p1de3b271uba65cda8dbcf6b94@mail.gmail.com>
References: <cf70f0211002221600p1de3b271uba65cda8dbcf6b94@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 14 Mar 2010 11:50:35 +0200
Message-Id: <1268560235.2399.5.camel@localhost.localdomain>
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

Hi,

On Mon, 2010-02-22 at 16:00 -0800, Shivdas Gujare wrote:
> Hi all,
> I am trying to use ubifs, but currently I am facing an issue as follows,
> 
> 1) I tries to format a mtd device as, "ubiformat /dev/mtd0 -s 2048 -f
> ./ubi.img" while it return with an error of
> 
> ubiformat: mtd0 (nand), size 164757504 bytes (157.1 MiB), 1257
> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 0 --  0 % complete  libmtd: error!:
> cannot read 64 bytes from mtd0 (eraseblock 0, offset 0)
>         error 22 (Invalid argument)
> ubiformat: error!: failed to scan mtd0 (/dev/mtd0)

Most probably your NAND driver is broken and is unable to read 64 bytes.

> I tried to understand what it is and came to know that, "ret =
> mtd_read(mtd, fd, eb, 0, &hdr, sizeof(struct ubi_ec_hdr));" from
> "ubi-utils/src/libscan.c"
> tried to read 64 byte "struct ubi_ec_hdr - UBI erase counter header"
> while our MTD driver has set "mtd->writesize = 2048"
> So this mismatch between 64 Byte "erase counter header" and 2048 Byte
> "mtd->writesize" returns with an error.

Your min. I/O unit is indeed 2048 bytes. However, MTD drivers are
supposed to be able to read any amount of bytes. In this case, your
driver should read 2048 bytes, then copy the requested 64 bytes to the
output buffer.

> I would like to know, Is this a real issue or am I missing any layer
> between ubifs & mtd driver which interfaces this 64 & 2048 Byte
> differences.

UBI/UBIFS write only in min. I/O size aligned units, but read in
arbitrary aligned units.

You should debug fix your driver.

And validate it with the mtd tests, just like it is requested here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
