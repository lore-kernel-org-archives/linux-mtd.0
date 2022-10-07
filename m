Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ah4MM6qd9WT6COplCzr7xnDRh/w8mBiIh291OfZ51/I=; b=xUN
	BknLUAFo2yUtZj9UbyJAS+c+N+hBlRC9HhsZ+FCP7TKcHxxziGg9mV3lJpPmdkieiyzvTrsSNPv2e
	4zTGL5kXrl/d2lc1PgQx/65g8jp6JYK7jdbtV2sSUpaXIq/sbDbOVCrdVn2Kh5LKYm8NTqHqbI31p
	4/r62If2m3ajI2Ot4hje2XgVP00bM2rnQ2tkWc/ZsWsSrY7zYxAHIOslqYBLnw7OmxrmmaXMC0dX+
	7eAXWVBl2PQ2XvdkVWw0gHd7nZGCbguz367XCgwxoxElfg08INAv0i8y2BGrojPUKVnnSVLb93AzK
	bcqROaVbW5GlK1aNdC1Gzw7JMFoDosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghCC-007iKq-3i; Fri, 07 Oct 2022 06:50:56 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghC9-007iJS-N0
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 06:50:54 +0000
Received: by mail-pf1-x449.google.com with SMTP id 24-20020aa79118000000b00561ed88c3b9so2393910pfh.7
        for <linux-mtd@lists.infradead.org>; Thu, 06 Oct 2022 23:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tfq9PSGDXYpZtQCHcbvdnQkS1SYQVEwTPGR6C7TSjig=;
        b=XIYie7P9h7PQH9nyPA5sytpXQ+nirNYK9pq/gqG+8siVETbp96FSGn0WQDYKVN+mhw
         mTRYyGpCXbhtTmHJkF8QOZtoVnVLLm8n7njs7piHPjhti6kvF96dg1FDH6CQjP+nt2vE
         gZA0ORzUpF4YiXrlj1xudqFlukEhwyo7/S2bjzDwaFpIiF2Y3Elym/tOITnLSqpHkigs
         EvqeHnDUhvQCi2O7ocMaLM4lBkji3vJE0CwZWWtXATytnN5xb7yGnamMuCzmUB73E4W1
         C+YFwa607cckvF3sNR0I+OhOYguVa7CL61ChD/FgYBPXpedfg1z/qGoNhPgZxu5AODk/
         XXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfq9PSGDXYpZtQCHcbvdnQkS1SYQVEwTPGR6C7TSjig=;
        b=zE2jbKhFcu2DTyH9pSpmif8LSPiXer+lEQf1O/cjllNShjNko935NJ8mQWIBJzHy0K
         otEVH5Y8+qoDfsiqB8Vjukj9GHJbCfgyit+cEt7pOr82EkyKZJCG+CslKoviu7Ih/T68
         D0N2utFphMczDiWJyTd+a8QAXDaJ+ga5MhoffcyoOLXPTbAiZ6WVOTGzPJqbY7Uhh2YE
         /acOKpF7l3z8QpLyaHWv5H+4DIXyf48xiBTRo+mu5ckgsF+rjUI6PZNkGmNvXZjzZ3O5
         mCuVyERy0lIcf5DGVplMO/xeiiw7MI4if1rfT+4NNbsYY/8XqV7XTVH5q0o/uYB/3Ath
         21sA==
X-Gm-Message-State: ACrzQf0ijvZKhNjHW0MJzY5YTSM7a0/lLBXjAO75yy6FJYYyeUrqedwr
	7A56Hfi/wAa9qkFfy3EFRBLpwPmPIz3P
X-Google-Smtp-Source: AMsMyM77gwewrkwlUBIXJIRw0AYhQ3+4cmMkTaTi5DgxmQFldZmVoa3rzJoVPLNGFjXvJ1sfZvIXpkgUbNnd
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a17:90a:f016:b0:20b:a65f:af42 with SMTP id
 bt22-20020a17090af01600b0020ba65faf42mr1196300pjb.79.1665125450706; Thu, 06
 Oct 2022 23:50:50 -0700 (PDT)
Date: Fri,  7 Oct 2022 06:50:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007065042.700761-1-sgzhang@google.com>
Subject: [PATCH v2 0/3] mtd: mtdoops: use pr_ functions, add and direct call
 mtdoops_erase function when panic
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_235053_791121_FCE11ACD 
X-CRM114-Status: UNSURE (   6.33  )
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
printk() to counterpart pr_ functions. Add mtdoops_erase function; When
panic function invokes mtdoops, if needed, call mtdoops_erase function
immediately.

Ray Zhang (3):
  mtd: mtdoops: change printk() to counterpart pr_ functions
  mtd: mtdoops: add mtdoops_erase function and move mtdoops_inc_counter
    to after it
  mtd: mtdoops: panic caused mtdoops to call mtdoops_erase function
    immediately

 drivers/mtd/mtdoops.c | 107 +++++++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 47 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
