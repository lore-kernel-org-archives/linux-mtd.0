Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82896C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 21:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ult95EHjMLOzakWHcrE8XtN5pZamGC1UbEmX9q0FyY=; b=OQac14kfvfaziM
	9o4Eh+wsqEugRzV8vkC3g8Ne84xAw8KB7igh7Q+rYrz+SZNCpHZ5bnb2xYCEfehUDm7T6yg5gOzNC
	k5iPT+2mL/rJMCV7OC4WASH90Etk4C3vPAOGlOq/7mEHz+uQYNJ2bj5ENFM5BuxFAThYUOG2H68DB
	i+EgfTM7OnIKeJcRaXQPYR4CT+rJA1qMhBHlXgzfIn7WYrOmHoNkprYfRtKgqW1YjCiQqZRe2tLSh
	3fJl+byG3iX07PzTjumFDR+H3BlGirGj539wtM6pbMrlD4TnyBIyIz8rV3prgsjqBxkY7/IJ5RrUG
	+IB/7iB5Y5K67R6c1WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFNLi-00GwVl-W9; Wed, 02 Feb 2022 21:39:35 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFNLg-00GwUg-8M
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 21:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643837972; x=1675373972;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Yk/jgFqWUvz1adqNi+GwqR741IdbZbWUzfwflmMjc10=;
 b=VuKM0hn1NVOYcaxznOO5DCogTOls8JdL3pX91TyhyohGz8b3wv5TcsIS
 2wzQbom9PeQdnZ5h5eJyGMygr3tTAiWJn0n06t2ii41R1GtLnF4AMSrFs
 aCzE9L+NArC47NP220fPzKm9NqivkDuLYmI0FKtikwE0gg9SHF800HYZB
 LtfaDxvELw/P4prKrWTfr36hs2R6311GPPraUn3kTNeh7l7vNVk7zOdWa
 FewTmEsxrf2ITu4ObzRKm0F4EI2rRINKGcR1XF/fchEReF7YXkOPHUCPQ
 pyHHI9tyodJNGaF8+z3shNIh2WteLykm5ifvk/M5D1hzJN0psT6730fTC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="231591570"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="231591570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 13:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="497896299"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 13:39:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFNLb-000V9r-Ip; Wed, 02 Feb 2022 21:39:27 +0000
Date: Thu, 3 Feb 2022 05:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH] mtd: spi-nor: spi_nor_sr_ready_and_clear() can be static
Message-ID: <20220202213855.GA31097@9f7316611cc3>
References: <20220202145853.4187726-13-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-13-michael@walle.cc>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_133932_383316_9796D3B4 
X-CRM114-Status: GOOD (  15.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

drivers/mtd/spi-nor/spansion.c:332:5: warning: symbol 'spi_nor_sr_ready_and_clear' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 spansion.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 4756fb88eab232..242d55e043f08d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -329,7 +329,7 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
+static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
 {
 	int ret;
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
