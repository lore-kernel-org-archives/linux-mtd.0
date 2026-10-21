Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03D606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Oct 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WaK1XIU3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1bdHUXd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j16q0OL31vzbhpbNQOqvJmGeccaKqug7Zz3yMhqejPA=; b=WaK1XIU3EtEGwW
	1EjD29tp8Me0f/aLHQH3Mz9j3OjkSj9L9UTiPSnVKRboQEbqiUHhyRlNQbjPsAmlbIlty9kdOSVI8
	LwaIYDAPaqM1Vkgn2ifaPmwbAzv1XSLYQFrccigIib3iyfNPt/Em0bKJtdIx75/fwwRVpU9VHqcXd
	7ezawLKFLQoe9bSB82vEzQ/kabRsSDXGg+xQAOiJ+bNobDq+PVq4eiIkBzbwie5+WqROj84D/lG+6
	e7sa2o0EnZMVk0xL7Cx82GRYANWZjUH8QwB0JYvognJaU2LgK6kr2CB7/ynT/9Hs9oEweLHNg+w2/
	fM6SaRx/XA9QQYBYfYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUuY-0000000Bl9U-3Nab;
	Wed, 21 Oct 2026 11:55:14 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUuT-0000000Bl94-41l0
	for linux-mtd@lists.infradead.org;
	Wed, 21 Oct 2026 11:55:11 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5363316fa0cso7380201cf.3
        for <linux-mtd@lists.infradead.org>; Wed, 21 Oct 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583708; x=1793188508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EW23E2mFb7Fm/luf0IceECOkzJ6tAxozkU+iJmUE+Xg=;
        b=d1bdHUXdE1GK8/Y7eRVA7gHNYAAA5LmB1TMfl1JqZYCOusFqJIHPaNu3xSO7iZpz/q
         SESLybYa5EvtS8t4W+584ljlQarMu+xYdpO2yw3MMTFgOizuG8ntAaARzb16ellkvd1n
         Glmas/vhAz6mmM9Eb9bf6pzjPkMeF8QQ4vT9zwhIY66Q7vadle2a4rcFe3bqQDtlPxja
         fP/fFO4sXc+HOCkaLUoQVLmXinqw0uyJe29DGikYmNfmEyaaRuCzUzHM2goeja6cGBqH
         u+F80399OV76meYqM7LXKV7CTawmHtk/DHwcOchNBRd3dQWq+XQ/Yrzj7MGhLoTtGmNb
         K2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583708; x=1793188508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EW23E2mFb7Fm/luf0IceECOkzJ6tAxozkU+iJmUE+Xg=;
        b=ouXWY1cs5Qf+El/gGXXhZOTKdz8VDVWRIj7xHayEQDdLr0eN7rWEv7xMAPzfl9hK3T
         EUBOdSHO3GLC2cIZcn/1ye1amsVV1YsVGAaRnEoyt5c57gUorzwTmC5NzqTj9wF1EmlP
         gCYCnIT60J/MF+GnrH6VMjgIUut5Qed0bUbxNTmyV9qsOzf4nQAcisu1w4X/wh080B3p
         9qNstv7j42a6xsuEpfUq3zjmTl+Wk+dmRzBh7x3Inrd3AzrxpATuDs0LOI5Ic0TIrhUM
         Lv5IorzLeMeNQUv4dPawjO84wEfVCUE8bAwYDTse0/BJWNfv/Nh3m8XZTRZG5pKrA3Ib
         SSjQ==
X-Gm-Message-State: AFq9FYIhvK4f4g6B4pAUyAkdQ1svg5otBtL16f0TyFt39+8gwuEL5ut+
	aynuOdi2MzSDVV6I8H2uTXVg6WrFW8ZFGSULqiYvbB7KZs/pef5x6+zNpGs6tgw3
