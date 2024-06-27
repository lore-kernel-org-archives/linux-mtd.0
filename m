Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E970C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZJH3NZT3Wu8Ma2IwRFrxGItaAskWSzpS7C05U5wuSM=; b=SN+S7FndGWf3aX
	8VpH6K4DbaFy07hCq9gJDiIdwbKxtMdunZR1U3k/H/+Za4eyXr8w90FWDxpWCiLEp9VlbtYTDpcxF
	y1fchEf77AqYThOrHtU2efMWNYEb9ytvd3p/5jBAopBGQ0JUY/3iHw96GIDIS7MWR4n4nt7i8/GbN
	9CDKk2jLyWTgmPa7iffsnrY4MArn3B4ZpE93ZVjprI3skJZ0V3jUQHInrSNBsQBmq2hMqKyvQoxA9
	YeZncdksGXLWgZv07b6qEk9b5natApTcwCAky40Qp1/fQcu5J5GDbcaA0z1mJY95dy07SqBp7e7VT
	CMWzj5dfWns3BIIvPRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjJG-00000009Vtn-0NeH;
	Thu, 27 Jun 2024 07:12:46 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjJ6-00000009Vsh-2P57
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 07:12:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45R7CUcg066000;
	Thu, 27 Jun 2024 02:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719472350;
	bh=9/nt+OwWswhCPKKWAujQ3ZdvXlga4u8MUGMl58MIwQ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WvCmvmg/Xagn/PUZZhekH2f6Qzd96bL+1Igzvf8dDSbTpcefJ+K98NnFljwGdVVWU
	 SULh0L+t8KXzhjlCdgju+Hkxm4Wftw11vkn+CDD9L4VFVwSk2xf9zh35laRS6r6r7I
	 JTzGpCr3DniOJ1sJ5AvNyqzr/UchFd+irGZBdzIs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45R7CUgr027376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 02:12:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 02:12:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 02:12:30 -0500
Received: from [172.24.23.9] (lt5cg1457vgj.dhcp.ti.com [172.24.23.9])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45R7CRwH130459;
	Thu, 27 Jun 2024 02:12:28 -0500
Message-ID: <4b867d2e-fdb0-4d5a-a9a9-e00758f2cd05@ti.com>
Date: Thu, 27 Jun 2024 12:42:26 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] mtd: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240610-md-drivers-mtd-v1-1-0f59183e4005@quicinc.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240610-md-drivers-mtd-v1-1-0f59183e4005@quicinc.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_001236_996414_44809383 
X-CRM114-Status: GOOD (  11.57  )
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



On 6/11/2024 10:37 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Corrections to these descriptions are welcomed. I'm not an expert in
> this code so in most cases I've taken these descriptions directly from
> code comments, Kconfig descriptions, or git logs.  History has shown
> that in some cases these are originally wrong due to cut-n-paste
> errors, and in other cases the drivers have evolved such that the
> original information is no longer accurate.
> ---


>  drivers/mtd/chips/cfi_cmdset_0020.c     | 1 +
>  drivers/mtd/chips/cfi_util.c            | 1 +

For the CFI bits

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>


[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
