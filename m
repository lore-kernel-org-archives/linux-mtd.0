Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8949C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM0rFSRohBsxXIJzxr4UBNVSLpWRFBCrhmiG2mz+Z3M=; b=x9FVnGo/hX0D7w
	ODxBgU29tLkYEaqnm1Mo8Ola4j3ATywIKCWp5TW4uUmOO3kEHeCSzfUwjXs9Rn8CbE3Gk4wufqe8y
	StzRfW2qK1cvWofe9fItvdR+Nk7oPsDYL7ugt/Gu3jTzv1a+UpsOr+BeLRMX4vbjYXrljz7gutlJN
	OOGQmOtior9iHC+JQghsiREzUbexM4+Hw8JmMOBlr0VtZIxm22ZapCK0n0YhxFmyxE2t2KLdw1WyV
	TsM596oCvRDW3WChibx5k6/9VUGKKKdZfQ4OhecpGuCj2kIvLbYsNeNJNjkkvMBYTk5s3qIo7BIDi
	j2EixQSQIvxF1wZLmtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNt-00000008Bf4-23gd;
	Sat, 04 Jul 2026 05:57:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNq-00000008Bc5-2x76
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso695896b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144666; x=1783749466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dp1mXo5SNq9TpBKhHNYZae1AakBfR6uJunKVLp5bf8=;
        b=ObDemSgujlXEOusjrY4cGGSiS6sK1qUo768uECis77Q/BbGxpnO5CPkLpJ+PTsoQHg
         d0bqNgXoEFlZcDKqwEpxFLwIVY6FMhnK5vxn7mMYRD5OYYKVllWHixGRvcaXUKNUvaDS
         s79CR1E9xDkT1pnul6vtWARqkNtb6SX3s/LNBolcjBJXY2T+n7qx/mJ/v9It025gfZny
         4mZ3Sb/n6IVg4z3a3DtGMKae7b+sncmhC/AF+gKt8f5s6Al2lvm5aVCWT9hBJKf35xhq
         VXid3QjDkn2uVLo+qVIiNk8jl2Xl4SH/XBJ7lYlhYfFJP0pCJ65kw/cQT8EJkkaY2VW2
         HHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144666; x=1783749466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4dp1mXo5SNq9TpBKhHNYZae1AakBfR6uJunKVLp5bf8=;
        b=CsMiprpZ0YvTkrqVficzKQ+lJUGvPCyKyUM77lG3+lYyClEPxpqYptBM9FdjOFOLAG
         VnS4spShoAM12B/rKbs1vtDKg8DIIzTm+MgOxj1yrOkseXe2hLCpGslNs8+GjmsoX6mR
         JUAZc1HMktD2Ij+hW6oo/qEpbu1++7ZR3iMqhrQLVpjHF2XU14P7GRoy1SNn9hhQr+jI
         PQYzpi/aDoPaOwov/Pd9gQDVQ/p0fL6hkW/9iQXChG4vZ4OsDksGa1T7Z+6hGixOK/Cj
         c3eKH9uxft6yrw4HIckXDJeMQ+/mDmUn6Ps8yjdNldScPA2H/8eD2bYEQ1lXDqnGPQQy
         b3pA==
X-Forwarded-Encrypted: i=1; AFNElJ/o7GVJcOoBe9EtlHFazkFR84u/y+kcUZx/oIhuTA2BsLm0aGvc4lmcCefilLsFXvaTswKl6OXuzCc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxro853USLhWFjOd13jXqjy28ubbkA05N5SkAWvzyoXkAianE6h
	SibpOAip6xi7VhMSbTaMtpaesdAmsf6a3JlzmL0TE0zuKb8wcgp4H0Y0
X-Gm-Gg: AfdE7ckJJspoPEudzFrS1OAi8vjxR1XFRja5XWFWsj3dpaNypSIZtI5lVaH+Zse4X6+
	qpUzSZjBiDhMD6u+TCLbthBHYagXmS7aO2t8vsxo35owUF12WztU3kQrRe/W77c9hzosZ5cPdxN
	vVyfTz1ibDTzDa8CL1hnouAmdv0U9jwDL12P+RuHYjZ6G0pijCz1RKnciCCa32dgqyxsMqTPPgw
	yLsy0FQqUmXsah2gH4vDHRJKlF/KGcR0vvtmK1oCBRGA8BeZLaspz5nY/jgbiGxV3KQN6ZH3Zp6
	MOkaQqGCbbMAjPAP06XCU8iJfScRsOgOaYu4RzNN7Q8faF5wn6G9qYllMHqLiguAfQ2HhVP8eTv
	qrKdcw3GOPTGuSnasEa2E2qMSYr8jGxraolpLcutY89yNZW424FhrKgYndjeijDCQ5h3FhXijM1
	UpY1baAcyOnKVpuuN90DZnljH5h6Nggk5paWUDh+x8vOKdR1fRCYthagY0sW9myH7sLDaeeDj01
	Ws=
X-Received: by 2002:a05:6a20:d43:b0:3bf:e66f:266a with SMTP id adf61e73a8af0-3c03e5b8218mr2447512637.59.1783144665865;
        Fri, 03 Jul 2026 22:57:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:31 -0700
Subject: [PATCH 08/26] Input: maplemouse - remove redundant drvdata
 resetting
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-8-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225746_756757_9994A56B 
X-CRM114-Status: GOOD (  10.10  )
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

The driver core automatically resets driver data to NULL on probe
failures and device removal, so we can remove it from the driver.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/maplemouse.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index 97d520e7d66d..37f60bbd0ba4 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -109,7 +109,6 @@ static int probe_maple_mouse(struct device *dev)
 
 fail_register:
 	input_free_device(input_dev);
-	maple_set_drvdata(mdev, NULL);
 fail_nomem:
 	kfree(mse);
 fail:
@@ -122,7 +121,6 @@ static int remove_maple_mouse(struct device *dev)
 	struct dc_mouse *mse = maple_get_drvdata(mdev);
 
 	input_unregister_device(mse->dev);
-	maple_set_drvdata(mdev, NULL);
 	kfree(mse);
 
 	return 0;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
