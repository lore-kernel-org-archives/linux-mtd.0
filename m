Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D88CC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:01:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C14C60F5C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C14C60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vvhLKSaaBVTMWU9fz/etUG2a2SvMkbUFKINFPjFZpc=; b=jylJfZyaw/yjwe
	1es04TPOoPu+K2MsnD1jDpsjVDxGhpinACQXJXPpY81bPibz/H+rD+iUSSLOJ2leudN2xGKZfZPl/
	XapJw3ZjdOBO5xpciZW+NcHHgYLuQvukEpM12QFF7TEBME5xhGcDxm3zCBH1wx/JDmu2wegPoT6/S
	qHPANHq1V1RM9ptlhkIIWOPvZRPSh4vv4iUr1GOQ5wd3NMFO0V08X871XUz5BFfXHMFPXbyf3heTN
	bwelU5LybR49vPvOdCPaFq7fj31/beEFmnZnvko9bxRheEZV4FFmJrQtGVBiJAKj4jnXRWtSbg8hN
	jzk4Ns5A+lRzoqDHE0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlPQ-0091iO-4u; Thu, 19 Aug 2021 17:00:52 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO9-0091GT-IQ
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 16:59:35 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 57C7B418F4
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392364;
 bh=z1RQh6TbDCdHTYWqenSZoV+dbCUcnrr2PV0XynCVMNM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dfcRDwGQJOYfgEMdu/YSMlD56hOeXFieYa93cLS/bkazxm0UfEu842grcNQCm35B8
 SNdwvrz1HIEsimIwvNA+dbc5kbUNVXYKy9+IsjvdzL6bYUldmVCuZY7x8qC6LmQlMb
 WT1fJY3MqNgrFNpYPC8qIZ1CXEG6sQRJP0DqvtHXEZQfhYIevRe4H9H69o43Lm0Vch
 CfE3I0bls5BM9ldVjJjLN9jrA6YpTST0kSKSIJJQvLTIbGBk9L6pQIZJdWCHO+aJEh
 7FjlEy1Aitm0f4gjhSY1nycuouNt3+Z4KvjhOsENzv/ar9n7fU3JSZ6s25svXJJY23
 hsHx9Y9/XoFQg==
Received: by mail-ed1-f69.google.com with SMTP id
 di3-20020a056402318300b003bebf0828a2so3157774edb.8
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 09:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z1RQh6TbDCdHTYWqenSZoV+dbCUcnrr2PV0XynCVMNM=;
 b=eMi4TkEJzs7wrqI+3oqJ+ccZeanCgsvuGC1Q2dMCy0Baz0OkCAtopVuoSBx3P2HiWs
 ytAjBzKeMA8Abil+9S4N+6Qc4WSPRuT5w5bNfth3SzH5zVkAMLfLMKOSSyFOHaueZ+/B
 tBBgwlPjSdtEd2GWYWRahCdxmyTVcSPwj8FObfYvfdHO/h6lhVFD+6SfcjoHUFevrepw
 29gxNtmOHLz2bgReUq9GrNvWWKuxqflXwnZm+9tCKh+zS6hxDWP49wyUSx0iK09Gy0e0
 OSCoo228cxLFc5+oCsznZ8Qu7vbOL4PbRNa6e0PpfdgMhKgI8PHkG1cFtNhICkvo3N3+
 v2Ug==
X-Gm-Message-State: AOAM532PEWLzqf1VBUOJF1S46gH6C/cOvtT/s9rCHydEKks6BUjm0ome
 RaFnQIcYmptLhtUK+fn9HCdu3b1PDlBtskPMGi+/P7EzvFwN+HvOCItqqo5qy8Pcq0zr0BfVf66
 qyQydT8cI2ovxV5yAIUSPaeC07ibVO4EQCmbu2VIVp7c=
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr16811911eju.118.1629392363985; 
 Thu, 19 Aug 2021 09:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN/cjF/lAeY/btLW56iOgt8LTWAswf2EwA7y38kwFtmqm0X0IiH2XLz30C8VuHrDQfV3G+tA==
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr16811892eju.118.1629392363864; 
 Thu, 19 Aug 2021 09:59:23 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 5/5] riscv: dts: sifive: add missing compatible for plic
Date: Thu, 19 Aug 2021 18:59:08 +0200
Message-Id: <20210819165908.135591-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095933_781394_AC0B4F6B 
X-CRM114-Status: GOOD (  14.22  )
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

Add proper compatible for Platform-Level Interrupt Controller to silence
dtbs_check warnings:

  interrupt-controller@c000000: compatible: ['sifive,plic-1.0.0'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 7db861053483..0655b5c4201d 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -141,7 +141,7 @@ soc {
 		ranges;
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <53>;
 			interrupt-controller;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
