Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67117C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 04:12:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073B064E83
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 04:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073B064E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hikPmrIcromlEj5SSJ7nlTItLIdnwzoeu174+1lBXyQ=; b=UbXXLYj1j523tsd3pP7C4pxSc
	bqZbyES/qxdLNulmdVmhyxLnlolqrtd4/DWWH9HlaXsYvi9CXZEveRnraXJZk0CwjDH1LBE+ZgFHb
	e/oUSQkb0BE3eFMAC6YUbWkuR/sljPgXIM45bAlQ5By6NHq5v5OPuaJcslnBEvQFKn0CoO5wmH1uj
	kc1tT3p2H7r2KnX+MA7jkM4o7qihvjzzNWYGnfAw8lI8wrtf8RvJFIHe2aWLjoQi+eJ+yQIWQuH3u
	IsvJUi5VlosCBW4hCcc3rWw4F+/q+jrB7W55Zj/inEIz8pb5+uE3uNN+0c5+d7+HT/RxdKW6rwf3h
	J0jKw8KnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF80K-0001Be-8M; Thu, 25 Feb 2021 04:11:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF80G-0001B4-9M
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 04:11:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id u11so2464627plg.13
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 20:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6hU6WGdCR9365lMcGYUik+Qyi/ZAYDHu+MFoj3y6wt4=;
 b=PLak/fmjN7fnFTz8fRzhp1I+hcyR24BNlkBt5PJNVU8drkHY1J+dcgL9k1ye8PzB4P
 XgniJRQ2nOYiqNNyhmVcWaxrxhf8nKffy5ArsDIKieuXGcs7Pt+28n/MDmCQVcRdtvCX
 U4OcK9AbfHpeTyG/tJio6DBDkX64Me6iyH2IWf6mzidlyUiVSec5eZ4N/iHNnpwbmyVn
 SUD6Xx40S9tRXZQ37zRs+OwPIDxkyYhtAblnvXqDUWdCnJYmzK4y1XwAZ7BZ4ybWaXXF
 8GDQNQEe427tSGC7c8qUTdeKx4+k/mok2MRa2gO3bQNoHfY5HCjz8kvmYF1/giAjeoyr
 V64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6hU6WGdCR9365lMcGYUik+Qyi/ZAYDHu+MFoj3y6wt4=;
 b=MZWODm1krKViDFPmBPvCbxn5LiFZcB4gySDLItDdsX90nhBmct5VsMhVHVt5lCojas
 yaUd7zL/f7WGa4YvnWZ9CczP+u9YkbI1jyHJC/gTeDGSru+RPUSs5UQZ1eTaLtFhXA9P
 c+tb2lWUG0w1N1h9mZwpxiZADXaFvoNuJN3P7+hQVdoHClguodEOZAHOyzVcEQHS5/QQ
 yo1vObkNkErNx++aV5j8qUIyDonB2k2F/GVFsIeQkA3Z1ElAI83lT2FVHELXeTrwe1dK
 N1WuKoliO/SHqcPsgtP8uR3r9jqPcTNclNbfnfHliui203UYNOCj0QqUsHA5Ih5SfD5Q
 6iNw==
X-Gm-Message-State: AOAM533QUKZ3U12xdMTmpYxmCo0FzvAWVbugNUS7v7oVTrwNKUhDD/rW
 zE8LIde9FttDxs4+ecOB/K/W
X-Google-Smtp-Source: ABdhPJzuwcRoiNHqmUzL20tCRghQTkRE9CDlSMQRUYr9GReiIvlfg/rCEryLOScv6WOd2u3ydXxAZg==
X-Received: by 2002:a17:90a:cc18:: with SMTP id
 b24mr1304343pju.214.1614226310108; 
 Wed, 24 Feb 2021 20:11:50 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id c12sm4155494pjq.48.2021.02.24.20.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 20:11:49 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Thu, 25 Feb 2021 09:41:28 +0530
Message-Id: <20210225041129.58576-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
References: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_231152_361360_DBDEA43F 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: devicetree@vger.kernel.org, Daniele.Palmas@telit.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So let's add a property for declaring such secure regions so that the
drivers can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..4a528468b90f 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      nand-secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Regions in the NAND chip which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present.
+
     required:
       - reg
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
