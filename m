Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1396CC54FC6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 01:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4oz4p3IvjaJED3xpmdtclIRfQEmHMJhrbGTyVag29Q=; b=Y+6uXgFWkbbyd4
	rNMwpsVSX0pOaJxeSF9LzbwNdjgZvJ14yhs2jep6NkGqxFP6GYDFMjEnBMDdgBIAQzVIt14yiCtFO
	YBWYLLG53V/sLZaGcSpnnv8qCcyd8utVP3LqNCxJEoDP/H84f1+ESFX8nJE386n7UVLUVykLN0Dob
	3YpHG/Zwo6DqXTih9Aq2xQAqloWN7uI9HQjQ3KES7GM4kcpsX6PiENs3N04gfruc93EHVDCU0qgs1
	64NKIB8Fg6QU1Zgwao5bqE+WP0H+mZ96Flb0cbS83Zq7mLSVMz5PjFRoujRZzLubKkdOrQ1EYdEcR
	MkP/ROxArpxrwvJe0otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIVH-0000000FxZd-3a1S;
	Tue, 03 Sep 2024 01:38:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIVF-0000000FxZ7-1dbf
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 01:38:42 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7cd830e0711so2893219a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2024 18:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725327520; x=1725932320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF46/poLcWGIiOf1nD6266+IxpxJ4be5IRsEMASbegM=;
        b=NILOg8pQhxFRkoU5jDat/wLI7KMzFX65rqmnKcv5it3Gt260EPYtI7onPCkIMlMd0C
         a/Ee/ArlNs6qmaLYX3AsUzKlxqSF7ytNye1PSVRmZGPALwMbFItSkhwfhYbAFsE+Fa7z
         WrK84dENTEUElizAT2M8xzFzxIE7EwFjXYm2lAisr6YVKkMlR82ZG4qORDg36E6uQC8p
         1l8tNZn9Hui6JV2kbuzg8Kk8qAvKDbTPqE2XbH7agaEczUmMWvW31DXN33/VDpBCxb3W
         s3bE/Qv4e70wiH039V86nyTLKuK4OHC3M93ncuMbOJJ21zWQpldT+Rjm6SQwSOuloCJw
         11Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725327520; x=1725932320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF46/poLcWGIiOf1nD6266+IxpxJ4be5IRsEMASbegM=;
        b=tsMPrz/H7KMwiahUYb/pcXy6fy5HeWNgcwe8BaLRuIGK0aQ1EoEHMYxjKGu50LjWDp
         ssHuaLv38oQXfka3TW9+oB/9cui4JUoERUJujbk5yJLffxpcSVOjnLUxK2iVpyZ6XI7V
         hIlaF3WAmZFXUwIlyS5+05upEsC8bfSag500Nguk0pNTPWJPYHMe54e7kPvQWMfddwFK
         LuQ2xq3VjWtgutUTD+uisJoc+NitgZqt0aChLCsMdiCkjAX4HwjipYPdSabFGMB/FFJn
         dyXbCbUE5BMY8pZ1urSibE+AwjdQ9e5ssSTtUs3J9QV1yTpFwpbcwUJnvwT5uUlyH+xU
         uSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP+zcm7YQxfcJ+Va/5EZc8kCf+4mA7yq7FL8hwbB2NMwTMTCCRkxY2Zwt4N0tOWMXIEOC2ozAd1gA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7UwVrNYxm5UtsH0gSEFGoAH4ZkDWI18bx54kKHYd/7YIwxnQi
	JQ+pJGuF2dRSbM4pp8PBz0WE6Wyt/yBueLcDzhb2QAlUGDT7kAQVkDnRfQ==
X-Google-Smtp-Source: AGHT+IE5rLJ1qrEMrjT7MUmMzjNr92PWh/mPXSbCd+5TwADwoA6j7jiZrnma60CQzUgHIYjTyUzLng==
X-Received: by 2002:a17:902:f547:b0:205:63af:3487 with SMTP id d9443c01a7336-20563af38a4mr69557785ad.0.1725327520117;
        Mon, 02 Sep 2024 18:38:40 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2054e56ef5esm39662315ad.246.2024.09.02.18.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 18:38:39 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 6914680484;
	Tue,  3 Sep 2024 09:47:08 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v6 0/2] Add support for two-plane serial NAND flash
Date: Tue,  3 Sep 2024 09:36:23 +0800
Message-Id: <20240903013625.1658825-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_183841_453204_917384DB 
X-CRM114-Status: UNSURE (   9.59  )
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

v6:
  Fix the name of the flag in changelog

v5:
  Update the commit titles

v4:
  Separate the core changes and Macronix changes

v3:
  Add flags for the Plane Select bit
  Remove fixups and corresponding function

v2:
  Squash patches 1 and 3 and come before patch 2

Cheng Ming Lin (2):
  mtd: spinand: Add support for setting plane select bits
  mtd: spinand: macronix: Flag parts needing explicit plane select

 drivers/mtd/nand/spi/core.c     |  6 ++++++
 drivers/mtd/nand/spi/macronix.c | 24 +++++++++++++++++-------
 include/linux/mtd/spinand.h     |  2 ++
 3 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
