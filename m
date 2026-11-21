Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD72F606A6BC
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vbq//0R3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5+GtHXI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PRBK/C4YTOGxxyDF2gUCfDr+jzMf0DouvfmDA8NtDFs=; b=Vbq//0R3fOk2PZXJfRVTX9o43b
	4ccJvqlsv8Czu+CYQx5CtApes+fbiFn+SHdil73Q6IVZ4n2YxpB3UvNVzxkdKqgqQcyubf2CywGdY
	Iny+BAuoN5KkictOx2xQSWBrmsjV8rBNMiCa/2A8A4526TCqjlN/cqdDLnX2/oF51wda6QGIz/Evq
	SqNe+LINecRwx0nwcCe+pw8hxiU2oMFP5Ij8jY+6QZDP35LRYok1o7oEOhCVHNJ0rZj0mbMAcLMmb
	J2Uzm8eAtgceNT8Vf+8OvyUaht+wEXFcD+PXxqhxmPID3bmT7b+JuBDipmylQwrlm2FkNKQZe5gdI
	8yVNbheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZen-0000000GagF-2Loc;
	Sat, 21 Nov 2026 01:12:45 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdM-0000000GZOv-2Esj
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:22 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-571eb508edaso714196b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223475; x=1795828275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=A5+GtHXIOsGrslVXPWAxexdzZoeRu9uILxTy2QWwaw+TuJ69UhctomFkozY96p+mqh
         jUYA3eCajkUc2xndUivvTcuJhTSNDvQruoEGbX4h0OO6AJ+ScZ9r/5DlFhl+eAa0GrEW
         fe4bZcHSISlzgr9LdgkVsunO4Fl4QAbl1+ICJDIfoU9pmSP4NeI5p/ta4/iPc8n/G5kW
         T0klQTBnanjMFpRl4N3eP+tsqkhMn69p1kB+4/EWVWAjBvaEMQaTKICYjNmvydTMw6M8
         1gRnFzV5Bxr+yK+hwJ1UdW1zdZbZayvY9nLCzPiGSb3+4HihnwW1AyjqyWdAfcBzAVJ/
         LT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223475; x=1795828275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=dYt31DIQZOB/PBezB7qe7vA9WyNAScxhIyYzWGYn6HVbXE0GKdEzhI64UGKaMeCyWC
         vJkfDXcrZjgPcLiWZEz6sG8ApGHrf/fY2F82uZw6CO28NlPVmGvEZhD6hlXPoiyDeLL4
         z354nww/VkLVT62Bl1IhqvwRRBmsClVd+h+M7lP8SGcdd3KSYSC+pOOrzn0syLT5wrfH
         bEElqmNdtIuOR4OC7dALWJF2OPXIIjLPgsOB9/xKpUHa+3qDg62WnKCx859gmtinP50W
         e4lDrSt1CcW2bSaD5P91Ozr6TYVGDAABddTVu3N5HKZ4KttvBAWx2zQpUR4ATqKM22QZ
         rIPA==
X-Forwarded-Encrypted: i=1; AL+hErEKmhYS8soQQ7V6OT3D4wMlW1WDQxDKz0eLLfI+RmGfX91iy83cT4CpUM3RhSGnSad0yD37k0mmoss=@lists.infradead.org
X-Gm-Message-State: APuU4Z9tO5lE0gcpAWX4eXLRuEV5o606QJr487JqyhHbuOP7sQndXp9U
	bRgVZFTBzWhc2lcuPigG2jdU49eVj/e0SL9x4xIAl+h1QLrwxLrG9RKV
X-Gm-Gg: AYBFou3FUx2pK9HnXntVIs5sMSHiU2XWCP4mNSPYtDdq7656Dls5BmpZynZa0II4i0H
	Sb852uF2dqNMh9KX1Ks71rePvFPwrEKtaSTWuitzQZADmVvkJ8skmQL0NKh5Q+JNXI353A6YLtJ
	4B8FuyVXwuuIHJcud7nsSr4R+oK3JX3x+mYKHUxE4kj37a/F1Jr83a5wpNlKZl2NPxw5+l35Pp7
	XdvAURpkb4q4L3mUwWO0wgMJG0b9HwEIIvPN1LNNlUVFFSV4My7Kxo/ehe6kgFxyb2nn00iMSwL
	akJcNDF1kijc7JCVCot9GQM3hsLZAsBX+AL7Ydi8tUAEoBrDu50a7PGS3vMOAYx241xSL1CSpd+
	5it9ePl50SukVVMlzrsUQ6Ksw+DKRQUG2v24UMrEZsrkMUsQE0ZEgXeySTP43v0TLRiSlyJr0Yw
	DbtXX/n05wP+ZsWHEqaqzPf5VnMDthKpCfvj/9TUxlBNC5BEF7bMFVpE0HQOTNT1ZeNKWNg7++i
	nXqtqC+ewcnNthTk657l22vpo8kUbgZtVAfBQ6qG4UJg5SrM+JcsUmCzYiArXuN3kbJjLGfGmrf
	vei84va/a9HSmM8ragKZrbAKd2HkUTZS+EGBRCmYaef/+N2rliXjRB9jc/PujA1c8H6e/0pPR1d
	fhMLnlfFC4uacHtsC46ulnijCahfC4gPRI1qwC0rBluEwdHVIPZ4nXzRUDIXmIRzxWpJA24Afml
	lacELMi9GM4gP/yUxdu0HrS4g+GNS+EUhv+Aauq9jeGbaqYQD66VS7
X-Received: by 2002:a05:6808:23c3:b0:567:f5d0:741c with SMTP id 5614622812f47-57a0b959e91mr6046198b6e.34.1795223475472;
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:37 -0700
Subject: [PATCH v11 14/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-14-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171118_186498_47A19069 
X-CRM114-Status: GOOD (  13.25  )
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

An OOB-only write can report failure after the NAND has already
programmed the page. Both the PIO and DMA page writers issue PAGEPROG,
wait for completion and check the status. The OOB wrapper then issues
the same command without another program setup or data transfer. If
that second confirm fails, its error masks the successful write.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 712648864407..7f9bc0237cea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1779,15 +1779,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
