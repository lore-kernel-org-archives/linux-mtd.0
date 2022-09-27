Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7002AC07E9D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+lVhegHdbJcuCc/3TBH0ZXUnYLdr6PlC5XquWR6FPYQ=; b=TEP
	dBhJkjqaRSpTFGR9rRVlCIYba6Y6Efd4DchbPfcl/MnkI6kRr/GwlQxtvggqpECLJn3IzUCJIREg+
	BXSYh+RmIBCB05Xy9n4OlMcu3OwgTmZGMvSzNVHytPniXIe3YCU/2Vh0WBJEXpvY1XUQFphmZmZ2X
	u3bO9NTKnJ/3VKAZ66dJE0gG4s9rZX5698qigGJhMMK7LktDPrhjgLIxKlivQsVj4Q6DfLfwu3F7O
	siyLsg0+6+OwlOuLQHjIynTQoPAF3hMVBCeZ5rUBrWwXJXalg102KAN/Lfddj7NmXrUvEqGFWu6kE
	aVbgTzSTJUsdfy3SwUNpvUzv6yNHVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odEYB-00BzO5-5H; Tue, 27 Sep 2022 17:39:19 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odEY8-00BzMk-AW
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 17:39:17 +0000
Received: by mail-pf1-x44a.google.com with SMTP id y17-20020a056a00181100b0053e8868496bso6172439pfa.21
        for <linux-mtd@lists.infradead.org>; Tue, 27 Sep 2022 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=cfW6P4xnGiNxspv7lrrMAvh03t//Xe+bE5jk10e/JJM=;
        b=MSoTgMILPkGBRU07gf8JBEFKIFDLnaXWXtCN3H+WjQmKsYag5ts5hPQ2M0enqj/yQ2
         8I7vvUSntSs9+XWQrzOl8CsjQrN67E5HUd8ML+4SGsEZv/9xZDtGT4yXiEzWkDHDnRDM
         D3t7J9w3fIcnHnjeUyHEq4ajjzvFkaKzMR9Cc+eQFaxWXii05201jAuJvb6pvuStYRv8
         HFXJ/IqU4iue+ohAJgzdxqMc6/4hVqXXEK6ym3ZAVDk89I+PMhBOY6QEngjLe1GQHJ9t
         oq0reFdcRQAbjJUILrpHFQuWibGCFjyitjzaokBDcEZM5DZrn1+rH3JDFEVXUhHNCBNb
         m8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=cfW6P4xnGiNxspv7lrrMAvh03t//Xe+bE5jk10e/JJM=;
        b=WlKazqDPoOjPXJvbzWLcu5hRDw8O+j/UiDyZWigH6TGwAuAyv6bEyMtf+vh5+rS43D
         DFJ4mKq4EleU5qYpKk5FQ5RyWaR1IRSO9qu1Lqw6CAZCjIXQl/iHmrhZQ39SeUDeqYzM
         Nv229MLwu5QyIKc84cdFluCePbyu8ZkhPeUnky0WESBztVs2fbx/bf76UF3p/5iM6m3F
         OVvqOMbKmAPpT/G/1+3DAIziR1bwTYNnSeT5p8STSgIMlGPliaF2krbZoAXn5MbOeryi
         LX3o9IGjlPTwIZVr4LDuq51Z3O9fRsWrlt43whEs8UhYCYlb+X3RcSbSRygWKEml7pRk
         q99Q==
X-Gm-Message-State: ACrzQf3d9LD8OoFaVixqRtfvB2i2EeV3aehXk7fj+w0TtiOk/vc3C9EK
	xTAqNW6LGm4tW185G3vA+pN01KW39ViI
X-Google-Smtp-Source: AMsMyM5bTykP2riCIcy3AsjQ/14S0fAIi5hNV20tr64VRsRWujSKABbvICdiroXEzyOi0TUtcvRAU2+y3BFL
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:aa7:8d05:0:b0:557:f0c1:6413 with SMTP id
 j5-20020aa78d05000000b00557f0c16413mr15214598pfe.19.1664300352650; Tue, 27
 Sep 2022 10:39:12 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:38:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220927173845.2293378-1-sgzhang@google.com>
Subject: [PATCH v1 0/2] mtd: mtdoops: change log and erase functions
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_103916_381072_3C287055 
X-CRM114-Status: UNSURE (   7.50  )
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

In mtdoops driver, to comply with latest kernel code requirement, change
printk() to counterpart pr_ functions. When panic function invokes mtdoops,
call mtd erase function immediately when needed.

Ray Zhang (2):
  mtd: mtdoops: change printk() to counterpart pr_ functions
  mtd: mtdoops: panic caused mtdoops to call mtd erase function
    immediately

 drivers/mtd/mtdoops.c | 108 ++++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 47 deletions(-)

-- 
2.37.3.998.g577e59143f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
