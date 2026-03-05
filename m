Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB1EF47CBA
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lp4ns1WSAdWc3fcaQjzh2XuaOcOwYTTNVVdzQquWvFQ=; b=i0fs5SSXhanmEi
	NFQIw32Y2r1/2kpSqqEFdUvn/ulP2nAks9V0RSgoDReLKKysfJsPjc0yha7KPGeD+nFa8DRa+MlVe
	QY8PEUfu2S8/wO/Zsa3hu763VLBhZgVf9XMAv/5NOmLRp5vf9D1PFASvNziaWas4JA3w0lBo3ROr+
	qs1J7Ts4lQWQxh/PC4gnA+OqPrxWl9X2+EMkYt5xFbbI1yX9+YpTqbpnu6uoiEr3VEA9UrIPxJSqE
	ZEF0FlVyBTQOA19uTNJx4pDf+7rnG7gC6hKVWsOJksX64QaHz8XJvN835cbEmAlOcjCaiczElQ3JK
	53q+IkBhoV+5kQGG27cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEhU-00000002TiP-3GW2;
	Thu, 05 Mar 2026 19:49:36 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEhR-00000002Thw-3oSt
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 19:49:35 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-829759ca646so1206642b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 11:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740173; x=1773344973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4emheSK6FNZdq1wknl5756xoI0itlVkBx7IxnP6UFk=;
        b=DEbN9ND2ersSxk28eO0rkfTnG9egYyczcwdqOxUFsd97hyP0Z3nzUyhMu28TIR8Dl8
         w6kzqhoIHOyZ2Y9bDz204NDrOdZKJtPdEe3WZAMyKl11LWwn3kXV9eIswvk6fcdRDD8x
         /eM66xGPdU9KO84e12ZjRQeXc4l2kRVvuxkmeu3XqKl0JCGdsEts9CQdlspr5c47a/g3
         kH80ccXs3Kba8EWxPFa+cHh6THHDtw74elgWu/DCAjdtNSIzcDW7M5SRhnILmLHBwwX3
         D9ZHnVT4GSCdDnjasf0ELnjkUJ/IeZzDyEVusBxb7StHmz7ZhFkSAoCZ45cOSSgPEg/y
         Lx5g==
X-Forwarded-Encrypted: i=1; AJvYcCX22CbB06Nn/M7vtbeJE0lCMfAQMknkJgap7E4dAoee7xqfbuL3ZQNpd7kEKtmmNQOCcd4qSnWOnw8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb8D7xnEbyj8RYvFVO7obf4dwf2x9WKgqVNy1q+t0Favc9r5Dx
	9tS9sEHFhXospT7dIXPcB9kwdQQrfeQhyV9WABWEFGJ+8xlFRbZG66nzFIRMj5Do1lzHAthVoIk
	F5dGAo1t6G9s20l54z6i43kCYuJIqczu21b3p3hSJ0V8U8sH0LLhb/QYwJjI2xMnWXbZB58NYI1
	mUi9Gv2qV5RWCoofHULT0rxZkTqwYghdiI9SpzisjPUwLmNeu/m7CtC/8nTFYdKex4mHkpdIQHZ
	9IqHEsOeV9A4w5MLA==
X-Gm-Gg: ATEYQzyL8hheW8oxq6H39JKZWXaR/oWWYLh4E7j2kzVKv0oERmQP4Z9WT7f7OWKtuh9
	w4oYdTfLYABysfSiH45Kw7TcqPHv6JgKS/o0z+9Omv0WVfjTBa48Ug0szOd7XkQmv5EdNszntvH
	HK4Nz1kOd/fBr20mAYxxDUDkrBIHW/HbszvctRHI2aJBusXo6Xda9ne+43vwss61s6B9tCgul6h
	pnqh9P1FeXkRSTaIYVW3FaslLBJFnZhWH96tUq4NxYMRdY+Q4VwIEik/8UMCo9axJ4AGP4x/2/M
	BTPE1fHAofcZOEWv/4+64WkHsYqhgLFlyRVhDX4SVhc5+WSoFoDMDrfgb18mIhiLN+IGZc3dk5x
	JM1nvJGai9ZHp7s00gYFDT3jmHu9TKVoy2pKBBgDHa6tNRq0TMzbKUGYY2HeIkTaSCMBb1x5lRQ
	QQe+O2aCez3na9Lq173H66zLC7DREjb9CxYLVUxkfrj3xEhfaUJqNlRA==
