Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD5CD1284
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 22:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMoFLIrf3l3ggwzRhOoQg4G2rfNITi4oT6p0xbTscCM=; b=hCvyZPlsIRMOfr
	5G/SKAoqyrljBUqpmta3JWc/GoJ38no1z0HXHqld1WmxZnU0Ao6YbTNulQ6XMOowLy7dmiwCvE/Sx
	npZbP//nlN5tJONDNT/i60S01aTlz1EGufm97G9IWRRQIFW65aoutHMoUQbpGiz57J2hwTY6gMGMV
	oHx+zM/TK6/H5drghk7PeeDyEt3fogNmdoFaHvfZ+RyNepkL36bVEOhji4cRDT00P2/B/wYBrnqOl
	KxVX3V6Od7UeBGYuW2QGYpIQaoJrMWS+/tu+XPEcaYwmCorsRQfEgBnHGhXW43mmnvNKf2T+YVxpq
	yx8Qtv3eplPkNc2Eer7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruged-00000009Gt1-0q18;
	Wed, 10 Apr 2024 22:42:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugeZ-00000009GrH-3qpn
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 22:42:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-346b96f1483so21618f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2024 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1712788967; x=1713393767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT7sY0T3CGhWKIB6yVdHnCqmVwHF3DtjfPjZOhXj7w=;
        b=gSv368RMNlK8Hcdd0h+f5hHmir9ZVt+pqTJ0uRCgbVWfXqUyTUngffVbM22Z01NwtV
         ju8P7gHg+fc2h8XtR8hKlUJJWMGRjAJV+sYg9yFzxiwRUDZG78d81xoB1GZS9B4F8Rfa
         UyR3B9onEqOZkq0LLpTra0DOVlZ7IxgTuwSgBvarLjXDr2AKH7+1W9Synz/8/3hIEgu4
         6JZpvbBJxhQeHqsVw3g4WxsIjC1LOJdMdN7Ikwvf6qAksJ1ujZNO+WUl5FYlKK818DOb
         Uja1+CTFtSw49JNmqX37RwDKJZidSBf1irDRpahsOihKfOPHc4goo3lmeElMj9Wkphyg
         8wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788967; x=1713393767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsT7sY0T3CGhWKIB6yVdHnCqmVwHF3DtjfPjZOhXj7w=;
        b=Cud5qvh5aIS9hwmtQSEptH0k1A7aPnlYhiV6Y49LCFEhAv60YqkTlrY9Cis6dNT6ud
         QKvPTG91tKNv3NGgPh6STfD2pmVCn31cmsZEzchm9a4CzWXGNtS96+YLmDaqPwy9raA+
         hWkFc/OSDqsEkX1QYZs1e+AkOUrPMgQys6PUHGuCoPb2cGkb1Rgz+ZFEmStJMRJiJtrr
         4n2crh7RRVjrSG4TJtTzbgQV4rFLSZMbod0/BKomBCx6347saQZRjQGg4QgHjkpKB8Nl
         qHg8Sv0CBT6PEFlev5YE8cB9OdW68ridAkLiJpKGfQZDe5jjqki6cno7cuNuSS8IrbL7
         FAcg==
X-Gm-Message-State: AOJu0YwcmfglAuBxPyFYbBWX6GD+o0996hw3dJnIJ47iWQ44pxZewdcB
	d+aHmvnviQAOMqdGIHmjVpMJMWQZh4CthAoIITefL1zzFHXTEfuNG1bLw4vt9iA/Si1jqh8Bs7I
	cu3c=
X-Google-Smtp-Source: AGHT+IEnK4dxZlG5Mvzhp6CVQrn9KFSAP9OG2nva4L6gG0qw+d2isMcacaCfZBgHocYUqkNCXHIEFA==
X-Received: by 2002:adf:b60b:0:b0:343:4170:f3f1 with SMTP id f11-20020adfb60b000000b003434170f3f1mr775571wre.33.1712788967412;
        Wed, 10 Apr 2024 15:42:47 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4cca000000b0034698307cf8sm271337wrt.15.2024.04.10.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:42:46 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: linux-mtd@lists.infradead.org
Cc: Ben Hutchings <ben.hutchings@mind.be>
Subject: [PATCH 0/2] mtd: ubi: Fix some initialisation failure cases
Date: Thu, 11 Apr 2024 00:42:40 +0200
Message-Id: <cover.1712788087.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_154252_273171_E50262ED 
X-CRM114-Status: UNSURE (   9.93  )
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

ubi currently fails to initialise if debugfs is enabled at build time
but disabled at boot time (CONFIG_DEBUG_FS is enabled and debugfs=off
is set on the kernel command line).  Errors from debugfs should always
be ignored but this wasn't done everywhere.

While fixing this I also noticed that a recent change to ubi removed
some cleanup from the ubi_init() failure path that I think is still
needed.

This series should fix both problems.

Ben.

Ben Hutchings (2):
  mtd: ubi: Restore missing cleanup on ubi_init() failure path
  mtd: ubi: Ignore all debugfs initialisation failures

 drivers/mtd/ubi/build.c | 15 ++++++---------
 drivers/mtd/ubi/debug.c | 33 +++++++--------------------------
 drivers/mtd/ubi/debug.h |  4 ++--
 3 files changed, 15 insertions(+), 37 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
