Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F3E81DFF
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuwE8IzATqIDrM3NNGOyyh+JNZbA500Phy+pjZG5tCc=; b=tQFvqpWOjThj96
	qIHvy7B213qJRZ9mxOyIx0p9MEKqVyesUQOzEWU/lQadjGFkSS5JBeeG/LdoULIlW31W5G2eqzmjE
	kjnMbqXGsbQLva7V+078f+kYr6wGaMS/zE6QroaSf+cDokn8MeOR3QlTYDKxcLwv8J+4R6KcvIGJQ
	jaXYmFULBDAZnBRUeKN/N5xFnGWGKVYTLDdgFbIAbu96b8bwWlkuesnIt9L9Zvg8NNFj2nZaebSVb
	hEWE1mkJoi9A8xJx4m5U2cN3bxoHvoLEAg3JzhgQnqZPo6kBeuKRmziXyX2EHFUBEjW2X7eS6bznS
	xdQvf7r3ZpC+I7OaWdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAr-005vko-1v;
	Fri, 06 Oct 2023 13:47:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAq-005vjN-10
	for linux-mtd@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4Kbdufx+AHXJ7bO+V5r5LajhsEMCAIPjaRpknMjUD+4=; b=NAJaVI8oq1VvxvkhehyyYBqRCb
	zk6msaL553A8CTgMCITTDHw1rovi+FwrdrCbUbN3AyMV4ozkdu7nn7UPFkirhuaBEcvmPznVsWIFL
	4MAy9umwZZylBvUmgifMOSV/pxkUHqh5XBr5AhD9VBBinni9AoGaTPyNTsMdwrM+99kZThR+Ps/dz
	bNj/acYzWyEtgRpZP8n1/9kB04dQ9cFMzh9uw5Iq+MJ6dsFOvT+4H6jT6eXFq0Lyxy7KYfQTjPDuS
	kqhdN3lf/FQgRIb1Mau9TuRlBdX+/uwIoXkeON/XXFdmBAB2+BzCf0h7V7HZPOon9lI4AUFiIDXAc
	0z8pNrSQ==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAj-00CfYn-3B
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 13:47:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so375904766b.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2023 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696600014; x=1697204814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Kbdufx+AHXJ7bO+V5r5LajhsEMCAIPjaRpknMjUD+4=;
        b=GVITjBwzthmKos9lo/oTRSZTz1OLCg1nf8TN1M2lM08EwQ3H0Mlb/e+BcBx5bPY2tC
         vRnDHYWRpRktOsTYs6hSS/HBF7vw3rDy9H5SrJKqBRc0AyhCzeHqILi4BRInBn9QnpbH
         sQaZLCWk0kk2i9pLNM36HC5hYthoGLSwsv4gWo0kFdeN5tU1GyEIdmPgntnBSHGYwof8
         dJmI3im73e3eQlah1tVJF1NFmH7TPerALVFd11igtV5eJRUBQML++TLh+J12bC5i3+ru
         JmatrSEPlz4wWsEmHyUhKpnqJB298dVgjldRlRV4OuE8vr8YnF3k2u2NeomdMumd31Ix
         GrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696600014; x=1697204814;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kbdufx+AHXJ7bO+V5r5LajhsEMCAIPjaRpknMjUD+4=;
        b=cgCORp878Fdau9Ep0/2/kQYqFQhVGd9fcOnhoLEwomOBTjIQIZzEGuwjOhAnTT3R/i
         CMJnYd+3IMi7oxD9jLQCbPWykxddIGoYg952I8Em5LVkHQYQHmJg2Y/eykZ0f8UPSu/l
         WUET9hGPdaYtQgADKqfxGmup4kHOuOeIfk3zabkrGXBDWoTZ+MtruQL7lqlFhzlssoIj
         3RpxpLITERU+U5/z+ffQbuYZo1/dIhJxM2y3hCK/zdtGtBbHX+oEqSBjXrTgAJ1MZHtq
         Q2Kc8+MtWl3jXJR+o24UqP/wWZjEEdhzAHfXo/VPBs60aWhBNnuP4edw5EmDmc0oh6x/
         OIew==
