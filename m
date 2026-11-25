Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55201606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDaMF66e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmBVRyuC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mw+OvizVsRWPC5t/ruE2X5c+GJ5SdoXX9L5oeZwKk6U=; b=WDaMF66excfCLtHMQ+2l0/vv5i
	q4iN/wQgFb9spiXR6xwJRONmMTyGrrf6vgwvU+HgjnX658jCXCkBKLYy8NmfJd7Pemv+duyb+GOat
	UCRWJGKSBM01HpC2dnluDy18Oq0vY3tbVNoq/tWP1CG416KP7urMYmM7juDPJbw4bdhvMELrTympw
	z4Z2NokG3AiZTwrcPLt9AyU8HHm97wh9VlI1SaDjaPPLV887laENXX6RYXOwvibTh7GDaJlRBpmFf
	LjZaHzDm+yjs4GaBbEKf801P6DFbr1qbo7rOYvn38AAV6IpQcJxDPj1L0jhvmuWcXYQt+tp0R0riz
	FAC1yLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9GB-00000009H8v-0FHs;
	Wed, 25 Nov 2026 09:25:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9G8-00000009H7G-48Kn
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 09:25:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f04e3bf46dso39707365ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 01:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598748; x=1796203548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=BmBVRyuC+L40Vr2TAfkf/Pixarx6ONBVQhJ1FdkdnrKx4fS1cBuzODFMBhvPQnqBRb
         bEQka9U5vNZIXlVad4gn9glu050gtiKaZKja515ZUR0d+lna8np1dH9jU2kxpq6jvB3V
         shfr2UJwgP5QfU030luUbnRkObSyaqMQo2bgKGVJjcjBy43Pkck6HBOKIbmDf13xBypQ
         0LgyQ4WxL0LSL3Vk4WnzmKTDnewYEy8Fv9mFum593VZL6VSyyXNtP8CIaaq9tyTjfxs3
         AYVrgXkIg88JpiaAxGV9gROuNENRVO9pM5ZFI8vYr4wKFhKKTD3HiN0u5lwn3S+91Wh/
         rm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598748; x=1796203548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=ne1IeZW48W4DDyP3JIA6+mWAEkWzy89PRd+pohbIRMBO9qZWNdJ9ozbHT/TEJeWyzp
         081A6FP9xYUHPp3cFRtdK/upy1pCT9JwaIleALGxySHTUPlsFCO9f8MfAqINNssQqPHO
         oNmkG/yhcmTo+hF6gDLNAwn7q85gV3Tm2+Nw1XN1xJtd2/ClmofbynlIyvO4B0/9yOQF
         QZcvX0J9RZiv1olcp5T1FztRBqw4wMQ7+7r3C3dM0V3u7+4FnOqEiNdwlVXC0DTvAVZb
         H5kBGfUx0FwoNy7IoHdXHW/Cw5NUoivA8PJpkwR9dbPc8r6QcHALs5wG9Khxm1uY7yPf
         qtAg==
X-Gm-Message-State: APuU4Z8pU9oX12G6yGQDyAYq0LKrK2qvCbwbB14pzZjB94yoDz+MZNke
	rAwy1wc8squNhJMmVgSx0AEbH/zJqDbm8KfF+L4F5hImdXi2xmrp8hKq
X-Gm-Gg: AZFdTZeLQHx+9kLWgHsafp+q74Mvx4Z4VfAUz75ABEZYmn1Ib0dA489KIRKUtbthfT3
	ZS3gUsTOKdcReB5k8cB3uv0EvezWg2tTpNwzr1IPtOzIF7iX35/2dbRRx9NbT3oQFDa9GOtRGvX
	JhaIjLHw3OKAvJLfKFeWyLIsPWED0TXFUuFtaLUZFOU93+LIsu6hAbsgT6JFHPsyvfCd3rgxjfQ
	xnBXDJR8p/XBf1wdhGXlsej62FqtFyclpzZhLsmm0MupsfpmHa9pNQYPuUG1EaRTd9ut57PmhRj
	78GVzW91rqjcnfEI4vwFgupIfIkBM9e1fVYyZh8mAWkAk1tdIRmszLIf5+56srzqKeYWJKev/fX
	+HW0HED5WjIflz8TRPNfr+HRwbgtMYSwJnd1OAttvGol8YYP7DtP3CzQB+HwZxGUQ6MWO+raZa9
	h+p1z2weX9IGYU0S3x6YzMY07yqfiWwxZhmYSAhc85VzBdlZYBK/g5pKN5Dp8zuqTzlnQDxRvqo
	SsRRfcT9aIAmFjpcWbJ8aXhPg9yYfXjUVmXbm6oPDjR2ct3bh1N5cp0ZwnWRTsy6wO8Pekh0meh
	x39R/ZfOhiosXr4l4wDOf1IFswCMT+YKVw==
X-Received: by 2002:a17:903:2308:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2f03f264db3mr164655465ad.55.1795598748107;
        Wed, 25 Nov 2026 01:25:48 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:47 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Wed, 25 Nov 2026 17:25:37 +0800
Message-Id: <20261125092538.1938516-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
 <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_012549_035630_67420DD8 
X-CRM114-Status: GOOD (  13.20  )
X-Spam-Score: -2.1 (--)
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

ebu_dma_start() maps the data buffer for every page transfer but
only unmaps it on the error path.  Successful transfers thus leak
the mapping, which accumulates IOVA space on IOMMU systems and
skips any cache maintenance the unmap would perform on
non-coherent platforms.  The error path has two more problems:
when the mapping itself fails it jumps to the unmap with an
invalid dma address, and the unmap is performed with
ebu_host->dev instead of the dma_dev device the buffer was
mapped with.

Return directly when the mapping fails, and unmap with dma_dev on
both the success and the error paths.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 1f493fb426d6..5eff8d7522d4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -312,8 +312,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	buf_dma = dma_map_single(dma_dev, (void *)buf, len, dir);
 	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto err_unmap;
+		return -EIO;
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
@@ -346,10 +345,12 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
+
 	return 0;
 
 err_unmap:
-	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return ret;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
