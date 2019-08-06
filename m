Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B60C31E40
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 16:35:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B27E208C3
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 16:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DpATvfb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B27E208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J3gX/3eI3awJPG9lgLbSXeTX4SrDE+29sNREhINjotM=; b=DpATvfb9/vPOjS7Ems7apiZXf
	b3A7CoSJGowOIP1zrRQN23JGoKZstPLEMjLF4Xkwy/MS0Ai3Syi4slOFfiC3JMORdjtTULIW1FTeM
	DkklHCmPZdgWcNphJ0rQksKZa5r11xjk55kmqxl7cOyL4yBIKlUxL3FoW38QzjWzH19dSca1bCanN
	oxlsWROSqpmi9wilZlFwNBhznqlwwgd4VDt1oq6N2ri84J3KJUrPcOmMGDOiLOI+GLgvr0W1i0Dw9
	bezdQeJKc2SoSO6LBUx8yfHXtVectVnWCSrYhxFK0DAKtUDxOG1D8jeyHNG8Zp481BgXmZ6IEd1wN
	yIyqTVVeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv2Qs-0007Mr-6q; Tue, 06 Aug 2019 16:35:30 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv2Qo-0007Ly-7T
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 16:35:27 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0D6F1403823FB709DEE3;
 Wed,  7 Aug 2019 00:35:24 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 7 Aug 2019 00:35:22 +0800
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
To: <corbet@lwn.net>, <mchehab+samsung@kernel.org>,
 <linux-mtd@lists.infradead.org>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
Date: Tue, 6 Aug 2019 17:35:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_093526_498273_E5E42CD3 
X-CRM114-Status: GOOD (  12.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/08/2019 17:06, John Garry wrote:
> The reference driver no longer exists since commit 50f1242c6742 ("mtd:
> fsl-quadspi: Remove the driver as it was replaced by spi-fsl-qspi.c").
>
> Update reference to spi-fsl-qspi.c driver.
>
> Signed-off-by: John Garry <john.garry@huawei.com>
>
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
> index f5333e3bf486..1f0437676762 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst

In fact this document has many references to Freescale QuadSPI - could 
someone kindly review this complete document for up-to-date accuracy?

Thanks,
John

> @@ -59,7 +59,7 @@ Part III - How can drivers use the framework?
>
>  The main API is spi_nor_scan(). Before you call the hook, a driver should
>  initialize the necessary fields for spi_nor{}. Please see
> -drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to fsl-quadspi.c
> +drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
>  when you want to write a new driver for a SPI NOR controller.
>  Another API is spi_nor_restore(), this is used to restore the status of SPI
>  flash chip such as addressing mode. Call it whenever detach the driver from
>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
