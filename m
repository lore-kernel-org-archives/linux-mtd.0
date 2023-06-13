Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC63EEB64D7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6OQFnKfPVvIqA9UCuwvag8+Yu7OrzV5pmniQbPsPzpw=; b=OsPeel8wjPFPVX
	OFsS6KxssbpOEiK2VhMRD9YUemqYtBV3NaUuFQ/l7fDMxXE7sfUMN3IaolTY+SI7jtx4h28kSkJXa
	9aM0AqsS5TKE6umXGdH9o8/RYpKu4XEehgxkOSmyD7yCEE/4GIHAINEh3LeJSPbhWzyuUUAgvKS55
	jLp/+lHFCUhCAjJ1kjj9VRj1bcqbdIWzqpeFaUYjrm3c5m4PFQBNBdwC1FdN/49fr9xWrtv2eP6+i
	Ccf/7zvPEnfLPhSZom6qp043P70R3AX6AHuKOmbCpIa/xNw1nJngbdvg+UD2DKGuSRTrAQvW2rKzk
	LJfHmXQue/1QjUcJjOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ALV-0093aA-2A;
	Tue, 13 Jun 2023 20:10:29 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ALQ-0093Z3-2E
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 20:10:27 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-77af8476cd4so149590839f.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2023 13:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686687023; x=1689279023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exFjk9YFmKjn7DoaqlYF8HkermSR0gG7YSmA9ZFUaQg=;
        b=eQiGazz/OY/MZrheFvcDxbAi63Iz4TYlBYjFDiHvcuPByWxfLXfR/S+GT2mCOQYMiS
         Q2+ab+FhFR4cwWPdR12qBgMw8X5y7OLiPc28ejZ03ZspeNnTcDbDR6xcPYQOC5fTofj8
         oO1gaj2M+oYTJBnPr9tfY3o/wNTaHZsOps4F0LXwEIdAUjRduXHD2l7pjpkkHCLUNFNY
         hY23oeS4Pe/JhtLC57tu81TsJn1S3GqvH1H+KuKoRqCiTOSuRVOhCINyq50weig22KmM
         A6qLCsAT4CRbOP3+tgM49I0eBi47c7o+cDIxIumI0/Z2A9bfU+ksoOceJyFsIcdGUrLk
         y/CQ==
X-Gm-Message-State: AC+VfDyrIUJZqF7FAoEMJuAKW6mVZOGkCe9wg1gC18rLrgFILrUOJDoT
	U80HTlMpdyGFjiyah6jBSA==
X-Google-Smtp-Source: ACHHUZ4Pk+jA7WRJB+MQQATfRhL3bfkT++75DkNeNxkkrB7Myk6RWS7rs/nRHqI0HCTmrjKdglzKyw==
X-Received: by 2002:a6b:ea08:0:b0:774:9394:b473 with SMTP id m8-20020a6bea08000000b007749394b473mr12621972ioc.7.1686687022923;
        Tue, 13 Jun 2023 13:10:22 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q15-20020a0566380ecf00b0041684163ee1sm2462910jas.146.2023.06.13.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:10:22 -0700 (PDT)
Received: (nullmailer pid 2823344 invoked by uid 1000);
	Tue, 13 Jun 2023 20:10:20 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: partition: Add missing type for "linux,rootfs"
Date: Tue, 13 Jun 2023 14:10:14 -0600
Message-Id: <20230613201014.2823185-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_131024_725725_C32BC76D 
X-CRM114-Status: UNSURE (   8.89  )
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

"linux,rootfs" is missing a type, add it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index cdffbb9cedc2..1ebe9e2347ea 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -55,6 +55,7 @@ properties:
   linux,rootfs:
     description: Marks partition that contains root filesystem to mount and boot
       user space from
+    type: boolean
 
 if:
   not:
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
