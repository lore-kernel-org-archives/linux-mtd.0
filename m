Received: from mail3.efi.com ([192.68.228.90] helo=fcexgw03.efi.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwqN8-0002DJ-AF
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 22:22:18 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Feb 2004 14:21:56 -0800
Message-ID: <9961BDB14162AA47A39FF91932F1AE440ADF54@fcexmb01.efi.internal>
From: "Ranjan Parthasarathy" <Ranjan.Parthasarathy@efi.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 on Nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

How do I make a JFFS2 image for a NAND device with the OOB data included =
in
the image. I have the new mkfs.jffs2 and related utils from cvs.=20

Currently when I run=20
# nandwrite -j -o /dev/mtd/1 jffs2.img
I get the following message-
Input file is not page aligned: Success

The jffs2.img was created using mkfs.jffs2 -r <root> -o jffs2.img

Any info would be greatly appreciated.

Thanks

Ranjan
