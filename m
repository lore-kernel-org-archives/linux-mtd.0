Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]
 helo=mo5.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TEZH6-0001xW-MN
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 05:26:09 +0000
Received: from mail404.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id F206CFF94E6
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 07:31:55 +0200 (CEST)
Date: Thu, 20 Sep 2012 07:23:33 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: fix the compile error which miss
 label "err_ecc_ioremap".
Message-ID: <20120920052333.GC17667@game.jcrosoft.org>
References: <1347347412-24214-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1347347412-24214-1-git-send-email-josh.wu@atmel.com>
Cc: vikram186@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:10 Tue 11 Sep     , Josh Wu wrote:
> Add err_ecc_ioremap label to fix following errors:
> ---8<--- 
>   CC      drivers/mtd/nand/atmel_nand.o
> drivers/mtd/nand/atmel_nand.c: In function 'atmel_nand_probe':
> drivers/mtd/nand/atmel_nand.c:1423: error: label 'err_ecc_ioremap' used but not defined
> make[3]: *** [drivers/mtd/nand/atmel_nand.o] Error 1
> make[2]: *** [drivers/mtd/nand] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2
> --->8---
switch to devm_xxx instead this will simplify the error patch and remove patch

Best Regards,
J.
