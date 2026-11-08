Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79760606A334
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o8KvC+7l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxWmbT5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CiexR6fAe54uDG84M06trlKYTWqcFq1ubdYAO1io8qU=; b=o8KvC+7ly+oNZDMgHClHu3yvcO
	QfvxAQslMkpqFG0UUp6FOZxY60eD1V0p7wvju0f7JnoKHiX60EzuBOz7Ki1SrUSaaEKKwYATBgxSz
	Y7gljp9FcnTA3vvpjhU34LTkCXXl8MXcQ6z0WmG086AnpZO9XIfGNJgLyp9LKZBSTDraqZnCcHEDF
	PF1lxoDiksuXCW7jiDQiL/S5lNCJ9uq+jd5kTzhSKsSJhQKR3ROtLxUw5xu+guF0LhOG7x1b0K70E
	EMeGOBuG0sJ/Qco07idE/vuFzj7dhBBl5qHVQfudmjg/4VKh3lD0DStzm9asOz9QiBqWRwF3R6PBV
	PD7ZKlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8WP-0000000GWaz-1zi9;
	Sun, 08 Nov 2026 19:25:45 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8WM-0000000GWaS-2XC9
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 19:25:43 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso449358eec.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 11:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165941; x=1794770741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2B0XES+Futc2oiYdctR5M7D9QB0YhuOgiy88ZuvgwLY=;
        b=OxWmbT5oktk88bfyZk4B7It7o88+m1owpSyB7qDUGiXOt2Cg6CQbRk62b+AuWMqY2g
         1pP6N431LuBqAv6f6yRDnNrn0QoC7F7db9mwjcBrIUiqbsXoE6ta9OGmProZSX54NH4U
         3gvZYokOtH+cbN+1i1qyQ9DMqP6paUhAKj3uS60rk1XlvPc5EUJyELEG4JUMB1aKPlo8
         XxoRt6Bm+kx+iNYYLTnbo3pEETnAe15oRJyUuQW2FOzXClyWr7bwwLUvUiG2UFz7sTXA
         k7+o/2IcTQ+5BLYF/1dtU6efBDM6f9xC5CdPFG+/mTR77uoi4UsAaiyvzLHjG6+ftU0l
         1hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165941; x=1794770741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2B0XES+Futc2oiYdctR5M7D9QB0YhuOgiy88ZuvgwLY=;
        b=V6D014XIwSVUezAvdSUydC/KXLJXN6J5uODsVrvThoNjq3LiUcaXf/48NOOMweiSuw
         hc1fVEYaoXIRImzpphcwVijTAbX/qjPxBUZONftaEr6MA1NQdr8rP0vAfLzantZzlYpk
         aDNB1bIssmGOXZnrPlB2A2rcYCbZIDRXtFuMI5mncLA9cTscAc0kanD46EBj7V958ugv
         pl6IK5FUAFDRbdDT3z2psVXpQmyxKSCGyJbGKgNRfvvCT8hrzELH0GyZljcmCOfAPzaH
         bmiWr0my43OHSFkjtmq9JMfpzMZLhTEdJgA+1ICp4UlcdpWGFnyTuHLhuDMfneepIT+B
         uYVQ==
X-Gm-Message-State: APuU4Z+K2IIUv8Yxq3Ly9SJNhHTXvR9P6giZUhCPCOtNZb8Lnmaw7HUI
	N6ixU634TuwW7kdKFN/JUQUtM9DNd31o2p8sIWN/4tGlygwai2Ouxwha
X-Gm-Gg: AYBFou0s7gisJWBp4Abca9o9vwO9RKzMQ3wVYggyMZlngUa3g/2rscXr6tUZhR01O6w
	WrjvwSxtOv9Pvt5YFmHrA6mPH8yGkzvrKWP0OhhcvqVBfwVGQLIjgtfVFGTGjATPZufR3Y9mqWp
	tsJb5sneZ7cizRhoEvEOYqwVCbRaVo1vQP56eZv+tPbcWFGs3o+SSG/v0aRq9xxtYyhrOAkDnun
	sQ8q08ITt0FC1EyZSkKkayKrYV/OhDVQwHbullLlaGKhN1NaBVb8B0NzpiesVWUaWDQ+XB8TpNy
	nVY9nWnT4F7txIzihbny6xWTNpx9MbSxGVf5OwtgdTqq6Vl2A6d9p/OQyORbMDnSD2qcGqPeuNf
	cO3pMX+IHYYGhdVa+JNQGaTTTc2oLh8RbQ9EobhPS3NgaJqm8ESw5dC+C6iY9BBSW8DZuy7ivJE
	d8lk/IbN50w3T0VJyxMNDC2yjlljrD3m6g3Q1vRf9oTNP3HlRpvUrT1Xt7ULwnwaTUp7Qtk/U8s
	YTPnEFe/dcr/oxgmGuQx+GraUbxhqlv/DMKS39lu+pcmknglWA3+uPJjkqRbC1H4QG25BS9BVH2
	XI+l2kwY4s+3WHkc5elw5NCaJvG0FJPfyYkCqv2gRw+g
X-Received: by 2002:a05:701b:2091:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b39feb2b95mr3431115c88.28.1794165941286;
        Sun, 08 Nov 2026 11:25:41 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm6607366c88.11.2026.11.08.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:40 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH] mtd: spi-nor: winbond: W25Q512NW-Q/N/M: Fill locking information
Date: Mon,  9 Nov 2026 00:55:18 +0530
Message-Id: <20261108192518.46803-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_112542_640282_411500EA 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The W25Q512NW chips support standard Block Protection (BP0-BP3),
Top/Bottom selection (TB in Status Register 1 bit 6), and Complement
protection (CMP in Status Register 2 bit 6), matching the layout of
other NW-family parts (such as W25Q01NW and W25H512NW).

Add the missing flags so that software write protection and complement
features are properly enabled.

Signed-off-by: Archit More <architmore303@gmail.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 51f6bcd3f8e5..6ba1a137a549 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -406,6 +406,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q512NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
 		/* W25Q01NW-Q/N */
@@ -500,6 +502,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q512NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
 		/* W25Q01NW-M */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
