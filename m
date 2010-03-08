Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Noez5-0006U2-Lz
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2010 15:35:11 +0000
Received: by wwb13 with SMTP id 13so3117329wwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Mar 2010 07:35:06 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 8 Mar 2010 16:35:05 +0100
Message-ID: <804f0d21003080735q49fb834bo3369987059b17208@mail.gmail.com>
Subject: flashcp failed (bad block)?
From: Arno Steffen <arno.steffen@googlemail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used the mtd-utils to flash a partition on my system on a running
linux. This time I get an error:

flashcp -v /tmp/mtd5 /dev/mtd5
Erasing blocks: 24/320 (7%)
While erasing blocks 0x002e0000-0x00300000 on /dev/mtd5: Input/output error

So I tried to erase the partition:

flash_eraseall -j /dev/mtd5
Erasing 128 Kibyte @ 2c0000 --  6 % complete.
Skipping bad block at 0x002e0000
Erasing 128 Kibyte @ 27e0000 -- 99 % complete.

Until now I have been sure that flashcp can handle bad blocks? Am I wrong?
What can I do?

flashcp works with same image file on other partition /dev/mtd6 which
have the same size.

Best regards
Arno
