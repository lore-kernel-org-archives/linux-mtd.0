Received: from gate.epygi.de ([212.126.211.241])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7ccv-0008RR-6I
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 16:22:53 +0100
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Eugeny Mints" <eugeny.mints@auriga.ru>
Date: Thu, 9 Oct 2003 17:21:52 +0200
Message-ID: <NGENJJFPMHGLPILEKKAMKEIBCDAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
In-Reply-To: <5B439D84E6653F4AA2E14A5D8898A7E163D806@auriga.auriga.ru>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eugeny,

maybe some problem with the flash "ready" detection?

Stephan

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Eugeny Mints
> Sent: Donnerstag, 9. Oktober 2003 17:04
> To: linux-mtd@lists.infradead.org
> Cc: Dmitry Pervushin
> Subject: NAND flash
> 
> 
> Hello,
> 
> Could anybody help me to solve such a problem with JFFS2 and NAND flash:
> - the NAND flash Toshiba TC58256AFTI
> - kernel 2.4.22 with latest MTD and JFFS2 
> - handy-written miniport for the paticular flash chip
> 
> The device works OK almost in any case, but when I try to execute  while
> true; do dd if=/dev/zero of=/dev/mnt/foo count=1000; done after 10-15
> minutes the system hangs; I cannot login from console or via telnet, but
> it is still ping'able. I tried to use YAFFS, perform dd to device itself
> instead of file on the filesystem on top of flash - no hangs were
> observed.
> 
> Could anybody help me, please? 
> --
> cheers, dmitry pervushin
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
