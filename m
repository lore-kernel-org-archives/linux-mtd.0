Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAF8C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 19:49:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0163C61355
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 19:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0163C61355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22fjh01WBp+DGQw1XrSvrk8hKnGwwmiHFqjGk7Svp/8=; b=FORjmiTZScGFU8RXI4MSqZe8Az
	TH18fIuvSI21j0mXJqt5WsU8nIYNzwQJ3aU7orcZu7lC4i2rtc4C2HqCu1YYA1qOE0mbj9tLVWa/m
	zw6SXZTqJ5eQHYw7D9q9TAIq+pnrj4BhPIpCd0qCAzuTdxX37mynfWQE0Uc5oGoCpZfQ9AoSGkl+p
	cEjzUAS4iVj4dxutjTKTumjVJceVW/PHtIxFkzO8WB75d9x/eflTdrHOJX2iD3Y8vdwXi93rT57QP
	ReCqcU8/2Dnuw/LEf6RrwzxD/gQyG1yzz1vTsHFyCjGYyB/SxE3uEUQKfUN9HDz8UvUZa8CxewZtt
	CK3a8PQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljoej-002YLP-TS; Thu, 20 May 2021 19:48:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljoea-002YKK-OW
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 19:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=FB7IPwoGcrWte7J69DSJxA9Wwq6HCVigxcRMGRBdIAI=; b=yF/22n4xi9INd6H6bVeX+fJvZc
 V6aL7e/8zFqDWtkueqMtjT5V9vZPtybiysAKVM7NaT+0FUWTzGlnjZvixDcQrXyZfwqNRGv0XSlNv
 lAuCBXv+EqOVJGYEoB3vFonDl9sEVSBhgBsbTspgOc8Olj5lowJyWVfSjN5+K00+toPcjFog41N9S
 xA1MYfDBXCdmJ+DZ23ZUi/iTjVOaKPnsVC40TMRM2usGSZjDwkL6gyuaBf5FW38E6cQfsCtyYM8zl
 VuiX5LIvvrZiXRtrAgw1CLo0qcGc8PZWPRizqYhskK5dOVQn9xM/vreAjCJH9zrBtUZLol6c7hpZj
 D+K4Tucw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljoeY-00Gd4j-0P
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 19:48:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7D2E52224F;
 Thu, 20 May 2021 21:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621540095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FB7IPwoGcrWte7J69DSJxA9Wwq6HCVigxcRMGRBdIAI=;
 b=n2Kp6EEeT/QURJUM+g/xBrQ3CDr0H2MaO/OdCvfrgT+LrI59KfWwlLk77SkAw5GY3GeLa2
 wV2CfFbsEaaSKGt5HLgxCefDcZpofWBIK2ExmrpJ3oJhgX/EGgH74JbMd9NqvsO4Qt1Rm1
 9wwkLsMbT7Gd1FThhOxP71wGcz3c5W8=
MIME-Version: 1.0
Date: Thu, 20 May 2021 21:48:15 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: otp: use more consistent wording
In-Reply-To: <20210520173906.3h3m6lykfpnmznkx@ti.com>
References: <20210520155854.16547-1-michael@walle.cc>
 <20210520155854.16547-3-michael@walle.cc>
 <20210520173906.3h3m6lykfpnmznkx@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1752653b57961170ee8b7efec4f79023@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_124818_242395_C7876811 
X-CRM114-Status: GOOD (  18.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-05-20 19:39, schrieb Pratyush Yadav:
> On 20/05/21 05:58PM, Michael Walle wrote:
>> Use the wording as used in the datasheet to describe the access 
>> methods
>> of the security registers (aka OTP storage). This will also match the
>> function names.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/otp.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
>> index 91a4c510ed51..ec0c1b33f7cc 100644
>> --- a/drivers/mtd/spi-nor/otp.c
>> +++ b/drivers/mtd/spi-nor/otp.c
>> @@ -15,14 +15,16 @@
>>  #define spi_nor_otp_n_regions(nor) 
>> ((nor)->params->otp.org->n_regions)
>> 
>>  /**
>> - * spi_nor_otp_read_secr() - read OTP data
>> + * spi_nor_otp_read_secr() - read security register
>>   * @nor:	pointer to 'struct spi_nor'
>>   * @addr:       offset to read from
>>   * @len:        number of bytes to read
>>   * @buf:        pointer to dst buffer
>>   *
>> - * Read OTP data from one region by using the SPINOR_OP_RSECR 
>> commands. This
>> - * method is used on GigaDevice and Winbond flashes.
>> + * Read a security register by using the SPINOR_OP_RSECR commands. 
>> This method
>> + * is used on GigaDevice and Winbond flashes to access OTP data.
>> + *
>> + * Please note, the read must not span multiple registers.
> 
> Security register is a very vague term. It in no way tells you that it
> means OTP data unless you already know. If I read this for the first
> time, I would think it is some sort of password or access 
> enable/disable
> type of register, and not OTP data region.

Hence why I didn't use that wording. Also if I read register I think
of some small amount of bits, not a whole 256bytes. But it is like it 
is.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
