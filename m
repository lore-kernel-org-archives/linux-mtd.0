Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C0C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5dxTRDrFY0tZaj5KnB0hjSXySfJBxfPx1tjpi+UnVY=; b=r4DWoK7qB+tOzQ
	JDI06+fxPW6JjasWRkNPgFMYlFzcU6MkgaRumtHwNK5pqPNnu13aPh+fzbkAq2rXRn9IFGjAiMvaI
	N/IskwJG8BPLdkIHJjZ6scyZMKIYyAGEQe2OkZ7qXZsx3MFYIXz2F6OfAztDpYK0NFNm92lmGbY4s
	Xw2ga2WnKfokdLqwLwZ7EdsNXe0vHxPUwUDhLfGE1nzV7+pR0kWHQFdZ9FSUyXwNOC0I6MNFzuh6V
	bMqleWwy12WUGgz4HpZF+vPPus0Q1yF2mydpgfJQ8qyDDHh6n+K/O498Bq/d6bvhN9RMqzLRPtZ5g
	oiq48mxLONOq20ZTx3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Nl-00000003RTf-0sGm;
	Thu, 02 Jul 2026 02:42:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Nj-00000003RT6-1JPy
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 02:42:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso11993085ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2026 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782960146; x=1783564946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPLD1Nad7dmgJk6iBDV7j32ZrofVNThoKuAf3XZwK3M=;
        b=rHvW/Z+NB2ttrfSZrTGntX1CJU/YDjNtH5bZBkoZMldA254yQaZ0svq+AjTRb6bbze
         Ax9MJeTXL2NwRSEqMebODIr80pPi1Y5Njr4c5G34ZjUhpCwAHdM64rLgdX+uj/18LsG2
         8cRklY2PHyz9Y5RgY4ivfvkFHk9sQk/vfwkBjs3ey54fC5yrA7pSPieJ2CR2tE+avsyE
         4exTXi4flqkuMzW4hmrdf2b0hf9bMpcPZJYmTkHu9cB8LUOnlSQfK71wqg29ZN87bzb2
         XNZH6WM9bA/eLtly2/UG0ewSubVZ8BYbRgx0tcu30yA7XBXEhdSvJxa8FRMR7twNdKJ1
         XIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782960146; x=1783564946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SPLD1Nad7dmgJk6iBDV7j32ZrofVNThoKuAf3XZwK3M=;
        b=maIvfCOE6s1ykwSC1o2dv3+s0TISqIsvQhmdpzciw3uRTdeHpFrXkFryTMAvFkqNzo
         cipU+A+2fElOtJ3k49cPtZNjyCt7Jyj6gAzyjzOlc9Bt/JZHCeoUQlsxB7HxFsoGmjfQ
         njSfubW17n/i1rBqjTtKncE8wDJ4kRsbqGTyOWZyqTCDFRcpkZbRmohTqmvg2K8w7xyL
         zJ0YpCUDU5U8FUoZr8qcIQTxPEB6GPM3rpxtGfakPAL6fpb2m6UIBHjk6bjWpkBbsswB
         1ynX4D7Jz7PgKX9gKHLK0sdGQJx6lPfgEFUKBvcHr0Ose4CW8fWepqv3CrFR0ezcIT+m
         xQ8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrqBStB0i0VAHbrFyJUjapkEW7F2S7XUTTbKoGOCnvK1nKBtOt3XXpfnrACluPlcK7XE1RXX1liYBo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoLCJq4qzcXRtPTuA2N957DXheFFERAJ0ryhJY3SFM+OscxWyY
	uuTa6y2FbAcUwt6JB0Vn7deLpGw/0GmrxpW3a/VPSPpyp0is5AADWFFE
X-Gm-Gg: AfdE7cmdVX61oVlIv3pT4PsPca6tJOA0VyV/5OLEw5D5DnAFouGfqQtutseo/UkRYeF
	mxzSwPvQKQQwqACVT6s+yUc2qcuxQQuW+NWjvocUKrHTHYzEmVEBX/53t0nLs7Eyfi2l5XM8haQ
	KugS1Xxber2DMYBi5IqUnSc552rY/ZNkQl4FUJHjYTIsQnHyc7CBvQwHs0fGOhDKdcePW1vVlTj
	8mqgRVtynlhTo7k2SnnuEhqvZp5Ol771Mtl3+NbieGKjT2wFSSwEyLM1q3BCjhuKk9zN8LGtmaC
	IpVQ8wgDtvhmkcb6Ws07EjF3kqwlaUQO+71NYu3fBw6jnq++R0DOqNrl0OuhTE6RtIRn1hKSpVD
	4aTvFlERklSffK3oqwLL/oLUhObBk07ViOmTnstta5URXNBmSdR7D1/XkyOGrxFkp5i9j2qZ/WZ
	6eDXJ0rTHfgeDVfqz4NDJSZ3YJ205yPAe9q2CYJhvukSv7tw==
X-Received: by 2002:a17:903:2412:b0:2c9:e86e:aa07 with SMTP id d9443c01a7336-2ca7e758e22mr45668145ad.27.1782960145797;
        Wed, 01 Jul 2026 19:42:25 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9ea0e4sm6233795ad.60.2026.07.01.19.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 19:42:24 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 26DD44163B72;
	Thu,  2 Jul 2026 10:42:22 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter initialization
Date: Thu,  2 Jul 2026 10:39:23 +0800
Message-Id: <20260702023923.2772610-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org>
References: <20260601125438.3481722-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_194227_353605_68DD2188 
X-CRM114-Status: UNSURE (   8.10  )
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

On Mon, 1 Jun 2026 14:52:42 +0200, Michael Walle wrote:
> That being said, I've just did a quick test on my boards. Please
> give it a test on your boards.

Hi Michael,

I tested this series on our Macronix MX25L12833F and MX25L12845G
flashes and everything works as expected.

Tested-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Thanks,
Cheng Ming Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
