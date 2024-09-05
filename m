Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8A8CD4F56
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RNeB5CLJCLuv4kV7zXhVt0p67FjhdMRAMpALHo9rKwE=; b=CRKUBGYQee8z8S
	+zyoozSdf2LeOKM4QzkfJhTHvdyAkpUZPqWTXrguqxx3+x97+ufzEeJ1zPRDlc0S+XT7gM2ANBUWN
	M8Ew9JToG2jyXIWuOK7BMMWfYzdUykbni0Hg/52ck7L6W09a2PDGQ2t42eum7ecgSq+e6ta2HuPV/
	VPK4kxohjhIQZBmEeOxSIMhk4+Q0ghgvt598wSV+foPvkIg5BGNiG5R6KWA3ahqfKqUd4OPI3Ceia
	FuMJhJ431EWOIlPhUBWfq1TY+YL6Ci+GTam144EDXMtEJiqn/ehWCDi/xxRAnvsN4ElkAGg+JBAEd
	JMvsnkQp/SkDZyKw4piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5TB-0000000763R-45UD;
	Thu, 05 Sep 2024 05:55:49 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5T8-0000000761u-1tcS
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 05:55:48 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-70f645a30dcso322198a34.3
        for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2024 22:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725515745; x=1726120545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pSftet0jyeDp3g0N3i1N82jvf3t0TCZia8ty4jrRx70=;
        b=ARygV0E+LSAC2Y9y9YN6dM2FrwEg8+OvvPNsecLa3RNNWe8ggZqbuAobvnzPHqz5mh
         eTIlzIJXX6WIUb5s0dg8xXh+BLxI9cNBNUDRWf2ZLVU8OMsyjxRAGWkAqqsym2zZgGdN
         kP+lkGJExghtnGhlv9cGRt5gBsBF4wmHgb0rff0dkBh3ia/NtdkDEHGjavK1dgoAmYBD
         4c65OsVDi5yFhEqhVhwX09EDcZJ/x4UldwksNLJa3Zs+6ngLuxyhnAiU0VBXBdANrj3V
         y9zKwFq4FyvB48TnoKMa5vqynpMU9ZPtY7Ne6pOtBc7mOrA7zqjUsu56KNja58XQYKor
         gplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725515745; x=1726120545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSftet0jyeDp3g0N3i1N82jvf3t0TCZia8ty4jrRx70=;
        b=VRB4eRjCsey5CyVPdwHbjgALib/AGaal/M7aREMALyUe6h0VN5HNmOX+/KBxibfBDe
         9tsdFtmk2DzyGhn2du1UUslLJ4PdRQm6erH4O08LmtQJi86xatUuwC44dQE+GkCzjVnR
         6Gaw2Cc/il1tFBMro2QGLGZcBJNj1R0bladKFUE5UsJelEDFuMwU78s/avwbuXLmuT0f
         xCnaRChfFPVkm+nCw7MELany33+5HD3LRPbiWz8RpJxp3R7aK/nTpZYgvEMz0uNkUTCA
         LvfFPpKVKwSp/U6GtbCteB7JAgSYRNkAO8h/+ww48oifGLCoPVo09X4nDRcWkyK7Gbkk
         GrTg==
X-Forwarded-Encrypted: i=1; AJvYcCVWIuahqjnbH+8NOY/spBfDoxeX72/mv36U7Uxv2jTTZ3u5nSO1YhLm5iQUMOCXYKKHUGSPIESPrNs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf1Gr04G7R3EQzV/9bYkvGW3JT4Q7unbfqnUa4yXiXnyyNHpdI
	aPGWiZtma3Rtmf/z2tI0O7LPH/O2z/Eqv8E7eTwwBkVBgMqPAyGM
X-Google-Smtp-Source: AGHT+IFgDBRriydFjCDDQs8m/0UwuGzvwBinkyFHX1pf+Jb6S39y4pyCR146A00VM4ENmIWb+n/slw==
X-Received: by 2002:a05:6830:2906:b0:70f:6f81:d274 with SMTP id 46e09a7af769-710af72597dmr8262352a34.28.1725515745168;
        Wed, 04 Sep 2024 22:55:45 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd85b36sm2564072a12.4.2024.09.04.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:55:44 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 23C30801B1;
	Thu,  5 Sep 2024 14:04:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/2] mtd: spi-nand: Add support for read retry
Date: Thu,  5 Sep 2024 13:53:31 +0800
Message-Id: <20240905055333.2363358-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_225546_514871_7EE4251E 
X-CRM114-Status: UNSURE (   8.72  )
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

When the host ECC fails to correct the data error of NAND device,
there's a special read for data recovery method which host executes
the Special Read for Data Recovery operation and may recover the
lost data by host ECC again.

For more detailed information, please refer to page 27 in the link below:
Link: https://www.macronix.com/Lists/Datasheet/Attachments/9034/MX35LF1G24AD,%203V,%201Gb,%20v1.4.pdf 

Cheng Ming Lin (2):
  mtd: spi-nand: Add fixups for read retry
  mtd: spi-nand: Add read retry support

 drivers/mtd/nand/spi/core.c     | 33 +++++++++++++-
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     | 17 +++++++
 3 files changed, 112 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
