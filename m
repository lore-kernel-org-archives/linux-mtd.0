Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF0606A332
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWQxLNpr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZd0T3V1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vyj6QTLs5jMyioY0xT4neofuc78RAB0AeAIWpvHiwrw=; b=wWQxLNprpTtwwnsJKvV6KWHHDg
	VHaUgYYlhUEFY0xj2aHbpA8dRoKpceQDnqUar/xJ/22W5IFDiljGqW2gnKatFmNGpkzzCpFe430Wm
	nKRyrezSm5JAJxT6DhWbCzhY1AJz86DCZRAr57LUdz+EeXEl7DWPMZ46bmhVjdVoIeMaxr9kzlFVs
	gSHu/SeR/9nFUm1tLxkSry45dBP1QX8ac0FFPxS4aLrz3aFg27OdWAuotAEoBZ2Of/WC2DRhibaTN
	isawZlYDF40RdkCTbITB7MURw0zk+QlbRdNiSP4/bbMvIBymaBgTuHRgYcu9MPeQpK4rEf4tcfPQf
	mYt+5Dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wc-0000000Bzk6-0bj8;
	Thu, 19 Nov 2026 13:12:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wa-0000000Bzj3-1XTO
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 13:12:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31771695e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093970; x=1795698770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=dZd0T3V107nnFWYp2eJGcy4Gf7EcCqE2b51MyULsZfAyFHoiYkmJLouRaDimugI8Rv
         meOy9Hfz4UXG2iyCuu+20G+BPJi+lyFcqU7ossSBpeALfp5spw2o72r4bt5rfScvPa+P
         Lz5keuc9vkxTjy1WSylMqJuRieOl2AOiVMVBJtRwxnbC2wLxpLU9OTDhUmBCyjPaK2/4
         3thTXefg5hvPcRlRCh5jU6PU7bRUmwrAAe3A5MBgUSUR0MlUOF7XYl6Ze91Yg/yinwAa
         pZ47IFg3F2ir7Hp+f3PU0jEC2g5hyqfTj4bkrRyzJXIuC2IXNS8exFOtleshuYt6OXKR
         2/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093970; x=1795698770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=vO67sLC51pEU3FD/fRmmT7BQAdR0Z2jtFN3JLnxW+njIiycmereOksP77PtkvAW2Xi
         pnsSw6kESySDtM3xhtqt9B5OFdUL6RmnMZWg1gfhBeQyVs+s6i+RkNGiZQNWDAn6eDau
         I/JwPxYlDA77MaSb98hAVgpKjw+iDd+XuD2QBAnjPYw6u0mx2z3eljvqkIPLWd46dFVa
         Q68QfGexyNTiu3uvf53HFNix5TgM+uEXG++gjNbR/MYQb03ASs3MUHudHwfeVFDR+8IB
         xp5Bbhfa0/563qRwENfQZngwRftod9HPHaEgax38deAC+yg4lNQuSnFowEqoCzf4wFkj
         8OHw==
X-Forwarded-Encrypted: i=1; AL+hErEe7DVuoxh8wg7C5lSqqAsc4z0EZgmcnPu1zSr7xNyfSwKuIBDFi1yRkV4+4oC5S0RxCpErqnhkRvc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/SRrm7B8TG2RI/tGwfoqQLqs86ABfzRyRwdQcr7X70N+EBsVUI
	cAPXb5G6opMPJoAyjedMOt2STOcFT1aLDnontvrpAEwEHpKJsJdZ7Zcx
X-Gm-Gg: AYBFou2Zt0dP8DtKnjVFhP8KTsCxHn3ddhiqLXvJcBOWTP39hHOVHjXob18Awpo68sh
	STEogxcnfa1aU+DpKf/DtjiLxxkHrS1TiVbv8sV/paO+ai3mECuLBIS910TKFWNPNVE1wgNs8Xd
	ZUS7+kRvrQ1p4dVWx2VVIYQnMcsdhz/9/ZHQZVjA24HOhwT3KxUS+7BHy8HzhU+iMcQbWhWQDgi
	oFvbC6okkHRCWaQZg3SBF9Mh//m75p0pvxtDdNXmWHqOEHoenc5S5RhFA7WQ6/yu4LiXMwDG0VQ
	B11rIBN2EIWPCBo+vHj8CfVn+iSWv6Xr3k3gNtIImXxChA+gGIURLflP1/WgVuEwbHsnQe//jXK
	EUbgoi3a4NIIt2f7V0LYl4tqHLXaIF+ll1yX6wz10OOrIZ+pDa5SwENpK43xIlbmeGLthXJM7dW
	5F3EqcQsyZFSMwlHUySC+RIG+XcxtnHUqfjnT23VPUOfdwrZ5yEA0P6dvfnWVKt1b5U1o2tjdUT
	wcT+zUtirOl3/Gmq1AtoqnC+FsZNNgR6GeZCd7jd4NCo30QmuGYI+6/n7HEhyA1vyfIt8nur6Mi
	8KvK1H9XcxqYr5jRlIQdmq1QNPIZVy0pBsq+nPHyJGeXZsr29WFAvfhv
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb7da28927mr133157225e9.26.1795093969644;
        Thu, 19 Nov 2026 05:12:49 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:49 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3 1/3] mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
Date: Thu, 19 Nov 2026 14:12:44 +0100
Message-ID: <20261119131246.187406-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119131246.187406-1-mehmet.fide@gmail.com>
References: <20261119131246.187406-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051252_449792_85744507 
X-CRM114-Status: GOOD (  13.29  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The ECC page write transfers the page and the spare area from the
controller SRAM, but only the page data is copied there: the conversion
to ->exec_op() dropped the vf610_nfc_write_buf() call that copied
chip->oob_poi. Every written page gets the leftovers of the previous
transfer as its OOB, and OOB data given by the caller is lost.

Copy chip->oob_poi into the SRAM buffer as well. The NAND core fills it
with 0xff when the caller writes no OOB, and the ECC engine overwrites
the parity region on its way to the flash.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 6ab3c440eac7..acc9ff282083 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -637,6 +637,8 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	 */
 	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
 			     mtd->writesize, false);
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+			     chip->oob_poi, vf610_nfc_spare_size(mtd), false);
 
 	code |= COMMAND_RB_HANDSHAKE;
 	cmd2 |= code << CMD_CODE_SHIFT;

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
