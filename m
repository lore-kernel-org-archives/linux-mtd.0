Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4474FC432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD8E60F90
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DD8E60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlpk2MKbZVHFcfPg0omXXVQ9p0uPsCgyvjw/LY1DOq8=; b=YLl29YYIzi0zxv
	zTk0QxgOQIzzCoWphYwSHDvA7ptJ9iqKS91pRcB1YdlirWqqatRvYEFdBvUty/yHuB1Q0IaMRF/9r
	lDUv9qB5YI/QMDLDOq3ZWs+j3zCBo1F+bRuVwzS85/fVygaKrU5kGK52izXAv/hJigTEB4AORkZoa
	OlVD2wGS2J9HByrG0mcekT66Zxl1o0qQqpzNOFcUnadOXHHGnPNxfsnpGn3QvBOQXToNP+CyxwPuU
	Po15qjzm7Q4CFvRnypFFmJ4ndUJ9zC4ER/s3nwdXWtfDfOgrxZGEwfeYUDLA944KzwdD6/EDcaypZ
	X7unmvTXrVAsssYsYiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOcD-005ePr-Pj; Wed, 01 Sep 2021 11:41:13 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLOc7-005eNO-Vm
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 11:41:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 181Betbw002043;
 Wed, 1 Sep 2021 06:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1630496455;
 bh=Xpb1FcBWvzWF5SJEoAQG8wUxc92uDd/rzNCrD8V7YDs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gicr6BVkBuyaEUvQYbf4CsrscG4Xf8qMkmjgQsiRnQSXZHWrOROD07iJNaiB6Jyic
 gyUxilNPy7kZJC1rLMowM7HwNEoFq4+WtCV81dCQvg7h0SZFwe7pv1qUk04X9Zj+PU
 74EeeHa2tXoWZF3Mtmy7fBsfKZSocOtnSSxtPyME=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 181Betsx080673
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Sep 2021 06:40:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 1
 Sep 2021 06:40:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 1 Sep 2021 06:40:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 181BesxE094343;
 Wed, 1 Sep 2021 06:40:54 -0500
Date: Wed, 1 Sep 2021 17:10:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Cai Huoqing <caihuoqing@baidu.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: hisi-sfc: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Message-ID: <20210901114051.5cokevyl5hpgwrju@ti.com>
References: <20210901074259.9683-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901074259.9683-1-caihuoqing@baidu.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_044108_204362_FED91426 
X-CRM114-Status: UNSURE (   9.32  )
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

On 01/09/21 03:42PM, Cai Huoqing wrote:
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
