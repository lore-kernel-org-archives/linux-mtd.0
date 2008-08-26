Received: from web63406.mail.re1.yahoo.com ([69.147.97.46])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KY9Qt-00031y-NW
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 01:02:48 +0000
Date: Tue, 26 Aug 2008 16:32:59 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
Subject: Nor Flash interface problem
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <230637.86188.qm@web63406.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm working with a variant of ppc440 taishan board.
here's the setup.
a) 2 spansion 1gb part connected to one of the ~percsX (peripheral select). they are in x16 mode and interlaced.
b) _NO_ byte write/read. _only_ word reads (32 bits). ppc address a0-a4 is  NC.

Problem is percX can only address 128mb (which was realized later).
And the flash part is 256mb. Flash start address 0xf000:0000.

As a mod we have one of the gpio connected to A25 pin of the flash parts.
Such that any of the two 128mb "areas" can be accessed.
gpioX = 0, then f000:0000 -> f7ff:ffff
gpioX = 1, f800:0000 -> ffff:ffff

I'm trying to configure the mtd drivers such that when the the lower 128 is
accessed i.e base + 128mb the gpio is set to 0 and if its above f7ff:ffff 
the i assert A25(using gpio) to access the upper 128.

1) what the best place to have this check ? I'm thinking of having it under include/linux/mtd/cfi.h, cfi_read cfi_write etc..
    a) Or any other ideas to tackle this would also be appreciated.  

Any insights would be appreciated. 
TIA





      
