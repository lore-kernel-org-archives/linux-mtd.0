Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61A3FF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKD8M25UtZlbJlPIf9IdQnmmTbwzrXn6kj9GL+EqOBI=; b=C48RT0xwWZafFc
	vQ9422pcBlvOiy/CzTyfwfWiFO0hJAztnF5faiPzk5tnZRrx8i9TyZBwNIbReRUZ522aQDuMRTDP4
	z4PyGzgzf9KAkOC5L7SQuoizd0JOY4F/ahD1HUIfUhflIYbjdc7ls8QNzOLFL585Ciohsy5T1AAvN
	rRcXBvsmfnASpCY7+qoZpTBJKFQ7FfSDNAlmALm6q+0zjxOg1g2zfvNiVdu4b23B+kBXsZC4VwAnf
	tQ4g1eft5fI80oLU7VBan+29ciYtnjt+JkyzMjFL5XPi8TBbUblWWFYLXsVRC7xYzDYfX8klM2Jby
	m6satgKi6xd3VFilVAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUq-0000000GpSQ-29SD;
	Mon, 27 Apr 2026 11:51:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUi-0000000GpOi-480D
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 11:51:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d74086e5bso9704929f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 04:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777290679; x=1777895479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK29FoURh791KB3pSonK6KWtGokZs28tGn9ydulth7M=;
        b=MBz0Tv3aXQEVl+hRxYjkwt82i6QT1SUk4/bO+UUHGStt3Kx65P4ComjYKp9b64ueeL
         wTgVIimegS4q5Z+H7SCW7Lrjp1qQDHnN+iu8w3gpR3viE8miZL9pJWYLYRW1HNmqP4oK
         JIpiad96uI4K4K2ZAeCgK+JBSMIjHYcmQn48bI1T1JV420+ird93/fKQJjBk/sXufB4m
         fwniZw/wE63nuhcNrhHbuLJzVZjd+zkRVi53I5zBeosks6ZQvGqhdV7TMlxbJ6pbof3s
         smg62Gb2w0lA4FCjbcyt1Qje1pHHXH/zeNnjHTdzejo1JFw5QzjrsRptREwcJEGRFIeY
         X0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290679; x=1777895479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK29FoURh791KB3pSonK6KWtGokZs28tGn9ydulth7M=;
        b=OYJXhq2XSdm2ogFcrFZ2HqoTCXRhd1x+3zOLMADvI7hbdvNz5o5AC7ulik8G81JoQC
         vAutnWH349czuSnyVR+UT1jDeWjse851JTX/xjIW0KsRStE70hw/TYBPR0Lik8q8uDQr
         nOrJPKShg+l9LfhJqYpiMD3/OmGERJQlH9BIG2BeSwf5P0ug8b+VcvWYxJJkuvWlgPbA
         jgGMfLKSQU9HXwIDCS1X+Nrr42sttEANBpTJGbvibiDyDLlcB+sHx8oZf+k6hbuFOnLd
         YrZcoly0a7/ewjovvjSWz5SHTgs/vOgotnRNsg40Geujj4uxA0XCiRlb0QJhvnQCE2eG
         2Sog==
X-Forwarded-Encrypted: i=1; AFNElJ96ZXVzw8s+8Qaf/hXfZCsbyUajTLefeVT4wCBt3qW/z9gIz7rABquNiGQhpzHJzXQwXA3V8RB+/bs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl/Vo5OxaJr9Am0RcFGmXSzPd3HDkRByYHrRlBZy1q/IfPJqF7
	xu7lpAx3kIQ/U97Sc6EPjyvPkFgFo7G5ZcfJ/8hgLZ5VwAQ5adUq8sQ=
X-Gm-Gg: AeBDiet8WjmqoYsb35mqhfgNO+b9B6lyOi+vxmQoQrCuK9sfVCrdTTwU01MJpTQTcmJ
	C3McXWwdeY/IM33oRPbzm4T3zLdznvvOv0vSz4JiExAuRKsJcEUnzGtqUu8gmyjZKNQihyIMCP5
	CegAiBOeTVTACJzpe/VCme1Z1qCq4heFvEngvYqXMRKc89b7Q6lzTPW5zcCO59DEc5nzl9CDsgk
	Fmy+doi78AQ4/MxpiffRf/lFxWu5b3bkR/ha31h8VYkntSXJJL8JsUU+HED1xKKnObCyKe5ow6u
	LKKCacOyu1kCP6aVRePaHFRf/u3xvY3jFOrJ7qmkYU4RNqctUgLViJ5oSWDfml7DBre8TR5LGfB
	hZL+5gi103zcgkYbOqGbj2jwFYXp3KftHoLM5V/UpmT/TshdcXzQzpP9Y+mtNDnbgFfw16VFZMr
	UAvT/iCpJz7kPLK0XdvQXBGf1N6jCsRigzAEPYwxdvIDm423DI2nQgG3mZhq8TsX3sJEy/YPGYT
	Tj9K3zi92hyg+ZbP0o=
X-Received: by 2002:a05:6000:2303:b0:43e:b020:f8a2 with SMTP id ffacd0b85a97d-43fe3dd5208mr63553484f8f.19.1777290678780;
        Mon, 27 Apr 2026 04:51:18 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:3c87:b0bc:8c35:1ba0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e59f97sm87393680f8f.37.2026.04.27.04.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:51:18 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 3/3] mtd: maps: vmu-flash: Fix NULL pointer dereference in initialization
Date: Mon, 27 Apr 2026 13:47:50 +0200
Message-ID: <20260427114750.2480900-4-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427114750.2480900-1-fuchsfl@gmail.com>
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_045121_075534_664683AB 
X-CRM114-Status: GOOD (  10.31  )
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

The mtd_info contains a struct device, which must be linked to its
parent. Without this, the initialization of the MTD fails with a NULL
pointer dereference.

Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v1->v2: no functional change

v1: https://lore.kernel.org/lkml/20251117224408.498449-4-fuchsfl@gmail.com/

 drivers/mtd/maps/vmu-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index b76d0609d1b7..10244e6731d0 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -547,6 +547,7 @@ static void vmu_queryblocks(struct mapleq *mq)
 	mpart->partition = card->partition;
 	mtd_cur->priv = mpart;
 	mtd_cur->owner = THIS_MODULE;
+	mtd_cur->dev.parent = &mdev->dev;
 
 	pcache = kzalloc_obj(struct vmu_cache);
 	if (!pcache)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
