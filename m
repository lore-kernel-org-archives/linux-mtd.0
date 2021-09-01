Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF92C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A244661074
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A244661074
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrUy5hWXgmXSJb/hPCL8jkjMTCN6k5hpdj33dO2gQj8=; b=3bz78zTSCSV085
	tF8/pKx9H+g1iaS8VzDam2jLX9hqhx6xIjo8iI2m3yiQ1m6QiuQWbQWn9DlIyrJv3Q4HWHsR938wn
	LUmcrmKQfnggnIN6SgX2AstFtgzq/PQJe2ZGrDQ6agvOzSmyX7sJsoTV2XyLRtWXNZE16iQyQpLGe
	qUSSpR0LNldcyheuZA/XJ3f+/IkiPDoJfDmEPKv+JysvwilIMi6TTFKVYLZj/dj17eX/1Dlem8o9R
	iXacP5ckhWEYTfP6E48aYOVNg28lAsXIO5y/0wpigWagTBoPuCv7epGIiYFbLikH84Sq9DCYS+mt5
	/oGSTNIr+OYARRMZktfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOcs-005ebJ-NB; Wed, 01 Sep 2021 11:41:54 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLOcm-005eZU-R3; Wed, 01 Sep 2021 11:41:52 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 181BfjDG002268;
 Wed, 1 Sep 2021 06:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1630496505;
 bh=fhUpMxFqMK7/SlLqDXfOhMnrJvW3s0tICX9cevsOGn0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZbNjbKBTwht1vCmt+G4v10lTYx+Isk84HSBUENRSU8wBnYnVr25mnU/v29lKQ4nYi
 eeltm3uRcu7XJcEDN9oflDiY2bS01cNisIt+vvmpwS40/RqdG1Od/R6gnB48eadBkC
 VQDZj90cNpMxl/bNHdM779O7bU3U1zHX7h3Gt1h0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 181Bfi49119397
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Sep 2021 06:41:45 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 1
 Sep 2021 06:41:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 1 Sep 2021 06:41:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 181BfhEr095775;
 Wed, 1 Sep 2021 06:41:44 -0500
Date: Wed, 1 Sep 2021 17:11:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Cai Huoqing <caihuoqing@baidu.com>
CC: Vladimir Zapolskiy <vz@mleia.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: nxp-spifi: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Message-ID: <20210901114140.caxl4qicjvtp2b3i@ti.com>
References: <20210901074307.9733-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901074307.9733-1-caihuoqing@baidu.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_044149_027415_82C76CD4 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On 01/09/21 03:43PM, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
