Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8382AC54748
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P5WXGRlrQ3j1P1wS4nCSi9qratWF/UQsD2Cpjwv+VOI=; b=ej98hjE+9KHMCD
	vUx/MbXZXiD3tlkOUVPUS21qINF1HJjxQEZWoE18JcYRbh0n1YsiYyiM/0EdFrwJCY2q1xlQa7EmS
	ZXJbHpqknejEIeDf9NmpAcH+DQhy4KHdlPjdr3DktmSONtrlXGU6R9Q5gxaytlLOD9mbUzoqKyHsv
	d4Iprsz8PhA4j3jP5+DCpJb9i4kx8vD6CYLTmrbYcI4I3pnbBbcxCDOEHkiXxatAN9MLBwyw4qtcL
	jui/gOfGpPVOIaEgZMfH0n4aI9hJ/I/LF9cLjfDx9wLwkpgvDhdTJIgW+UqLk20SleVtVCszIlhcM
	U6BBZ3QE6k9eibAGxbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjE4d-0000000EXMz-3Esa;
	Wed, 28 Aug 2024 08:30:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjC5n-0000000E4mK-23uy
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 06:23:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2025031eb60so55797965ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2024 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724826222; x=1725431022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbT6GeRNW9OmI6+S8780JOyiYLK0JJiZnO9Ssmk8qEE=;
        b=Rb1oPoILChjgoqVO6JtjKWHIDRfM4joCbyu1yqdn/DzEpzZDUlHrwr60NNdZbD68U2
         F9V4cjI0M3UDjx2iYFbUyia+jkPbKhN8iIr6P4G5U/A1rdSIdlZFvZzjxEWvmP82OYid
         CrR39cqVCVJKg9SplchzbMZRfo9pOtb/mSvSfJpuuFy8P8sqAaTvRpslJcqwgb5XLeOW
         5hp2y8UuprHiCkyC5B5X8qT5B8fmbgyaH2VCBTB9ttYUg8m6BQkIXNTaMwibLEnPPNZ0
         /r75VlVw2lJjGH7vttXp/v9qpLIjNUrOlROB/SykbSS6wrxvdO48bM14K3Q7WxNRGoUT
         CP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724826222; x=1725431022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbT6GeRNW9OmI6+S8780JOyiYLK0JJiZnO9Ssmk8qEE=;
        b=R+GNmNhPMyDBFGFfAjsglBwKQhlkPIlP2wp8iyh67YlBKR16sRbl8YlCj1+c9jWKcO
         glgcIZ3PjYY+T2yczffTS3aeTqbvNq1ustQpXmite0mOvrG8CIeUiz8k8ku46btSi2xK
         ekXx6v+3bZaSE+1H+B+JbipfQu5Sd8118aKvJgow20ELC8G5Nb+008s3E6ruo/dKtJBo
         euk46tPk29CLO/UBdGBGTIlma96b/78OU5kaAB7YjocsjVmxPQ/tr84mqDAzGkFIQjh9
         Pq0PDBTqLTt1urcOXxWNMRSkDBhyD4YzWJt5yqpitkUUy5sGSe2a9KpkjLA2/qTAPLqD
         cUlg==
X-Forwarded-Encrypted: i=1; AJvYcCWZEcL8XO69TKloMyN8dSdaf0kpciqeYh08aJnb7OeMxgNIhTIKlKUXiqG6mnbWONJZvfq3+CAnUdc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFJ6tHT3AQYsLDgOBx45sYM01x3xNxCQojXLu+91zG7NgpG5Yr
	d9zfbk6Q5ybhgPZjgAt53xcKjfrFwOb3dXtH0/Tv3j24JesmmdmN
X-Google-Smtp-Source: AGHT+IHfNNTWMaQVLaBJdN3ixLypGpw4Amcpc0VO1I7SugKYFoaXVlGwK60OLul7emNqm50/iY7aUg==
X-Received: by 2002:a17:902:fc8f:b0:1fb:57e7:5bc6 with SMTP id d9443c01a7336-2039e486f6fmr217848445ad.23.1724826222315;
        Tue, 27 Aug 2024 23:23:42 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385ae7b1bsm91822785ad.262.2024.08.27.23.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:23:41 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B30E280379;
	Wed, 28 Aug 2024 14:32:19 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 0/1] Add support for two-plane serial NAND flash
Date: Wed, 28 Aug 2024 14:21:30 +0800
Message-Id: <20240828062131.1491580-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_232343_551877_C59709B1 
X-CRM114-Status: UNSURE (   6.93  )
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

Add support for Macronix serial NAND flash with a two-plane structure.

Insert the Plane Select bit during the read_from_cache and the
write_to_cache operation.

v3:
  Add flags for the Plane Select bit
  Remove fixups and corresponding function

v2:
  Squash patches 1 and 3 and come before patch 2 

Cheng Ming Lin (1):
  mtd: spinand: Add flags for the Plane Select bit

 drivers/mtd/nand/spi/core.c     |  6 ++++++
 drivers/mtd/nand/spi/macronix.c | 17 ++++++++++-------
 include/linux/mtd/spinand.h     |  2 ++
 3 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
