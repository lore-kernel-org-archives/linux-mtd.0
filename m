Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836B2C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 21:09:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020E264DDA
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 21:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020E264DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xpsal1SQkpMpB9BWtKq2ak4X9SZqhkKP5PyzydQJ2OY=; b=n4Twc56z6o8m2OnxXMMstUPBb
	3NlcP6DiRjma86+OSnXeJvsjY+MtZgTqCOhHgwZ4SOoa/Xz274fOyxo27pqkI8mK7MFVc4UYzAN/7
	mFdt4XAfKO6f/tePAEqfmDfSplTiDBl1RzMVg5HiEejCXHmX6c3FYNS2hxb2ZxGdkySKHJmtXOAVH
	YujezGaHJsCjB5S17tBuuLIkFCaG3gj19odHnUnW59MsVil2kcWew9138ixznkLcHk3rGI3ARvili
	6OOF3FtqVvjXN4ephdcadII+afS4EXfMYYqLk2IEaM5XR09hW4RmKxGwC3zfI2PyMRoORyFOlJtdC
	laeTTKpIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK64T-007j4t-6d; Wed, 10 Mar 2021 21:08:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK64B-007j25-T1
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 21:08:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id ci14so41491198ejc.7
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 13:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=bmC+GZuRpPw22iaH2nG9joxOZVNCyQ1ZEe+2lEU2JOh9Ei2AeeP+twZLnzoNb+/5lh
 L7hfz8o+uo0vLTKt6cNNlMNcKCgiRDRjxe/4VpEzHbT3iE8UvfKfbaFHwfF8PGSe1weY
 GE5UKQPgrg2Rf1VmwyWeMutLitQET78oyCiG36084I0rZSY9/upOTWWo/jSQKBrYQL0e
 CdtbQrHk2m/Yl3Wlqb877oxESdLiFMo9aVGaARam8/XrsmirLW4vRakHHcmbHOAFJVGi
 KQ+uioCVj1UhAjc8UofeeIUP+7ZNTmfNmfPsayy8d5azv0LUg96EQbb31mL0sxcNXj8T
 tiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=WozqQDV+0BkbMOLftzPjyb/AQTfl2d2P+nAxZd/tAX119+sRoO0s8mYe8f/VI2WXWy
 aI450khMm7UyNohJy/7CyTj8a0l08MkkWGoqNdfaZnGozeh314yZBgu1+1sL3zKiqxem
 8i5/oUwoKMzpwLQsYxy6d+p0irUadeu6nM81jUKxUhB6qE9QsRqQxhCQpKdLPlB9XeBB
 xAfAWK65IqhNd8+fP3Qb27+h4Xq69kB/wpeSv21GJGIH5IzyT+rSDuxE6TzPMwQAq9mH
 Vyraj0OA34pVhhr+WcGhbVmZEADwlySDvXZg3y+d+oVxBhOvrUCxmdewKiX/nDRo2fRT
 83EA==
X-Gm-Message-State: AOAM530/fhmtACcAeD59c1oOTC6+bOylT8Z/F540Eh+qAJtNEQ3/FIXq
 TzcYF0+yDZf89ezYeFbCp87YhXcEPus=
X-Google-Smtp-Source: ABdhPJzKCqWitK4itgJF5gOPWZ9BHxznB01QDhOfG6tEDyip2Frv/S1yKF7GrTdEgH6a7nWKme2yTA==
X-Received: by 2002:a17:906:f1c8:: with SMTP id
 gx8mr334710ejb.385.1615410506866; 
 Wed, 10 Mar 2021 13:08:26 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id f19sm252947edu.12.2021.03.10.13.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:08:26 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] devicetree: nvmem: nvmem: drop $nodename restriction
Date: Wed, 10 Mar 2021 22:08:03 +0100
Message-Id: <20210310210812.8880-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210310210812.8880-1-ansuelsmth@gmail.com>
References: <20210310210812.8880-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_210829_260645_5A496739 
X-CRM114-Status: UNSURE (   9.56  )
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
