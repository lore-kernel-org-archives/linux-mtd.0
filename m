Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2353EC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 17:40:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE786100A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 17:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE786100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGeUSXS1hkmvuXah5X/rodaHzS8lBIgQhp5L0GAzOg8=; b=JKgxz4wSIC2VnMN8jfDdDEZ1j3
	2n2f4Pktg8e+yrD0q4j54pNhi0K+xrx7z0r1554NE+Qa7Sl9X69/Xf4QM1ipWwE+aI2C2fuXtyzVN
	CAVd1sW81RvPqobhmZOXCcBpgqCr7LjpqyDIEkLLk+Iu/yZu1gMgxZcrJOAy3z/gSqa7GMp51hsNM
	Zpt9qObDY6DYNEFDkBSQmQwRZdLUaY4ayCp6prnNidYCwf86eI3clB9EmF3Y9xlh4N/pfaZMdAc1h
	W7rTRE4E8tVSVqygtwewfFBwNvLaWYJGIo4QHO3WOaVuqw158hocMcK09s5Q1TW8wprWM9Bb/bwec
	uNTgj2Ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljmdj-0027Lf-HT; Thu, 20 May 2021 17:39:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljmdh-0027LW-7d
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 17:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YsFqlXZ/Hajwge5aNHpzS6T/LhRAspSHg6EuVrihBzE=; b=FYH62DsFID93AXNSEOPwDKPnIn
 WljAikxgWn95S4fD/O5qz55MAY9uk1F303VJ6khmtRVWqR7NnCEaFFu0zevB/Q+fX8pnvOmavW+6t
 0cqjV8ZmNzikQ69IvANa8j4ibc6gGT1r/829BgsIRDvkVVNgY2G8IcoMuF7+FnQwdQCrPCNKr9X3g
 XI8+kXpF0cSCZ314wIGNr9LYreLgT0XLXbyOMwkxjF+s/Rk3sj57ySa/KgOIrWyKUV3RpFqQFIF24
 5coWs5yJGkCAn1Ltbn8399wgKplK1xAD6/U4omd7AqMeccZp2SA/KBm56gPu1zOe9r7nqxUPQBg0p
 IszIN1jw==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljmdd-00GXtm-FK
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 17:39:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KHdAwa008305;
 Thu, 20 May 2021 12:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621532350;
 bh=YsFqlXZ/Hajwge5aNHpzS6T/LhRAspSHg6EuVrihBzE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uqhVOJUZwiQhO6gcTqnqVlg9kvhMPYwHL7+LyeiCS/YNaFcN863OBBp/0ufzHp36k
 gwhiXr7rKFBLN0nIwTbt8YRxku9JMW5tpOSJ8pceOnD/MHpyuyyPDhAll+hlckt0CW
 qQ3QrWxaCfYrs4iihC0l7WUafn7YtZL8Pi3LVlZo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KHdAZd105531
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 May 2021 12:39:10 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 12:39:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 12:39:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KHd8rm001846;
 Thu, 20 May 2021 12:39:09 -0500
Date: Thu, 20 May 2021 23:09:08 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: otp: use more consistent wording
Message-ID: <20210520173906.3h3m6lykfpnmznkx@ti.com>
References: <20210520155854.16547-1-michael@walle.cc>
 <20210520155854.16547-3-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520155854.16547-3-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_103913_621377_502BEEAF 
X-CRM114-Status: GOOD (  24.15  )
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
> Use the wording as used in the datasheet to describe the access methods
> of the security registers (aka OTP storage). This will also match the
> function names.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/otp.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 91a4c510ed51..ec0c1b33f7cc 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -15,14 +15,16 @@
>  #define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
>  
>  /**
> - * spi_nor_otp_read_secr() - read OTP data
> + * spi_nor_otp_read_secr() - read security register
>   * @nor:	pointer to 'struct spi_nor'
>   * @addr:       offset to read from
>   * @len:        number of bytes to read
>   * @buf:        pointer to dst buffer
>   *
> - * Read OTP data from one region by using the SPINOR_OP_RSECR commands. This
> - * method is used on GigaDevice and Winbond flashes.
> + * Read a security register by using the SPINOR_OP_RSECR commands. This method
> + * is used on GigaDevice and Winbond flashes to access OTP data.
> + *
> + * Please note, the read must not span multiple registers.

Security register is a very vague term. It in no way tells you that it 
means OTP data unless you already know. If I read this for the first 
time, I would think it is some sort of password or access enable/disable 
type of register, and not OTP data region.

Please add a note to clarify this. Same for the write and erase 
functions.

With this fixed,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>   *
>   * Return: number of bytes read successfully, -errno otherwise
>   */
> @@ -56,16 +58,16 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
>  }
>  
>  /**
> - * spi_nor_otp_write_secr() - write OTP data
> + * spi_nor_otp_write_secr() - write security register
>   * @nor:        pointer to 'struct spi_nor'
>   * @addr:       offset to write to
>   * @len:        number of bytes to write
>   * @buf:        pointer to src buffer
>   *
> - * Write OTP data to one region by using the SPINOR_OP_PSECR commands. This
> - * method is used on GigaDevice and Winbond flashes.
> + * Write a security register by using the SPINOR_OP_PSECR commands. This method
> + * is used on GigaDevice and Winbond flashes to access OTP data.
>   *
> - * Please note, the write must not span multiple OTP regions.
> + * Please note, the write must not span multiple registers.
>   *
>   * Return: number of bytes written successfully, -errno otherwise
>   */
> @@ -88,7 +90,7 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>  
>  	/*
>  	 * We only support a write to one single page. For now all winbond
> -	 * flashes only have one page per OTP region.
> +	 * flashes only have one page per security register.
>  	 */
>  	ret = spi_nor_write_enable(nor);
>  	if (ret)
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
