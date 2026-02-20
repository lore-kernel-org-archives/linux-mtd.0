Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAB9C55178
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7etpDAf0z9gcAkukXNt5PMS8BGuOTug8jYQHSNwT/wA=; b=w4r/VGF64k55iD
	LtlDyLMQEkrbKkc+ncFNGv1WGZv2N+oAWZr61O5KVLhzBghwodW1aJ7P9V6jVPI8B7kyyNKwm2Zov
	2j6wFFw1ll5eBDpD2lNArKXNw1bPgiEG1bQj8dbFLlY1mMXa8iMhOFJ41X1mpKLkURtLCECV/rVQ7
	98C7Zj9dsDjvzd6bBJiuO+Ge2BtOfxzJQMucRuAledvGzv98GLBPucELPCBaBilc6Q0Wo/NlXdxGj
	oD65lDCzkaRmeIh9a7oRvDxfNavJyvlseFlsohWnGHZ5Rmz4+pxzCBvMnZ2szn/WVIjZqrD1QHPVZ
	kouvWhkQjin4RQf1x5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtN3G-0000000Dc2m-0ErC;
	Fri, 20 Feb 2026 09:43:58 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtN3D-0000000Dc13-2C6K
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 09:43:56 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so1202661a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Feb 2026 01:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771580634; x=1772185434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+8OkdNO1fPtr3MKMAcMES8k9rb9A7ACMmCYnwoCgbE=;
        b=dMdtrRQppThde33CBnSlaEO+s9rEeWttLRgFPDGQzu5C49ar/lK6QvNYI24kFLItVz
         JmItX7QAhwr8UbM2hQ6rckWkoO2uIZ622Xq513zVge5LxWJe5dwRvig3p67dHIgmYw59
         hkWmd3R0XMZ9auYsMZQ3S6v3CMObJDY0L4hHCdP1wDNgn7boq0mah+vapsLXU+PXLSf0
         KsJn8yXbjRj2PbVNGWx/ry43kZoTpRdYpTI3Sv4uEWJdc08nglSdBk42ZvGmEr85VXLf
         +WXoaKAaKNnagRjGgE7/jL3TybHp7QQf0y6AzkRTqOnH8EtOTQDDvvpc0JRltouX50pr
         GtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580634; x=1772185434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+8OkdNO1fPtr3MKMAcMES8k9rb9A7ACMmCYnwoCgbE=;
        b=rD7Ku9mQbGivxH4ASn1eW75aPYHpbn5H95/tS+VwHMHJZM8uq8NJYNfyAmf7kPX7VM
         TusXO9btQrajJ+KC5aJRCGCaHhaKCHxPpkbTjI3hp+Z+xd7I+1zjciZzfSwKA7OdXoCX
         nEPbf2kzSdrjBCKJb3BEHfMZkwhzT/IbdvprPl5w27wTr08iCLvbovqIYdC21deo+O0U
         o5RF9ZRN2OglfJ8kqLhOjn1jZS15gdl072UFw5JA8U7wVU09dJ+gUIdK2VpCgoReXvLq
         rR/iiEo38dW6m6E6mAdThxV0caq1YnFLJIozB/VHKcY+Y2nAMs/8sKfy9N7ZcecsL/8V
         CiWg==
X-Gm-Message-State: AOJu0YwQwMS8ljs0gYr9oUjz5X0BKpLPOO+mkVWLvEUmCUIlwhQFqmEc
	dSGkTfBLLfzx7a8XQtgv7ci470WCM0CDXpYm1n1h5r9/MmtmRqyrXI0vM+jqbw==
X-Gm-Gg: AZuq6aITnUwFSUDPIhRYOUiSJCbj7G3wdfP8c2W7uE2fE/FdIJJ98iSVQeTRj9wImlP
	G5y100+75jTbCNlELiGf/iKzKCYEnkMlT09bEeRi01dvQe1MgqtRbPet4uWcBaqt72BU5o7kif7
	aSyF5EkL3WBBDJ+9OCgXceEFINAkzUrWGtPsapvc79y6ooalHVj/mXwvoVMFZWGKQuYsOfgF6V+
	84l3b5W1eS2s9UBP2AJgHDcSXvR0HYJdvrE9SSTMVaEUGhDIYJsaba5TdGx4xZlLXPiok3Ihc6N
	qWP1nqFjJHAtVmwMVuC4Aub+YWsZAbnTm6sIUoO48parzYaMcFLGplVhfbpovU38si6J1miKd8R
	8STTJ68NSoJOUh1JZjzg5Gt952hk4tCxi72hQsEfpbA0eLALZE3mkXdM/MQXt9ii0R8/ayoZq1o
	/xP4HHhh8mpUgoAo9KS81bbFiHMVHUAA==
X-Received: by 2002:a17:903:19e6:b0:2aa:d608:ec55 with SMTP id d9443c01a7336-2ad175017e9mr190151945ad.28.1771580634204;
        Fri, 20 Feb 2026 01:43:54 -0800 (PST)
Received: from f0d65881db18 ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1ace5e25sm185309555ad.91.2026.02.20.01.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:43:53 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Sanjaikumar V S <sanjaikumar.vs@dicortech.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: spi-nor: sst: Fix write enable before AAI sequence
Date: Fri, 20 Feb 2026 09:42:35 +0000
Message-ID: <20260220094236.28-2-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220094236.28-1-sanjaikumarvs@gmail.com>
References: <20260220094236.28-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_014355_586198_4C2225B6 
X-CRM114-Status: GOOD (  11.45  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

When writing to SST flash starting at an odd address, a single byte is
first programmed using the byte program (BP) command. After this
operation completes, the flash hardware automatically clears the Write
Enable Latch (WEL) bit.

If an AAI (Auto Address Increment) word program sequence follows, it
requires WEL to be set. Without re-enabling writes, the AAI sequence
fails.

Add spi_nor_write_enable() after the odd-address byte program, but only
when an AAI sequence will follow (len > 2 bytes remaining).

Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/sst.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 175211fe6a5e..fe714e6d0914 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -210,6 +210,13 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		to++;
 		actual++;
+
+		/* BP clears WEL, re-enable if AAI sequence follows */
+		if (actual < len - 1) {
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto out;
+		}
 	}
 
 	/* Write out most of the data here. */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
