Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ECC606A688
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zoAPowdx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeiQU2aQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B/0bSh+aMPD6y3HpcU+MKyFGs9iyTRleBlU0ZDdzexc=; b=zoAPowdxY+WUVpV1Di8J+Ip3m4
	5voQpiTq7hlPL2xy/KdyZepVz5DqtqtqZCtGHFWLLWZzZCvpq3yt454uDydqZcdrnyLyV7a9tpyC5
	RbqppirXLdRwteC3OMb3xQE2hVdESJobzrtpMJSmQ6e2si4TOB/dHerB44IAcDu5DO8nC45fR+X8N
	xTtkhiTOw0mhAHuHXEorrHVbocKlvtkU3tWZ2Nve0n5pVAjB52sa7nEguwlOsEEIxyQyKwQZirIEV
	/0gZg9S8ZdWpMdhQgu8/+G/Mh4IYds4tpvDw3Ww8LGG0+/0utxMHJKiv9rHKvtFrd+vs6VeqxH6oZ
	YbbIbKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0S-00000009npi-3yqg;
	Wed, 25 Nov 2026 12:21:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0Q-00000009nnF-1oh7
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:21:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8a070755c8cso2742523b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 04:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609305; x=1796214105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=TeiQU2aQmjYVAglHy+NGFCm5cPHRiIHfAgH4VywzdAeCOA6HYUy+LGRhiUfxh0oYH/
         8CRMCWhrx1w6nrNy86LcGKc/FZ+pi4VCvoPSy5ZQgCzt/jybiiA9Hd9TdMgw64jTKEGA
         raRzpTVoC+6Mt9URTZFy7zzM+fRalaC+WC2FJsirNi77jQsSlsERVP/f2dWlVF0IAu+r
         IRx2wpaUKyQmi/ck04o1EQhzTwPeuEvOyU4+t2lavnFftZeJf7oVES0v5K+5kWQAPxjj
         sW54h26mAbk1YVfGvtFvVNTUIAb4LaI8GIzyFOw+wmqDKT2uklCB36bcKXrJI+AWAoYP
         6EYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609305; x=1796214105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=xyZKqfL8h0sX3PvJT1gxI+4S4Ow4lOfaBqcdH2tXWEMQ8ZEBkZIjUIbfUmWD2QcvXk
         e+tvEzTA0jIf2e6pRKcps7LDzlsMg2DzAEMvhtbGUSlknJOX9+3Fu/sS5unZ23P4W04S
         6ToTiepH4fh+ncLEhLE/rVQH1IrlZYKjjq9rGRf9fd8zV5HcLR3h/kQHH7daVvSC2aLc
         nSMAw7UwKU0sTyNOy/BpXXBZEbWdvNHfcHGAUdrF1SsAro6LDM3vYR2bGEiiCSNpLjNZ
         EEvn+BruHEc+gNOJs6kswWESBx14Nu6LPllDNOvrl2UPXxyNZY18iGmUt/B3Rhikqio6
         uOQQ==
X-Gm-Message-State: APuU4Z99YQy1GFJu28IfBgZWLWIoHea5oRv+wLf3lR1yZvqfXN0vk6oD
	vCmZcS9zQFvz/zTBRPiCqXudQlvCj7Sz9z3QeIrw1DhH3G3sXc5FdYfR
X-Gm-Gg: AZFdTZdWDZQks3Lr2RdC1xRXs6K0Tpj77+izB8qxq+ONivltQvgj57Fiu19APAZUePm
	1AAr3rr3eTFc77HurQy31ZwPaEvq5BYwk8My3WsFbB87EAs4XwuFsQD5TUErqDzq91VJuBcVo0X
	Ca5jTZNobmk8RlnT4dKC8znzlwf9RQtRqJ4iO/wa/YZgb7SsUnGtCP58rOiDv+emz/xGFgIrO/K
	ZPHi8ueiY+SPAGylEPo6c4adgPomZ/ocM5fJR04HwJ82WaGDZ2qqGcGUguDUyK/oDw77s2EHHTj
	ew4FV3QDqt7FBVGlvOy1VODCDBXuBMoDz3EugL70tptJ8RallN2flYArxMGFgzpNgPmBpQ87ijo
	myfZ+fMIURZAbhVi/JIaqpD6sowYAcdBLb6O7PN8tFEaxJryhFw4OknatQWl2+nNceknQ+ie/rF
	IUnVOuHZkiKXJhA1nYEFDlcE1ygCDWmBMFvIgWWIE97YH3WD2HMk7Y0two9YNUkXJwI42952uto
	G/oQZtEnq55wtQWDAmmDc7uj6Q5x5CQpCnC1BGwUjd0Sogo2j7de/grT3axoHdWScT3KVj3gU5X
	DV0Idy7HJbeZSNjXRgyjAEcgrqhv6Z1brA==
X-Received: by 2002:a05:6a00:2d8e:b0:869:9298:ba59 with SMTP id d2e1a72fcca58-8c876741225mr17478088b3a.0.1795609305329;
        Wed, 25 Nov 2026 04:21:45 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:44 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 20:21:33 +0800
Message-Id: <20261125122135.44696-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125122135.44696-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125122135.44696-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042146_542326_F601E66A 
X-CRM114-Status: GOOD (  11.71  )
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

ebu_nand_read_page_hwecc()/ebu_nand_write_page_hwecc() feed the
page buffers provided by the NAND core straight to the DMA
engine, but the driver never declares NAND_USES_DMA.  Because of
this, nand_base cannot know the controller DMAs these buffers and
never bounces non-linear-map ones (see the use_bounce_buf logic
in nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical here: mtdblock's
write cache is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers,
so such buffers can reach the controller's DMA engine, for which
they are not a valid dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers (arasan, denali, meson, mtk, nuvoton...) already do.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cfb4b231e067..1f493fb426d6 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -688,6 +688,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	nand = &ebu_host->chip;
 	nand->controller = &ebu_host->controller;
 	nand->controller->ops = &ebu_nand_controller_ops;
+	nand->options |= NAND_USES_DMA;
 
 	/* Scan to find existence of the device */
 	ret = nand_scan(&ebu_host->chip, 1);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
