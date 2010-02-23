Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjiCO-0001Qi-TI
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 00:00:29 +0000
Received: by pva18 with SMTP id 18so187605pva.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 16:00:19 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 22 Feb 2010 16:00:19 -0800
Message-ID: <cf70f0211002221600p1de3b271uba65cda8dbcf6b94@mail.gmail.com>
Subject: read error with 64 byte erase counter header & 2048 Byte
	mtd->writesize
From: Shivdas Gujare <shivdas.tech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I am trying to use ubifs, but currently I am facing an issue as follows,

1) I tries to format a mtd device as, "ubiformat /dev/mtd0 -s 2048 -f
./ubi.img" while it return with an error of

ubiformat: mtd0 (nand), size 164757504 bytes (157.1 MiB), 1257
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 0 --  0 % complete  libmtd: error!:
cannot read 64 bytes from mtd0 (eraseblock 0, offset 0)
        error 22 (Invalid argument)
ubiformat: error!: failed to scan mtd0 (/dev/mtd0)

I tried to understand what it is and came to know that, "ret =
mtd_read(mtd, fd, eb, 0, &hdr, sizeof(struct ubi_ec_hdr));" from
"ubi-utils/src/libscan.c"
tried to read 64 byte "struct ubi_ec_hdr - UBI erase counter header"
while our MTD driver has set "mtd->writesize = 2048"
So this mismatch between 64 Byte "erase counter header" and 2048 Byte
"mtd->writesize" returns with an error.

I would like to know, Is this a real issue or am I missing any layer
between ubifs & mtd driver which interfaces this 64 & 2048 Byte
differences.

Thanks a lot for any help.

Thanks and Regards,
Shivdas Gujare


2)
