Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F23C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEz7+dHRb2jRDWolV3yORNGbLLtBt54kCDmSFfBPbpw=; b=naBLZvKf9HQAkp
	igEaUmHDuB5V7WH5HkaBw22Zluuyity2L9lbOhmx3grVY7BBl5OqpUXJwGryngXdqabPVBs/yQXsj
	RilWF8QH643o+HzvGKgJ4kDtqqc0cf7+ozDg8buA58LEtl/lYHl9jmuByhfWsEDootg2MtcFm/s67
	GjnVMcVp2RmwzYosj9cvB6PH1K557rd6zeLvycUR4/Z5GYZSluzxsfLwOH1PIdpwxf9B6Wsi5QoHZ
	VAw7L4BPRrmzri8j/JWZPaQzW0Geqo1sYly1eSYO4KqkIN7xoNUBqGUnD+UA5UKVFQJY49O9QEKYL
	9Q4QLfvKDqsdc6OAKnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERU-001ji7-N7; Mon, 06 Jun 2022 15:14:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERK-001jch-4n
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 15:14:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id er5so19244591edb.12
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IvilBWGAnBlRQU+9jyrl5Is4xvOjLGN9x8U2mNdKUuA=;
        b=bi9r+qtN/YEFgZKvHG34WS3p/giaGxSArRaYglAT7nz4PQ/VsYlL8SUk7w1Io9htm/
         muhxQTp2qWsVdZiCnQuwTWrkk7r5MnUooK67tZwH9DEJnwK27j9dgngYu6KF6db8+F31
         AWLbtIXSy/7KMzNKc5Nu9j7RcfGILCbM/zwAcz1Oh9cJiGMjYUKdEZAY7N+ZRrQ7Czkm
         2hjy8FFI+KoJs2mOuMWhq5h1Won/1Mhlj1cfD4W5Co5Zy4FqYglj8PPH9DdMP4KLiGn7
         +zw4HLSP2WBActg5VfNCP8JfC6J3mntx3a0vTD/g2319ASx0z7a88G8Ab00tKRaHdLk4
         G4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IvilBWGAnBlRQU+9jyrl5Is4xvOjLGN9x8U2mNdKUuA=;
        b=NLbTaegWmK1EfL2MpmxZeFNGSou/gHIlKlg6xRXQ8hH2YdXTJG2PiwZBZ0lCKsN5lZ
         zg2bAz9HWYPuPgC8yNoxR667L/Hm8oNImfBpCt3cgMEVwPeUrUlIqUE6Ck+nYSIWUqP8
         D9QkrPz9X2/HY8CIMIdj8nOpRgA0UdrKtFZGKW3hG7BI0CR1+60AniOf/xzYe/u9m1bd
         fIH7T8porsLxSNehe5Q3tqZhtql3IIpEe9kJq/HQpSWpyvxQ8xxch63nkQ0OyS3hJO9X
         fiJoRVhKQiMx24c81VqQC/AXQhsIGYw2gHbiN9ICraNIW/IeX2JUb8HxXQ8E4rnmGa1M
         dKRg==
X-Gm-Message-State: AOAM532kojYFLvlpMiF5uTrwgQDjMWguj/mEj6K2PZX0TBp22soVAAg/
	fw1HfYIJb378JFdTkpFfolQ=
X-Google-Smtp-Source: ABdhPJyvopiVyT4O43UNksA7O6pjAK73X83wxSdwvAO1QFgjxLTOD7mUL678+d8kzQ3Qa2X+T1FOiA==
X-Received: by 2002:a50:fc0d:0:b0:42d:c1ae:28bc with SMTP id i13-20020a50fc0d000000b0042dc1ae28bcmr28023125edr.24.1654528482474;
        Mon, 06 Jun 2022 08:14:42 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id be5-20020a0564021a2500b0042e09f44f81sm7494001edb.38.2022.06.06.08.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:14:41 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: mtd: partitions: add additional example for qcom,smem-part
Date: Mon,  6 Jun 2022 17:14:16 +0200
Message-Id: <20220606151417.19227-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606151417.19227-1-ansuelsmth@gmail.com>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_081446_238160_815DAF36 
X-CRM114-Status: GOOD (  11.18  )
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

Add additional example for qcom,smem-part to declare a dynamic
partition to provide NVMEM cells for the commonly ART partition
provided by this parser.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index cf3f8c1e035d..dc07909af023 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -19,6 +19,10 @@ properties:
   compatible:
     const: qcom,smem-part
 
+patternProperties:
+  "^partition-[0-9a-z]+$":
+    $ref: partition.yaml#
+
 required:
   - compatible
 
@@ -31,3 +35,26 @@ examples:
             compatible = "qcom,smem-part";
         };
     };
+
+  - |
+    /* Example declaring dynamic partition */
+    flash {
+      partitions {
+        compatible = "qcom,smem-part";
+
+        partition-art {
+          compatible = "nvmem-cells";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          label = "0:art";
+
+          macaddr_art_0: macaddr@0 {
+            reg = <0x0 0x6>;
+          };
+
+          macaddr_art_6: macaddr@6 {
+            reg = <0x6 0x6>;
+          };
+        };
+      };
+    };
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
