Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C49ECD4F54
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DHLCBNyx4sY05vumHAznW29nZfOou5q37WbIjAZ6SM=; b=Gz2S3azpsQqI21
	XYc0zP5F9JVu3n+qrwqeSFZxn/Fff1eyJe3aLRdlofwDZ4tCNREqBFdGepNnQCc7xWH9KMJ0njE+1
	/TRL8mZz47cWCjqEK65ygldVlbedBrPAIOrvvPQS9lDoemW78knJqnPrAUu6NdyNfWoZf/u2aaczt
	yeFyCvlgDcOvVB9c/77quMSjo+Z6TUpB2yHywG8RCNL5AmBI7RNKvPKuBtoPfuJoi45eOO5nXm9hU
	NBkN0VfCNkym6bc/kSZOrmwU6jXoLjf9YtuJeu8lX7z/jDcMMQy8CYUe1Jvwx/hQYi6+IGM8sgJBT
	JHI/v6DWinwR365Qu89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRK-0000000FUOh-14Dd;
	Mon, 18 May 2026 11:47:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRI-0000000FUO9-1c5T
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 May 2026 11:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1ud+sEG7q0wP0zBzQht1NZnMd2Z7mvrdCEOMs+je9r8=; b=UDFmtYtjczG9SvvDX5zoRfJWH3
	47BpuozsdK6QAPuHk2U3Vf+JRqTRa5K2lLI0EzJ/rgee8XINZRKDFS2gdnfH9ERqJPku2p1TrCUnU
	9P2ERIs3B/J40yZLfividZ3FIzJWetpuv/WhIMlfdoiowoY4V3pTghZiVpnCmtAGEdLypnXFPkH9+
	mApv52D4puGa0oYk74nVIzdQb/uP0ihH36005wgmdiIK8KUZv88xjZbcdpM7/hjXzTX5ZA39ipHAU
	2Nay9DB7AXi50qrhUkm2vJ8Nky/2F+1JQms5OAljoleXMZ1rGgV3dVrcDj46Mml/5jwvYiEOZz0O6
	/5L9QwHQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRE-0000000Azur-3wtf
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 11:47:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so32631585e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 18 May 2026 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104832; x=1779709632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ud+sEG7q0wP0zBzQht1NZnMd2Z7mvrdCEOMs+je9r8=;
        b=eNOB98nsiazs2QbaFrj0oUnOm1n9GZ47+2kfE7CcdxgQk5h4cbsyTU2R48yAqGrjib
         upZEdkhpO/Qz8bSvOS5QO2tL20rAmPakz9H4L3gXvVYKo1SoXvlOfiEiXeIHCaOzQPkZ
         MVvTMWR86glWlC8NKa27qOL/j4I7XUCf8J5nOF1oghffh4ij4ruOZQLAezWVoacd8piE
         wfY8xZg2jqkzvCFtky81/yxIduxPn7Im6SOcUAjxZQZg8k61R6RlVuwn8v9a/GxL5paJ
         V52QinvxMSU+5vOr+l+TI0Ngdx7I597pMLTciajozbmcc/gmpjNOf7I7gZXKaiEuorLX
         9wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104832; x=1779709632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ud+sEG7q0wP0zBzQht1NZnMd2Z7mvrdCEOMs+je9r8=;
        b=gt6EBfAAsDtCBLz+IxY5NVxkV7CcloQ62VtXZCqn0D79Dp45KzCiR1rdJiW6SL/cpf
         5axphK39rkoLnpEXL0UxnhYPFz3XuscNTTDGXeYbe8Xjg0FEkSUSUmDYYfUgo6llBLB2
         +V34S8wtr6iIp+PMO8uu4PtmFkKp7Q+ZJ1Aa31E7R9BrwB/ZXN4jHq/ViQSq3FxhHTzG
         m1tii4qy51YTr8ZAQZgdQW/0iV0mu9HjrWhCobaekA9UKdDubob3zYVyUkJ7fowLcCvp
         wFgASmUnOEjCzL0JgjOrFyUHCNWeuyC2oXGdFK2g2s4XacNwyk+F/yjxhp6Vu7P1zWIl
         xuZA==
