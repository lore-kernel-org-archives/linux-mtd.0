Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B46C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 17:41:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6672D60FE8
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 17:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6672D60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/GPvQ6FMmIdvSuALKB5Bcvqa7IlA37Wh89ZPJN8YPA=; b=hF641qcl8M45xUrcWaAmTceh3v
	VkcTaz+RafSAFU/IP1QyRrsWKqXoVlTDqNOjk2pQIEEDsci6HtMHEAyo5yDx9rKbsilSIbYiBJL2q
	5Xp4bqsk8zD0JFB1r1TmCOwag6rhURXfHWv8QpN0Dh55ahljjACHcofQ9pQJagxJLVkCKe9ZXUdvQ
	MQIqtF+GiL+UGrUr7OmtEK9UOQZrqjUnu+evTM9hP1q18kkH53T4mKmstzEcQHCll/plZwRHZJmo7
	vZ+CxjpDjgdDibxYXZAhYMQgnu0r/mjyZ/13wzyvClvI0NwXk1H9mehPcSa5syBNeCxiyJi9WozxS
	1hSRoLxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljmfK-0027jA-Vn; Thu, 20 May 2021 17:40:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljmfI-0027is-W8
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 17:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=As/rsp/ZN/WjQohJMlHsJic0S5FeRBqChGR/2ESLt+0=; b=3XUK14ilLLahY2qdEsQQXqGSS8
 SdnF8mbzz8OSYNqWjS2MskJvPv/u8vK/UgEsE2R0Oj4O6otWVZKIxDMy5oAnlDzYpjjPmaxN+1Mic
 imkSqxwuX+u3AjaqYgl1StFYT+KKloSwwovQs238A8cyx8pbVqx4hhrf+BL0AoGkgBqMKoZ6/ZdH0
 sX8OJSnSYH8mFFi3337AHeSKZQvwzGyHeRR1Nbs/jSUPVUd+ikk/Ro1lEoRLIBKs6daKAuGBFx+Ip
 8kTcYk2zTF3qoR2yQWVO1tbSll6UKZqLTU64zdXCZqkbbOQIiRPqfygrwiXlcQi9c5tYtf+AeEz8Z
 Z5DcoWqQ==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljmfG-00GXxH-Cy
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 17:40:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KHemLf076201;
 Thu, 20 May 2021 12:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621532448;
 bh=As/rsp/ZN/WjQohJMlHsJic0S5FeRBqChGR/2ESLt+0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aNgEF4wDBo/rtV0c6nfaxHn8+0YkXO2ILT6DIB3GA+B2QiPVFDkIBt2uMeG9B8Ixy
 dJjMKWRQkI7k6/TnrgMUsKc+c3jaNfUmpYg0oQ2jiOGArIlWTgZ+1QNBAZ4lumssAc
 BWfs7xji/9OBLQtcqiQIF9ieXIiSMFx6fC2xOvIA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KHemGl065082
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 May 2021 12:40:48 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 12:40:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 12:40:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KHelTr014229;
 Thu, 20 May 2021 12:40:48 -0500
Date: Thu, 20 May 2021 23:10:47 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: otp: fix access to security
 registers in 4 byte mode
Message-ID: <20210520174045.sxbffwia7mec24rt@ti.com>
References: <20210520155854.16547-1-michael@walle.cc>
 <20210520155854.16547-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520155854.16547-2-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_104054_542573_5E3C8041 
X-CRM114-Status: GOOD (  14.82  )
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

On 20/05/21 05:58PM, Michael Walle wrote:
> The security registers either take a 3 byte or a 4 byte address offset,
> depending on the address mode of the flash. Thus just leave the
> nor->addr_width as is.
> 
> Fixes: cad3193fe9d1 ("mtd: spi-nor: implement OTP support for Winbond and similar flashes")
> Signed-off-by: Michael Walle <michael@walle.cc>

I have not done due diligence in researching this topic. But the premise 
sounds good to me. So,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/otp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 61036c716abb..91a4c510ed51 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -40,7 +40,6 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
>  	rdesc = nor->dirmap.rdesc;
>  
>  	nor->read_opcode = SPINOR_OP_RSECR;
> -	nor->addr_width = 3;
>  	nor->read_dummy = 8;
>  	nor->read_proto = SNOR_PROTO_1_1_1;
>  	nor->dirmap.rdesc = NULL;
> @@ -84,7 +83,6 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>  	wdesc = nor->dirmap.wdesc;
>  
>  	nor->program_opcode = SPINOR_OP_PSECR;
> -	nor->addr_width = 3;
>  	nor->write_proto = SNOR_PROTO_1_1_1;
>  	nor->dirmap.wdesc = NULL;
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
