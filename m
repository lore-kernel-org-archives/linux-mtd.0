Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K4daQ-0000yE-SA
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 15:10:39 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m56FAZ7r009255 for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2008 08:10:36 -0700 (MST)
Received: from ld0162-tx32.am.freescale.net (ld0162-tx32.am.freescale.net
	[10.82.19.112])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id m56FAY1D028116
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2008 10:10:35 -0500 (CDT)
Date: Fri, 6 Jun 2008 10:10:34 -0500
From: Scott Wood <scottwood@freescale.com>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: fix section mismatch between
	probe and remove
Message-ID: <20080606151034.GA21080@ld0162-tx32.am.freescale.net>
References: <20080606145940.GA25327@polina.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080606145940.GA25327@polina.dev.rtsoft.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 06, 2008 at 06:59:40PM +0400, Anton Vorontsov wrote:
> WARNING: drivers/mtd/nand/built-in.o(.devinit.text+0x114): Section mismatch
> in reference from the function fsl_elbc_ctrl_probe() to the function
> .devexit.text:fsl_elbc_ctrl_remove()
> 
> __devinit functions should not call functions with __devexit. Since probe
> function calls remove in case of errors, we want to remove __devexit
> attribute from it.
> 
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