X-Forwarded-Encrypted: i=1; AFNElJ98Ua02n5dqsY7Q+p+T13cMXFX5tjUjaHYGCPb7CwFXLsJiVps+GGCr5nD7pOHukDURJXLb3oKKFWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn+xV2b2vnAjCXPwuoOUR8ea7jf16UI6JK0WRsArxOYvG4PxxB
	KH0JCcqvcbNQj4LIFBJlEmBKy7ilFwdFvVfdxNqTk3U3QDVHx4vXv0w=
X-Gm-Gg: Acq92OFwIlfnvDNQKv5mUlD8nypA1TZKY6CA9uv9vZwg6sxTG7C6V/C2EZA+5tGUnuq
	JPsgQDFCIfjxtSzOPTpJ5ZvlyZnIsV2X7hkXt9n1j9cqUfaNV4Z5bhIpED5rkidzolPvl9aQ6YO
	tR6HV+mJUIvw0WkvoqYCvGapFTxDpPPVD4a7g0XierC0ewHH61drW3z4N1Iv9cHs3Z+NlGTkp5F
	tuT21iwxBMr1NaGGWv9t30atph9JK4VCuqq/wLLJWAkFeEpgqnGiQiTRnkH+uABD81rOdtpSNml
	Bh7yEYyNz6N9XL34Mo9KI6zgfU54tR7hbxPQVh0mQ6NV62mE0xE2Zuo+b7oSqRek9aNVFuZEmVs
	27ylY8LIsxO1iMIvZUacBvj8KSTnHV3LihnEBwqS/owdH8Y6l/EHIPkxlPfqnJA+CvevXzj0KEQ
	zlDpVKr7Ic/J1dfZVWkX3myPvg/y0XsKTRw/gOrT6ArHClZmkuTFR87aaBJga3f9DHd19BnX0K+
	gccAWQGjfX13cW0M8YjW/U+BaLaOQ==
X-Received: by 2002:a05:600c:3f1b:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48fe661db6dmr224835215e9.29.1779104831563;
        Mon, 18 May 2026 04:47:11 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:f15c:fd38:3fe1:9653])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48febe585absm82341205e9.19.2026.05.18.04.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:47:11 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrian@newgolddream.dyndns.info>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v3 2/3] mtd: maps: vmu-flash: fix fault in unaligned fixup
Date: Mon, 18 May 2026 13:45:20 +0200
Message-ID: <20260518114521.81564-3-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518114521.81564-1-fuchsfl@gmail.com>
References: <20260518114521.81564-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124713_388595_4C060C20 
X-CRM114-Status: GOOD (  11.34  )
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

Use kzalloc_obj() / kzalloc_objs() to allocate the memcard structs,
instead of kmalloc_obj() / kmalloc_objs() to prevent access to
uninitialized data.

Fixes runtime error: Fault in unaligned fixup: 0000 [#1] at
mtd_get_fact_prot_info.

Fixes: 47a72688fae7 ("mtd: flash mapping support for Dreamcast VMU.")
Cc: stable@vger.kernel.org
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v2->v3: no functional change, add Fixes, Cc tag according to feedback
v1->v2: no functional change, just rebased.

v2: https://lore.kernel.org/lkml/20260427114750.2480900-3-fuchsfl@gmail.com/
v1: https://lore.kernel.org/lkml/20251117224408.498449-3-fuchsfl@gmail.com/

 drivers/mtd/maps/vmu-flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..b76d0609d1b7 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -609,7 +609,7 @@ static int vmu_connect(struct maple_device *mdev)
 
 	basic_flash_data = be32_to_cpu(mdev->devinfo.function_data[c - 1]);
 
-	card = kmalloc_obj(struct memcard);
+	card = kzalloc_obj(struct memcard);
 	if (!card) {
 		error = -ENOMEM;
 		goto fail_nomem;
@@ -627,13 +627,13 @@ static int vmu_connect(struct maple_device *mdev)
 	* Not sure there are actually any multi-partition devices in the
 	* real world, but the hardware supports them, so, so will we
 	*/
-	card->parts = kmalloc_objs(struct vmupart, card->partitions);
+	card->parts = kzalloc_objs(struct vmupart, card->partitions);
 	if (!card->parts) {
 		error = -ENOMEM;
 		goto fail_partitions;
 	}
 
-	card->mtd = kmalloc_objs(struct mtd_info, card->partitions);
+	card->mtd = kzalloc_objs(struct mtd_info, card->partitions);
 	if (!card->mtd) {
 		error = -ENOMEM;
 		goto fail_mtd_info;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
