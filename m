Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEF5C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv5gNd1rEnsfcO083MQKkITEOzP09fEdINTKv3GiuEE=; b=fTUnA/0IRg72sY
	JohqjwqKUg1JAOLH6RBrXFcolYIUk+bqqBI8VGFfVvEnm2V1i6zMlGVu2YWIsssmCG9w7ps7Yqp8Q
	u/elPI0DbI+j6gy0ZOjiIWWyi+rwYxBp9n1svunClmcsaDPcd5ok3te/WSN6ND32VRZlfL/rJ+d2U
	XSYGfrvvXL+/qw91Th4piYoFjbshnVriBiySIYR8wAM8FaIu8iIUdJ7gHVrqzAIWOVAxdC3dlMJ7T
	MEP+tSExqDPGzI0dxf88nh8AkKsYH3qfYVBhAflrixEg5YDdIgfN6ZnvDWHUaF203kcE6MU5GA/t/
	iCG5yd4otF3xMY5tqPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftON-00000008CSA-2Z1V;
	Sat, 04 Jul 2026 05:58:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOH-00000008CIK-2OUV
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:18 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1509744a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144693; x=1783749493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4acdNVktMdF/ZdKGXVy9IqprAtt4e6vm+MUIpvJ+to=;
        b=D5bgC0dGNa5xDK5c0F9rN71LEgnRulRxtK16EHeRidgEYPQ0IIjOR2jxz0XerpleKB
         umkRrxYoAinBXrDomaQPiOXtn8UpWEV4nl4W6CifgcdJiAIbGdBSSfSxf6RcdX0OmaQ6
         lcQpAUSsOc5qK78Yr5YKX7BIz+fV4NzRC3F6B9NKZ/0bBwihmO/E8Dm2e9oLtH4idzM1
         364+HPWUZGgFqlRyovZpOMDnG3DbrVEVri8EInHsxZw9vm6/M41GJm06F8ZTENunuCgP
         7afZwA01g9LA9FyID++Huq+xt8Vcs+E2mZyNUDZ/N7uEa2ssuQ7Io/5lVYbgVKwsh9Xc
         J8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144693; x=1783749493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4acdNVktMdF/ZdKGXVy9IqprAtt4e6vm+MUIpvJ+to=;
        b=gCMr2y2hhyz+NZfEo50UBxAiwDM5hahT99VsaOONv3IhgmKrUTdfVS2nMzGRTHWSfB
         dOyWU5BC+qDDwwzgWcDFvQXuh1qfnlrciGl+CIKCJRJnZtw7eEM478W65QQF4yH6aepd
         5Ov+KQlctbMcXgkZnZsV+n96X4jA9YTnXs3R9+uPxXgWYR1XhJKC5jmqcXAomKyWHuPP
         +H6X6LyTDymZimPIl/3oA7udXUieCXdKwCfP6BIM204bRjKhGaUGTzPcFsVhoKSABXNQ
         2yR52Z99LIzd6sd0qg8LQWYcK3Lq++pnbrcVwXd+JVIejOgEhanERHwmx/70iML7ROMA
         c/Bw==
X-Forwarded-Encrypted: i=1; AHgh+RpW1eQMWjM25YNCLHsTSqRAV/22ZIV7HpUvtZOqxhdR5RmDUGLn9hZIa/kHU9zfLjUQ8C1Ghb+kKPY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxywSrTW8Yvzo/+vQkhEb1Tal6OwIgH3aTP7cqEIkHGNtseKbTP
	Ejf5SOxbur/z0yWMhA15UKwN0p7xIfu5lxxeHufpYY+8rdWndOebe0+h
X-Gm-Gg: AfdE7clL0Jl886ZiM6nrOcnRVAH0wu/A3OmtSPD7M42g8KlGP9DzSw6DCPFAsTgkYgx
	cR/hiXAVaqbEUeo2TDye37QpoZjVZynPbLEBS+B2/q6Cql6xg9WZyP7K6zsDr6a/49C2YDy8v3n
	mm3vrR5eqCDZXn6nMzA3d4tPSK0RyhXoVNp4fA+uLnhkq5dbF29NnJwpfTUi1R7Dcs5qm8C7Q+y
	6v31WmBhy7pkSx3u2A4Zz7sD5MceDX6AMZw010JMQrzb3guSdTRV3cfe5+kTsVppbDFtZJRzj+X
	TQ9i0Ryf4qZP9e1cxle58yqLj167h94GvMJMvymrF5NLnZ57SeFJOsPIpPlk8btizrAswed9Ucp
	XCOwiD87j4JbUfiMiAy8gN0NT8uatJtl29eKmv4GoMUsiDH4gCq1DMnTE5yaMNAOXrLSgkHkdRg
	TxpEF+Uj0sX+0A5SfQGKrLOQaAABhdQluSp0IPBr0OqjkVjyrO8KB6OtpPRcQgCmjBPPBYazjAR
	1s=
X-Received: by 2002:a17:90a:d406:b0:37e:144d:7f6e with SMTP id 98e67ed59e1d1-382802becaamr2576630a91.3.1783144692874;
        Fri, 03 Jul 2026 22:58:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:47 -0700
Subject: [PATCH 24/26] Input: maplemouse - fix style issues
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-24-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225813_634612_6C7BA687 
X-CRM114-Status: GOOD (  11.05  )
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

Fix coding style and formatting issues reported by checkpatch.pl.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/maplemouse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index 7842bd46c9a1..691cf334ae9c 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -50,8 +50,8 @@ static int dc_mouse_open(struct input_dev *dev)
 {
 	struct dc_mouse *mse = input_get_drvdata(dev);
 
-	maple_getcond_callback(mse->mdev, dc_mouse_callback, HZ/50,
-		MAPLE_FUNC_MOUSE);
+	maple_getcond_callback(mse->mdev, dc_mouse_callback, HZ / 50,
+			       MAPLE_FUNC_MOUSE);
 
 	return 0;
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
