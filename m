Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AE4CC6B39
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RLdY4fqANjnZ6lry6Y5pG9rUzTW9cK9hIEhu1cdrALU=; b=z1b7LzGqRheQqf
	mm5l6sx2U3BwZOaSXSNAXlTfZKbdYbZCgo3IlWo/x9oNxWS8QC4h92akDdsoFmonf4jv/mO2rGlel
	hHyZS3XqlmGF2tB4KIVEToZcdWbTs05nXZ1v6kJiIVRRQPtAO27QIz7f4R2MafXlPM4XUSFD9wJxt
	x90a0vNg/0mlt4wC6pFbHkze7EGbEuwN5Gi3B0WDeVf/yAeIOvSy6h9o7x9DBFVHWTvTtkXjMzLVX
	1A0Eb5Dvu5ZoB/YWpr61+4wpnFjqLr8lwxGl39IGWyQlpL0gZiq4XyGVsVLzTV8n3j5tpuBqDJUKJ
	g+6qu0UnrUrky2aJ1mZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFyE-0000000H2a9-2lvp;
	Thu, 15 Oct 2026 07:33:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFyD-0000000H2ZW-1ojY
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 07:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=FojOk/s3XuClAwiyOiafNOx/R0mY/htX+AFS60ZWGXU=; b=IXzUwGLr6RXqgo4wvFskLIPPGB
	3nQaV9X9oJWU93rLf+fNxFUHLDbZu4smI1H4oJB50KdZVTGYKv9S0SQ/W4QbKy0MgDZJSAreC0ztL
	9WT60e9O6TnISpp5kFdPn68zDoiLktICSXlogMNx3obnC485Q2RgQuI8/uHIGMbEGxwNiF6d7GNTm
	CLyv3TlICBLs+b3RVZWZ6xPGfNB2h7HqEgHkP51AXgAgDNHPhHnc6UZp1iJwdURbBjowodEntrGWB
	VOeOIHUZR06i9o7j5kkLS2pQAo/UluQxaW/cJhJJE2CpQeKA0BvXdZXS8udjNxQxh0Tsg0GvKiQIt
	T+nytFAQ==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFy9-0000000Ha2S-3cPz
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 07:33:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so412404a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792049619; x=1792654419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FojOk/s3XuClAwiyOiafNOx/R0mY/htX+AFS60ZWGXU=;
        b=rqOQ3Y9R3kcc2IuRFMSBEceWBr4Jd5yUNkIoqBClFfBhTg6fTMxYUbOlx2pFmYMkAR
         9DOMkWD2wObtyBYUQHfltZ9IX3px7AY1rp2JTXFMOMWXuYah4Exg6OA4vrk49JtNiznm
         CJ9q3j9lE+MXOiolokstGDgqlopmChVdWkdepiK0mo1EZV9xbX1DBq8Fj2TRXnHXcyoS
         gc1dtmAHevYPM4PIVu5dETpEnAE8JVzs3uPFx5UX4V0PdzTRgGGLpm095OX4kE+ce3N0
         QjLs2tebvWY+dwtgg+Dm6RQpNClZNJOqpWbTjtJDg2ZA3GDU2o+fWc3RGBdqqGLyOLlI
         9Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049619; x=1792654419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FojOk/s3XuClAwiyOiafNOx/R0mY/htX+AFS60ZWGXU=;
        b=ks8eQblW5neasuak+0ZYMBFhbiG5M2tRPjX5ND0ec9518gW/huh7KubiytNwRKaBZP
         iMVaBzIo2EkgngIqLYI/FbTjoI1mCjNuNRdBhZJ3WpNrWbHDBcJPjjBOV5zPcQihCtB5
         Fas2hCqqibKjR75S+I66y1AVfDDAGoWISG50ArCHFdwP6ccfp1JTrGzcNPn+j08ubnNo
         ZJygAgo1Z75kCmIdZWphNI5O2JNePKMpaRGUyINFtDik696HXPoKApwwFodS2TfSOZ4U
         0En/8RTi1G4mAlwNWD4NDvSFZhzYExlt9pTBhhPIF8ZUYTvGruHJrbm4BPlBXnvviejj
         2nJg==
X-Gm-Message-State: AFq9FYIGjNipt9ER9PGAul7JUDbI6uMQ940jQolYx/yM9Qm0ysk3E7QA
	1yi5+Hsgj+88FTFp/7fvWKq9ORLkINXZCCzCOpygbTRmszBiy0DJ2yf7GuSGK0jWBP+Tjw==
X-Gm-Gg: AYBFou2vNMQY6vIcO0gqj6SR3Z0ahLpRGPLCVUQu/MTZHg0X0U0UKuf439OtVPcJGYh
	3Mh+ZWZL+e4d89rpUdtOtNMUiZ/7D0JJODMYEqE6OemqH+q3TgbsZ38S32ya+3GasGxwVZTvxo/
	HExpPdoZEWKVTan0mva5aFYUUcBqM6KN55JTsTz+ULH6gKr15NC5w3JGsbhOqjTEeepn6uCIdIA
	c7iNfpUosMp8Rb2zuRaptgP+zfgryDCuN+dI3QYtPP9rdYWhn1kxo3xzpE+x0fyysKB4TiVLiqJ
	Uh4w1kK8FEh8PTdgmgDGFTtcK9pti5xFpUPK06cpUpVJNOz0txGqIs6iY3Lew2FvLgziGt9TZOb
	JRG/vDZ7TTwywP9nAh+/2RvNTJlhqxuZ2WL0zLYoFUbgLDc/H1kWCNNLEh2ASfZM0u8+sOc5Ol0
	9sfhyK7A5lY+fgLTo5/rHa7qC1/ToB3CeFzKmm6GTQQvF4avhoAYCrpzhgaOYXujZDj7ryfSDSL
	DCj44Yhlmrdbdcr
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr8435721a91.6.1792049618841;
        Thu, 15 Oct 2026 00:33:38 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm3066274a91.10.2026.10.15.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:33:37 -0700 (PDT)
From: Yelin Fei <yelinfei66@gmail.com>
X-Google-Original-From: Yelin Fei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: ubi: fix direct reclaim deadlock with synchronous block devices
Date: Thu, 15 Oct 2026 15:33:19 +0800
Message-Id: <cover.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_083342_212597_5D583575 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Ye Linfei <yelinfei@ruijie.com.cn>

Two-part fix for ubiblock swap deadlock: forbid direct reclaim I/O in the synchronous dispatch path and switch the ltree entry allocation to GFP_NOIO.

Ye Linfei (2):
  mtd: ubi: block: forbid direct reclaim I/O during synchronous read
  mtd: ubi: use GFP_NOIO for lock tree entry allocation

 drivers/mtd/ubi/block.c | 15 +++++++++++++++
 drivers/mtd/ubi/eba.c   |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
