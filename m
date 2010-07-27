Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdeBv-0004b6-NH
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 07:03:08 +0000
Received: by gwb10 with SMTP id 10so461641gwb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 00:03:05 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Jul 2010 09:03:05 +0200
Message-ID: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>
Subject: mkfs.ubifs gives corrupt images/crc errors
From: Leo Barnes <barnes.leo@gmail.com>
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

Hello!

The recent versions of mkfs.ubifs in the mtd-utils gives corrupt
images for me. I get the following error messages when trying to mount
the ubi-volume:

<3>[  711.246826] UBIFS error (pid 413): ubifs_check_node: bad CRC:
calculated 0x1f8f89ca, read 0xbb39064c
<3>[  711.247558] UBIFS error (pid 413): ubifs_check_node: bad node at LEB 0:0
<3>[  711.247924] UBIFS error (pid 413): ubifs_read_node: expected node type 6

I have identified it as being broken since (approximately) after
commit 004760f969175da7392dd02bb4fa14164ff46c1e (Wed Jun 16 09:47:27
2010 +0300). Two or three of the commits after this one refuse to
build with various make errors, and the next one that builds gives
corrupt images. It seems to have something to do with the CRC
calculation.

Best regards,
//Leo
