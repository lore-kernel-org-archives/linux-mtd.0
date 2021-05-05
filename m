Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395D4C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:16:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A01DC613D8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A01DC613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IHpjU2wxIlblc0V8yZ/wqkQOBtZO4RrQM2XyVPpVPq8=; b=DXyyt2y4jhJLj9upYfG8Y+qB8j
	m5mfEBEugIj4cc57YueXEvy6rQ+3NplC6SP3QDHqxFdXVm+M3v/qP2xOYxLRIENUfMNfq2LWjCH4o
	sSIs/sXsg2Sw1ejLr9rMEAljJ0y5gRq8VsigtdiD5hPNVuB7yNq4xw9MmM/OjlZ76TDcFgbDuYWUQ
	s6R6PLvvCFZMWofe9hg9YxkZ/7u0NRUtu50EojGBJnMtOHGegNsIkoa525atjKs/HnAomqGj4Xlmm
	RjAFjT54MUCH2sEvCeyLxtFM3QnPCwqGznN3naEJeWP9dc1c1KN+u0skmuTdKU3ilZrgMWPfCAOEC
	l3VtupXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le8wo-000BOK-SX; Wed, 05 May 2021 04:15:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8wh-000BO4-Nw
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 04:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=JwFMGO9HkR2TbGCzhvL5JqySxlTQeVpbc4kaTKGs3BE=; b=wv695n9I0RaKBn3bL9H3kiS9Jh
 PIIaHMVOqIDjlIacO1MsrcNSOqQ1DzRirxnk6E7as1mIh8c/1imXlDTV3k4lKsBMxPHXDaWASdYug
 KXTem6N+d7WUXPxR8VtCoP2/x3yo4ub4FoLxv00dpg+cCsFL4ggCapAimYPbrmkIIIETaDaoQgXxT
 ml87en16mVmFdCfKGNCAm1/487W54DincFmpfoIK+j7eZjSxgXrDtaYo+OdN4hdMM7vMIO4WhOLiB
 +MfLR7qqXmh1wooKJ4GUlrh05lu9rIqubqcFd9UL9zzfG+3TDsJUdIjeDzWa8UtQ6+xwEEjUtzAop
 IvLCx4hg==;
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8wf-004Rv0-6S
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 04:15:34 +0000
Received: by mail-vs1-xe29.google.com with SMTP id j128so461484vsc.5
 for <linux-mtd@lists.infradead.org>; Tue, 04 May 2021 21:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwFMGO9HkR2TbGCzhvL5JqySxlTQeVpbc4kaTKGs3BE=;
 b=So4uNSovbAF6AIxmxcgpac+3XujPMso0OpejYWnatVakC+VivuKTDYJq0JprrWEHeO
 5koxPBUPGvj04vYyKqS3LvP1R/ZT8e0elRemrGF+TCDmI+1HSobRhK3T57X2/+CCz3Jb
 utFgiKh52kcQwh2CrqFuBs7uhHnV82iL0NFb3NVwPgndlWKOUy9XG22VuNt3tJGRDt6v
 aKij0fCQ5786h2ms4htCaoJPGLSkwNUyTViy0CoPc8gjx5jXP1qQtsj56Wo3foj6DlgY
 6DfKxITLKO8e2FQp/YxSYCnjTJcTGJjOMLG1hZNJv0ROwhEixRjv1GuApkYc1toe73I+
 4+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwFMGO9HkR2TbGCzhvL5JqySxlTQeVpbc4kaTKGs3BE=;
 b=jfbidQr+HzktQF5aP70pp3HpRoVYoNaIyWoLhw2GSAbSSPsZ8H3eBLj2KMk9a3Ky5f
 n2SQBAKFhqbK9nkXsvULq4ZfpWfwirnChCxEg2DG1SfzYg5RfESsEpku9a6wUk0WNDdv
 vtIwRqKBT099tI4jfDsg8inJynCaNZ1SzUKNDqRuAkfgnEvX4yoxQIDNx1iFbthKPTSU
 qPgidKWT3hPeUhKc7UQbTRSzRf0PuNDgqAvV4jKhF0+AnBHl4Z9ZdOtsJoU9WN3Ew8tp
 z21MDmrP2ptIIOKrfi1Kj2h/Wb29IsSVdgBLiNn6Lq85nLRUI0nzZs/1uNGL6OqVXl71
 u0qw==
X-Gm-Message-State: AOAM531wwznJv2eWiOmcVEzAzt0BfvyDLZe9M1JY5driqGmC9enx6ekV
 9i4EzNDH6SplmaHM24I6was=
X-Google-Smtp-Source: ABdhPJznfIdsSQkkIyOEynUhQcAchBMBTfxBweZKp5EmG8G0bNl5ZSXY59PMVszgcZKHog8oZt56/g==
X-Received: by 2002:a67:e915:: with SMTP id c21mr520283vso.32.1620188131439;
 Tue, 04 May 2021 21:15:31 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
 by smtp.gmail.com with ESMTPSA id y124sm2601112vkc.45.2021.05.04.21.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 21:15:31 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Jiri Kosina <trivial@kernel.org>
Cc: kbingham@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>,
 Sean Gloumeau <sajgloumeau@gmail.com>
Subject: [PATCH 0/3] Fix spelling errors of words with stem "eliminat"
Date: Wed,  5 May 2021 00:15:19 -0400
Message-Id: <cover.1620185393.git.sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_211533_260716_F6F13E31 
X-CRM114-Status: GOOD (  11.07  )
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

I happened upon a spelling error in v5.5 of the kernel for "eleminating"
in miscdevice.h. After grepping in linux-next I realized that this
error was fixed in miscdevice.h, but found related errors for words
sharing the stem "eliminat". These patches aim to amend these spelling
mistakes, and add entries to scripts/spelling.txt to avoid adding
similar spelling mistakes to the remote in the future.

Sean Gloumeau (3):
  Fix spelling error from "eleminate" to "eliminate"
  Fix spelling error from "elemination" to "elimination"
  Add entries for words with stem "eleminat"

 drivers/net/ethernet/brocade/bna/bnad.c | 2 +-
 fs/jffs2/debug.c                        | 2 +-
 scripts/spelling.txt                    | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)


base-commit: 9a9aa07ae18be3b77ba132a6eff3a92c9b83e016
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
