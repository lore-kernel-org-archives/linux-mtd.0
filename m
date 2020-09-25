Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D485AC4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:37:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 809FD2075E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SljtVH7d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HXUFywry"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 809FD2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdagjCVtJXPsnbjaSyI21CdATLE9dG2po3wV70PRwj8=; b=SljtVH7dxNW37MJsCICuCqZ1+2
	rvOUqOn+UEZIB5KC0nSJy+KnXKibmUQX0srZAknIFiqqOKCU7G+rWSFPkRdMDIsc9uZHHwMNQ7rdF
	XOiEu3QTrOLqRBDXfLbsKcWRyfnHY21LU156XKv+rBFklBYIYdPczA8maW74TEFle6uVDCmiqO5x3
	NuPznXAxHEHN9BNN4lbbbZglPeUpd71Wjn3GFIp6rug2h6uLPT8/IHLOsoE+LiAnjx3lI6bREtDpx
	yTLS/2X8iRje3+D5GLJ7wDRxCJPLbxbFgE7USL6RJUqtIK1koxDp7OWZtdHyYJqf9+NMcdmUmNCxU
	7CEHg8vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLm1x-000622-3R; Fri, 25 Sep 2020 11:36:49 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLm1u-00060Y-4s
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 11:36:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PBaVjp078679;
 Fri, 25 Sep 2020 06:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601033791;
 bh=JBpmj7Pxawv9ayoEtwHrqagMeWxL6CqnOw01lBIq+rM=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=HXUFywryX91BHng4Vw1mVQSPMunzVTTuyNIYpb1uBYkSCzpDk7E1VMByU7Oz1U90K
 10bNANPW8JZ/i4QNejbSGA+StpzvMw4XP0lioORXLHNuDMlSCqDfuYUBETyKIJuVb8
 bbAQpYFsv9DnytdwLHyLqByXk3tYSMxoUwn58h10=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PBaVKh023149;
 Fri, 25 Sep 2020 06:36:31 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 06:36:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 06:36:31 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PBaSFd100785;
 Fri, 25 Sep 2020 06:36:29 -0500
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add GD25LQ80C
To: Stijn Tintel <stijn@linux-ipv6.be>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <20200921184754.4010068-1-stijn@linux-ipv6.be>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <49548dc7-aff5-a6de-de54-41c446620551@ti.com>
Date: Fri, 25 Sep 2020 17:06:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921184754.4010068-1-stijn@linux-ipv6.be>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_073646_281072_4CE38A39 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 9/22/20 12:17 AM, Stijn Tintel wrote:
> Tested on a TP-Link OC200.
> 

But what was tested? Dual and quad mode tested (as you enable those
flags)? And lock/unlock as well?

Could you add this info to commit message?

> Datasheet: https://www.gigadevice.com/datasheet/gd25lq80c/
> 
> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index 447d84bb2128..840fa9f90a67 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -24,6 +24,9 @@ static struct spi_nor_fixups gd25q256_fixups = {
>  };
>  
>  static const struct flash_info gigadevice_parts[] = {
> +	{ "gd25lq80c", INFO(0xc86014, 0, 64 * 1024, 16,
> +			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>  	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>  			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
