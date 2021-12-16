Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED0AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 20:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4UyM9rpU2LEdY0YAct+MrwKqVW7gS6Xb/kMfhlLMNY=; b=dWRJ0QTT/tnLuK
	fYR5EW0fhpU/711B0Y5D7iJnPXnensyRK23opse39HjFEcVwDtjYWV5jNpqDmXoNu3WnjGZ6R7Ay6
	aMJlDldPnAOSp8B/WnY/n4EBbuhte9/R1Q0Z+Dpk8y5acsPsaGOvN5PvGjAPOeDkR1dzSERUYp97U
	IuDbYyAfumXLolpRHsEAPaT+wkQz9E9Tnq2oAh0Jn9flV5t4f9hD0ibkH2A6eD+LrDdrBb9HN1KOJ
	qJjvol3ILHMMmkuYRjI6U9t4cCv+OvOVzXGUDnkGCLPLVUtkhlxo+pf8V7knEtXxB17dc//9ZIGX5
	gt4zSCPdGEV+u/gSZL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxx6B-007S8o-ET; Thu, 16 Dec 2021 20:11:31 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxx69-007S7t-3J
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 20:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639685489; x=1671221489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OQ5tkb+mKf19Kj1M+JmkRU5CzgVeDU43EXvvxHFHGWI=;
 b=jPbMbDtDAP+X+c3Ep6UDF4QO4w5CzStqcxtx4iexMss2/Te7TsQklFao
 EcBqqVr53dW79psMvAnaFaVu5vbLoe5/PoasfG2S4MOuSXIIBEWB+/ibE
 pR5luFdW78SqcTPGrOBKn17xtZdtHo7gBQ2Vrn0ZzLjjYZ4QrVpUXv+Bg
 ZB7LtDuwTVla/seP1umTv0slv/6KZJHmKTY7AkIEQcD372yb5zo2aWtfx
 +M9ydgLK6bMXGOwmiFEcSh5ERZjaub3kA2U6fMxEvQVsjk3gznhNTBgcB
 vxzKsfcX3a643N5uFHoqitUZQ19zz4gZ6fvzAihzO9pG9qfiC9UTTPcnu Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239809890"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239809890"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 12:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="464817797"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 16 Dec 2021 12:11:21 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxx60-0003kZ-Sg; Thu, 16 Dec 2021 20:11:20 +0000
Date: Fri, 17 Dec 2021 04:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: kbuild-all@lists.01.org
Subject: [RFC PATCH] spi: spi-mem: mxic_spi_mem_caps can be static
Message-ID: <20211216201057.GA15223@5de6fc93f9bd>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_121129_185721_1EF561EB 
X-CRM114-Status: GOOD (  13.51  )
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

drivers/spi/spi-mxic.c:446:38: warning: symbol 'mxic_spi_mem_caps' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 spi-mxic.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 8f8530bd37794..e137b1ec85d40 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -443,7 +443,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	return ret;
 }
 
-const struct spi_controller_mem_caps mxic_spi_mem_caps = {
+static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
 };
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