X-Gm-Gg: AYBFou10VDJit7WEJ/s6y04IJgiRDjaAAH65zBfXFGWFAFeaI6wIDwEwZqlvx8/oQR1
	hN46L02//tL7P00I44utj2bz81PHsc6RqE9G/bI+3sez6v/in+JpLCEXvUcAGBwuDCJCakvSNay
	og6p6niL0VnQPbcQMaKE652Fl1u7HnuKKLzN8257OciHia816MlhVNZIO4I/Pp4gDzBrZ+x1Yzx
	wu9CNnjLpNWVhw8YBJg7CIPCT2f2rO/C13Zgb3xOij8JWe5wjLHFBZNE8p5fcPX66s1Hh0inWQR
	UxQuyKS1fzDInoNZgjDWFoaOgsp48kEUEMkrINdzQK+HwD0T63iUgg2NvMht0j2c0CieD9NUMOh
	pwP8ZbPe0MlG7Nic6m4SDxJr49p6oLJqQKPHeqa5nEH9JtazhZc/dEjWF0Kj86jMEJlpkZAUJdM
	oS/eOfMCpPmDouIJMWb/o04VHa4M7ruOg9lq8yUB6IYCgBoWuRBh2oVLc2mPGGdgCIHLbAPBGPQ
	TCBLfcNre3u92S9ImPlfdKRD96sOVUryUjpimOEai2xb8vgeHsk3X3rwt/+s7/BzA1h9l27YXvk
	o9ruCi+rQTNXKsU=
X-Received: by 2002:a05:622a:1b03:b0:533:3e09:22bb with SMTP id d75a77b69052e-5369b82fee1mr25272531cf.42.1792583708345;
        Wed, 21 Oct 2026 04:55:08 -0700 (PDT)
Received: from virtlab805.virt.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae9290sm17472821cf.8.2026.10.21.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:55:08 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vincent Whitchurch <vincent.whitchurch@axis.com>,
	linux-kernel@vger.kernel.org,
	syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com,
	syzbot+061cb4ee001379dbbfaf@syzkaller.appspotmail.com,
	Rahul Kumar <rk0006818@gmail.com>
Subject: [PATCH] mtd: phram: reject non-RAM ranges for module parameters
Date: Wed, 21 Oct 2026 07:53:48 -0400
Message-ID: <20261021115348.799538-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_045510_010614_6C46A3BB 
X-CRM114-Status: GOOD (  12.73  )
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

Writing a bogus address such as "p0,0x8000000000000000,0x1000" to
/sys/module/phram/parameters/phram reaches ioremap() and triggers
WARNING in __ioremap_caller on x86. On arm64 a non-RAM address can
map and later Oops in memcpy when FTL scans the device.

For module-parameter devices, require the range to be System RAM
before mapping. Also default that path to memremap(), matching DT
without "no-map".

Fixes: 9401911f2d9f ("mtd: phram: Allow cached mappings")
Reported-by: syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eaaabe90f486cb6f31b2
Reported-by: syzbot+061cb4ee001379dbbfaf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=061cb4ee001379dbbfaf
Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/mtd/devices/phram.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..9747e7e58e6f 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -19,6 +19,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -126,10 +127,16 @@ static int register_device(struct platform_device *pdev, const char *name,
 			   phys_addr_t start, size_t len, uint32_t erasesize)
 {
 	struct device_node *np = pdev ? pdev->dev.of_node : NULL;
-	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
+	bool cached = np ? !of_property_read_bool(np, "no-map") : true;
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
 
+	if (!np && region_intersects(start, len, IORESOURCE_SYSTEM_RAM,
+				     IORES_DESC_NONE) != REGION_INTERSECTS) {
+		pr_err("start/len is not System RAM\n");
+		return -EINVAL;
+	}
+
 	new = kzalloc_obj(*new);
 	if (!new)
 		goto out0;
@@ -138,7 +145,7 @@ static int register_device(struct platform_device *pdev, const char *name,
 
 	ret = phram_map(new, start, len);
 	if (ret) {
-		pr_err("ioremap failed\n");
+		pr_err("failed to map memory\n");
 		goto out1;
 	}
 
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
