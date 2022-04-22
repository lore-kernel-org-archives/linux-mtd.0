Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCB4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 19:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VpxV7zQk7zqRk8bupQQa6pqUUI/R6KHbh6m7zZp70/g=; b=lsIOSORzKrfBNu
	ShJLiDWhTHzg6YdYKtsST8P4mN6vmAzS3jGij4sRT5ea9I5eDChNYvcSdhtV4b5Uoz2nGoZF9+qYz
	TQghZtOHWM6f8fojgfYrq7rQgx9TTeWr/E7JNCHCTB/YLboiSZmBTm8g6eAj+2cN6YE9y62ZKlxls
	uQwep9sX38w0NUdUv7vgMlHmTlzh9F6AmbFq3BZMFupCuiyPvxsvaiXzxLa4fUphtugQacQfMLbdS
	6fOIU6ZyVx8HPo58LzfeEynD2+d3zv4rwkOOnSkCnSDcJfWklTNS4c54f3N1hdglcSzj7c6fS71Qy
	50y6PnSi5pV4b6GLlmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhype-0027Ai-NJ; Fri, 22 Apr 2022 19:20:42 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhypc-0027AB-Cu
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 19:20:41 +0000
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so9610677fac.7
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2022 12:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPXMqD3X8aZc1gXMrMxqebs6D6zYaQ0urWjSJ8Up88c=;
 b=k4M/Z92Z2zOvUS2WHuymxbigCx6cm/ENLPCJD1sNHVMYFQ0QvLD48i3vbV7N+aockd
 3iG1tPyYgvHV8fYc7utsa1oxX/9hNaEHwR8q1d7HpUsixby5KgInTX4ERh6efSPVXrSV
 Cu+EMIL/Akh2upibEEUKKMvWSH8dzZNB+Wevs/MpKszn4nSOiS5vT1FFI7eodv+75yvg
 9AUMt+lg7Cc2YgTn7ib94lBl9De32npJiTSIfyfNx8GkHhCfpwBA+XZ+wRjWsc0H+FnJ
 RshbwND7trOd7rkGg86HlpIvz+Dv4bEOJi6MM3fAv+6wr+E6WOLeBsPji6oeTRfXfnwG
 SbJw==
X-Gm-Message-State: AOAM5319s2eDLDicAzaju+xzs1yjDLeaTd7AOwuh2f7N4tiYWMJz8mR0
 tOyd6YQd0YGRxFi5x6Lx+A==
X-Google-Smtp-Source: ABdhPJyNlHUyl9wvKM6UUmFm66SCvceXo/fIVBC+AhuhJuRSCFLQ8tRNV5S1nH0SHinOhCxabmzQ/g==
X-Received: by 2002:a05:6870:4149:b0:e6:8519:94f5 with SMTP id
 r9-20020a056870414900b000e6851994f5mr2684281oad.48.1650655235173; 
 Fri, 22 Apr 2022 12:20:35 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 h21-20020a056808015500b00323c43663e2sm1047276oie.32.2022.04.22.12.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:20:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: [PATCH] dt-bindings: Drop empty and unreferenced binding .txt files
Date: Fri, 22 Apr 2022 14:19:57 -0500
Message-Id: <20220422191958.2589318-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_122040_474937_8CB6C667 
X-CRM114-Status: GOOD (  10.30  )
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

Drop a couple of old, empty .txt binding files which are no longer
referenced.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/eeprom/at24.txt | 1 -
 Documentation/devicetree/bindings/mtd/common.txt  | 1 -
 Documentation/devicetree/bindings/rtc/rtc.txt     | 1 -
 3 files changed, 3 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/eeprom/at24.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/common.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc.txt

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
deleted file mode 100644
index c94acbb8cb0c..000000000000
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to at24.yaml.
diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
deleted file mode 100644
index ae16f9ea8606..000000000000
--- a/Documentation/devicetree/bindings/mtd/common.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to mtd.yaml.
diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
deleted file mode 100644
index b8d36fce5e2d..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to rtc.yaml.
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
