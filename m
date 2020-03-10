Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A26C10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 17:14:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0D52146E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 17:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmInHsiC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0D52146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iYDhSmmhNhqaGH6hDv1ubQLJvt6gsAgdEL1137k14dY=; b=OmInHsiCIH3DttFHYRuQjXAOk
	b+Xq+X3PKWhQOvOP4whs8i3abh7O/ASLGZEckJ0tLiHPei2fMgsSUurtyO81orMich6WDjuACisoq
	WV1/CUA5baMWS1uHFcj5o66Mup4pwHzpr6i1fAnwakGZMh8d5cAcxoIb5Arkxtr3KW73gCYtSp+pN
	O9sCaaddyMDWdlbxe0AI1Ua2b2PwaS/Px0sXTg5h+7WkeixERia6bqTOpoRbcxmGcqZbZfKPSPW1R
	PaV8yXFCTIehWQZZyr8Td2VDfMtH7zYuqoB+EOni0bOktY56r7HENLqZGot2DLTVVBSp5wVzHue0U
	sv0knJ0sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBiSX-0002Jg-Hz; Tue, 10 Mar 2020 17:14:25 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBiSU-0002ID-Ew
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 17:14:24 +0000
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 52588B476245A54C551D;
 Tue, 10 Mar 2020 17:14:14 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 17:14:13 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 10 Mar
 2020 17:14:13 +0000
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200310201923.24e34363@canb.auug.org.au>
 <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
From: John Garry <john.garry@huawei.com>
Message-ID: <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
Date: Tue, 10 Mar 2020 17:14:13 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_101422_650777_90700E73 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+

On 10/03/2020 14:37, Randy Dunlap wrote:
> On 3/10/20 2:19 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200306:
>>
>> Removed tree: nfc-next (abanboned)
> 
>                                doned
> 
> 
> on i386:
> 
> WARNING: unmet direct dependencies detected for MTD_SPI_NOR

Uh, so kbuild honors a "select" of a config option which has unmet 
dependencies:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143

So this looks introduced by:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e823

>    Depends on [m]: MTD [=m] && SPI_MASTER [=y] >    Selected by [y]:
>    - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && (ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
> 
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/intel-spi.ko] undefined!
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/mtk-quadspi.ko] undefined!
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/hisi-sfc.ko] undefined!
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/aspeed-smc.ko] undefined!
> 
> 
> Full randconfig file is attached.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
