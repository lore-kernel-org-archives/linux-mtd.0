Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PlKfS-0000zU-RQ
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 12:21:39 +0000
Received: by iwn38 with SMTP id 38so2131852iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Feb 2011 04:21:37 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 4 Feb 2011 13:21:15 +0100
Message-ID: <AANLkTikmtAL7gAMwrekqiZHa=oCDqAn+K5VaVc24L4jz@mail.gmail.com>
Subject: jffs2-filesystem
From: Arno Steffen <arno.steffen@googlemail.com>
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

I do have a question to jffs2 (using NAND flash).
My filesystem is almost empty, only a few bytes are in (see below)

...
0000120 0016 0000 0000 0000 4bed 98b5 e4ac 7bbe
0000130 6956 6f73 2072 3156 2030 202d 6f79 7275
0000140 6e20 6d61 0a65 ffff

Flashing this file to an emtpy flash (all is 0xff)I see this also in flash

If I do some fileoperation (touch a; touch b; touch c) the flash
changes to something like that (schematic):

0000130 6956 6f73 2072 3156 2030 202d 6f79 7275
0000140 6e20 6d61 0a65 ffff  ffff ffff  ....

0000800 6956 6f73 2072 0000 0000....

0001000 6e20 6d61 0a65 0000 0000 ....

0001800 6956 6f73 2072 0000 0000 ...

So it will write (multiples of )0x800 bytes and pad the not used bytes
with "00".
This is different to the original flashed file, which is padded with 0xff.
But finally this gives me a message: "empty flash at 0x148 .... 0x800".

--------

It seems that flashing of filesystem goes wrong as it is not padded to
a boundary of 0x800 with 0x00.
But I couldn't found any option in mkjffs2 to generate such files ..
Can you solve that riddle?

Best regards
Arno
