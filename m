Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C839C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 17:51:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADB160241
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 17:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADB160241
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7bVA4DX2omW4HKeae4MBzbC2kf4lEFn4FnNlEvhyns=; b=cgJU7hLu4W1WCZIVGcLxCQIM+5
	litrzSnwyREkcunZ7FNJtxU7MLLHaf10zWJry/aOpRMEe+ouO5YCjyRR4NubWwEoa+17eKHZcDeq/
	JIKNH4nnaJLvhpaTLD9AWgdGZXwN16U7sIxX5CQ/s2uDRD0ME74MZki/3FuHi5/dW573hl8x5oQUg
	CfqOEPgNIxSWhN7+Sb4raiKcFFFMQ28D6bXKZBfbSVRU9KGFW4RujfsMArzf/ZQDsvILJGmMcHjIh
	34cZMvi205Mm17aj+feT2AnPCk16kDGp9pbLnbTIlobm7Iv1Rs1i9kYENyHZ2oz8wAu0VK2pPQrU/
	aYZ+DZwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljmpG-002A34-9W; Thu, 20 May 2021 17:51:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljmpE-002A2f-Nc
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 17:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=71SRxWPp32oLiCpyyS/3q/lgTgU5j3YxVkv6LXLizQ0=; b=hYr6m78gFbu3cTZH2APJlJXPhi
 2JVuMQTokOawZJgEKxnA/tZd4jhDWAiXY75sMKoAZpgEcjoDNNLQ2Tlxh9JjmJjttRoCiuxt/5jWA
 6GBmtUXbwzYyqYNwBnXhY4CDueOijObc8Gv/fjlKJdgWIav2UltxH5+XThnFxXVQL8C1abaOUqcma
 j8YOfMxGYHw7cOeSR12o1JU8OOziWTNitw5P3J1pjZUGRdMTxwMlGol6Jc1nfN934fTcQxYBt4+LA
 mp6e8aSnm8l6HXhy3W3Q0Y5+TlPzSdsF6DE20AOVIC0J/J3KzSMXQUQDVR6I0eZD8RmutO0BBP/Vx
 7vVfqjKw==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljmpB-00GYLv-SL
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 17:51:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KHp6FP012774;
 Thu, 20 May 2021 12:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621533066;
 bh=71SRxWPp32oLiCpyyS/3q/lgTgU5j3YxVkv6LXLizQ0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Gd00o//4mpY3WFzdmof2Pzp5IZo7SJ4CzVZ0VTCVI+Usdzh/IslLIwrWRQuIgiI/o
 wk/edE51k4gHOs4DBT/9UVSJYivIMkXJt0bCrMvbYofDjUNVysGbzPTx12W7UsP5PW
 esOcm/gUDJxMbJkUCbNq2YGZRMFd0QpO64bPHNZ4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KHp6MM081412
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 May 2021 12:51:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 12:51:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 12:51:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KHp59Y039957;
 Thu, 20 May 2021 12:51:05 -0500
Date: Thu, 20 May 2021 23:21:04 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: otp: implement erase for Winbond
 and similar flashes
Message-ID: <20210520175102.hfo3aa3ubpa5gqgi@ti.com>
References: <20210520155854.16547-1-michael@walle.cc>
 <20210520155854.16547-4-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520155854.16547-4-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_105110_040330_1C4802C7 
X-CRM114-Status: GOOD (  21.15  )
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
> Winbond flashes with OTP support provide a command to erase the OTP
> data. This might come in handy during development.
> 
> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
[...]
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index ec0c1b33f7cc..2dc315b6bffc 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -111,6 +111,34 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>  	return ret ?: written;
>  }
>  
> +/**
> + * spi_nor_otp_erase_secr() - erase a security register
> + * @nor:        pointer to 'struct spi_nor'
> + * @addr:       offset of the security register to be erased
> + *
> + * Erase a security register by using the SPINOR_OP_ESECR command. This method
> + * is used on GigaDevice and Winbond flashes to erase OTP data.
> + *
> + * Return: 0 on success, -errno otherwise
> + */
> +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
> +{
> +	u8 erase_opcode = nor->erase_opcode;
> +	int ret;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	nor->erase_opcode = SPINOR_OP_ESECR;
> +	ret = spi_nor_erase_sector(nor, addr);
> +	nor->erase_opcode = erase_opcode;
> +	if (ret)
> +		return ret;
> +
> +	return spi_nor_wait_till_ready(nor);

The datasheet for W25Q32JW says in Section 8.2.29:
  
  The Security Register Lock Bits (LB3-1) in the Status Register-2 can 
  be used to OTP protect the security registers. Once a lock bit is set 
  to 1, the corresponding security register will be permanently locked,  
  Erase Security Register instruction to that register will be ignored

So if the region is locked, the flash will happily accept the erase and 
simply do nothing. So will the program. So when the OTP region is locked 
and someone does an erase-program cycle, they will think their data went 
through even though it was simply thrown away by the flash.

I think you should check that bit before doing these operations to make 
sure it is actually allowed. If it isn't, return an error code (-EPERM 
maybe).

> +}
> +
>  static int spi_nor_otp_lock_bit_cr(unsigned int region)
>  {
>  	static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
