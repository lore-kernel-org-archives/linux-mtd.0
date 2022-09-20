Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460B3C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BG+BTRecTGPJAK4Xd3+QR7tY3jznKY1XwFZAFJ6Sb6U=; b=gV19TNX6tLfz0s
	NIibbS24wFY9tZOGr4aBsNp9J0NftXpP+TadshJ3606VGXhAOJi31vmfPngMLGnYc4jiOuwABb50e
	yR7PxuiMinNne6k8r/dK/+DhAren1suuWNaxXntmwC6NWG0XKckjTB2fiUxsyd92IQBamJZ+kkHCK
	rPq2Vh6UNwyCg0ZsISJlMCoT4w7dLBtUTmQ5bVVvRf5MP7z1fCojYfbzjCjsb3kF+1fyt7IsyVf0+
	yE4yiCgfJpSMQRf/OlH8aZb52vn4NcAdVyU6Gqsl1vmoegCPK3sOe3b897VrrLc4Xc7oBzvs0P56n
	eUq4mPKbtM7/I5LuldEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiHv-005oYO-RT; Tue, 20 Sep 2022 18:48:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiHp-005oWB-Lc
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 18:48:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r133-20020a1c448b000000b003b494ffc00bso6968986wma.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2022 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=e1rax8zHktkJE4NlsAmrfBmfy6JQLwKUdVTmbuE0Kvk=;
        b=a/n6KLKyuuFnUM9vPXO3YclSzmLnz5UmmI77Eu3qAaW7GkwFECSgfrEM4d7ThRkn+b
         ZTMsEBSKTuD7zZiQVnWgjr07lcGlSZ9GvvEgMm0rhzp6C0aGUGevKgOvhoTx7JxtonZC
         cRH+h/UsrueXTDj97dWDJ+LJl89I4BlMeysqwnhpKoX3kUbWiKuuMaXAF8Zpx1L8spQA
         Hk/fmXNFF5Mygf7rmhKqwumIZA0iLEqpSsNbVh8OcqU9iYKYY9QYErbSUiNfkFYXOFPR
         LAi4v5NqDj/zYgN5BQZ8iCvyfyDZ/LxZM9kQpWnHtWqeAGSezF8VPy4ng6kbwnRmQpE9
         Sp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=e1rax8zHktkJE4NlsAmrfBmfy6JQLwKUdVTmbuE0Kvk=;
        b=K2UdEQ+i4efstQb6eyGfeRbTCjuvqmWrP9qTYcFJIcOEj4DsNykcNSHbtIU+je8TMS
         g8DbxmnRTbnxxSV/Tg1F4Z8C4B2FaHM6Q0DNSUfAtpeSs6RiEJD1eMtqH74t5lsbkyfn
         FHQf+31UN7j2WN3mqf8fEHiM+eHM2Dd/DIRdSEmZSCeI2WvbEEF2FEW9hrNToazUg8Id
         s8djPWDZylAJwgX9a6cW2fc38TZVO3mahZK/zG7jRVgYcJQ64ucfhhtD9XjKbW5vwfMs
         EyMg03YpdZcR4Gt/KotnB1m69kl4ACADGLGA5+VIw+vlZVLiLSvloBA0SbcB3RsRznEm
         26XA==
X-Gm-Message-State: ACrzQf2oMFySp6Rsojmhx4w7NbbWBGMySkPfWNk7qJAaN/hmfaFaQnq8
	ucbbML4Sf5EutIaEczmChhYYXHEXNsmqrg==
X-Google-Smtp-Source: AMsMyM4R92uxH1TZaMut6DsSvvNnopmxhOhsLA3A+9DuCP3Acj5edYh4JdyiyzPrQqGkRn4eb4NHpQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c709:4322 with SMTP id g11-20020a05600c310b00b003b4c7094322mr3342558wmo.141.1663699676003;
        Tue, 20 Sep 2022 11:47:56 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id id21-20020a05600ca19500b003b27f644488sm507061wmb.29.2022.09.20.11.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:47:55 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
Date: Tue, 20 Sep 2022 19:47:48 +0100
Message-Id: <20220920184748.44812-1-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_114801_778373_100C572B 
X-CRM114-Status: GOOD (  14.62  )
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

The datasheet of is25wp256 says it supports SFDP. Get rid of the static
initialization of the flash parameters and init them when parsing SFDP.

Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
After this patch, it parses the SFDP information and still uses the
same opcodes.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---

No change from v2, just resending again with the next patch.
Results from the tests given by Tudor in the following mail.


 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754f..8b48459b5054c 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -71,7 +71,7 @@ static const struct flash_info issi_nor_parts[] = {
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
