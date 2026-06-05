Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC06CD6E7C
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwMV98uZGGE/fm/4uPpVzXXsB3vIscxzqAJbFx3MHcI=; b=dQpRmCDNedpMOm
	3OJp1VlZyoLUpBUAxLInWaw/COo32OQNOBO2tBrkxL8CSn6IsiehT8ILoGy8CsFQsn0jBQCib040L
	A1CnNy36eWZawl1PYAQQQRzO6aqVPVMwoMZxm0cTA6dum1BaoftdGGyoMc7wm7CgnO148lBVwMYQ1
	jHzNQzql+p/PL3oBLdAasJ7b/ACtmDjwy+UqbWBcj2UTalMZvpvez4Uk1w7NwnlhG73QPvbS8l9ht
	l334tHjqP8ELey6tpAM4AvIxh1s8YuwG9zFvTrxme1CMyFKjroZx6+d+P2fhVa8RKRlQfWTlvgKdX
	gucAyu045SLKMGWXdnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQGW-00000000LIo-3l0O;
	Fri, 05 Jun 2026 08:50:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQGT-00000000LHH-21cS
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:50:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso16430885ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780649453; x=1781254253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3OkoXbhs5kLS7ezOvy8weCw2fewKlEBiuSMFva/mlQ=;
        b=ZTQLcQW/vqoA+56gJVrqGlN+OCda6sJrMJJU6JStbozmmk/zzdLQzG6sdZ8AXWWNEv
         AMzMj1Ngpd+Kln6F475nx4H1SUYy8VdoqGwYkL0zQoYsO9o3csmCTsVBU9FJon+nCDRk
         97PciS3VU6AW3zr52zjAbpVDMqUJ8pS4f/uZniUj2h/sMkIFtY/cpYUnxYT7DIsNKoOu
         M4AeIK1H57HQT7bt7CiTeGW1W/fDvLTJW7riAYZFFU+A16qSAgoItcmIl+6l9O5W0hvq
         W2PFsTFACd5GhkG1UAsJI77QyMBeiBD4M3SMu4+zX1d3Ck6WMyZ4M7SOqpOijjJmx1QL
         6Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649453; x=1781254253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3OkoXbhs5kLS7ezOvy8weCw2fewKlEBiuSMFva/mlQ=;
        b=li8Quq4mtO7/rNx45Ut2KHuP/ZcaeBBbwX6Zf87f04m+9jVBlCBGltsK5u5sOo5cR/
         QDTLIQJ+DAU7oj0ZpBWj+Z8OmkSO6hvjxIqg/NBpzo1jGWJUsQB/W5C42xuoWbgCcSzF
         85fxjR6j7jsGVzIYxEkFIN2phbKxpYCPBz94HVH9bcWpkX3R/kdMs2czmEwVRQH19/7T
         Jhp1kcDJcVvU2voaiXKTh3zjt72zPhfHzWpwREcVJsxJnX4BvQHwQuUgv64k91oINMaP
         Azxx+EWHseje4RsTT0Ln9MR3TrHhyRcLMHOX26aFk12KfoIxgLdPkK4KChS02+R4EKeC
         X+/w==
X-Gm-Message-State: AOJu0YzXzxPJ5/b49aZzLiESAX+U98aRHWGJ4qPnQka/gJStep13ZSBZ
	22jlhpJ8+8kjlZjapYLr0LKx593e6hyyq2J8BA8a7in1ciVsUDIj2Egk
X-Gm-Gg: Acq92OHc8hJrHqAsqH9mGixDk+QsU6UK/BpGYo+QAOpeawaeA3osX+1gohltRB6XJXk
	kTpcb6XHDT8ck05sdsY9TrPwhVtdA/I6Cnwdh1vo3rcP8aTYr/BaOo+rPiHPkIcHgd/qLpRkelV
	3OiEFsDKdheOYbUdOAxnNqooFUibCm4oLUwADlsP8syXY30NTr9/pvCBmHY2CFTk4knNqtc/Q+R
	quu1Vyyc5wRdt9s2O6A6NYqN0t/q+jIGZ13X7RquD9ZrQTyY+wtMNMONnqICOD43JtpBYMZqcCr
	joAsYfE2Z6h43sKR4osKy6I48ExV6+tf4Wtcm+shCK71RQ31dIXxurp/OJfyZ3sWG0n+7K+5TNt
	6NcQvMc5941YXgGbEjBzL6B6MzCY70vyPd2XrIdYAktOcTfT8CXl+v1Kk9VS2UYRB+CF2b7K0sH
	1N1/DUNfRgLYXIXmnZGa3fPLE3wic1YK66cbRRj0wj5hflWYWRwvQuC9XxQMzxAPdrvx4=
X-Received: by 2002:a17:903:41c7:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c1e85e04bbmr27080835ad.37.1780649452732;
        Fri, 05 Jun 2026 01:50:52 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm108703915ad.78.2026.06.05.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:50:51 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B99234163B74;
	Fri,  5 Jun 2026 16:50:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D
Date: Fri,  5 Jun 2026 16:48:37 +0800
Message-Id: <20260605084837.1875896-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605084837.1875896-1-linchengming884@gmail.com>
References: <20260605084837.1875896-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_015053_525389_B75A9D42 
X-CRM114-Status: GOOD (  12.07  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

In a previous effort to drop flash_info fields and rely on SFDP, the
static size and no_sfdp_flags were removed from the MX25L12805D entry
(JEDEC ID 0xc22018).

At that time, the legacy MX25L12805D was already EOL and unavailable
for physical testing. Verification was inadvertently performed using
the newer MX25L12833F, which shares the same JEDEC ID but supports
SFDP. As a result, the probe succeeded during testing, leading to
the mistaken removal of the fallback parameters.

Since the actual MX25L12805D lacks SFDP support entirely, it strictly
requires these static parameters.

Restore .size = SZ_16M and .no_sfdp_flags = SECT_4K to this entry
to fix the probe failure for the legacy part.

Fixes: 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fields")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 1adb79832..d13ea93b0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -155,7 +155,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L12805D, MX25L12833F, MX25L12845G */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
+		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.no_sfdp_flags = SECT_4K,
 		.fixups = &mx25l12805d_4pp3b_fixups,
 	}, {
 		/* MX25L25635E, MX25L25645G */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
