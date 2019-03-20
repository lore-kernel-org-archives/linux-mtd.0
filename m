Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D67EC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17ACC2184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9UFE9Zn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="TNaQZuuC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17ACC2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3m2XXANWZVKe8aobW/tDRqGAf6c3K3e5vLnQ1GMEAnY=; b=L9UFE9ZnV/WZDF
	4Ds9Ba4TZ37DoyzsJvZCxQKEW0MhroxFdo79ZAD+KxmxAKqZP14VKIFDno5fmMxq/b3YHZrBingQ8
	8AdV1WwbVY2NliPiGPGSuqLbX5cyHLnkW9mQbFsUkO4UT1q3Vq44hBiqkKTjykwrDc0qSP/ekFkeK
	IyMyjZxN/0Pkk4aTNrsMsESQI23bN9qIecj5UQHLQI2q/6chsdEbL0LrA6tLRKlhcF1q0eiJp/gES
	aUEqJNerLSM2/9qltSZXIKywPjQEdmfhLWM4n91LF8W99iGFtD0npYtJuuxBJ16NUTzma7IDTkzvr
	34bFM5Dl2Qv3r00m8Wow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6VSg-0008Nb-2S; Wed, 20 Mar 2019 07:16:30 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VSO-00080A-1u
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:16:12 +0000
Received: by mail-lj1-x241.google.com with SMTP id t13so1301572lji.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0utWn4bfgHDfXTgAWrk9ABJFEc0lH1VKiFFVaEPVrIw=;
 b=TNaQZuuCFVCzAA42C3CYCnJJeeGRUXPfNxeoY2uWEfNAFCb9hCjDvnSpPJ80reENl6
 1qCJK7NP8yKmb0y29MNNDwPmWt9nKnnkfL4bu1SC/G70BE1Hy/Xi5hqphhi0ZWXGAxD6
 xhULyVzvDjVVozfPmeu40O36aJnpBgcTJf08ZptRC/OjVv3DwZVliOH+TjlCMhtnEgVi
 Y//2ZtTH+4r0shoOyk6e0pCMX70qx8zhfH8DYmtksmcsFl1ZbmbKVHRSh7/M+YC+YZjK
 SaRaQHXnbzM7V+IavC/fEvKCKokOCt/tBN7op3v6Ed+QbHiy3dtlTyCaPBTcnt2KA6pi
 VCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0utWn4bfgHDfXTgAWrk9ABJFEc0lH1VKiFFVaEPVrIw=;
 b=UIJY2eQ4AhlSDJv06g2XAHnZOliu6NiqHusBuJWPqUf+wbTwL/ikrOaElcFnCndUpI
 XFHpJ/vwwZeOCmpUNeZRQagSvWI3dQyAaqhXqewbfY9IeMb76LmtNOPuxVWxIpQ9gyps
 pOtNvMWpmgAN14HnnLXDm1MLcYzOSBu5KK7yff4IxkP34jp3VQbwyzaRgS8fiQDyG4T4
 q8lC5bJ3FYI3R6YX+lSUrY4ZHvKjaY0OfnHR13GfEzzmxsejrAkJ7IlP8ed4Md0OzEmf
 9ckSWqL7DZdG6Uo96Jk3jwtBTvRJ7WFy0IJgrB7O+LPo7nLNolF83HttN4kFpqwbr/RR
 OQJA==
X-Gm-Message-State: APjAAAW1V2vyEzFT0z3lpxgySaHYYeWlsD/Fh84JCizp+/YRtL9KMlF/
 w4+FUKw+bk1Gzua0NzzMgnk3vLON3Cg=
X-Google-Smtp-Source: APXvYqynP+I4XJl/AK9eFVf2a6p053XiVufqBKUTyqJaZlYFXSDjcnKfRYbZdH50riVrAESYhYLj+g==
X-Received: by 2002:a2e:7f17:: with SMTP id a23mr15713613ljd.175.1553066170352; 
 Wed, 20 Mar 2019 00:16:10 -0700 (PDT)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id s14sm217243ljh.0.2019.03.20.00.16.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 00:16:09 -0700 (PDT)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Date: Wed, 20 Mar 2019 08:16:04 +0100
Message-Id: <20190320071605.4289-3-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190320071605.4289-1-jonas@norrbonn.se>
References: <20190320071605.4289-1-jonas@norrbonn.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_001612_091805_D673D5A5 
X-CRM114-Status: GOOD (  10.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jonas Bonn <jonas@norrbonn.se>, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
Tested and verified on a Cypress s25fl512s.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0cc0ef4fbf3a..9abac9e326a1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
+			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
