Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45EFC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 09:57:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A658613CB
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 09:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A658613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oXgqjvdEECCYh+fSm1GAXQcDKn5IGgzNa9groOt33k=; b=NR1RHN6ZkDYRHUqr9eLjMwsldD
	vunCB876q6nlUs8Y2xmco2qLKNg1RyB97RIq5oL5V9UwmQKhQmMKQyxf4+plfmfMwvih+7bZTei/r
	igAeuttYFiZFEPNH69IeWa2yVVkwwErL/iSpBlEKFiDjeXA1bBu8r229zitxhx197cbsecEt8THuq
	P1UydgnBVmea5c1JtAeaJ+jf+qR6Riawvi1+LZ1a4sRAuLOtfnZ5U5r8blpzdi4YFnNgTEZxRzotX
	HLS/hJxdDVfLqlN1aXM/tQPHFJXpsd0CgjGD37QwTFr14dlLGFIYp7y/0HpGNjPfo/OV+TQ5Vzl7Z
	G6w/5lUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk1sI-004pN5-5P; Fri, 21 May 2021 09:55:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk1sD-004pLA-Fh
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 09:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zcdSUALsAgVoPEUXX928KRQZXwv6SENqMPSsey5/4VU=; b=1riAXRtqqFkXPp0q2P9y+eSmTm
 N16j0zHr7BX6vSYpNAUzS7+pQZtsecmBxbsl3WYSV7CmsJhDvwMsAjXoVJE7w5GdkiBTGohYdOIpb
 BlgEay7GiV7Qg0W5/an4IkKK6dPxOJ0qAgZtgRmJv8zlHN756gJQPWU2JVFRJUMuXLcPx6xbGLwLf
 sOvdzfZVPSuIkrEZjQLz7uWa9Q2d+3ruwLsJr/xNoAsQi8jPfbjqk5hr/f6TfivvZTdYCf/N9UX0X
 749owPWZN/SumgPJ6SfgjUA2gpcnaWQhC3CUuO6Mw5UDuuBIGDiFzXX/PDSFDNEpr9xqMI4adY5e2
 kgSSswjQ==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk1sA-00H0od-MC
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 09:55:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14L9t7vY088535;
 Fri, 21 May 2021 04:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621590907;
 bh=zcdSUALsAgVoPEUXX928KRQZXwv6SENqMPSsey5/4VU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=YusESYABMlWYPmVJ2HxI6Y/Z7bHbewSYcZVS5XnnsCsO4Qi6KpXf7ubnOctDf3Bzb
 UOwuryTMZ3tFbNkswitStj3y2995Gl1ZqAhuMDtmHrgPwcTj1k0VmDg+9/voRMNpmr
 QD0drypwoQiR3UJoEp7PWstfam19jLk3MI4BAcf8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14L9t7ss070706
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 May 2021 04:55:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 04:55:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 04:55:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14L9t6LO066914;
 Fri, 21 May 2021 04:55:06 -0500
Date: Fri, 21 May 2021 15:25:05 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Petr Malat <oss@malat.biz>
CC: <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using
 SFDP
Message-ID: <20210521095503.qw3aivg4zklupwcj@ti.com>
References: <20210520160701.28176-1-oss@malat.biz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520160701.28176-1-oss@malat.biz>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_025514_852961_CD238937 
X-CRM114-Status: GOOD (  19.87  )
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

On 20/05/21 06:07PM, Petr Malat wrote:
> This change allows adding a support for flashes with correct SFDP
> without recompilation of the kernel by setting sfdp-compatible property
> in their node. Alternatively, sfdp_compatible module option can be used
> to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
> be used to match all JEDEC IDs.

I have skimmed through the patch. Before I look at it more closely, I 
want to understand the use case for this patch. Why would you not want 
to recompile the kernel when adding support for new hardware? Do you 
want the ability to support flashes on devices that have already been 
deployed in the field? Is it something that comes up frequently?

Then comes the question of how do you get the flash to probe if it is 
not present in device tree? And if you are able to update the device 
tree then you should also be able to update the kernel.

Have you tested this with any flash? If so, with which one?

> 
> Signed-off-by: Petr Malat <oss@malat.biz>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt |  3 +

This file has been converted to yaml since at least 5.12-rc1. Please 
update your kernel sources and rebase your patches.

>  drivers/mtd/spi-nor/core.c                    | 86 +++++++++++--------
>  drivers/mtd/spi-nor/core.h                    |  4 +
>  drivers/mtd/spi-nor/sfdp.c                    | 66 ++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h                    |  2 +
>  5 files changed, 126 insertions(+), 35 deletions(-)

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
