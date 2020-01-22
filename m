Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B39C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 20:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FB921835
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 20:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mqIlJNic";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmO+WrH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FB921835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oMg148xfQcsV9eRbypi3ioySmB8jHpGSyDhCoxMEqig=; b=mqI
	lJNicYimu4+FHEzQuHczzGaDnxfWhvpyrAJ/m+wIdmpCfX8hBSsMSPd5w1sUw7kRYsPM1/HTB3PIZ
	IU+dHn2/wMp37gxXPp4VUi/G4J7vvBYovsUoXj7OpxzsoxWmHCa6qzQesFKbtlX0LbjRXPsKx7DPQ
	UX72FrVREmOT9t5GCeZrD55WcAKywOefCrUTxUND5gRXLC1HoYtJgsNK7ZCnknr0M6j9UqFbUhUmp
	4w9/jxRk9CzvAcT4S6qPUv+jxjfFx00vbMqIn9mXM9AP3n2Eok0kvjxzuKaw5aAn9wsJoqiUJ4cCp
	jFul0uC5Cr5jJXpDzZIqWl3XD2AhOyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuMpR-0002Rp-LU; Wed, 22 Jan 2020 20:42:21 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuMpO-0002RU-Oy
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 20:42:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id s144so357296wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2020 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eeX2JNGz9HgVPRGIoEvaZTiS7IkFyrAlD7or7JXr8vc=;
 b=XmO+WrH6qgO7Ne8nEAm0qLG4GTHSp4ISjzysPA+T9cbl87pd43WV5D1FUSeCXy7MRT
 /mBFUrLVUdoJHC/cTbtrHTLL97j/U0kFc0OCK7vOXN7HkQ7vKCy5HD3xvSdgcgcY8+/H
 PmZDVXYuimI/uLvjmx+5XDqLhyzcZKa43ZC5OpU5s3uTxxP58d8CvAMMRAJsjZOjjq2w
 DsBKXux9OjGRkF/5LR3SBQ8H9Pg2NL3OOJuVEt9G0uTPDe9BMxcJ3H5MJaUTAPXCYhAU
 edkWSaIpHvxvpTf770Jo5ESsGtWVsl3KA3Q3bpEqM5AGbGFfoW/4EF6O/QK1Rl+kRO3n
 CRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eeX2JNGz9HgVPRGIoEvaZTiS7IkFyrAlD7or7JXr8vc=;
 b=Q32T82kXd0LM6xttOEWFXaEMLxkdYxuzRnGuuAZCOZM5mX8ZE1h+l95ftWGUnSLNLI
 wKoyyVoyWzAhboT8WYWQnQRqLgP6RquhtXjzGWm6kvZc+onl3IaSXJnMqcDx7JaYd/Dk
 trxFD3FR/REqMoT+kPDqTpHlELVFJMg4eifC/9FcjRs0EoMhytFmQbn9u92Gz/gY7CKm
 SmXDyUXIYG0o1VkEPxhmiWWRdkeP+5JZwTfzOaIP390t6sMc/97d/kryeVZO5bEOb6nd
 sQ4vmr4x+nUfqcrbYtB7UPZfW2hLTfScjzodWnp3RRNm8cN0kDvJqTjW5b/jBv6tQu40
 O5Sg==
X-Gm-Message-State: APjAAAWUlhBrQDOsUFejCL5JFjfgQRaBZCm6Oagp3yvuATeKU2KhdC0f
 j7dW54hq4ujzZDfcl9AMWmX2gqWI
X-Google-Smtp-Source: APXvYqzjJmS3tK7eQWlg6JpwLB9Y75eZZTMwk5rQl/gsFfC8eW5kvb2gCBg+6vIiN13AGheMV7dwDA==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr21182wmj.117.1579725735539;
 Wed, 22 Jan 2020 12:42:15 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id x132sm6216302wmg.0.2020.01.22.12.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:42:15 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH V3 1/3] dt: bindings: brcmnand: Add support for flash-edu
Date: Wed, 22 Jan 2020 15:41:09 -0500
Message-Id: <20200122204111.47554-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_124218_835135_06C38356 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding support for EBI DMA unit (EDU).

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 82156dc8f304..05651a654c66 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -35,11 +35,11 @@ Required properties:
                      (optional) NAND flash cache range (if at non-standard offset)
 - reg-names        : a list of the names corresponding to the previous register
                      ranges. Should contain "nand" and (optionally)
-                     "flash-dma" and/or "nand-cache".
-- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
-                     FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done", if broken out as
-                     individual interrupts.
+                     "flash-dma" or "flash-edu" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt, (if Flash DMA is available)
+                     FLASH_DMA_DONE and if EDU is avaialble and used FLASH_EDU_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done" or "flash_edu_done",
+                     if broken out as individual interrupts.
                      May be "nand", if the SoC has the individual NAND
                      interrupts multiplexed behind another custom piece of
                      hardware
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
