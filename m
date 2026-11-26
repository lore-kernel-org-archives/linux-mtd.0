Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C68C606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQSMszrI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWgT00R4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ofum30Qy6aUdRZ5ZhbjIEfq1hSQ+aZdPeaT6eOn+B20=; b=eQSMszrIPuhDIlAKRC2DVnVQSd
	L93PWueL0omPaYRwsN/IZ1CmV/qylQu+IaQJGQ4RGa0JdKMd8HRERlBYrMdmBlIdP/EJIqoR16Qma
	u4TlS7kOUj0rrvY8R9yEMEmM90/mBgN05M6zforWllLgUrASlvQQiMIYlKgxjD5B+6jOn5WK5FKfq
	mo31omjTIX/UdlubSxQSdH1HPD7xaCXgu6vXo3K4HltomvPceW20c+rd13V+ERn8b8agudxQ8tX44
	ip/Oi9Qa9ttlL/8i3ox7ylwd1tEJ8PqkpQR/JEmZc/kil2SyW0ltX0HL9I85z72F5G1Y3AeVWYbN6
	MnOVSeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZc1-0000000DO4P-0Zta;
	Thu, 26 Nov 2026 13:34:09 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZbv-0000000DO2j-40FK
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 13:34:07 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38431138772so9094206eec.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700043; x=1796304843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
        b=bWgT00R4D2Q5PLc/gmOYOOW4KZlv9B2KYFXFUUgvSQ0jzRNbix/P4p9lf3QovKb4XI
         EkA+y9rEfB0GJ1zAdQ2QZ9VxmjYH36fh2kAzd4yj4cZL0aHXWr195zPJKhRq42V4p1SB
         prisr3P9hDXmKOlWJOq9te9BUbnMN9/+VJDlfXRada8XBpTUElbU6EwW45/dtj3flmDK
         4+oabRAchX/qoAuJSY/8QXlB39hMRmxdbI/BCUQaE10L/783lkr/UL7eLl0TYD+YXEz4
         B+CcQsBzwELjoPSkJApdshy1pIqV0I3WGtXJIa9qe33K/HSmeHt/sDBlBCnr4U43XEXz
         7WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700043; x=1796304843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
        b=eKK+6foEZ74gsyL0ElIc7EpEAcDLEFiUyiyRtvRtUy1wq0pi1CgNM1NYK8maFDoCPp
         2rZAf1bdPXh+TfyWGGIRoqKBeVd6qlcH3eRWOgjmWINMKiMr0y1U2Ie03wUMJz3KGHgF
         wGHQIVW3QKEUiPQ57oSolViv1t98oLUBPFFiihDqpywRRbSmHoCMX+aquLpOcOgE/f/R
         1f+JqWh28L9ckzK7TOxXBEMNC+TfLF6O6GLyk2/FRC791cumRGNgBQfPKWYnlGhdONQM
         kQ0rU/O3T9L6hDpEVb/W0+mLCDhGhP+X5t/N0sRJKOk69j6FMXqEm1URw+ir9dCEQ+9v
         EuXw==
X-Forwarded-Encrypted: i=1; AL+hErGOUSDd099EU53TyeTeOKsOe38G4IvrXB8H84boiLszBhcQpgwmHkGpOHWrEAIFmVhglXc+iCzanqE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+9zQz6en2Zf8UCO3YnORwLDlcuA29hH+TrMtBlKlg1KClE2scA
	3mJFCBlNcMTS2xGjehEd8mzO7Qm38tQyRCowT7P0eDzMRpgPFMXcNS8=
X-Gm-Gg: AZFdTZcTAzrweYl+drgkZQgyxxG3D6CixzuoZyzdGzxsBqgX4ELrJpvDl5bmVHC/qSA
	DL3gifplHiuwt42KqX5NCmWYS+05d/vV1BtDq6tgUfzQIZPjudt2uR7Iq3KZWNJMo3Zzv1BnpP/
	ehwwNKwdH3oErLZtGEIsN6BMjnR36vSnUppi/AWqqbs81gKG/e34wYp2df36GzVBVkjYnPd2b0S
	CjuBfr4EKGsvzfWoeQyAecNlvPIOMH3D8BmpSxPCB2fMK5SxLgY2DiHUNjJwrk5v5pu91hUJkhd
	p3BSbVIAnv1ENy+efmRr7CmHpn93xlePEzFVHV8MLzlLekDt/bCRpfINdJ4FymHw81zDbfXS0Ko
	cHbGr9kD/2QbMKKeKm6Ln/9wX5aXuSYj+XYYSWycJGdpNdqJ/G2jhivylSMfqLRN8Yes2NhPS08
	12pAw6K5KCe4ghvBRwspqedb2rGzd/D6Kv8Iboeoq65u5AkpiLIUykOzzXXexJ207a8I6br5NtF
	imLiRt6FZaI2/66W2NJiSo/YgD3R26E03g/6btcEW4ZiAyDET7qIFHYns4gtQxldDYbWHx2YB5/
	JgntgwziVGPEcv+O5ixPPwBAdxaw3Q0CkW42SoFYwm/PWBJtXAFadzxOq+fvCKvjU48=
X-Received: by 2002:a05:693c:6010:b0:382:105f:e7e with SMTP id 5a478bee46e88-3857170e441mr26340102eec.36.1795700043018;
        Thu, 26 Nov 2026 05:34:03 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm70967222eec.21.2026.11.26.05.34.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:34:02 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Maarten Zanders <maarten@zanders.be>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: gpmi: fix probe error path when CONFIG_PM=N
Date: Thu, 26 Nov 2026 21:32:39 +0800
Message-ID: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053404_000857_3F278FF9 
X-CRM114-Status: GOOD (  12.87  )
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

With CONFIG_PM disabled, gpmi_nand_probe() enables the clocks by hand
and gpmi_nand_remove() disables them again, but the probe error path
was not updated to match:

- if gpmi_init() or gpmi_nand_init() fails, exit_nfc_init releases the
  DMA channel but leaves the clocks prepared and enabled, so every
  failed probe attempt adds another enable count;
- if gpmi_enable_clk() fails, the jump to exit_acquire_resources skips
  release_resources(), so the DMA channel taken by acquire_resources()
  is never released.

Disable the clocks in the error path when CONFIG_PM is disabled, and
let a clock enable failure fall through to the runtime PM and DMA
cleanup. Builds with CONFIG_PM=y are unchanged.

Fixes: 1001cc117124 ("mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_MTD_NAND_GPMI_NAND with CONFIG_PM=y (defconfig, =m) and CONFIG_PM=n (allnoconfig, =y), CONFIG_COMPILE_TEST=y (object only; no new warnings in either).
No hardware or runtime test was performed.
Needs a CONFIG_PM=n kernel on i.MX and a gpmi_init()/gpmi_nand_init() failure (e.g. no NAND chip found) or a clk_prepare_enable() failure in probe.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 019df54c4bb0..fdfe11439a6c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2806,7 +2806,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	ret = gpmi_enable_clk(this);
 	if (ret)
-		goto exit_acquire_resources;
+		goto exit_disable_pm;
 #endif
 
 	ret = gpmi_init(this);
@@ -2822,6 +2822,10 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	return 0;
 
 exit_nfc_init:
+#ifndef CONFIG_PM
+	gpmi_disable_clk(this);
+exit_disable_pm:
+#endif
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	release_resources(this);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
