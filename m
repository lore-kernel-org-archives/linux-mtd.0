Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC200C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 21:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6184322211
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 21:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQw7zqzi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1U4iKqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6184322211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LDaVBP/aqGK5Zs8ksYniIL5nmiiqmQKNqm6Uo+Q7CX4=; b=mQw7zqzieR7v6kzFx3VqB0VPq
	HYLomUi2QbSBxUj4dzG8bMWDwRrfh9wr+S67ZH5riVlRS8FtHrjQg+qWlp7F95CdxOz10KtOmxXNu
	QyeJMK0Mn2Jw25yq/AtY08b2Q5MKZJ7V2i+zNsV6qZn0wL8dpK2kaOZyGj6ugLdSxI6IFYICII9/w
	w6FL2LSyCxymPY3N1XbLk2MfzTCNpvje1frK4nUsk+lOZ5meV/Oe1KRs/M96VaWYwLtODzOkjwANh
	wWdjxJYWNPPHldG9lmRf++gtQzoqQQUsbKSMVfkXAaKSaAPK/stlA77bPwKE9MIlVJME8DYtYTtsY
	QLcd3y2QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJkka-0001Cj-3g; Sat, 19 Sep 2020 21:50:32 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJkkX-0001BZ-HE
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 21:50:30 +0000
Received: by mail-qt1-x82c.google.com with SMTP id c18so8773684qtw.5
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 14:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuUvgB8iMkHgcxvxhIPaKesqPeUDTnfXOpNMPbDpmVY=;
 b=a1U4iKqhfo4da2k6ZMM0pR3UEwpnjniDmb2MM9Ml7eYFtKSG4Ku8nDDx02mS0ysf2A
 zF/Qo8LRemksaeTJtLkCO/1e4oaYQkSd/Mq96dFWTLkuHfeZomuha1g9UvL00j+KtoiC
 4+1mLqqxrZQ0iIHLNOek3O/spp6usolVcdXfQiiF7AgnDINl43oRQkvU0zOn+qfLV26v
 Cy1O5i5hjsOxWwUU3B2y4YyWmkwtnpmBZLCj2p4XMorJOR+FLW87mes8h6mmchPMvkRW
 y20p00TJNqCjG6hF0BEoTGUnoAC67gPkqPQ7qavyHjQGWvTp40Vf3WIl9VE2L1aeFCGg
 KRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuUvgB8iMkHgcxvxhIPaKesqPeUDTnfXOpNMPbDpmVY=;
 b=pM0/f1mUn0ot/T4FAjJ5gAhIAbnEBb0LEBwOURgUz+z3DjDzYEW2tTom7XQc2rNhMC
 JuwPplUvGWdFh86UlyPGKdzT26xDFM0NcNnE818dx4LnN0YKdmM6Q1atkER7nY7CGJnn
 1fpLwyppKDkU0TR/9KPPZukDCeuImcsVnZ09sL3Y4qXFmfObXEg4XC1yUUv0Aa0wG00n
 eAny8Rq58m89TWPcSTmr/RW49vq9U+zH+CO33ZB3VHw6FAdk2gv/Z3C8ZfEiUO4cX5+Z
 8jcZZInYMTRfYX9rNtLshxGNsXzeVmmOccIeamXSrzkXJUh1/Ax5QKJr0UMQDFABwLDA
 RBlQ==
X-Gm-Message-State: AOAM530FHUvUx+ICMK24PPh1OWoB+l8jwaSIN9Gz3ndsTH76D3QPK+XJ
 VepOsOv0Jzeqew5K5sMSPMc=
X-Google-Smtp-Source: ABdhPJzma4TX4Rjz79pVVDKKfg+gBUBcVH8tV+LWgy9AVIm0GMUcqLSOQvPA8LlC72BFBXfESKGGTg==
X-Received: by 2002:ac8:409e:: with SMTP id p30mr37958612qtl.208.1600552227678; 
 Sat, 19 Sep 2020 14:50:27 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id y30sm5617173qth.7.2020.09.19.14.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 14:50:27 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/4] dt-bindings: net: Document use of mac-address-increment
Date: Sat, 19 Sep 2020 23:49:38 +0200
Message-Id: <20200919214941.8038-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919214941.8038-1-ansuelsmth@gmail.com>
References: <20200919214941.8038-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_175029_659414_103C66EC 
X-CRM114-Status: GOOD (  17.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Two new bindings are now supported by the of_net driver to increase (or
decrease) a mac-address. This can be very useful in case where the
system extract the mac-address for the device from a dedicated partition
and have a generic mac-address that needs to be incremented based on the
device number.
- mac-address-increment-byte is used to tell what byte must be
  incremented (if not set the last byte is increased)
- mac-address-increment is used to tell how much to increment of the
  extracted mac-address decided byte.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-controller.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index fa2baca8c726..43f2f21faf41 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -32,6 +32,25 @@ properties:
       - minItems: 6
         maxItems: 6
 
+  mac-address-increment:
+    description:
+      The MAC address can optionally be increased (or decreased using
+      negative values) from the original value readed (from a nvmem cell
+      for example). This can be used if the mac is readed from a dedicated
+      partition and must be increased based on the number of device
+      present in the system.
+    minimum: -255
+    maximum: 255
+
+  mac-address-increment-byte:
+    description:
+      If 'mac-address-increment' is defined, this will tell what byte of
+      the mac-address will be increased. If 'mac-address-increment' is
+      not defined, this option will do nothing.
+    default: 5
+    minimum: 0
+    maximum: 5
+
   max-frame-size:
     $ref: /schemas/types.yaml#definitions/uint32
     description:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
