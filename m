Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92A0EB26EB
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vTiH1zhGpnmZ9cz/QenZS2c7z9DK8UjdQ8k8o7Gh94=; b=wvfOKtrv0/TDNe
	5mAzHghimpShJs2szHfiaglYOtvuGaSKAq1uFSzQRJH6PxfdatqIv/TJMuaPWK4foEUBfFSxeVpnB
	eaycvtoMXksV+siHJJIplfVsKtTWU/Zmisk8syTkWYQSzqrHRYrKzw8p40jkUvHbxMyRwTO8OtOal
	qS+Yr1A3rO8Q3ahAHI1t8KAjIYiOclzcTu4rBu6nPC7hCsi0ZapEkQvp61QSWVbmkl6z8davNxQPn
	80zbo5DF2ha9XWFni8mYxUBTrmXfnslcFesHsqXCC9Sodfi6jwzbmIeJbh5TBEGI6D1EQbbkUsCTe
	F6xH5SGj8PNwqysvWFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq781-00000000Tas-2LdY;
	Wed, 11 Feb 2026 10:07:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq77w-00000000TZA-2eAC
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 10:07:23 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso692378a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Feb 2026 02:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770804439; x=1771409239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn/Y69Rs16zIbCUr1d6TW/gMLK4puZ79zycPXpVzP0A=;
        b=P7af5L23ms+w+LX79eD9C2D0L24Ly8A2rQTOXxpqiVMxr7RVz4cw0EY58Vf9bb2Sby
         JC5XgOc3zRoSmAkdkUMwLeluHUpi8UJVjIiVoosjV+Y9NG1JwcNCXxJBr4K1T5Fpr7Kw
         CzMdUV7oTMI91zka6odSr3aX9cKEqOs+9U7CIWd/aA3IQs9PqbJb3M/bOqkxtjNgG+Rw
         eqbqzzp5awzIEsBfkLs2qhIhkFhfma3McBMFEnnaS268ZkkJ1mu6hBGpFpADPpwA7MjW
         FbUhsVJgsJTqszBLKAAxI+jadgA9ixA2QXppfF/ClXuPm4QkvN1YP+Lxu5CwJyQoPSBe
         3X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804439; x=1771409239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sn/Y69Rs16zIbCUr1d6TW/gMLK4puZ79zycPXpVzP0A=;
        b=VfzBl0nCPbpwyfxS/0iwGvRsu9YDc5ezeh0fz+Vn8x+RUiw0dmqwYmr1UTUKv/oMrz
         unnb2dbRS4kb4LGIcaVeFrOYMz3ERmk30axgLpICv/LCkQM3xCbBnj7jF57XEOKL4pfY
         xCYRTWax69pilOTCGUQsr54ZFs1VDBn4I/qdlXyZUsOFSqCViBX3n9b4Rkf/p8m0/XVW
         Gv+xvQNe5sHXqpOqayCGIpLWYELbFd1G8d9ECEi4uipgChi5YegER5YfwQNlBHdEvccN
         cdr4Sx1HREy3Ob3UInek0HsXGSedaHloNARBDaIcNYWPCOQ8P7vMKGa7YuubKQQDFLe9
         xhCg==
X-Forwarded-Encrypted: i=1; AJvYcCUAXEigYZQI827E0DW4CCKfn2vUiSXXflFCUuFamqOCrAy/XH1pouRc4Ncnuoz27CE3Q+WLDFVUPj8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxaYxGAzgEMqlIEFtTIQmLIJbnQYsE5akxryCqadvbFc+aFbEz
	S0pg2XF5RwauHSn5qEiprtG0pzsKMNWPM1a9mIixYz7Qcdfd0s1aL/yK
X-Gm-Gg: AZuq6aKiGHrDfezOTDiG1pKdqYn+E65Mh2QijTYn9lyMBJHy4G+J3cM10K8glcZJXkT
	XSErkiLtmhFYQnInT4ihU61/zEW+Ly2sKMDPPgIMg/gl/Uv7ksW0twCwTLk9ldgun+sOvH4fiKf
	zF/41qaku9cDwgXM1RW9dykQ78e/LBHuDmEBYqPkjI6kEt76xc8CJ3dgs6KltciQJTlGTS5oFcN
	i1V//E0hROpD1fEsUUC4dvn7ChokHSkmnaHtGbBizF4RE4D/1t6aEiJKRt/tTNbxplXjRRJzrov
	2anYzzPLNQQIw9PSoWOMDmS07qPKUh9d+eQ+qZ1zG86MKusvznH4qt4IOGVP8rudhxB3FlZx8IX
	3xzOYRky/WZ+BoZo3k6uZMxKvVNxe7skNHnP3pWplJUuib4ESaHLgnjb4+6aJjlmXMkcv0DVkZ1
	8vHZlZHaTVD+goC0+d3mknaf7BDAXDWnmvYenXh/RU+v03pQ==
X-Received: by 2002:a17:90b:4a08:b0:354:b2f6:b4e4 with SMTP id 98e67ed59e1d1-354b39da597mr13513502a91.0.1770804439383;
        Wed, 11 Feb 2026 02:07:19 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9fb4bfsm1632089a91.8.2026.02.11.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:07:19 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id E8D704136074;
	Wed, 11 Feb 2026 18:07:16 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 1/3] dt-bindings: mtd: spinand: Add randomizer enable/disable properties
Date: Wed, 11 Feb 2026 18:05:51 +0800
Message-Id: <20260211100553.907585-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211100553.907585-1-linchengming884@gmail.com>
References: <20260211100553.907585-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_020720_678236_A8ECC849 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add "nand-randomizer-enable" and "nand-randomizer-disable" boolean
properties.

These properties allow enabling or disabling the randomizer feature
via the device tree.

According to JEDEC standard JESD22-A117E, no single data pattern
represents a universal worst-case for all NAND flash failure mechanisms.
Different patterns, such as fully programmed, checkerboard, or mostly
erased, can disproportionately stress specific cells (e.g., programmed,
erased, or those influenced by adjacent states).

Given that no fixed pattern can cover all scenarios, the use of a
randomized data pattern is a practical and effective mitigation strategy.
Our hardware implements a randomizer feature that scrambles user data
before it is written to the flash and restores the original data upon read.

This ensures the data stored on the media is more evenly distributed,
thus reducing pattern-dependent degradation. This is especially crucial
for preventing errors caused by unbalanced data (e.g., all zeros or
all ones) in blocks with high program/erase (P/E) cycle counts.
Ultimately, the randomizer improves the long-term reliability and
endurance of the flash device.

Please refer to the following link for randomizer feature:
Link: https://www.mxic.com.tw/Lists/ApplicationNote/Attachments/2151/AN1051V1-The%20Introduction%20of%20Randomizer%20Feature%20on%20MX30xFxG28AD_MX35xFxG24AD.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 609d4a4ddd80..2fcbc4b73e95 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -67,6 +67,14 @@ properties:
       the secure regions present.
     $ref: /schemas/types.yaml#/definitions/uint64-matrix
 
+  nand-randomizer-enable:
+    description: Enable the randomizer feature.
+    type: boolean
+
+  nand-randomizer-disable:
+    description: Disable the randomizer feature.
+    type: boolean
+
 required:
   - reg
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
