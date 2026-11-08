Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D4606A331
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E65e0AW9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZkvSB4HT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M/DHXj3p9wYuyPRauvkayNB5ps4joydbzMHpLtTcLrM=; b=E65e0AW9q+EUZvyOPchxO5/NlS
	5hTcpRhho6xIbzOmuw3dWB/XiUhX1KORFEKfPQhiIjA7WuW1lw2O3Uxb80wOJB528DyGYONLF1LlS
	kEnIpz3J7ilyLUFdlvt9Htju/86u2ltJU1D9RBM4t/KXyp1moiDlhpDUvp62pGscgE4ZqFYGGqrLi
	QBG2+kRTvRnEj7sGrANldIvRe124/Ys70g2TJ07QsDPrp1E2Wyq9MhE/KxMmP7V7x9oZiLQP/tvSt
	/utiIZ6FsjoFdia6ulTpKaBFcQOXC6eNe32rbqjYU8XYPppHaH0glfj/KP5nnTG4vsg7lOBjQleB3
	ik/l+NIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA5V-0000000GfXd-34Tm;
	Sun, 08 Nov 2026 21:06:05 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA5T-0000000GfX9-232z
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:06:04 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-825b40f8a26so101182a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171962; x=1794776762; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
        b=ZkvSB4HTUhmIBV7MGEWpao86bKFojHpM2RE74RsmJDfeyZZ8nTZbsb+jaN3fDkaNXJ
         vN1scOPJVt33EXqBOtCwCfWq6HLJADADlSUeu7SQ44guoMLny+ExyjIb/f7syM8tqURf
         HSyse/gw5WprtCwILUksMhWIXXTllqrFnFSpRuLWBlTN6MyH0n/KSHsNfWXmDn575dCm
         mY7tbNtWXz0IPjOD1gXfD0CD5o7vUUso4IbmJwfDo6/dNIkpZmdK9RL+j1o1c1u5kJf7
         UhY2HIG7/mIULpFBLJZdTdXgaJtWc+52jXRyaWbHRFCVIz29Xz5/5qVgK/du0noxk4Ge
         O08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171962; x=1794776762;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
        b=cYOdbQV+I6d1o8GpH0YT3tSPxigdLF7LcF1hND/6vbmu5MwWSYI50VxiZBWxvxOl8I
         br53E0WnjJKsX0bWO/K5xxsfu5GTtfL9XNQNUv75a91+5AUmo6zP7fykXM5HQgucY689
         E/m4QWAVmmC8Vx6eZkicTBS+h/QY1BuTs63izKizwgdNMe/pcpsV2Tu4wQuJ8CBC95HZ
         tMW3RMeFN28tdQ1RdbbNK8NqpQMX3dZN74+00QZG3g3Z0py7/pASVFL5CCxaayh7uQYN
         ZCA6YRZv+qTcO8Zaf9hDriXWjLbdkWkzE63XvgIiYVLmU+kOGjy1verLdOEINLsGLTIv
         I0iw==
X-Gm-Message-State: APuU4Z8b2RLiKewJbHrgrfe0Dum5PB0tnCJ3Enf16un7Q+vgYIb8Gu5+
	E4WQpgC6yRj+5uiAjRXzy+jKCCN6wBbPlCuc2mGGf4/WM9aNGFIoZAbI
X-Gm-Gg: AYBFou1eEXBUZNqyJX4S1RjlbG+7b2bwy4IZWlkzMLeyqO33A5P+flhEFr2tx61OHhl
	VXxPk2jt7C0aPBqXQ/rZEfLoOdYtQOYmissiakmCLMb3R9mHXOBiEBF4oJDbVaeMFMSrxgCJhp6
	M4r9XYIatyb+FMMYW+Ry0vT0yxqCcWJOuo7Wt5/mCibaQOgG2DnDBvC1DWQ1TbOBY0Ezwupt8uz
	o+SHn6DSDme7S1oVqO2tamOwHn2SmOPcoDXQ6JXtxQDZinAT3j9LKcJFqM10kK2EiHfm4zOEqlA
	7RX1fR42wFyY8Q8NueIHtmo4Gjxlzj0Bbwjtj2dmpQB4hp5DX2WxZbveNCboFZ5shyR2uWbHOIk
	9VGYMuFzn/NvMP99VHWNQFUKpDLeSPPPVBPQWZS9+FNckVBFTyb6zm2/Yc4uEs0SQsq9MKAsuGl
	w+SpubPT0dkw49bn5t+RMxM2UZPphWd2ouaelVfTzNQKTIMrnm2t4wDovnDS+S659ot4llymR9u
	pwTl9WWjTIVisKGaEEJHXh6pZArxQeY9uS6kQfaQpS/wnXlFoYm01/yFF8dQdl8q5NGsnwJplZb
	c315LYow7O4HqXBjJa8fg+EIhKv1W0J1EqV7rJVbjK+Dw6OLvPnkup7VCxQqHaUlbef78NH4rfI
	EecdsmK2X06hWo+aFmbSyLwwq44OrioZJGMl9cT/DD1u8cCMfY36fGt8vzpbIVtMWX7Ed0P22dE
	xw5jjAeECAgekN40c1eyKb9t8a8ObLndPpoxKJ0HlBNfL27oIxsLTxCkdqFbxgNLXLkrCt1LrcM
	g==
X-Received: by 2002:a05:6830:2317:b0:804:ec69:3979 with SMTP id 46e09a7af769-85f50854422mr1625444a34.21.1794171962292;
        Sun, 08 Nov 2026 13:06:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fbcef97sm2275583a34.21.2026.11.08.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:06:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:05:55 -0700
Subject: [PATCH] mtd: rawnand: tegra: drain the IRQ before disabling the
 clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbZhA4M/t2I82E+BmVC0m0hCu
 Hc3PXy/NE83iCSBIlyrDYSWEMPMOfShAjcaHgiDzw2Najqt1Qnj204hYaJBDLJhj0FeOY34+cO
 4aOxU3x0vrWrt2UF2nkJ9WH8/bvd/Z+RBLhW4XFgTCa0YdmOZpuTrItdMa4J9/wI6p3S/pQAAA
 A==
X-Change-ID: 20261107-submit-tegra-nand-irq-teardown-v1-60f649303b8c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130603_761076_EC86F0F0 
X-CRM114-Status: GOOD (  11.23  )
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

The managed IRQ handler remains installed until devres cleanup, after
removal or a late probe failure has suspended the controller and disabled
its clock. The handler can still be accessing registers at that point:
it signals the command and DMA completions before its final register
accesses, so waiting for a NAND operation does not drain the IRQ handler.

Mask controller interrupts and release the managed IRQ before dropping
the runtime PM reference. Apply the same ordering when chip initialization
fails after the IRQ has been requested.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..1104d75b6cbe 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1212,10 +1212,13 @@ static int tegra_nand_probe(struct platform_device *pdev)
 
 	err = tegra_nand_chips_init(ctrl->dev, ctrl);
 	if (err)
-		goto err_put_pm;
+		goto err_free_irq;
 
 	return 0;
 
+err_free_irq:
+	writel_relaxed(0, ctrl->regs + IER);
+	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
 err_put_pm:
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
@@ -1234,6 +1237,9 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	nand_cleanup(chip);
 
+	writel_relaxed(0, ctrl->regs + IER);
+	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
+
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
 }

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-tegra-nand-irq-teardown-v1-60f649303b8c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
