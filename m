Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dnmsI-0005lw-HB
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 14:24:48 +0000
Received: from localhost.localdomain ([127.0.0.1]:59218 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S23993907AbdIAOYRiw3nX (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Fri, 1 Sep 2017 16:24:17 +0200
Date: Fri, 1 Sep 2017 16:23:55 +0200
From: Ralf Baechle <ralf@linux-mips.org>
To: Mark Brown <broonie@kernel.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-spi@vger.kernel.org,
 linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, john@phrozen.org,
 hauke.mehrtens@intel.com
Subject: Re: Applied "spi: spi-falcon: drop check of boot select" to the spi
 tree
Message-ID: <20170901142355.GB31297@linux-mips.org>
References: <20170417192942.32219-4-hauke@hauke-m.de>
 <E1dnjTy-0006AD-Ox@debutante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1dnjTy-0006AD-Ox@debutante>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 01, 2017 at 11:47:26AM +0100, Mark Brown wrote:

> The patch
> 
>    spi: spi-falcon: drop check of boot select
> 
> has been applied to the spi tree at
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

Thanks Mark - but there are some ordering dependencies in Hauke's
patch series so it would be great if I could have an Acked-by to merge
this patch through the MIPS tree along with the rest of Hauke's series.

  Ralf
