Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D2C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH8tUrxH9C6Qwc/Sjo51rcZBejdq2YsPCkn3WvJOFGs=; b=tGci4N8w0gUKiM
	JHoAmvYmnWTfwaVyfdRroqmpSMDxGO8I39OjruZhriF+sjfB38UBKKguU6VZyqHeOaQqayJM3gEaF
	H31eD06mX3WIPtnpfR5QI6duoPl0brbK9ARDl3SMJHBcn49UzA5XnjVYxiLJl8VkP25knvkrOnF6Y
	q7oartCwym2Yi3v539PUNqRJhTuFnzQYLuZL70ryYLZecgjE4vejmh/5Wx8g417vPiMEgAfxfbMpk
	RHC2FlgMRKMMzzdfQ9n9GJ2NoztdVrOjet+Yv2rdd4GsP1FR6g/rtgfrQvJMwxrLX6wpruIc/WjyS
	LHvS0uU2RZcoCqfE7pIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOF-00000008CFU-3yX6;
	Sat, 04 Jul 2026 05:58:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOD-00000008C8j-0Zp3
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-37d70036426so808957a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144688; x=1783749488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjRXENzhFdJSLRiM6d5V3++2rjRXfCmisZIqwmSzJyg=;
        b=YtQdChrcj1yKwO9Vb+86utO1Ulrd+Q9sLx4Q4Qz3OFi6upbrPm1PpE5y4aUkWgHZr5
         7+gp3WhztrB1jDzPsnLukQ1hAV3wJ4R3FC75Thr4yhjpyaWM4Dw7rv5jG5qX5f4rAAi5
         6DG0JRLCja5IiWQ5ugbMs2T/MqRLsT/v2a8g3HZ1yQV8mw5q9v9mz17qncDKULkPhD+u
         aaV4tNitTise2qsxe9FWEIsfnzgC7/2CE/ifF1fSKUFuzJ2f3B/nCm79JSC21yhLLCd/
         OrWH9GNxA37tqbQ8+RK1vqizVoCNMYGyPxXpkCiLnr7BX6D7W5Ng/vbdYAfPiChBlj1K
         E/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144688; x=1783749488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjRXENzhFdJSLRiM6d5V3++2rjRXfCmisZIqwmSzJyg=;
        b=IuG73qQUckkAbCZSl4VtzgpKQXNLORoU7FQupgSkE+qw75Tfn1XbjL8HtiOvyHc7H9
         SleHTGetHxZBrERRhhY9u2Ixs4OhUjWztr1akpVlxozg2Fm6gQAQEWTo9Z3CgOTrbuAM
         KNe8nfOs8IXU5gohD78jHDl9CYc7sLZ4+S6Hu1p40/2M9aBk0aGRlcksHWFd2IZ3dFKk
         twHNoBqhXdEL1x7Ger0BLCJwUkYxj7Dk/E/eDcLC1n/cuxOOLyPUfnRP4PIDcrPj764i
         LhSsUoA46kbGDcFFtxaYzPyWzMPik87Myx53Xm9+Mw0JnrZS1WlB++qAO5kTASR35JM4
         f5qA==
X-Forwarded-Encrypted: i=1; AHgh+RpciSkQnY6vC0siy33ikv5rXcq80E9ZIZeO1oB6TxMz+oBATYCQ7a0RfpzhOxtG/FEzSCXfU/6K6pM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/b/E71GYvRz7GXGgkZZcxgVhWHI5ibmFIlX09Xbt5LtTkGIvR
	NG453UrN2uin+0cWGhCxqb0kPmpYKnhLTQBFAUUb4t8bHhluxR3HuKNQ
X-Gm-Gg: AfdE7cmSHmOknvFYV3tyPjjPSWKcNha3UkrCungW7M9uC65TU5S1wurtQF27NhrwHz4
	G0HeirZKnYhmgmyx6PL7E+JcYdFK3ntvjehcIXiQlo5MC+fvwXh6/qGj2FVuJHVnbBjleND97SV
	pAqFKgh8xGiKD8Qeh7eUAavne0pGNpV/OwWwRLrP0exi2XMJrof+cpxpziG6kQvBrYZoksIcf5y
	qwSlokCoc2Q6Vp08paTyXbLoYIZmTpTHVkR23p68i5UuRr3+jRQtbRvsr87QeemM0QV7XnA6e4A
	XgyAzW8/3uygENGyc7lH3K7m4PJFw7WMzT92aHSO4LZ6cekE+2rKLYtVTArZsJldogCC3eee+CS
	IsjMXiAjGF0+vk2a9xgfPL7qWaSjkIJL4wcjDWHFYtFIrCdXuwApQYoyvExfAMB8PnKDFQ1pwrj
	nKsjKiyoWgYl366PpA9ZgHk3mNbVCvK0P5WZVPACGofcAwdvbmA8KSpFG4hg5J1Ms50/qilWpTU
	bU=
X-Received: by 2002:a17:90b:2c8e:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-3825c50c2ccmr2400537a91.0.1783144688130;
        Fri, 03 Jul 2026 22:58:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:44 -0700
Subject: [PATCH 21/26] Input: maplemouse - convert to devm
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-21-41e424964da5@gmail.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
In-Reply-To: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, 
 Adrian McMenamin <adrianmcmenamin@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_225809_189628_60111FDB 
X-CRM114-Status: GOOD (  12.08  )
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

Convert the driver to use managed resources to simplify resource
lifecycle management.

This eliminates manual error handling in probe() and allows removing
the remove() callback entirely, as all cleanup is handled automatically.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/maplemouse.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index 03cb666d278d..7842bd46c9a1 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -70,17 +70,13 @@ static int probe_maple_mouse(struct maple_device *mdev)
 	struct input_dev *input_dev;
 	struct dc_mouse *mse;
 
-	mse = kzalloc_obj(*mse);
-	if (!mse) {
-		error = -ENOMEM;
-		goto fail;
-	}
-
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		error = -ENOMEM;
-		goto fail_nomem;
-	}
+	mse = devm_kzalloc(&mdev->dev, sizeof(*mse), GFP_KERNEL);
+	if (!mse)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(&mdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
 
 	mse->dev = input_dev;
 	mse->mdev = mdev;
@@ -99,29 +95,14 @@ static int probe_maple_mouse(struct maple_device *mdev)
 	input_dev->id.bustype = BUS_HOST;
 	error =	input_register_device(input_dev);
 	if (error)
-		goto fail_register;
-	return error;
-
-fail_register:
-	input_free_device(input_dev);
-fail_nomem:
-	kfree(mse);
-fail:
-	return error;
-}
+		return error;
 
-static void remove_maple_mouse(struct maple_device *mdev)
-{
-	struct dc_mouse *mse = maple_get_drvdata(mdev);
-
-	input_unregister_device(mse->dev);
-	kfree(mse);
+	return 0;
 }
 
 static struct maple_driver dc_mouse_driver = {
 	.function =	MAPLE_FUNC_MOUSE,
 	.probe =	probe_maple_mouse,
-	.remove =	remove_maple_mouse,
 	.drv = {
 		.name = "Dreamcast_mouse",
 	},

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
