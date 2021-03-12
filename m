Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12373C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A360464FEE
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A360464FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xpsal1SQkpMpB9BWtKq2ak4X9SZqhkKP5PyzydQJ2OY=; b=Y2/2pgNVYEmmFlVK4SP9klsFJ
	2XvbDEr2suqCdPSQkXNCjHPwNQIBfEgogatCYnxWDlJRHQZ9Taz6K88vPMxln762BaZPjp/8xrUB2
	MTzWIrAMv2FVIw92rj6gwEc2B4jZnQAb+NvAbpRggRyk3DF74T7Vc/V2lfXnzjVPOfFaux/2Of4D6
	eiheOsNDJLHWYX6B+F9iLgpdweMLhHS7FevS3ZRcg6Vt4c2l6y7oZn2HW+ZT65VGt+DssZdKTDGSm
	LmRLiBHMMB0l6b7WJgufOCDcwGgpeBykk4URIF/3S57yie72cQ9AaaqNPprRoxNQr8H3mdN7Cqz2Q
	xIRMIy2zA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhBn-00BSBA-Dn; Fri, 12 Mar 2021 12:46:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKh9f-00BS6r-OG
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 12:46:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id e18so1702590wrt.6
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=jKu8KqJ0S9Ti0089FwYbzp6PseVn8UWEuGVbAk2j8DJU7dQ52Xp1Ke51Tb+vGopIWC
 NmGxDUqN4/27ko7EM+tj4gS/Mmahh8EAKL+MV+CI7gKgsgW3LgjefxbPmvX/8rYjE3em
 2M82od3nx6sLLXzceyi+BgkU2K81kkyyetjgZ185s7zYXZZcvKKOkLz68xyy3LTnjGXK
 wWeg/Gbg1eq7Yd6CzoPgizHJ+KYkusD2V7+KxXslWFXW+t33KR7SS4O6ghqH27gSmH55
 6lmcaDGKvA5QDHhwQgGKxhrLgfvi3tqnvlLSVkiEIngWKX7VdNmflmqQAAdSrmfEflDO
 fRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=BBXMaTA6eQaOVlEE5H7N4FPrW7XciM5qNeUggGMMDCZR9HPLg4y6ddUGumu1zmD67u
 rGvA3lAPeY8W6gRm2p5gSTw9QgmzR9Vw436fLJZUqH0ejWOhSfYYazM011GcvcD/DPAJ
 d1zeu0q3lYhk6MVqwzrmZyRMMSHP/vkLW8Br/iqKX/BQSIDItsvOMyeIjwNw77PEWH3j
 X+IsaMROmylFiS+Jtq+IG96F/FgE5hNw0gQo+ZVl1SayKXRr4yAn+i3I05ZD+SdHFVz8
 tFIwv8oxwE/1r3V67v2O97iYuQUGC4VvgBlG80r8+Q+kX+QzQ+blvPSwjAZ7r1eflFth
 PDWg==
X-Gm-Message-State: AOAM532LdNPXrWMr16EFT41V5gmEZpnPJ2au7PPis+Ej8sRSk1scn58e
 EQulm8km2nngHWMGDYvz0/4=
X-Google-Smtp-Source: ABdhPJzrmsxMYLLRKM+pCC+tNbUyIbddF/llb1BgF89xo2TU++Xf8VCyIXJFgdHYoz16BqflKtnbMA==
X-Received: by 2002:a05:6000:1363:: with SMTP id
 q3mr13859141wrz.74.1615553074983; 
 Fri, 12 Mar 2021 04:44:34 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id 36sm8213414wrh.94.2021.03.12.04.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:44:33 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] devicetree: nvmem: nvmem: drop $nodename restriction
Date: Fri, 12 Mar 2021 07:28:20 +0100
Message-Id: <20210312062830.20548-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210312062830.20548-1-ansuelsmth@gmail.com>
References: <20210312062830.20548-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_124636_078334_707B0270 
X-CRM114-Status: UNSURE (   8.50  )
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

Drop $nodename restriction as now mtd partition can also be used as
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 7481a9e48f19..b8dc3d2b6e92 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -20,9 +20,6 @@ description: |
   storage device.
 
 properties:
-  $nodename:
-    pattern: "^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$"
-
   "#address-cells":
     const: 1
 
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
