Return-Path: <SRS0=OWKh=JW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A072EC433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Apr 2021 09:10:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E5E613AB
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Apr 2021 09:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17E5E613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JTan9+IkML6CIEBcrTHKRLGxQgWTOz4+LsWFCdDefZ8=; b=IWNWE6l79gGUx3oTRpMN7giZjL
	3DMbyLBbLAuEDyLV7a2kMlo3dlkX3IoLp22YUG7ntgj9FVd58IrChhH1+laPFX2Zleites65U2W1e
	xYVUR+Gnw1l0xZF0UGu/dYc9pVND8fe1eKFU2iWZ8NekbfXBc0g2VhWzTaOri5azRGMUy0a4xXJKr
	WX7ahztrHO1XGiM8MisvulzkuZdIjCQmxZGU3s5RQq+USxXSRmm8njrbgGMazJq/f1bmlKwQxc76E
	kSBhi1qyXPYtdLs60uXBUkuiJ/mpbePRnsMEP8nMtY88siJDmoke+2nMlu6V/5hvZj6+A9CzuWt4M
	zphSBSBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laalJ-005KvM-ON; Sun, 25 Apr 2021 09:09:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laalF-005Kun-7j
 for linux-mtd@desiato.infradead.org; Sun, 25 Apr 2021 09:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KovP6x9LkmwwQOxAnbrKATiZyVoCztzmjmzZtGrFd5s=; b=wPoLFSapCmvcZ2m8l0j/l+WnRr
 u6irlwITJI2z9loJMw2dlFWSs2ARGEyYe0P5cg9imeqvYTIUdZAZFu/682kDHvCBWcvk+7Wyk8Cbk
 kcw+oPyErRwYT67w3z3waVUyqVgVzWYz87DlKsaCyjwq9e3cHQXrTy6FXug+aDOhsWGPeRQ1oGn9O
 TyI8zO/thaKB/DuqjbEhwWYytdq4EE5oVZ2rWTQfIUziDZgKCcNmP5QuW7dfThwaSXh3KGWQn9x+d
 zwF8qQS7VstTefZQsMpztpfL0hH4CKWhzJCIwHRSugOp3lxmLKvyRWb8DcYAGCLoEUp9iSc3JnPOY
 r0xsynXA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laalC-00FMwx-BV
 for linux-mtd@lists.infradead.org; Sun, 25 Apr 2021 09:09:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id t3so70946plz.1
 for <linux-mtd@lists.infradead.org>; Sun, 25 Apr 2021 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KovP6x9LkmwwQOxAnbrKATiZyVoCztzmjmzZtGrFd5s=;
 b=vgRcZ7ZCDZZbHaaMgaYDUTqA8jjKHfEAwxrfg9hlAWGOew5h0i0T/tp4mug3uI3WZq
 fUe0IVzOde8FYWlwhvb/p+/i85ykYaxro9O/AVwJb1ftOy4vTdSeCvdOuGhFLbar9emE
 xeHj6sW6vqKNZ+rKxmYlT50zjS/8tm7C4G8hnKLuo6aic6N8U5WQyqrMNuxE5ZyYCKgs
 Pbdga9PASpuJtDarO92n5taplHW5K2URoUKwZZcHl35BVivkkj53mCQtwD6GnzDIK1Ze
 K5YDClAWUegvKwkRy0Di30bjgboCiSxNBj2CBdCxxhfqPAo94iD/E9rfzPKfvN6aaUD5
 5AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KovP6x9LkmwwQOxAnbrKATiZyVoCztzmjmzZtGrFd5s=;
 b=A6rWNSk6X8xv0QXvjwe1+S16OJHHx1lrCIjqBRJwrAqecuvZda4awpPDorGmpg+xOW
 DFngkjbPINhB2jBWc6+8zdrEKbT0Vg49gKzxAcMCIGOxnV8sOIbv/K5VybEJCAz+Z5rh
 8hN1kLEYU9HaOqxuu4w9h9NbRfmNRG/zp81aLzCrVUAfdBt/vi7RadnN5zJ70ByYFYwN
 K6US2QV5lo2E618odkA8rbAonkktWrNFRFVEW6/M9/Ha7Llu7ybTwt44SsGTCq5oB6Bn
 Dw5rHoxlR8UjCsiHGJPba8abUazpiLJfGXXjjLVvsLHPRLUc1x+3Pw1W9pjMZi7+O8Uh
 eL/Q==
X-Gm-Message-State: AOAM533s4zYltvzBXVM8MYU9vJSfHgr9m7MsgkC1+zd42UU50C5G6pBr
 kQkkpTl2uDNRKdU7pMhpueQ=
X-Google-Smtp-Source: ABdhPJzbMvkLuAkvHdRAZbxt9JQUIs13Fbmx6xjneebOpXFPjAQYfW+PZCuONofVgGE1MWjPqonF4w==
X-Received: by 2002:a17:902:b705:b029:e6:f027:adf8 with SMTP id
 d5-20020a170902b705b02900e6f027adf8mr12618646pls.72.1619341741456; 
 Sun, 25 Apr 2021 02:09:01 -0700 (PDT)
Received: from localhost.localdomain ([49.37.83.82])
 by smtp.gmail.com with ESMTPSA id p10sm8189983pfo.210.2021.04.25.02.08.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Apr 2021 02:09:01 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mtd: rawnand: marvell: Minor documentation correction
Date: Sun, 25 Apr 2021 14:38:41 +0530
Message-Id: <1619341721-5580-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_020902_409412_96AD268B 
X-CRM114-Status: GOOD (  11.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Kernel test robot throws below warning ->
drivers/mtd/nand/raw/marvell_nand.c:454: warning: This comment starts
with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst

Minor documentation correction.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 79da6b0..e7b48d4 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -451,7 +451,7 @@ struct marvell_nfc_timings {
 };
 
 /**
- * Derives a duration in numbers of clock cycles.
+ * TO_CYCLES*() - Derives a duration in numbers of clock cycles.
  *
  * @ps: Duration in pico-seconds
  * @period_ns:  Clock period in nano-seconds
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
