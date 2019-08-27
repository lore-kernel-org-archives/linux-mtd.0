Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FF8C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 10:54:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96AD220828
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 10:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pR1NbkF+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Di77E3dP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96AD220828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XMYhlBZuUpYidIwrpd6OX3H2+2D1rwxbFJcdHVusG2E=; b=pR1NbkF+S/H3gNzkNMh8yCs2gT
	Z/fFUZsmeoUr0pIXNmMHwJyELLuYKsRLQ2pxokr/V/Z+LTGUd+B8x0NIKFJEefrBDWI8ps817qT0C
	HHChrd++hzcaVS8oyCuI2G4gUpzeySSoE6zT33RfUUpb+YgBKjdtasvc8tT5kI9s1iNz4OpR3nmIx
	6b9SxFeGhSV9QybDLC1DvfyW+75+UNsYA0dBJGuepiJKk8D4tRxrk6091qOHlBMfteHu8SRxfGi+V
	ilFBq4YNXB9yjOql8UfQ21Bt5B082TCoHQJeCyLd9zkL7YBw3cyLgXBrZ+qd2G3ve7qpl5TaSHJqT
	CtYJQt2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Z7L-0007ZL-GW; Tue, 27 Aug 2019 10:54:27 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Z7I-0007Yu-IX
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 10:54:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RAsMJZ049507;
 Tue, 27 Aug 2019 05:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566903262;
 bh=GqflARXeAhdREjDtF4fATi59GFE3peb8GPtKJig/ZQE=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Di77E3dPd0cJieRdmcupP3CI3r7qxoHLGV7sIOmemfoDg6JJAbuo+8CCtM4GW/Ceq
 0Qu3oO0TS+yfzAV+IStL6iLn1E1fYK47aWNvWye3VB9xChrC5JgrHco4Q2PZYetoCJ
 v6NzSywBEiz7mVur6A0WW/KnqwzOI2VvrD4VgmSE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RAsMRi010301
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 05:54:22 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 05:54:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 05:54:22 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RAsKeI006404;
 Tue, 27 Aug 2019 05:54:21 -0500
Subject: Re: [PATCH] mtd: add New Winbond 1.8V SPI NOR Flash ID information
To: Shih-Ting Lin <STLin2@winbond.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
References: <67270bd6ccfa48d9aa484a11cae9b91c@wectmlbox04.winbond.com.tw>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <f014099c-1dda-9eb4-bb0e-5f9019710de6@ti.com>
Date: Tue, 27 Aug 2019 16:24:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <67270bd6ccfa48d9aa484a11cae9b91c@wectmlbox04.winbond.com.tw>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_035424_718003_08247753 
X-CRM114-Status: GOOD (  14.46  )
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

On 21/08/19 3:06 PM, Shih-Ting Lin wrote:
> 
> Winbond SPI NOR Flash have new product for 1.8V production line.
> Following is the patch add new device ID and part number information in spi-nor.c file.
> 

$subject should start with "mtd: spi-nor:" (run git log on the file to
know pattern for the subsystem). How the patch was tested and what modes
of the flash was tested should be part of commit msg.


> Signed-off-by: ST Lin <stlin2@winbond.com>
> 

Signed-off-by should be full name.
Please follow steps in [1] for submitting patch

Also run scripts/checkpatch.pl --strict and fix issues reported before
sending. Please use git format-patch and git send-email to generate and
send patches

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html


Regards
Vignesh

> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2153,6 +2153,22 @@
>  { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>  SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +{ "w25q32jwxxIM", INFO(0xef8016, 0, 64 * 1024,  64,
> +SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +},
> +{ "w25q64jwxxIM", INFO(0xef8017, 0, 64 * 1024, 128,
> +SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +},
> +{ "w25q128jwxxIM", INFO(0xef8018, 0, 64 * 1024, 256,
> +SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +},
> +{ "w25q256jwxxIM", INFO(0xef8019, 0, 64 * 1024, 512,
> +SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +},
> 
>  /* Catalyst / On Semiconductor -- non-JEDEC */
>  { "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> ________________________________
> 
> The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Winbond is strictly prohibited; and any information in this email irrelevant to the official business of Winbond shall be deemed as neither given nor endorsed by Winbond.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
