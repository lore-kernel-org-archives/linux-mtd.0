Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5E3C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:20:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C1E64FD9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C1E64FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xpsal1SQkpMpB9BWtKq2ak4X9SZqhkKP5PyzydQJ2OY=; b=DPOsCJkZK7KLUq8VGyY/ztGm8
	VpuXBoxIHTK6PichDxRAqGKu8qIHIucCizW9FPPUweRG6YpdBi6ATs82tOjN2XR4W5M3MoG55C+Nh
	OGo+3nav1crQyGvYtnqPsrrih00KFDqiIavy2NxnLILuF/kWupZNZ15hKZETfqGWNaMBTHee06vPa
	Ox/RLsAWsa5phXpCM6j4jR1ysAGJ1/fa+nQ8KurrMjPzcbm+fdmn1baTiezoXa4yaLP3TXXMCgOIa
	XYGHkYXWztKNf+IqnC89tLENtbhs8SDfKOJbtpO0wvKTvWNjslpudCVf1edT/iH6x+XDWG6d31gaf
	CvGIcnLlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKKIV-0094Qg-OK; Thu, 11 Mar 2021 12:20:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKKIL-0094Od-52
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 12:20:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id i61so2431101edd.7
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 04:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=fgeawZzrBbCGdcAcelur+0SABygA5M29pxOKik9PqPGuRJeYG3++RrM99cKN5ZnBCY
 8DUtgcoZKtjVyhYq51WBmsH2MM6T88TtXF7uE/eLQtQZ8zZoBw4dhlbRcFN6BtbufYD2
 YOXx7v+TJ3oHBCfX3rlbT6cboH9c6o+zbPztZPAOx6mXp1sd9lcIckkncy7PN23JlPnh
 QCkca64+f1dHVVeVDhFK7asr7p00Oqz7EZjcl6HF9N9tznb6zLLajtcdwtXICybDYvoR
 Bq/X6AvxvApOldH7ABXtX1EjPHdgkozhlDYqBWQM9gVxSDj5FSHIlLQgWOuqS6QcqsgX
 E4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=V5cH1hDBgUd2aoWamLyw90EUm6EPhu3udjPjnQT3IiJBUoyfTuPnr//92+IS1XRKIN
 akOQqEQrk3GY3JIrgZ0Lrr/QKeMUKlPznHPt5VnHuLsTDLatJDObUQ0/xwQWouNRcxCt
 JIw76S+ypj9jl+jAOeOvtCSvFQNPIl/qjx7p0KeBKZGSmo/I+9AvCgzLseBJ6gwxS0W8
 q9Ie9m4E5AojRjwqcnYWiDlccSyqIXGKgj3l4va5lfy2ripzENTnfkYxPWnWz1QLGwSe
 /AT+mQqJ+cgp0/hazbSVPoVnSHncNdqrpIeCUKNGvrZ8cBnR/fiyk9O+pwoBwT7dLyyU
 sx+Q==
X-Gm-Message-State: AOAM5333t+2VLJsZ4+nphPSmrJ+jTCalplWpZB4F015Q2PlDAchDUx9Q
 15c0Mj0S+y1gBBCph6ypxws=
X-Google-Smtp-Source: ABdhPJy/LAguhBAHOubln+kVzUm2XTYYb3+YQBi4JS/9M4gqAYnf0B1QXYHEUFxzxcAIn5nHuVYfrA==
X-Received: by 2002:a50:f113:: with SMTP id w19mr8114112edl.226.1615465198235; 
 Thu, 11 Mar 2021 04:19:58 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id c7sm1273748edk.50.2021.03.11.04.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 04:19:57 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] devicetree: nvmem: nvmem: drop $nodename restriction
Date: Thu, 11 Mar 2021 06:12:49 +0100
Message-Id: <20210311051309.16789-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311051309.16789-1-ansuelsmth@gmail.com>
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_122001_275800_9830E627 
X-CRM114-Status: UNSURE (   9.22  )
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
