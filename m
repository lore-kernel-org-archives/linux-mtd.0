Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58689C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 23:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4wmslLbXVm8Uu4DgRRSp17GzYaDHYOEmNUTlnTFI584=; b=YswkmwQKhykkI+fxCnAe1mOJ1a
	gt4wcOJiCxY3GMDgjLnFlOXonodxJja+eonNQ0kNA7hl2pf/XgzdMchRRvuA7tPKiehCHgSBxM9nj
	mK7VAgN2aCmYlsg2O9ZqyFhPwfIi3XrEnKIjDI6Jw/p/SPdqwxeUtIVivcslL6deSWqGJ4AGnFeyG
	5gzOaR3yEi2xx2cSEmqCETBKuYKEE2jaF3l8LZeMOleyl5KD5CvV/eZTm+7CYLopYmiRQfk42ggE1
	Lfu+/zDUUJun3N8qMMXFZwsy8tV9ibvpc4V4l+uICWTN8nV9mndPhn6vGQfiJElM7oL1Qfera7CZp
	NqcQtfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhgSK-00FOVk-5f; Thu, 21 Apr 2022 23:43:24 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhgRu-00FNu1-IJ
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 23:43:01 +0000
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2e644c76556so56922237b3.15
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 16:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VxEbzXVRbQ+Pz/eSbOfviKpWgjInXuPB8Qoiqt9n3DU=;
 b=LnZSJzFmYUBfJWSWXQ+ZZRNEC5pGr5mcApLbXWEI5V02ESdFtYRtQendMBBiDsHgfi
 d8UBCo5CqaypQmnP5R2TLzdlUlt3LBhdxwPmBs0cSwqCLScXuxn3zLQ0KaSpgCnk/hVo
 111sURkIlxqMBV9CJ+JrKbpzUXAmAA4wod2na0Ne38a/KnkvgyNCNrYgIsdju2lT52bc
 mE+0suLOOizwzcMFI8Chc5qM5X5qZfTiHXaDXokIx93lgf0KSygV7d7v5swdAjSHMIXu
 F8kUHJ0GF0qgJkOUUx8/ylM/k8WOSU6cLnIXrecuotgEeSuL51DJXLakcl9xoJWqZ5pd
 M/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VxEbzXVRbQ+Pz/eSbOfviKpWgjInXuPB8Qoiqt9n3DU=;
 b=yu/YaVUeQAzHop1HjKur6FlBO/o0b+GHS9IblOODafCibnXFhzQPoIxXjpO0Q9dG1L
 A2nC6iG7nwgu0HKbnqJtgXH3OAw02vvnHOaagI0xRuxMCSGISjatZlz8PnWpvCDDQ4aI
 BNVZqcwPYoz+4obvawTIKEQlELw4j+8p8k/z/nuwUVmc0xUug6WzTIhhyRDZDCkMtJU2
 i7GqsKjW3rGXHTJSff1EZQI/EtC75UmUJpKO+r81XGMF9IJN5h6l1d09M2l01pxOcg7Y
 +e6tt7QYu3q6qDg7cV6kkVHkkOwNe0wWuj7jpTvXLMIy8y4gFBM6RnIPqMtVXTwmCZMY
 1SNw==
X-Gm-Message-State: AOAM530yGLivWrA6/hySi2ymjbCu0nL6szZsI58DvHkN2KNfkrjnD7Xx
 EEcah8LMhjzclNZVwaPzDT3jAZH5zHxf
X-Google-Smtp-Source: ABdhPJwfv9vIB0NzbKUqSLsnehF+HonN/WKiztk/usKtWvoPVNzmfAoZaSYWnHW8nKDNc1cZ4uuSGpow0DRJ
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:fcea:37a0:4467:e04f])
 (user=jmeurin job=sendgmr) by 2002:a25:ad68:0:b0:641:acc5:8d59 with SMTP id
 l40-20020a25ad68000000b00641acc58d59mr2153528ybe.548.1650584576224; Thu, 21
 Apr 2022 16:42:56 -0700 (PDT)
Date: Thu, 21 Apr 2022 16:42:41 -0700
In-Reply-To: <20220415001321.252848-1-jmeurin@google.com>
Message-Id: <20220421234244.2172003-1-jmeurin@google.com>
Mime-Version: 1.0
References: <20220415001321.252848-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 0/3] mtd: mtdoops: Add timestamp to the dumped oops header.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_164258_716732_9D2E7330 
X-CRM114-Status: UNSURE (   9.33  )
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


The current header consists of 2 32-bit values which makes it difficult
and error prone to expand. This creates a structure for the header.

Some oops only have time relative to boot, this adds an absolute timestamp.

Changelog since v3:
  Fix the printk format for sizeof to %zu.

Changelog since v2:
- Add a timestamp to the header.

Changelog since v1:
- Create a header structure to simplify code.
- Patches in series.
- Patch prefix.

Jean-Marc Eurin (3):
  mtd: mtdoops: Fix the size of the header read buffer.
  mtd: mtdoops: Create a header structure for the saved mtdoops.
  mtd: mtdoops: Add a timestamp to the mtdoops header.

 drivers/mtd/mtdoops.c | 61 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

-- 
2.36.0.rc2.479.g8af0fa9b8e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
