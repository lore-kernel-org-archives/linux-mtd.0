Received: from fep02.superonline.com ([212.252.115.9])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vgNC-0008AH-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 15:48:14 +0100
Received: from yunux ([212.253.56.213]) by fep02.superonline.com
          (InterMail vK.4.03.02.00 201-232-124 license 82877460054e144bf0b390e626dd66fc)
          with SMTP id <20011022145535.ELPW23653.fep02@yunux>
          for <linux-mtd@lists.infradead.org>;
          Mon, 22 Oct 2001 17:55:35 +0300
Content-Type: text/plain;
  charset="iso-8859-9"
From: Yunus Yucel Altunbicak <yunus.altunbicak@eliar.com.tr>
To: MTD <linux-mtd@lists.infradead.org>
Subject: DOC millenium on vz328 processor
Date: Mon, 22 Oct 2001 17:57:54 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011022145535.ELPW23653.fep02@yunux>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,
my embedded linux system is ucdimm(mc68vz328 processor) and i compiled linux 
kernel 2.4.6 with mtd driver(included, i couldn't compile the mtd driver be a 
module :)) for DOC millenium(DIP version)but i got below error.

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Possible DiskOnChip with unknown ChipID 42 found at 0x10e00000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftlcore.c,v 1.73 2001/06/09 01:09:43 dwmw2 Exp $

*the chip id 42 is correct, if not what should be correct chip id of doc 
millenium for dip version?
*is there any document about porting the doc millenium with mtd driver to any 
embedded system?

Sincerely,
Yunus

sorry for my poor english :)
