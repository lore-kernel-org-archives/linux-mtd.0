Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE31C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 08:22:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE3161158
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 08:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE3161158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iugx/2V/PxPHqdMVyv/mOBR1ouR6ne4Gf2uaVY2AylY=; b=HqAABWMtppY5XH0YZFei1SPh8
	7mEjpOX9xLqjxeRAYIYm/DrjHwn6WXaV+W/yBU9LIvLxDB2VaTblr5L+uWc8un9zTdiqqeE2xYJij
	BVqB9xwCu9w1eRMD31UjtlvtCAEpggNMxziAEWDIeYubm8+58ipD75pGYgL42NqX30oZSN9AfOlPZ
	wSWenF5EPcRKAVUgEZxg0NXTTtGWvEOn3mXco7CTda5GmMQLfaq/pclIY63yOV5BapmSuqELwF//d
	rjta2Si029Orhysm7N/b67AFrqVcMO2brlB0paEmXSnRuQzVMhI4CGGsK3LTINBkZYAYZTIOoUFSE
	KWnjxDn6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUPvC-007KEE-UY; Thu, 08 Apr 2021 08:21:51 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUPv9-007KDf-IM
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 08:21:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id h25so885755pgm.3
 for <linux-mtd@lists.infradead.org>; Thu, 08 Apr 2021 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zbwUVKaLhED6SaTnCnGL/YRni1MqI0vO0nkNW6/ZS/k=;
 b=dITi1RhrVBEKysuIp24mL3AqYhDP5C3lV/09D1LKuVOis6E8KB/Az79EoU5JL5Vd+S
 9tozqBH5pzWfngBsS2+m0wALSYSCVxUuLJtAmYDCX/xp3XjlZpHNQAqvEkRYBBk+myh4
 GiffWqsEklEeDH7h9GqotI1+dTOfSZ5J/ICrS1/Ybaie9RkEoGogxKB4wuMAdk6SZ/98
 Le5xzm/J2NPa1WzxtmRDLq/8ySAr1x1HRSdmCto/R9MgY9DlrGp9j87DDaH87vqYz1KT
 gLIjR4XsZO2yWVoFocbAikqhg1wabjGnFpD8cFJoG0U8LsgPkp5gUEWRpp/I0moQWThw
 480A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zbwUVKaLhED6SaTnCnGL/YRni1MqI0vO0nkNW6/ZS/k=;
 b=ozY/wT14EouC9CsNuItBiCXt8Q+j9J0L30NPV+ha1iFAT8YhO6LZBglUMy50Juhvlj
 eGVEgqu95NfR3MhTST2cRlUDblkiiy/MU/MNBMs+CqDjOer5tMA8wSTxoAN0cUJOheCx
 woJ80XKogqtS7Pss3jf+Da2POoXz/eIZB9qrCUBpPmqU6fQWGMIkiI/Kj8s4oU62Z6U6
 LnYW+s2V/8vQa0zjZ9X1A0JJ+5XRKgGRhHpDfjxjSHiU3I3nYJYnqGVrc1O8bNrcQtEg
 GmhKyY0a6Vjgj8webkX9xn5YXLtSUIYIFk7wfIX6EXjZ4P1ROAFqQpDub5Vv7mh1hLNY
 h2+Q==
X-Gm-Message-State: AOAM530Pf5YVbsc6QLLJJOgDuSF7qKxwl7R7U0+orjP5EPY+CTMN3apo
 4wWtHDswTUipHqN8i4f01DY=
X-Google-Smtp-Source: ABdhPJw9O3wy2OjQM4p0Ni0ElAiGqIs2lvOMLwGYLYEcK2uulvAqD1GDFc25CWFTiXDCuSCjCvCx2g==
X-Received: by 2002:aa7:824c:0:b029:21d:7b2d:174a with SMTP id
 e12-20020aa7824c0000b029021d7b2d174amr6503387pfn.51.1617870105508; 
 Thu, 08 Apr 2021 01:21:45 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u25sm24159138pgk.34.2021.04.08.01.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 01:21:45 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
 <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <bcd8e956-c00e-df74-62ea-9cb746ae24eb@gmail.com>
Date: Thu, 8 Apr 2021 17:21:35 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_092147_709682_4F783A78 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Tudor,

On 4/8/2021 2:06 PM, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> On 3/19/21 8:58 AM, tkuw584924@gmail.com wrote:
>> +static int
>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>> +                        const struct sfdp_parameter_header *bfpt_header,
>> +                        const struct sfdp_bfpt *bfpt,
>> +                        struct spi_nor_flash_parameter *params)
>> +{
>> +       int ret;
>> +       u32 addr;
>> +       u8 cfr3v;
>> +
>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>> +       if (ret)
>> +               return ret;
>> +       nor->addr_width = 4;
> 
> Takahiro, you are bypassing the core functions. spansion_set_4byte_addr_mode()
> will be called at set_4byte_addr_mode() time, resulting in an illegal op?
> 
Since the spansion_post_sfdp_fixups() adds the SNOR_F_4B_OPCODES flag,
spansion_set_4byte_addr_mode() is not called actually.

> Are we safe to modify the core and do the spi_nor_set_addr_width() and
> nor->params->set_4byte_addr_mode() before parsing SFDP?
> 
It sounds not safe to me as there are some discussions about addr_width.

https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
https://patchwork.ozlabs.org/project/linux-mtd/patch/1611740450-47975-2-git-send-email-yangyicong@hisilicon.com/

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
