Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ENVpX-0006oe-7s
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2005 09:30:55 -0400
Received: from dslc-082-082-157-240.pools.arcor-ip.net ([82.82.157.240]:34712
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1ENVrB-0008Kg-7Y
	for <linux-mtd@lists.infradead.org>; Thu, 06 Oct 2005 15:32:21 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1ENVqE-0006ti-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Oct 2005 15:31:22 +0200
Date: Thu, 6 Oct 2005 15:31:22 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20051006133122.GA26508@zappa>
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
	<20051005114511.GB31190@zappa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051005114511.GB31190@zappa>
Subject: Re: XIP fails on kernels  2.6.12 and higher
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Konstantin Kletschke <lists@ku-gbr.de> [Wed, Oct 05, 2005 at 01:45:11PM +0200]:

> My 2.6.13 breaks near the same location:

In order to try debugging this I found out, that ther Kernel boots
if I disable jffs2 support ... weird...

K
