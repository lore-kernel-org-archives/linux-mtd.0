Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75C606A31E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3OX0vCWb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fxEHZdfj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Js54wfsb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1aaWrayJPzsrlIoYY+Jg3V3OwkZ4+flOnkC1t2Himk8=; b=3OX0vCWbPCK6jFC6WQYD1ndqPT
	lCX+M/MygM6ZFz81PHe0XIKylU6f2/uH2u9mPvLzyT1bnVHAUT2eXSTYTudHlF359KUmHVGwZHjy0
	RvKNqKkZURAu9LDUpALSklNEUrs9JHABWYyx/g2Av5jDObA+I6ogYgYy3osb/db/PF6vMfnJe2f97
	9nlrzTKJYP0R2OBXJGdmvs8fRFD1KmgvbLqLwxunv2j20V9n0FE4HEnxm7oaUy3GWAluXENCt0SO6
	2RmoOaFN+H5Y3G+Q2uHVL4om7j9WwqjnsmSpCDgqrOjb+XoeD4Ie10xAZEUwQ581CLgjKIHEubr9y
	SPD7ar8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO7C-00000002QrV-2xdr;
	Mon, 23 Nov 2026 07:05:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6o-00000002Qo8-3wKu
	for linux-mtd@bombadil.infradead.org;
	Mon, 23 Nov 2026 07:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Sea1MXgJI7hJpgBjDyS4CUv6JKegSSSi91eydOCrWN8=; b=fxEHZdfj6oNA3Ec4PSAzpncFLz
	I9z5nrFD18DVMegoRyv2Ien7jEPSByg/ElzVOPKRbH39DlMP565eyJfzLaZSRgYMDD8ZAmGqul/FL
	/AWem2XaBylsyxYbjByA98IGROVpJ2eNYC5Lz7HGG4gcJUA2WZAOESXS7Aaq4sSUZA91fadmo2o1t
	xI7egi1C1bKLDj2FWRkryeiKKRHxJJgukWVDm0PgHXiscrIB2r2x0/KGHDj8XVjysobkXlfn1nIdv
	UdSIK2TDGKOdPNMnFfHVX7fH5xhAbpXJm1u/MRAYmylj6UciL1vg7Zya+taMhCFreL/QZZOLPC9LY
	B64utQjw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6m-00000002oDs-1eWM
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 07:05:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so1376133a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 23:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417498; x=1796022298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sea1MXgJI7hJpgBjDyS4CUv6JKegSSSi91eydOCrWN8=;
        b=Js54wfsbeIb+lK9Evm6ENTU+JpDWtNLKl+8iYlqYlp1Egz9LbgoIc+zG4kJznoxMxK
         M5R03WA6F6X4X1mT58O6lrBKmSP7V3unud0MiMhxT2gb7vHx3oeW4GPcAFySMaGn8qG2
         PHqVzm2v19xg0Oj37Y0wpytILS/Ms1H/BC/PDsaFUjUfXVvg99HzH8d915PZc/AONqXY
         CDmg8hSoNYLwudUydy1HQLvkllGX8OwaooTboNAA+NamZBdXVpXf765lAEho0EFHblWH
         7NwEqRxrBTRH/2fGOGuZ7LaPd7+38Hd7h28Y0kg5XkiL5c4QqOsvBqdbZZDJ6sNvFVcB
         159w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417498; x=1796022298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sea1MXgJI7hJpgBjDyS4CUv6JKegSSSi91eydOCrWN8=;
        b=TlMwQMwLOD9ntICdpLlhnJxlGB53gAZ31gU2choLv4aWf6qzeAdZ7/gsAuToU8xOTH
         +zuKLhvHVhfDKP2CCKDD6uLi3GBzPc7qi6H7o11XxZSPItMKlIjb1zGTSdkzzTjWS/Hx
         +nKa4DsVxV1KDEpVKcYUBKeWsiDoOXhAJycf8QzwQmXekETaUmJNKjFO/RAQiIjl8XPS
         izsWSCciea7uL8POqYJHmn/sJi96MHclhi9V5epW7toLEXZ838QQedoucM3MpLktx03o
         udOmFEmAar0YVBpvmXQEn65oFkUNMIVWwKWaUV5NCp0WhCk/q7Wp2k7sVcxnUVkaEr2G
         s8kw==
X-Gm-Message-State: APuU4Z8UTZ3XaODqe5Cl36DS90I8qNi0twKH5X3JUb+6YFx/4p/kET8/
	V+Fl1UiBcdVqb3UYDbkpHjGjDy07m8nojq/Qfg0jp4Gx5y1yKu6BOaJG
X-Gm-Gg: AZFdTZcui+fH6eP57cFoLaD3sQBGk0s0rXtjHMbri6nCNs6yaDO667B4Nzs526QeZBW
	3JdLAjzoANXnqeF02zMfRDUPx/wByd9XAh8/2WcUozm0bPoBDzP2ubBWQVZQQW4/m24c+IB1G3B
	BAUlnEGozHydQjiW/JQpeGY4HdZYOfxYqfhz3uncFBysqWYpp8lYoFFq9Skq/oje2BQPVaO9OB+
	+O+T54cjipRyfPuRbA5FY9AGCBL1wAyNR9ppXDHGlj7d640PvqX7WXmSDAXoh9Wyidyh4Zy/QCV
	fXLyuaGc98KMfqH05xqb67w08YHewIXhh0EXllayJknwZ4GLR7MUG/TvzTV8waKTStXieDlEJWH
	Ahtv3Us7WCeTuMOR/oBMeCtoKq5v6LE7o374w97Ge3nde/Ha8N+a+lK8vhr7gmGp2j3IoaxSY0h
	wGqmmk6f0flWyQFMN5wXBoCk8WW8c8jQkqK3UU+0+rRiaihJuXIrLhEe3oqsSkS9g51Lwonq9FF
	8RnVRk8a6d7ACedubgDy5i0ZhRZBS4O9q3vt0bRD2bX/xk/Cj51Y1VJIdUxegnqbEJeaPk4SCzq
	EuLf00QWsPPZ712MYFvdZD9zLgGu9BF7Dg==
X-Received: by 2002:a17:90b:388d:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3b41cb235d6mr9547694a91.56.1795417498055;
        Sun, 22 Nov 2026 23:04:58 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:57 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Mon, 23 Nov 2026 15:04:39 +0800
Message-Id: <20261123070440.3060882-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123070440.3060882-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070500_401198_CBA43D7B 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -0.2 (/)
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
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 1f493fb426d6..094cf554a7ca 100644
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
@@ -346,10 +345,10 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
-	return 0;
+	ret = 0;
 
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
