Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D09C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aD5lUddOaBhUhOgnORNGJNYwDveU8X7x9nmzpkxTK3o=; b=0s9X2VnwPJBDXI
	wwW9aFBAC45YvNfL8yyGNrkMlbgXQDlK8+8gdOL1Sr/dVFvd9xKd+OGeapH9QqrHqbBxGdWvNMePF
	VKaS6pvpRtV6K0mRBEXMC3SKETTfPhpToa9NRRGB6ldzs706xy1lofKhpyBtO1yUp+VZFY1JTUdnc
	hZuOr2A4fr3f3jOyDKmf3qb4yDJ9u2CD0iF7f+OmMHOk+pmZTBxUkIWi3fztbBD/w41nRTiDf8EQy
	HZYKNErI7R2ZR1M9/OFritDdx4491qqmvxiExw2Xry5T9Vl0b9FfYfBRYHDzSpl6p5xXNywMoTIU7
	CHJnsirpMgkFW+EE8qog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otbZn-001F9n-DW; Fri, 11 Nov 2022 21:28:39 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otbZk-001F8D-RC
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 21:28:38 +0000
Received: by mail-oi1-f174.google.com with SMTP id m204so6045051oib.6
        for <linux-mtd@lists.infradead.org>; Fri, 11 Nov 2022 13:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yofEEgISmTkFd8KNSd67teL9O9R9Xx2fbkwmtcfVezs=;
        b=5Lj9DqiKecjQnC8UWPukY/icFT4+dQd6WyBXgwTk5BEuMb7d1fUp7F20rWpnjt4ULk
         ZSaIsS0EHEJPh7VsYsptvDleIV9pAD6mFPaQIIO/l64egqUXkaIaBrjCyAP1vI+TNEdU
         r1OqaaAhkh7HsQDBaJJdj/aCOnbK86cTQh0MUaJi0WEG+Qow+I7SvxUbZzzDLIu3t1YV
         PhmnzCeqpl3Ug+ANlq6Z9JJWTku5KF92uTC+0no0x+mTBVNdHtlOYgOhtE74bxNnOEWZ
         G+45QvhyooEg/pDGqr81YM2nJ72nKALz0hTQHHk1+ZMzgwHKdcCGXZq8djF22c18ubmo
         Ji8w==
X-Gm-Message-State: ANoB5pmeRdy7776l08dd5CCYnN2jmpDhsOISJXY05QO0H8G8HwTO+Qu1
	rckD5Uv2LHfCI+OzV2Akow==
X-Google-Smtp-Source: AA0mqf790Zmp5a1ld1rmeQNI84Xp4grv4h7heGc1cG9c8BZByd09XHvvxMJ3yRdHJgda9B+Ui/VlLg==
X-Received: by 2002:aca:210d:0:b0:342:ff90:1867 with SMTP id 13-20020aca210d000000b00342ff901867mr1692144oiz.297.1668202114153;
        Fri, 11 Nov 2022 13:28:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020a9d2c07000000b00660e833baddsm1432403otb.29.2022.11.11.13.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 13:28:33 -0800 (PST)
Received: (nullmailer pid 4103770 invoked by uid 1000);
	Fri, 11 Nov 2022 21:28:35 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: fixed-partitions: Fix 'sercomm,scpart-id' schema
Date: Fri, 11 Nov 2022 15:28:24 -0600
Message-Id: <20221111212824.4103514-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_132836_898582_146DE650 
X-CRM114-Status: GOOD (  13.93  )
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

The schema for 'sercomm,scpart-id' is broken. The 'if' condition is
never true because 'compatible' is in the parent node, not the child
node the sub-schema applies to. The example passes as there are no
constraints on additional/unevaluated properties. That's a secondary
issue which is complicated due to nested partitions.

Drop the if/then schema and the unnecessary 'allOf' so that the
'sercomm,scpart-id' property is at least defined.

Cc: Mikhail Zhilkin <csharper2005@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../mtd/partitions/fixed-partitions.yaml      | 29 +++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index ad3ccd250802..39b715aad2dc 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -31,24 +31,17 @@ properties:
 
 patternProperties:
   "@[0-9a-f]+$":
-    allOf:
-      - $ref: "partition.yaml#"
-      - if:
-          properties:
-            compatible:
-              contains:
-                const: sercomm,sc-partitions
-        then:
-          properties:
-            sercomm,scpart-id:
-              description: Partition id in Sercomm partition map. Mtd
-                parser uses this id to find a record in the partition map
-                containing offset and size of the current partition. The
-                values from partition map overrides partition offset and
-                size defined in reg property of the dts. Frequently these
-                values are the same, but may differ if device has bad
-                eraseblocks on a flash.
-              $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: partition.yaml#
+
+    properties:
+      sercomm,scpart-id:
+        description: Partition id in Sercomm partition map. Mtd parser
+          uses this id to find a record in the partition map containing
+          offset and size of the current partition. The values from
+          partition map overrides partition offset and size defined in
+          reg property of the dts. Frequently these values are the same,
+          but may differ if device has bad eraseblocks on a flash.
+        $ref: /schemas/types.yaml#/definitions/uint32
 
 required:
   - "#address-cells"
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