X-Received: by 2002:a17:90b:52cc:b0:356:2fee:92c4 with SMTP id 98e67ed59e1d1-359a6a4c9f4mr6487525a91.24.1772740172669;
        Thu, 05 Mar 2026 11:49:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-359b2d3cbd0sm338072a91.2.2026.03.05.11.49.32
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 11:49:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso6199506285a.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 11:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772740171; x=1773344971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4emheSK6FNZdq1wknl5756xoI0itlVkBx7IxnP6UFk=;
        b=WDHMjgsaWlzZKpLOd2ezYXDbHAc1HeF/hM77xPlT2zOS9qCHJDXkfmyNgx5fkPlyTL
         rbhi+wfo7SeRfuwDYAz4B8+lG3XUSZ5UWOO9LtK9rmESaBOHofraPKGUanQWR9MEU8iZ
         aQoRSeO+Em5wmSEo+v48+0i0aeL/70CbwY3Ww=
X-Forwarded-Encrypted: i=1; AJvYcCWCMzOIdCK1pXatocAY3O4RlQ6Rw8PrDG4bYph2j3QeaCo2YsMwYtJ9NMn2DepwU2vr24VysmIXBbI=@lists.infradead.org
X-Received: by 2002:a05:620a:4892:b0:8b2:eea5:3311 with SMTP id af79cd13be357-8cd5aefb7c9mr932370485a.26.1772740171422;
        Thu, 05 Mar 2026 11:49:31 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8b2:eea5:3311 with SMTP id af79cd13be357-8cd5aefb7c9mr932366685a.26.1772740170894;
        Thu, 05 Mar 2026 11:49:30 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e7627b69sm131228046d6.41.2026.03.05.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:49:30 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: masonccyang@mxic.com.tw,
	florian.fainelli@broadcom.com,
	william.zhang@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH] mtd: rawnand: serialize lock/unlock against other NAND operations
Date: Thu,  5 Mar 2026 14:49:06 -0500
Message-Id: <20260305194906.3007131-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_114933_949578_1D1326D7 
X-CRM114-Status: GOOD (  12.63  )
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

nand_lock() and nand_unlock() call into chip->ops.lock_area/unlock_area
without holding the NAND device lock. On controllers that implement
SET_FEATURES via multiple low-level PIO commands, these can race with
concurrent UBI/UBIFS background erase/write operations that hold the
device lock, resulting in cmd_pending conflicts on the NAND controller.

Add nand_get_device()/nand_release_device() around the lock/unlock
operations to serialize them against all other NAND controller access.

Fixes: 92270086b7e5 ("mtd: rawnand: Add support for manufacturer specific lock/unlock operation")
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mtd/nand/raw/nand_base.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 38429363251c..dfd8361bdd36 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4737,11 +4737,16 @@ static void nand_shutdown(struct mtd_info *mtd)
 static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	int ret;
 
 	if (!chip->ops.lock_area)
 		return -ENOTSUPP;
 
-	return chip->ops.lock_area(chip, ofs, len);
+	nand_get_device(chip);
+	ret = chip->ops.lock_area(chip, ofs, len);
+	nand_release_device(chip);
+
+	return ret;
 }
 
 /**
@@ -4753,11 +4758,16 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	int ret;
 
 	if (!chip->ops.unlock_area)
 		return -ENOTSUPP;
 
-	return chip->ops.unlock_area(chip, ofs, len);
+	nand_get_device(chip);
+	ret = chip->ops.unlock_area(chip, ofs, len);
+	nand_release_device(chip);
+
+	return ret;
 }
 
 /* Set default functions */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
