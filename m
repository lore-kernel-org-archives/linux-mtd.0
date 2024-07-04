Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22AFC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2024 02:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I0zlkedPPSxg5v8YKgT/Gfk8pVNMntLX0XivPgN/ppk=; b=GOYEltz+nYppY+
	jTrVKk+bf3qsSz+teVDhqtqY2iTzQpcf6/7KKTJ9DsM4RsOfOxjn0FwIn3UHLue1ODLtjBStXkhHP
	IOU3V/FMMSWzcQyp/umlJkqOzDePjUB3zf7Y/fnYD6j9AZlpi1Yg08xM8jmIfNE0BvRNUOq1MzOf5
	RUHskj3kfbSbmtE04xR2aSHp3IRBP0RlEAPhBCzd/7AENpBP8VWhVq9wjckld8d5HhbhTew40FhwW
	7CZ4v4eCDhAyRd7vlx+Xd9Apv+AJpj62/XuwX8qVV4e9wcEHGxiRVm5QKtLHDaqM7Siu0oL2oBfu7
	UMqr0igyCPGLaGxpapaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCXF-0000000Bxhb-3PHK;
	Thu, 04 Jul 2024 02:49:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCXC-0000000Bxgu-3oFH
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jul 2024 02:49:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f6a837e9a3so596385ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 19:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720061362; x=1720666162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VfUskD/qPJn4//0G8swipdcwsHQZ9A5zlheJWqzB8s=;
        b=U9Kb11/vOgPAWGKgB17XS0jDaMB8WmjOaO+rUnuQbbEwUAMRGlZp2SOSuW5IQKld6W
         pkvJwzoRKO1+U6thiTrf9zpok1LJF4QtTF9p40awpvmZJT4HoO5DcS1Mq6eD+DvUxxmP
         lcf8z2k8x7oelL7PkiQZxjXz3DYB9q7rV6lo8LE5fSh3Z13cgVQGFzG+PU1W3zp7aZ64
         E0HpopcgJyuo8E/bh1Pshcy/f2/zvB9K6dXvyLRh38TuY20DcuutBShXUKmJwyy9Oi/Q
         VACBZny8MwK0TUMuL1Jpuo6a63nLfYEhjF5i+V4WEDOqYJpkasTVQaB5HTSClssf7n+r
         LWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720061362; x=1720666162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VfUskD/qPJn4//0G8swipdcwsHQZ9A5zlheJWqzB8s=;
        b=k2puQMIwm9bTp0Xf4ipZ5FFDgnQBtUow5ZvWZXJnmuDmiJMX5iefGJmlIvpkjj36TX
         ASxPUU+lox0lD6hg8e2hJ8NJ47M7oL1Wy2ZXJJ2grge3a6Y8xGwNwQ4lDqfm7v1FkWKu
         CY5RuQgpTkBKzPJh2x5QW/+ccgh7M4UsznTegwGs22iwNguh6JUrdqx9T7stfkQsqsls
         kDB+THXY5dSPlX1LS5T2YiPLwciJXYwYrqDtEtNhVqhsCajqt9eMzjvubZUBqIgU1FqU
         Bwc6ibikGssqs9SGZ8Mn32YTlQ0/TKdjR6M7EbW+kihGJlU1xWy45cFkj2A2HoabDXz2
         TkoA==
X-Forwarded-Encrypted: i=1; AJvYcCUii1j7YpCn65ayOp7Fl1cj5DSevhVkuz5IonWO5O+lLIPpHkYz03cefbd+GBoJEIQ334lXh8D6D5q6Elt6q6YeP2i3LY9HBnQ5Zd8XUw==
X-Gm-Message-State: AOJu0YyuSGY71nfcNbou1dDqboIcv5IHIIG+MOr1+++5djRsa2GJKQVs
	Gnhb7WUrdvDDZ4TcYYtqOsb/n0ZCJ4sliV1CrrACGWm9KrjnI6TvRYjo0Q==
X-Google-Smtp-Source: AGHT+IGQsTpOx1QzcrInHksPymhOLpAkHCMutbM5pVz38YzCLXxPyaevyAqE9Q1A7hfklMqp+l8zNA==
X-Received: by 2002:a17:90b:193:b0:2c7:dfb6:dbe6 with SMTP id 98e67ed59e1d1-2c99c822e05mr199139a91.45.1720061361952;
        Wed, 03 Jul 2024 19:49:21 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad067031fsm102255835ad.259.2024.07.03.19.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 19:49:21 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5DFDC80152;
	Thu,  4 Jul 2024 10:51:27 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/2] Add support for Macronix flash
Date: Thu,  4 Jul 2024 10:48:37 +0800
Message-Id: <20240704024839.241101-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_194922_971094_1F079468 
X-CRM114-Status: UNSURE (   7.35  )
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

Adding Device ID 2 for Macronix serial NAND flash.
Adding support for flash with the postfix Z4I8.

Cheng Ming Lin (2):
  mtd: spinand: macronix: Add support for reading Device ID 2
  mtd: spinand: macronix: Add support for serial NAND flash

 drivers/mtd/nand/spi/macronix.c | 64 ++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 13 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
