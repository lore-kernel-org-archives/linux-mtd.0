Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2C9C04AB4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 18:33:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E05FD21734
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 18:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gs6o04hq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeuL8ziv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E05FD21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IThfzb/BoQwpmNwGrPHF/SaOXIkzb9m/Y4JwvGI9Stc=; b=Gs6
	o04hq4sodncyOR+po4KPSKz84zVNBIr320uYvNzzc+y3xEtF59juZwzqCvzfpkVjZZMH1fDnSb+7E
	W7f4vHYqCNsIiYqTL4K3QVjco6un/WmeAd0SFCJFzm5PP0grXpnregWgOu6rmskFSIEaocYEeiDWH
	Hi3a0BjfDIkGxpmPeZCSDIAhz5dZcaYk85u4NV3gxi730BjrotJsjES6AVWzwAVIXJ2oNaTLkUvDL
	4wAW/X4Z0jOiaWlWNfC/vhh6HOc84mvMdDskV4vz/QS1YNfZl+vHCeXwRiPeeKDqDqz5h/qtrahTs
	1wK0tMHt7OvOx12Qd3Drx6NHU48De6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRhg4-0007Hc-GN; Fri, 17 May 2019 18:33:56 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRhg1-0007HD-Mv
 for linux-mtd@lists.infradead.org; Fri, 17 May 2019 18:33:54 +0000
Received: by mail-ed1-x543.google.com with SMTP id l25so11868846eda.9
 for <linux-mtd@lists.infradead.org>; Fri, 17 May 2019 11:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BjD/hLmyWdf0NxPtEyGr7A4l+oVrtiHdbaFge55fb3c=;
 b=qeuL8zivm3qB3CHSXskrouAD+Q4290zHeWoWT8S731bP1s/SL8tdtcwQcG8xEMwQSN
 pDY+BENukAGdKHCnMewMyV6H+OZdMB9ud/heH0xx2/OauY2R4PcYscUF/DmfyE8zxlnr
 24TdmIl+5CDLlR4x359IjFBFTWJ8Impp3IF7V+PMjearxZ6+Fo+NrOUvhZ8MbxrUZKzn
 uA3+cWRgT32L2ej/JzUhoE9k0AaHkqqiLxJRDkqA2DCuIBzd0G5LgTAC9O1j1e+VDcZQ
 v3USP7u2LA23o8Zf78nbFoZmK4y0UDjAOVwvwxxqLPS0vLwcepiWBgSH3XgkITvfl0pW
 +qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BjD/hLmyWdf0NxPtEyGr7A4l+oVrtiHdbaFge55fb3c=;
 b=O89SXvHbuYabjzyoB4Um8yzqTsZ3DdLNZvK9CUnR/5kCftrK/IEdaKB1cTQCrPFSkK
 m5nVmZib25D4EceKX6CZ+Q+Fl4Z+7+JfZVkx1KTkcN9sEeLZmsI+xNWxnCcLLeG6EGaJ
 x98X4Xx4slZFKZBt32HiWf7Elw5paHCskL9Igo+qy53zoNiASd8MuEyYZ3IYnALTPLvO
 GeBbBSY0wTUXrxFZQluSSWDQaKr96ul7rijaiD5KETKrqznpqm2k/4KcPTwXbmBHavQP
 jVTs9Ex43Z5x448c2+nds9JSNzJrHIY6tVsEVlFt0rLxdVicgzXv7AuEhWc0gVX2Oc9W
 SXDw==
X-Gm-Message-State: APjAAAWghPHBht5BFpcNujoOaZGvhY1IB/2bEiATlVgWJ8xC/kQOp+vr
 R0wgUhwGYRD28X8Fxy0MVLih+fAj
X-Google-Smtp-Source: APXvYqyQrr/jjTQ38l6Sibivrh9zTM+AWzaIkJ3ftnBxf11BDjXBKeRfiQV0gg8ONoYodsh1qvdgvg==
X-Received: by 2002:a50:d2d4:: with SMTP id q20mr60123979edg.120.1558118031463; 
 Fri, 17 May 2019 11:33:51 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id q19sm1687127eja.59.2019.05.17.11.33.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 11:33:50 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength and
 nand-ecc-step-size optional
Date: Fri, 17 May 2019 14:29:54 -0400
Message-Id: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_113353_779557_B0FE253E 
X-CRM114-Status: GOOD (  11.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand-ecc-strength and nand-ecc-step-size can be made optional as
brcmanand driver can support using the nand_base driver detected
values.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index bcda1df..29feaba 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -101,10 +101,10 @@ Required properties:
                               number (e.g., 0, 1, 2, etc.)
 - #address-cells            : see partition.txt
 - #size-cells               : see partition.txt
-- nand-ecc-strength         : see nand.txt
-- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
 
 Optional properties:
+- nand-ecc-strength         : see nand.txt
+- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
 - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
                               chip-select. See nand.txt
 - brcm,nand-oob-sector-size : integer, to denote the spare area sector size
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
