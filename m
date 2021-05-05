Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD98C43460
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:18:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 736A8610E7
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 736A8610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LreZy2rPzKn/EUNbXzFniITAfUl4Rferz814ooVkkPI=; b=U/76FeKGHg5OWPFiVb58+a57u
	30M/OhkIkeyUz7gkoUT7LycZClc1ecMLvwZ5yx98GCty+bhFwoW7yDETzlcrHmj3XZnjEwpd+0pLY
	E7AMmyF3NbKgppc9CUCm/GuXSgzdCemXQyi/7AxsFc/WuQs1FeI7AGSqPiY8x35d+rQ/rJy9U4YLT
	MsFdd+ivMTNVJ4qREgN41xnaQmaD0YY3NzTMJ78iCYV34xio+K9hfZPayLMqp+xJ6yK9pkMpgTDEL
	ARU1EHX/GULAV+b8vrv5WBcyAPUuS/ALNzbYFMJE4mp9sTNVvHyTfdKhpnsi6FcQw9l6HlGswjqlK
	04ftUoUag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le8yU-000Bb5-Mg; Wed, 05 May 2021 04:17:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8yP-000BaZ-JR
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 04:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yWX4oJR4tsVyMxcW0RBqF75Bbh7IX1sBST4dlvOh10c=; b=oM3hVTsBjI3vYq3bSgde3/zhrV
 Sf5SlG6VH/EwMkbmvMlzAiCBGZwpe256Ju41GORYRzhW0Z9JsWCdwpoOhyfx9nzsQaCGHlDV/hc9X
 h6n9DxtxK7kxlkOFQmpscT6loOGhw//L5sYqQ+xRxkEwwXwE3E/TEtTqeE1M4V72XyqJDFtAOtCq9
 8yXBS5qxuXDu4dnoDr0ifyEbUTEhxGAB4BO2tSd40NEezhVxbMNMgEHozqkMzhos3CGXk5ksU3pr/
 F87H1JkR0Sp8jaK8JSwNw0df/q3ZBVoaZ3w77OoFNW1x5K8O+ClCsh2Amn60zBE1996hXMu61424w
 qHAsawlQ==;
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8yN-004S1J-58
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 04:17:20 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id k124so464332vsk.3
 for <linux-mtd@lists.infradead.org>; Tue, 04 May 2021 21:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yWX4oJR4tsVyMxcW0RBqF75Bbh7IX1sBST4dlvOh10c=;
 b=BU15yE000ZMck7FNXICtJ8wCfvnd/OqEMt2y7fs0fgXB8jz6BMI9XncK8Wm/vA24hM
 Soo22Kl2m1o3f+upRMDBPSQHybt+vqYeO9O/0zk/ACLiaMQMGk6A9GN3bJu6n2dz+yLd
 Z/104QxKWbFDgVuwSNqIdfUnuT5N31x5zb+E17SXd4TjkDdxTdCDk+2JT94LrOOanasW
 jnpyntDjnbun4D/cAmeeJDZ8JRtiMnnycyQdkG1e09PT8vp6mzi/y9MQXtTTXHQBY7i/
 LQ2+v5ZHwGuD8oXkNNyJf+IplJ2Y+3huT+smNNupNX5GJSHAbroY4delkfRhym3Nm02a
 8o8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yWX4oJR4tsVyMxcW0RBqF75Bbh7IX1sBST4dlvOh10c=;
 b=hZgZPjQoOUunfLWC2wrlqhscXa2w5pxunyx9N4xnG9I2CxINmiUlGQTa9ICK0uZuuW
 9dG1GqXlH5FsGsVJloa/JzJ8BbcfWsaStFBmF44ae/auaySwZUIhyzhsE/w/qfnAqRSo
 gSI/qJvnXQWmvOfaDtX2Uj8MXAgRztdeEPv679UEKPldq3PxzUYm+axLUXNQ+AC1rjoU
 2OUDO6nhx7jtgStDr2a68wAiNnmXbsrPsqFosWA8LAy6Gx+Tx2S516Gx9gBxYVYF3aYz
 1nPCgjMBwI1Ec5wYmjwL6Xf2qPiL1q/T27DxL+iRZrRQr9Ww9A0GEMEu1QoFBFd6u/ph
 OLhw==
X-Gm-Message-State: AOAM53370ykSQWzC2Ucu5OFb9aPn0Cc471lgAG3gdCkZnvw0l/8BHWTK
 51WjPuxox8HoRDylpurY79c=
X-Google-Smtp-Source: ABdhPJzAO4Suv/5mO4UkLcEyRpoSuJrEA15sGU511QPNtZLmxb5ZLx27qzPkXhqP3OK3EQYSgvZnZA==
X-Received: by 2002:a67:8008:: with SMTP id b8mr1139349vsd.13.1620188238228;
 Tue, 04 May 2021 21:17:18 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
 by smtp.gmail.com with ESMTPSA id o35sm594070uae.3.2021.05.04.21.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 21:17:17 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Jiri Kosina <trivial@kernel.org>
Cc: kbingham@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>,
 Sean Gloumeau <sajgloumeau@gmail.com>
Subject: [PATCH 3/3] Add entries for words with stem "eleminat"
Date: Wed,  5 May 2021 00:17:08 -0400
Message-Id: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620185393.git.sajgloumeau@gmail.com>
References: <cover.1620185393.git.sajgloumeau@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_211719_216339_042AA0BC 
X-CRM114-Status: GOOD (  10.22  )
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

Entries are added to spelling.txt in order to prevent spelling mistakes
involving words with stem "eliminat" from occurring again.

Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
---
 scripts/spelling.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 7b6a01291598..e657be5aa2a9 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -548,6 +548,9 @@ ehther||ether
 eigth||eight
 elementry||elementary
 eletronic||electronic
+eleminate||eliminate
+eleminating||eliminating
+elemination||elimination
 embeded||embedded
 enabledi||enabled
 enbale||enable
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
