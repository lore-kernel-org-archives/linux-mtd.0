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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48851C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:04:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C517F64FCE
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C517F64FCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xpsal1SQkpMpB9BWtKq2ak4X9SZqhkKP5PyzydQJ2OY=; b=m2DnLlmiW3mcDkafZ7HCNt/4Q
	w3zehlm0ahKDAjbQKUPCATA9D1eRZnoinSG587piNL2sK7yyOVnuRYOSXSpos/QoxQg75w/rbGCSJ
	VhIi+WMbLwpUGlp863XHe+aHOr5uV+AU9D4hN1wDf7VSt1Yis18wDYmrCUpfRXYv0VpJ+7UdR2lEo
	U279d1PZheXlKqB5X1TbM6QU6lFX6feINHSQDuhFraRZQ99IvgGy1YRmtHNLrH9+k7HZowxp/jjhI
	tsKN4PCrCyuKErAy8pKQbRiOHGUNEltAv2EofH/zEIb/GEg4jqu16fITCXHjjXnXgn5hlUoCzhSfO
	WPH20HStQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOj9-009e4o-1z; Thu, 11 Mar 2021 17:03:59 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOiw-009e1s-RV
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:03:48 +0000
Received: by mail-ed1-x529.google.com with SMTP id e7so3868896edu.10
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=dRoK/5Y9w7PG6auT6ZudfCM6FOG7DpqSmflGRRG4DKuffxACMDeG1P5mfGHpBl/SmO
 rkGL2d3HCT5kFv0KaZp5pCxoeGZbLyWifomOXRKzZrcQrMtbTz4FbhV74xbFdAPknJAW
 oGyVyrW0/zNg5bENsUQ/Tnl2DMzf9xJvXQfIiFC3MXBskpU8/MGx05dX5/2e3u+6KC3U
 GNXBjKaGpLr6PCfXgs9h94ie2OTL7TApL6IEDcEgiK28rp9DDJQ+JZwLCq52lhvTxUXh
 V5dz7YAh4hoPPGBvDkVPrVETr8zbZnBsKgiJ8WaQWsKEJXFtaXXoAoUKIBdOJ2kCPpWn
 ZodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SX53bYeJpoRn/Rj8EJYnn/yWlrMIeX4TZ6gWcrZofc=;
 b=r24IRRpWNgW7iTwwgPIxWMZIa6xEzz03mlQ558Yw0oYj8KLC1lE961/dHBW8RKoLsR
 cNOQtLTRzwH73f7m6voTPSjnF+dimMZejCgNFXjhja9rPUtD3P1zmoynfPZJGxKVXAH9
 uACAc4HBEJYOHb0V+VGJJvPWrpd4khYiOGOuEZkUnS4btofvWv97CUrW/FvvmcHRiyfj
 ZZime1IyI4Rtjq8J6xniAedjTJi1HHRq4bt+Wfav7yosZe4Ka48xsLTXqKk19D6FsQY2
 C7YIbFx5xQZ0zgLX7HNFlN/TrQjG81/GWL97ocLF4E0169EhBNurKnwLZNscaItNa7/N
 /5fw==
X-Gm-Message-State: AOAM532vsP/vQAMANNFYYUpnOU14zNsT+gpv8c3aEiByYjAoyeuWGNDB
 ICC3yyk17ILfO0np7MLe0Ew=
X-Google-Smtp-Source: ABdhPJzWjm/dVhAPjRJToEBbtc/5CZdeISlWchLsH+0sJdKagZmW8JyR4LY5IR8mK2hdQKi5DcKMSQ==
X-Received: by 2002:a05:6402:704:: with SMTP id
 w4mr9933440edx.175.1615482225554; 
 Thu, 11 Mar 2021 09:03:45 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id b4sm1627205edh.40.2021.03.11.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:03:45 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] devicetree: nvmem: nvmem: drop $nodename restriction
Date: Thu, 11 Mar 2021 10:56:59 +0100
Message-Id: <20210311095715.17048-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311095715.17048-1-ansuelsmth@gmail.com>
References: <20210311095715.17048-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_170347_157600_AF9AF731 
X-CRM114-Status: UNSURE (   9.04  )
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