X-Gm-Message-State: AOJu0YyXX17pWtOW7Kw6w6MU66p+gNheASSdgtwTrm0Bp81QZYkcQ3zi
	moiwSXb/VVAAc8v/fyntOrb8aA==
X-Google-Smtp-Source: AGHT+IE0IHER02baeg64vD4NFKJGKKk9/C4zdTpjhZWXo8zy8VFiw5MCCPLhmr4wFqK6avJ7wDBI5Q==
X-Received: by 2002:a17:906:301a:b0:9a5:b814:8254 with SMTP id 26-20020a170906301a00b009a5b8148254mr7494241ejz.24.1696600013816;
        Fri, 06 Oct 2023 06:46:53 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906711a00b0099329b3ab67sm2918398ejj.71.2023.10.06.06.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 06:46:53 -0700 (PDT)
Message-ID: <bc76767e-00c1-47ca-9a27-2aa7d2a262f6@linaro.org>
Date: Fri, 6 Oct 2023 14:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
 <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
 <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
 <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
 <eb2a9138-a76e-4b1e-e001-315149c4dabd@leica-geosystems.com>
 <f0a7acb3-00b5-433d-af5c-724a509fb816@linaro.org>
In-Reply-To: <f0a7acb3-00b5-433d-af5c-724a509fb816@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_144719_660019_D1700FC4 
X-CRM114-Status: GOOD (  21.25  )
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



On 10/6/23 14:33, Tudor Ambarus wrote:
> 
> Hi,
> 
> Thanks for the debugging info.
> 
> On 10/6/23 11:30, SHUKLA Mamta Ramendra wrote:
> 
> cut
> 
>> --------------------------------------------------------
>>
>> IMO, HAS_16BIT_SR flag is causing lock/unlock failure,
>> since BP bits are calculated wrong then.
>>
>> I tested also for a case where I don't parse SFDP and
>> reverted the condition in  micron_st_nor_default_init()
>> for 16BIT Status Register Flag. And lock/unlock fails with
>> same log as Non-working case.
>>
>> And this mt25qu512 has 8-BIT SR as typical micron-st flash.
>>
> 
> Indeed, the problem is that HAS_16BIT_SR gets set when it shouldn't have
> to. This means that the BFPT table of the flash is wrong and we should
> fix the parsed settings via a post_bfpt hook.
> 
> Does the following fix your problem?
> 

here it is again, this time compile tested:

diff --git a/drivers/mtd/spi-nor/micron-st.c
b/drivers/mtd/spi-nor/micron-st.c
index 4afcfc57c896..20f76e278095 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -180,6 +180,18 @@ static const struct flash_info micron_nor_parts[] = {
        },
 };

+static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
+                               const struct sfdp_parameter_header
*bfpt_header,
+                               const struct sfdp_bfpt *bfpt)
+{
+       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+       return 0;
+}
+
+static struct spi_nor_fixups mt25qu512a_fixups = {
+       .post_bfpt = mt25qu512a_post_bfpt_fixup,
+};
+
 static const struct flash_info st_nor_parts[] = {
        {
                .name = "m25p05-nonjedec",
@@ -405,10 +417,10 @@ static const struct flash_info st_nor_parts[] = {
        }, {
                .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
                .name = "mt25qu512a",
-               .size = SZ_64M,
-               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ |
SPI_NOR_QUAD_READ,
-               .fixup_flags = SPI_NOR_4B_OPCODES,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
SPI_NOR_4BIT_BP |
+                        SPI_NOR_BP3_SR_BIT6,
                .mfr_flags = USE_FSR,
+               .fixups = &mt25qu512a_fixups,
        }, {
                .id = SNOR_ID(0x20, 0xbb, 0x20),
                .name = "n25q512a",

cut

> If yes, please add some prints in sfdp.c to determine where it's set,
> either in BFPT_DWORD15_QER_SR2_BIT1 or BFPT_DWORD15_QER_SR2_BIT1_NO_RD
> 
> Is the datasheet for this flash public? Would you send me a link to it
> please?
> 
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
