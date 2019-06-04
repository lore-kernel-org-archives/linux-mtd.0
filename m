Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461F4C282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 14:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8F2212F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 14:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YrSZ5t2o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Z4giGi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8F2212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tsWjDliLVVuJKk929MRaJ4E69CQez7gUp5GiPbi++WI=; b=YrSZ5t2ongUBX8C/PlhQsZtS65
	FN1FQ+l0Bz87ykPSUlGD1EcvI94hUFzLBsk6Qyw3JE5pP+1IbjQNu+duTDz1S2yZfp21J/wo8KvV8
	WN+mFwt6VjNEHt1f39hU39Ke7bQhwBDE+2aVyZN9nRUeBe9LiKYZ2b8dyOt/xamyK6a96Hv+XoSmp
	YEjfOsMGdwPdHAJ52mvZZq8arjI0wQU0RcOb8f5bNsyzj7HaWPQ4r4cbNt8ZVH9Stxr5Xs+sU4sDL
	9aVQAgAv2UjKEUfaWpWbPDrvfClCmLlweTOZ7rNXq/aDjeURonK+FtfMrJK88aN7c9lAEzWaOPYwm
	KQQd97eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYAZO-00024d-0b; Tue, 04 Jun 2019 14:37:46 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAZG-0001y2-Ec
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 14:37:44 +0000
Received: by mail-pf1-x441.google.com with SMTP id t16so3989869pfe.11
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2019 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qzbfu0dliCkkEmJ1UFnYukQdP9RWNNavonlb+Fp2x7g=;
 b=B6Z4giGie6KhK2KkxWuIhscXtPyiQHeMiQvlupiBP6cuxnHxnkXC7r77dL910UfzOp
 NbF6jRlrR+fe5PwMr2YdnxhZNvwetSZZa3fSdtJDlWfp2SL6I309qlCdjHgsmEeIhY4X
 4ZrmS2LFhTrynTLrQxkzzst9w2U0QbfyK5S8C2eHE4lo4WlNv6bg+GxASJxWiLvLJYJZ
 4vraMmMpkN9pYK7SgbT+8yeb9DtD+3+r+D4rN7oN0ni70urCpD9eRBY3MFNoaI45wugG
 ECx1VtVgxzw4ohf0wQgQ7/gIGbYiBRYngTDo7tdYImb28Rq0OSmIb06tELlMUi0p4pv0
 Tscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qzbfu0dliCkkEmJ1UFnYukQdP9RWNNavonlb+Fp2x7g=;
 b=aGDcY2DU6dZRPPNXWxHNHgilIrXLGKluSIlHggghSCdkD9JTcZsZeeZaVo3YeWDYjY
 tn4AH4jtbLq886+nAz2yGY3z02Yug6l9kMXiWs8YgCXjy12bV/gw4RXonaDWYgrsrL2h
 PO18YNPd/lStEwq2db3R9dVehzXOKR0vsPc2VzfGBedyfbfDH/iFRc30MtcdQxEkoc35
 uDhlSi+Lwl3BLQvRMtpKpn4yf6YQuUZbLiocq+eT0YGC0vdq8W84URwQzMpUnqwjLHVy
 X55JO23YlfD+LnvyN68RoPF1jWazANZN4JdzOapd/m+O8xBpN2DI1ncvl2vVIPIsJ6It
 V9gA==
X-Gm-Message-State: APjAAAWd6Q+/uCaueRacDTKZAiobsm4xFakwXA8+MyrQHebApWT41rw0
 BJhHYys08Pz1jggUUnuvdPUHQGUA
X-Google-Smtp-Source: APXvYqxODlBBHGGcFQeLSbBlxK42pdQc5O3+h4I1eh+4EBYLKe4wKcH39RExLE1ACFUyrK4KVJo6gA==
X-Received: by 2002:a62:f201:: with SMTP id m1mr32199419pfh.217.1559659057712; 
 Tue, 04 Jun 2019 07:37:37 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id m6sm24156872pjl.18.2019.06.04.07.37.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 07:37:37 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/3] dt: bindings: mtd: brcmand: Add brcmnand,
 brcmnand-v7.3 support
Date: Tue,  4 Jun 2019 10:36:31 -0400
Message-Id: <1559659013-34502-3-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
In-Reply-To: <1559659013-34502-1-git-send-email-kdasu.kdev@gmail.com>
References: <1559659013-34502-1-git-send-email-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_073738_761178_D7646027 
X-CRM114-Status: GOOD (  12.02  )
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

Added brcm,brcmnand-v7.3 as possible compatible string to support
brcmnand controller v7.3.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 0b7c373..ad4cd30 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -28,6 +28,7 @@ Required properties:
                          brcm,brcmnand-v7.0
                          brcm,brcmnand-v7.1
                          brcm,brcmnand-v7.2
+                         brcm,brcmnand-v7.3
                          brcm,brcmnand
 - reg              : the register start and length for NAND register region.
                      (optional) Flash DMA register range (if present)
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
