Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22904C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eBX7kvkScCrYw/Jqn9ozwgWOCLOvtaptzkTXDNEV8oE=; b=Xm5
	oZ/eM+bIuxt/DuW6nkCAjBWkzL6vPzmGmttKEMFWCaucBHMXUO/eU2COy+pTO8pLN5+DrWpO9eUxY
	hkjPce3lxFJS9BZYFGilHczIeyuT1DDCgRvXCIJIh/QGpTz7vg6TD7wTSOb5tn+BsjYmvTW5Ln5PC
	ilS3VsoR4TtKgZZ4XTU7ovoa+VFdI9sFWfZvW9ARBAX/g/FvGa8GDWQjz41UJJHaB+madLSxqdRIy
	JemBPZbS27EInCOWoxo1BAsENc+XL3ZNe1GoPqzd7HiAbNH/RHWv5Q9X+E/GusUJnZOr2eiGTNgar
	0cCdm+Hznz0hUam8GVEawtpgOIrE+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW1Jz-002VpZ-2p;
	Tue, 15 Aug 2023 21:11:23 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW1Jw-002Vmy-11
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 21:11:21 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-589ebdea23fso49927937b3.0
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 14:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692133875; x=1692738675;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3y6Izf6PWqeRPwTjJUSGtpHjQ5Xbrf4Hr6LZlxEahOk=;
        b=DEykWB4VPD0KGwkR1rgTEkxuGrmyMbRmPDZOUHEnPXwFaHI3rUqsojcqqySGFoopGa
         qtooGMRnC2iBatnU5WIMN05g0vZUnhEdJZVjk4lw6MaKHZj3uELr1pxCP5/hsgTqIrBu
         1inqQgqIJZJ0VlbPAJIpm9/aWo9WsTqBaNDDVihJxzTBMBNgex/TOLHB2mYmoJOp1Kva
         bWeQr8NZbtkqjwq7mvqMAtaqjcOqkVBp/oDMzrZX7hqKYwQW4a6d2vnhTsoUk3GQCY2x
         1lnjzzGiQr7G4wgDP1gxwsyDXBuhUnF7eiCe83f1an5ltuLTmcDWNx/do1f/T7qdFpLb
         btCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692133875; x=1692738675;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3y6Izf6PWqeRPwTjJUSGtpHjQ5Xbrf4Hr6LZlxEahOk=;
        b=eR2bA0XLKSaT80fKP9u5m2X6+x51+5nChIvGEnr8WfA3RTUC/u545h1OGZYUA0uqcY
         pI+0qoHg59HjHwq+jj7SycItmawPihQhYzTY9srcoEOlja4JV+04JZ/nCEU0lWTPjPmr
         katRVgS/AgVmGyvQO9us91wYCsjtLInsmr13aigglPc/GgQPcxO4aFXxQGeRHZGfqkTY
         J+a9KUkyexJTLZ4u3nun1DQE+a7bwA6JOoCsjiMFkcMnhbLPnJOB6MfHsJCS/CA9se5T
         17/TcSrlmx9D7a/kU7/n/IZEPQuQuXmOiHTffztPBc8+ZjL54rx3ksrRYAJi0MvRSUTd
         Y2Qw==
X-Gm-Message-State: AOJu0YwJ5nHpZK2d7QQqxnlWeHct4TXtt3OGwiNNrfJzqRMRja4FNNZ8
	xkLWo1bvgA2eDN0iXRHIz/68TgU+3DA5OZwVYg==
X-Google-Smtp-Source: AGHT+IESHOcNCiS8o17qcx7V9DnY9/u5Ejmnxug8PTEedCECk+Qy3ouUC8CMmwLN9yzo20in9nO1So2V6LKsvaBvXA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1818:b0:d08:95:76d with SMTP
 id cf24-20020a056902181800b00d080095076dmr2170ybb.6.1692133875480; Tue, 15
 Aug 2023 14:11:15 -0700 (PDT)
Date: Tue, 15 Aug 2023 21:11:12 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO/p22QC/x2NQQrDMAwEvxJ0rsB2aVP6ldKDqeRG0CRGCibB5
 O9xepuZw24FYxU2eHYVlIuYzFMTf+ngM8TpyyjUHIILV/fwNyyzEJJKYTUcF8IxZsM8bNYAzxo X+TGG0LvEfaLk79DWsnKS9f/0eu/7AWJszKR5AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692133874; l=1857;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=HWSTPugX/6hl45mOi43ekrd154LFJ7mP03sqOaFNygg=; b=mUKhNFxwaMYAvGE8r2mEXisjetzD1WuRCSRRz8uhoZeTBBafOwti17CqjOH6uuGZ7lX7yJ56h
 SfAxWxpgjWqCv3/V5qSm4hMKInmpums0ZWkx3xU6Pf+KbCoMPqB90qI
X-Mailer: b4 0.12.3
Message-ID: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
Subject: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_141120_362605_35AA554A 
X-CRM114-Status: GOOD (  12.32  )
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

When building with clang 18 I see the following warning:
|       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
|               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;

This is due to the fact that `devid->data` is a void* while `enum
versatile_flashprot` has the size of an int. This leads to truncation
and possible data loss.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: There is likely no data loss occurring here due to the fact that
`enum versatile_flashprot` has only a few enumerated fields, none of
which are large enough to cause data loss. Nonetheless, this patch helps
towards the goal of eventually enabling this warning for more builds.

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/mtd/maps/physmap-versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index a1b8b7b25f88..d65cf8833771 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -206,7 +206,7 @@ int of_flash_probe_versatile(struct platform_device *pdev,
 		if (!sysnp)
 			return -ENODEV;
 
-		versatile_flashprot = (enum versatile_flashprot)devid->data;
+		versatile_flashprot = (uintptr_t)devid->data;
 		rmap = syscon_node_to_regmap(sysnp);
 		of_node_put(sysnp);
 		if (IS_ERR(rmap))

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230815-void-drivers-mtd-maps-physmap-versatile-2270fe7fdf16

Best regards,
--
Justin Stitt <justinstitt@google.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
