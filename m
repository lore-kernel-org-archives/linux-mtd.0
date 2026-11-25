Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4664606A32C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wEU2O+X7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nae6s39R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B/0bSh+aMPD6y3HpcU+MKyFGs9iyTRleBlU0ZDdzexc=; b=wEU2O+X74W1//JopyInLBLkP3Y
	K2Y9JIly6XBA+XtmG1a3qcZJfLK/bDS/ILkIGyRWYmLBpra2ZD6JGOiwtZ7KTOfJXEas1i2CXka8L
	sYYOCSJ1lpJiBwy+1M7wlfm0EZXkxqc2QG6ssP81OcksKQ0tpKXqrHGPRBD21/tNBglZnglgPTjeD
	ufaXCQsnkZFtuYROr0BF9lf62SraAFlDW5yov2w8heaZUy0/SjL9X5kXAztH14rrlD5Ff1vhMmVrN
	G/jtqS4ZoiEcd/Wyo8E4WCZidsRg15is3qCZuSZg8N3Yv9c6ipZAOjMRdNTfk84eycZC9mTe3vULy
	MC6jvOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBX2-00000009izM-0JIY;
	Wed, 25 Nov 2026 11:51:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWu-00000009itj-1mUG
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 11:51:21 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so1664229a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607475; x=1796212275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=Nae6s39Rj6e3mStAn0ORcqNvWuw+tbr73kh0y1nFspUQCSUBRpE3xhSnR0bzWJE1w/
         iGyLW0EkeI4TpLeAIsft7o9Y3PWD0yQptM5wY7I+JFKEvYF5gJ7v+r045Ch9TOOLmayN
         l5BmuLW1ZWVUKIco/KNYZK9CyGn/vLcGe5QRNwVwQQ+xzbXEoBYMmk65wOcGWId1UXu+
         JmQeKgrXTwYfpl4jVRRm+DWG4PpBpSgXI196XRjDV0YIhoArcT7Dwme0shJKm1R8Dsdg
         ns9vaur5kzondGFqlN6hYb7z3h/+ChKLfUBaLBu6w1yqn9MImEkVaLpfcorPEHOoDHQw
         T/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607475; x=1796212275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=yEFwRWwi5lShPZCGDQFqwVsO9X5Cx+17SAwOMtDakIWuCMAG9WK5CLnQTFX0gOWvEG
         hYK04f4GNrgqzuk2a7OIEX0Nt+YzIJVt8wzdD3qcZwdCLSOKqukTz5XPpAKvjOkyyfKi
         PL7qar4C6/rjAuMpr0M4OpjxdVaN6MJoEQrP2W8EVdIJHSW544GOhfB20VSpWwM9sAyo
         lLraOd/8NGMvSQvZwfKpyZ6Y6qFePiwqGD5n9sp90vfs3fyLUKYqclHCdfzFx3GcJtml
         9yzgHp+A+7Dz1j+A+IRe3hZ1XpgnEZRNjFF0CfiFCKHbNZDw8nCc1P8mHrrQMUPsL3IP
         774w==
X-Gm-Message-State: APuU4Z83mcjTidhFA7FwImCdAxdY9nVn7140MUWnnmnyJTR41IQRYiCI
	lpOeCIrFYMGeB354y9hyg0DZ8p77sbuldhZpZVFOLdjI6mcjhyuaK0wCpE5YFkDX
X-Gm-Gg: AZFdTZe/SBmY4m2ExDP6ttliUHn4vQ+VKbdBw+Bl+4Xaf8RJetKL+MQoS8uvU+h/Mqy
	ox992C4odXyT6pW2qJSSna7LUJ+Xt6eIT+LVbJDx34eq5602XfLhr4wdqgjoLXSNP3z4Ea7Rj/n
	Vqet4dXMdLjcoX61h/u6DgAaxFPelY2Puh5J8MMJ0fX/23diUMV7c7hUhQrMm1NjW24rhnWM2I9
	frQO4Peppewu5ODdkR4FPSOAZlM4mNOQd49aW96Oxda+3tv3selyG3f6B6GhHxHO+hPRduA3fx6
	5iuNuPceiUVMY5Mtef+urfzHxBD1RjXdDsPFR/UFEm4gSFuMWjk8UrL4P7c/BhNhS42g6QqSvJJ
	uHQRSo/WJzSF1EwsHudEkEd54wN26oxOmurnjcqaoNIjy2ad+9zPqJGJWDa17T5XxXBvSqfPIG9
	tTEM1imfT31qEkhKP6KqSHM40f7WZ2bpj2mQ0w77azNyFpfY1Raazk/r8zQH+RK4bGf1Y+JVaKa
	BQO2HVteHM+irThv+bqdb5LgZVm4SeXWiO8pWzEA5jVEkChmdW+2qi4oXgsTV3styLoVVjiKdAA
	UJiVADtdYzM/MVaGIyT1xulKPbjCALelsQ==
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14680529a91.10.1795607475481;
        Wed, 25 Nov 2026 03:51:15 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:15 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 19:51:06 +0800
Message-Id: <20261125115108.4147741-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_035116_553879_A74FBC75 
X-CRM114-Status: GOOD (  11.81  )
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
