Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD0EE81DFB
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crZ8QiwE04igRux6pXgQI1qJCi5XrX9NmVnem60x9K4=; b=B5jRFkREqEM2Wj
	61pgPcjpYrhYZn6CwbsM/zRmp9F1VUpLfbONaeJOT7ijo3aJ1ZzhRJlZHS3D2rOs9VgZg0XF3w/Np
	KG0MJq+YrDYOwxDLupmwciBcMDoJ9lZf8Zk26+sZJ/AsLSAu1JMnfmXXLDFuC5UH0qbBIy7HFcpbN
	nbHhPcl1cwYKVFnIrIq1rAUVhKYdwShOurb4JyNQqZWvMnVKnzuJ/fbUm5tEsGdml/OcD6cEmZEsK
	LILDMz6p/P5734ojP8JBlBR2mklCVCkwEkUEh6cwl58LD+nAl0ZQZN08ISClqr47PH2WH1m8+foWb
	xjzo9rR4hUmfJxd7VG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qokxJ-005t3w-30;
	Fri, 06 Oct 2023 13:33:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qokxG-005t3O-1v
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 13:33:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso365892166b.0
        for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2023 06:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599198; x=1697203998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLF3FmUojqF6i31/VFtA/YxgmVJsIVWsss0oZC+5hPk=;
        b=upJ32pC12noDAsASbllP3QhfNHHbWetoMuBq9KUlffDATJVujv24UN2sJKkYpbKBJn
         fxr6ND1vWR+65871m9qLO6jS9ynY1kMzhqNsnxkuEHzNur4dTb6bvtBrdUY2AUVFv8/y
         jo8akt3FTG/bTCckpvKXuk8NJWrZkPoyJ2ssFKiGbFX9MTP4vOgUiMy4PDTUUAzii0Qv
         aCQVIbwIeL48e5dTZNiqexbTnlYTIJf6n3VZBzwFj9LXxydY/Et1Gr+nqp70tPJy3F9n
         GHXKyH9qFHWT1qN137qNMD9JvjDg9V31/oO/6CVAFiPV+sCN6D+PQDNZxYHp9p6ZY0iJ
         qNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599198; x=1697203998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLF3FmUojqF6i31/VFtA/YxgmVJsIVWsss0oZC+5hPk=;
        b=Ztt9ylZ3XTekSJSBiwfl00jZD2Ymjcpgr3H2TtwXUCg9JSjkUIOiv9+TmXAkmohKYo
         s2lfNcfH5dIo73oDkPqqI/JRRchN+KEIEFCSefyghU7qz8IPVffWkr7Y5GK5WreqLzUE
         rkkIPkWOeqB1625442mkCcXjCgJ17LmaRlG2g/xd7lKdivQquwPiBEVnarjj8OO4tyJX
         f2DlrGwIb4JCvgFnEveLfKCRLkZ1SIT95pLV3txxNdSsaJzzNcMrIG4NuNJMLztCe2vX
         pBNN6GvUYZ4kUe/kMhEBanOIZZud7Y38K30nG2TB9BLSVLELk/UC824I2ubaUSOr+hS6
         vaUA==
X-Gm-Message-State: AOJu0Yzw9q1bm3aApJvQhXc/JDbvLs/5ZTZS2HrB9IzJnfuY62pHtuWM
	BsikwPzPtr3YKjQ2BV7Oc4SJdQ==
X-Google-Smtp-Source: AGHT+IFbCF1v/pXs8yumng1U8WEpOC/dqt2bLSWBiJ0XZz0OdoS9TN6528aICAm1oaMwtWOr1bt+vw==
X-Received: by 2002:a17:907:c241:b0:9a1:6318:4d39 with SMTP id tj1-20020a170907c24100b009a163184d39mr6842293ejc.29.1696599198565;
        Fri, 06 Oct 2023 06:33:18 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906a28b00b009737b8d47b6sm2858073ejz.203.2023.10.06.06.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 06:33:17 -0700 (PDT)
Message-ID: <f0a7acb3-00b5-433d-af5c-724a509fb816@linaro.org>
Date: Fri, 6 Oct 2023 14:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <eb2a9138-a76e-4b1e-e001-315149c4dabd@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_063322_640117_394C6F85 
X-CRM114-Status: GOOD (  15.97  )
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


Hi,

Thanks for the debugging info.

On 10/6/23 11:30, SHUKLA Mamta Ramendra wrote:

cut

> --------------------------------------------------------
> 
> IMO, HAS_16BIT_SR flag is causing lock/unlock failure,
> since BP bits are calculated wrong then.
> 
> I tested also for a case where I don't parse SFDP and
> reverted the condition in  micron_st_nor_default_init()
> for 16BIT Status Register Flag. And lock/unlock fails with
> same log as Non-working case.
> 
> And this mt25qu512 has 8-BIT SR as typical micron-st flash.
> 

Indeed, the problem is that HAS_16BIT_SR gets set when it shouldn't have
to. This means that the BFPT table of the flash is wrong and we should
fix the parsed settings via a post_bfpt hook.

Does the following fix your problem?

diff --git a/drivers/mtd/spi-nor/micron-st.c
b/drivers/mtd/spi-nor/micron-st.c
index 4afcfc57c896..733bbddc6829 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -180,6 +180,17 @@ static const struct flash_info micron_nor_parts[] = {
        },
 };

+static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
+                               const struct sfdp_parameter_header
*bfpt_header,
+                               const struct sfdp_bfpt *bfpt)
+{
+       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+}
+
+static struct spi_nor_fixups mt25qu512a_fixups = {
+       .post_bfpt = mt25qu512a_post_bfpt_fixup,
+}
+
 static const struct flash_info st_nor_parts[] = {
        {
                .name = "m25p05-nonjedec",
@@ -405,10 +416,10 @@ static const struct flash_info st_nor_parts[] = {
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


If yes, please add some prints in sfdp.c to determine where it's set,
either in BFPT_DWORD15_QER_SR2_BIT1 or BFPT_DWORD15_QER_SR2_BIT1_NO_RD

Is the datasheet for this flash public? Would you send me a link to it
please?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
