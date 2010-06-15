Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOf9t-0000tT-BY
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 23:03:06 +0000
Received: by bwz11 with SMTP id 11so2993669bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jun 2010 16:03:02 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Jun 2010 00:03:02 +0100
Message-ID: <AANLkTimAdhNT_WGSk6CwmRNAOjGfWkXv_Oj2I3cSlDKk@mail.gmail.com>
Subject: ubiattach fails
From: Alex Boag-Munroe <boagenator@gmail.com>
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

Hey folks, quick question.  I'm playing, or at least trying to play,
with ubifs on my HTC Hero.  Running ubiattach /dev/ubi_ctrl -m 4 gives
the error:

ubiattach: error!: cannot attach mtd4 error 22 (Invalid argument)

I get the following in dmesg:

[  779.384338] UBI: attaching mtd4 to ubi0
[  779.385253] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[  779.385742] UBI: logical eraseblock size:    126976 bytes
[  779.386627] UBI: smallest flash I/O unit:    2048
[  779.387115] UBI: VID header offset:          2048 (aligned 2048)
[  779.387969] UBI: data offset:                4096
[  779.389251] msm_nand_read_oob: unsupported ops->len, 64
[  779.390319] msm_nand_read_oob: unsupported ops->len, 64
[  779.390777] msm_nand_read_oob: unsupported ops->len, 64
[  779.391021] msm_nand_read_oob: unsupported ops->len, 64
[  779.391448] UBI error: ubi_io_read: error -22 while reading 64
bytes from PEB 0:0, read 0 bytes

I would appreciate any help anyone can provide, thank you.

-- 
Alex Boag-Munroe

Lack of planning on your part does not constitute an emergency on mine.
