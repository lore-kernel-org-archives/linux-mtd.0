Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D026C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 11:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CBB601FC
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 11:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CBB601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyVoKEkfcgFBn2Dd0mLxgEjIv6IYYm1mZKU0BKExvxI=; b=Nqafh7FAypubuw
	wecJ02oO/hM+EBHxWxc9RJNqtOrAtg5Ihp/FxP/H7UUfSJ5iCR82n8HHKQMsh/vPO44mGWXP+R/Mi
	/hpEFHXBIa6758jO/1wbhvf9vsLKmX80IkY4Tl0PQxf6GN+U011i7k/9KTK9Gn2FQcNsaZJaZnUVd
	audjWJL1JMLLLq0TY6y3VpFqnHkQ/CA/8uTkr4bXHQiNZgSrF9h3emdD7mwr/JU7VyKO92pemJ8Dl
	tJZwfHPUVUw/f/0xTHv0h5xRReN9kd8IpCtUJTzT+gsA220TaMDgCpA9u/tUsCIY25iZVI4VeD9/u
	kMt3x/gyf93WjpdIE6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1macBh-00GED8-MU; Wed, 13 Oct 2021 11:12:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maaTU-00FklS-Ti
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 09:23:02 +0000
X-UUID: b2645a768a0f48b1b8f0cb7d9b06ce18-20211013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=czoAsTvBuGCxYJGVA2dOND3dtZ/BE0EoRCGWbu5iAi8=; 
 b=PywEcrXdo8l2g37xId02SEOlE5NOXT5Uaa+wNyOUxbscl+Rnx56Njk1k/L9lJ4SA0nCUGj2N0Fl79NFS+ZITX/5BN7wwZwlgRZMjpQlRTWxnkvO/qXQc8kVbQuMDI0SsiCTjArZYws2ELCyR7DjoT5DLjybvAN3h4Ta4bfST6AA=;
X-UUID: b2645a768a0f48b1b8f0cb7d9b06ce18-20211013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1115251445; Wed, 13 Oct 2021 02:22:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 02:15:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Oct 2021 17:15:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 17:15:45 +0800
Message-ID: <872348abea7317c6b3d2ed53c8139e0927bb991f.camel@mediatek.com>
Subject: Re: [RFC PATCH 06/10] mtd: nand: mxic-ecc: Add Macronix external
 ECC engine support
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, "Boris
 Brezillon" <bbrezillon@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <jaimeliao@mxic.com.tw>, <juliensu@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Oct 2021 17:15:49 +0800
In-Reply-To: <20211008162228.1753083-7-miquel.raynal@bootlin.com>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-7-miquel.raynal@bootlin.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_022301_125481_FDEF5854 
X-CRM114-Status: GOOD (  13.01  )
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

Hi,

On Fri, 2021-10-08 at 18:22 +0200, Miquel Raynal wrote:
> 
> +static int mxic_ecc_count_biterrs(struct mxic_ecc_engine *eng,
> struct mtd_info *mtd)
> +{
> +	struct device *dev = eng->dev;
> +	unsigned int max_bf = 0;
> +	int step;
> +
> +	for (step = 0; step < eng->steps; step++) {
> +		u8 stat = eng->status[step];
> +
> +		if (stat == NO_ERR) {
> +			dev_dbg(dev, "ECC step %d: no error\n", step);
> +		} else if (stat == ERASED_CHUNK) {
> +			dev_dbg(dev, "ECC step %d: erased\n", step);
> +		} else if (stat == UNCORR_ERR || stat > MAX_CORR_ERR) {
> +			dev_dbg(dev, "ECC step %d: uncorrectable\n",
> step);
> +			mtd->ecc_stats.failed++;
> +		} else {
> +			dev_dbg(dev, "ECC step %d: %d bits
> corrected\n",
> +				step, stat);
> +			max_bf = max_t(unsigned int, max_bf, stat);
> +			mtd->ecc_stats.corrected += stat;
> +		}
> +	}
> +
> +	return max_bf;
> +}

In spinand_mtd_read() function, rely on the return value -EBADMSG to
check whether ecc failed. Therefore, maybe there also need return this
value in mxic_ecc_count_biterrs() function when uncorrectable ecc
error?

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
