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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3FBC43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:32:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D6E20E65
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRtsSGPN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kq1HpGi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D6E20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LDaVBP/aqGK5Zs8ksYniIL5nmiiqmQKNqm6Uo+Q7CX4=; b=dRtsSGPNODeEq4ZLdE/ZscHAw
	lJfJjJ92sF61jfTwuxE2z9U+UyHdF6+9OTLLWUUfs7RQ5Cq7o2SH/w0JViM62iTaRUt3k8SgeEsdL
	MV08YgZL8AZVgNKaz2y7va5OE1ewznCOeUqJNCCp8VnKdd12Sg7l85HlK7ofWdanBwcwZjwUJKMUB
	6LF2Qq3Y9yleh8dwo6Cx7i9MbiGfYwCz/8PIQAJE50xc0upUT7oVCXqes8AJ2RGxADP1l2/+YJ1CW
	fSEb3KuIIBkmmUd4kUzgR2se/Sp9NTogpzz1C/Sr4/HDHGCowrMVLvGGFW+H9J2N17s27HjHBhQud
	ztuRHDKlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJlNw-0004cc-Lp; Sat, 19 Sep 2020 22:31:12 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJlNu-0004bP-H5
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 22:31:11 +0000
Received: by mail-qk1-x730.google.com with SMTP id q63so10862837qkf.3
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 15:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuUvgB8iMkHgcxvxhIPaKesqPeUDTnfXOpNMPbDpmVY=;
 b=Kq1HpGi/RYvFJutzgEITb+4XKoQsYcQaiw+JEkrWbrHSNHzflhnewbfX+OA/ayuomc
 x3AwuO3t6ZN/vhnJYTiArWB+c8Pu0QJUMS+brIYBidpJNVGEz9z7sTUTkkkivAKtsgGU
 RGezSP7qEpItLVMgIEcxuxHKBWu3MIDWlAM9tqgm57ObEzYKGqa9JVYmkTrGUo2mfwzS
 ZxY6ejgJBoT5TwyAYgFIDcg+QaX4gXcG4FmbOK2w1IA4Ubx7QgTojiH/B/H1cDuKif55
 Y92TBtPpPRCIIrht7fIqeMgQx1pNYJw+mSfl6uw8QaKuMUI0/0a+UTtuhH46eDnZwOVW
 01Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuUvgB8iMkHgcxvxhIPaKesqPeUDTnfXOpNMPbDpmVY=;
 b=UXqhC2uB818t9fbWzci0VjUdnArJL9UHSi9/d9ISHWKkZTsD9XOFxi4LERfYyr7yOC
 qs2F/OyAKcmohoUByefTAfCaBhhKB3O56jjE+xW9Gzf/uUmy2UNvaL+vxHNml1mnnZBX
 coM2TcPSY2wJ3JZT7ROY7ZEyr4gxnXBuZayROStQvDojkAqwjbetF8TjRgXuN+nS3YuA
 lfBEAjIWfuNuItIXysAaJ0ooCYQ1s4yCRQ6k3Lkr19ZOcZyoXCjUJaGr802Qp8vwa0ok
 eryvJj+e/+LfyVyiF3clUukrUgHVtAzcoWeNhc+69SZNTsuqNjWPFJCV5MgMWs+OgC9J
 4mWA==
X-Gm-Message-State: AOAM533CPoAXluBtV2pqGtin6oq6HGg5zhRCsA3afMiLNI1xlFZfzHl+
 iaAsuC6WAIBQObcoC6ZtAW4=
X-Google-Smtp-Source: ABdhPJwMQqLUYfruyEYwvtNhOG0DwZqLC/uJ2hsFUBlKE0cn+xgwFxVAVeYLm/LOL9qALxmfXyYNrA==
X-Received: by 2002:a37:76c2:: with SMTP id
 r185mr38929715qkc.122.1600554668713; 
 Sat, 19 Sep 2020 15:31:08 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id f24sm2581139qkk.136.2020.09.19.15.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 15:31:08 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 4/4] dt-bindings: net: Document use of mac-address-increment
Date: Sun, 20 Sep 2020 00:30:23 +0200
Message-Id: <20200919223026.20803-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919223026.20803-1-ansuelsmth@gmail.com>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_183110_602744_29E19CEB 
X-CRM114-Status: GOOD (  17.41  )
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
