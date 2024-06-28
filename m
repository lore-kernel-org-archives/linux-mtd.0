Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105FEC3064D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ChTP6mxVzO5jMfenVdXhmVkYOdTTZji54/I5cQOwbbY=; b=E6cf9/X4O36q7f
	ok6NL1sGGdfdWUxV9HSXnz+b4GmblDa7ssZUbtkWnqrdPjOZd0rSMqWU6XBStA/R5g/x6heTBEllH
	etdYF56nDeOrITdWPYKX4Uv+WT8yYsSAo/KfctJbrPBWuxkQvShD5sc7VadKyxHDmH/VkQYDd+QjA
	3/0ex3Yor4g7weskn7GPEpVaNe6CJfP/1E08tKoKPsivTT73FuXULNhaSiva6FjRhO8XguoKM9WhI
	4O4P0MjziW9IYJ5BRdNwVqgHNnCcIoEPho2Dm8lZGuKB0M1NM1FpHxC8qVNGFtLtXiTVLpFzgB9un
	YyLS4/6Oy8bR5DnnipzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7ZA-0000000DC7s-2tFP;
	Fri, 28 Jun 2024 09:06:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7Z7-0000000DC4U-0Ww7
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 09:06:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2c7bf925764so285790a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719565604; x=1720170404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMRbTa4mkhpQwNvUErP7FXnZYX3oBnht6jeaJD/L0Tg=;
        b=hxX4srXzJ3Fg4lL58c2bWtQfRzKvRushPlVJ8CyXaG6lUtJoRvRJR02NPtkK4xYHYF
         +Jcz3jzt0JDHRGQyr2HPvePM7m3gDfC/XoJmj3ilxliI3+kCiQe/CNaMrezH+AXlGhRE
         oSRa64PDCs38egHfeir3lYky8S6vuHXkDhUEIx0mtmwvw6Tw3/9pOw4Wj+lqqRUgKO7g
         l+Jaw+pgf2XujrxvEpc+2wfI5+JhhLpdl7ek5NCmRBJPxKT7vs73wfwRtpVDHJeYyi3A
         nMRZrSxg1UDlH6wDZHtoaro1iC6jrVKl954zsVAAM0KdERfLpsphHFie8xvf/8UbHmBv
         QqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719565604; x=1720170404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMRbTa4mkhpQwNvUErP7FXnZYX3oBnht6jeaJD/L0Tg=;
        b=evgffY+4NjnzDVSi/lr4Q2sPjvOySV1IUSigiW65mwixT/7LY659C1oKXeZvnmbS1R
         L60Dxme5N5fbEGVXl426YYG1rtGkULP/oYV9EsOAJKbuQwQwDlJp5oSkQo/1jtE4wH5S
         ciWr61V6vXPzLd1QxfDAllz1I6gkY94+nSuOcxaRYYuO0qTGmflSR5AsG75AyJdKMa8M
         5Bm+JOeqdjztDRpZBqCOVxQVULUjMJJ2RNZiXqGZ7y1HjQqj1Tez8egKbe3J0rzFjwOG
         yFAn/onDkJDGOTslGaUZ0qnOOYRiPDIaxHsrS1EJ9xOJ9p9E8WeAzZTeCQm+1rC4qQGq
         4P0A==
X-Forwarded-Encrypted: i=1; AJvYcCXJPAX/I+MpNccyfhw2/8Co9UH7l11HEVr7MNDbsy+Jz9ehVtO2oN2myn98Nkn7MZ8l7wa2pa4mgsMGOiqwScT2r+DxAlXCGyKgbkCtNw==
X-Gm-Message-State: AOJu0YwbbmS4GWNqEXB3/XRSVIxq+sQJ7bXFeK3vGftYL17FkiROXtfO
	N0LB0X8sMraSOO2SlzxCrzLzru72FoJaiqCnYdsC3988npts0C0+
X-Google-Smtp-Source: AGHT+IGCwl2lcv0gINuTQm4J8J8ys73nnUpAwQMg4eW90iMo4mIH312Ju/HCw92LA6hR6FSB9a2Msw==
X-Received: by 2002:a17:90b:1904:b0:2c7:a907:b6bd with SMTP id 98e67ed59e1d1-2c86141e883mr13536376a91.49.1719565603970;
        Fri, 28 Jun 2024 02:06:43 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3ea485sm1120663a91.47.2024.06.28.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:06:43 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B62258043C;
	Fri, 28 Jun 2024 17:08:58 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/2] Add support for Macronix serial NAND flash
Date: Fri, 28 Jun 2024 16:54:42 +0800
Message-Id: <20240628085444.132714-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_020645_260816_D8EA935C 
X-CRM114-Status: UNSURE (   6.08  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add Device ID 2 for Macronix serial NAND flash.
Add support for serial NAND flash with the postfix
of part number Z4I8.

Cheng Ming Lin (2):
  mtd: spinand: Support serial NAND for reading two bytes ID
  mtd: spinand: macronix: Add support for serial NAND flash

 drivers/mtd/nand/spi/macronix.c | 68 +++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 16 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
