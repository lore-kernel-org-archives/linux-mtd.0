Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC1C43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azgMGKCLrwRxfiiY72TQJlml9+LxZndW2fDdffC8/Rw=; b=Hn6dVibvtjUwT8
	Fh5jYKD1sHBk95VisJbsEUmEiEx0jEmtZkpy5zvcfi/+lwAhjUbxiUGYBiPEPPWrCC8EqlTX6RV69
	Wm9AvI0QKEuZizwWXz5S5YRMRnbZx83ZimWA/lr9Earhw7w/hJdammATqsXuDMPLwSHiJ9uL/tAke
	ZMavKlBcF7zVSMQBbftJ+xjbGotbao55ITvJLdP3pOtO40ITOHZLD5RXayvfh9nI7fkcKfgGUBv7O
	8YIsKTGwyHWIJM++kyMumQwZota2jjgI0ffDR4yEMJjwS88PckzZdCtDJqmzm+KbdY3emZk/P4+hh
	arUVVd6tTRIANqDH8Acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNk-00000008BYt-3WfG;
	Sat, 04 Jul 2026 05:57:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNi-00000008BXt-30KY
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3811e59df58so700169a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144658; x=1783749458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWA/4m/UVmnMmxggqt7YCrXYgmO39jWI35he5TtM3O0=;
        b=Th2p7sSULyhzg8AIF0PvONjoCUCpr/pgNzk9VZ08D0Za3yE3DWcLfuaTZ7fhCbGRrP
         wbye59ZB2AaVrMGG4tq+wE3ZlEixCXmCg9NxOlY/zhJ3WuuoczgZQvGj96fxSLIHpMAM
         V/qMMI4/KtlMrpb+zZcDNsm3T0cRxKueexEuDNOK9dNRDZoJ9OHoMcO8tFs75OQ0e/B0
         ZCrjKWJSIlBCyTfCCAZx8gOHxGWJLXvuQhCOYhqQksf9VmJVzFbw9OMurFtXFhMJDMUG
         1Fy8dQz35KOkywOeca0ewKL2/CNkV7c2KMnI1PIxjW5ivyjBdhbFO7hncuMzVhk+fT05
         tSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144658; x=1783749458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dWA/4m/UVmnMmxggqt7YCrXYgmO39jWI35he5TtM3O0=;
        b=JAypaOO9s3HwHu4SgN3/QEsydBBrvCkOAXZaCUNSmLWHEDER/CDeDzWI2OkS1xdmCb
         WVKJHMHHscJNZCiuChh2EZ3JlqNjym7JdJmVeltgWsknWH13PcRlSGzxiw0b1YDnGdNy
         CttXkmmWgjitNxSoh5pWp9MLAXmYClsWDADA5PeEcCjZ0RbXy6ZhctyL+HfyZgaxU7kL
         7FesX92/hzPjRYPPYTt3UQg1D5z0TvGKox4a7yIrrt0OaTLtCOxl0kNLOjvJe3Q9E0I0
         hZGdElouNF4nf7GZSVvKzXI8Q05KJI1GZsEEsvSfZ7PPCmswfi7+u36UtFm5bmnaKsPY
         9sjA==
X-Forwarded-Encrypted: i=1; AHgh+RqX6ny/+mbc9BQYpmbF0UeBtIu8O/c5YnCOuC2kSbQkwOmbR+w35tWXikkZqGZJoY3f3qP3SwixXx4=@lists.infradead.org
X-Gm-Message-State: AOJu0YygBTEPnZOe+yqLuWbxdIQIxJZJYuQ0c9qjnXgLZr63CZhYxMKp
	C0gjx5g4MCa6avZBKbI3pcBBVKjJVRKrNvnQq68rDcI2nzM+gjWHaFKL
X-Gm-Gg: AfdE7cnYBHBArPSg7G9mQPokaHrFaGTYcX16cikG/cUCx5IsJ0Kij3HHB+hftVLHB33
	g3Z3yPNCSzB0CVBVx6EV0JXsTsgh6bg/RT6U88Umvmc/8Y6aU0FBKIX12wiNEaOa8BX/AizcLjF
	4ux5oyIvv8aJsWozyY81LDhkwb8P1cT4VNMwjjxK0hhRqpSy8gKbBDXHWnbk7aMPFmgRRm5z0bD
	CgZlCYxnfpf2JG5i0+fA5KY9gcUJ++yj+e0QwuCU3Qr7K26MUM+rN4ccYPP8KvJpFFtWUcV0PSx
	3LOSKTdJnsmbsoDvvpkwwJBEgIUQrscxxoWbsKlAKMCUYHDNnML8sgVpJV4KalaQj1Hrpgz5W8m
	4FnSGV4XJm1lPnkciTCtqIJExB8nDYXJS3wK8dR70G0r6qBOLzsngSno/xFD5A+LquVB3O0idIg
	KMmv0Xn6b6WsBWD4ing0/NP+CCKwReE6zWbM2qffZ+v9wsOdPOddU36D5Alhqgc9BHjA1E1SB0H
	2s=
X-Received: by 2002:a17:90b:524a:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-38280d99abemr2441388a91.14.1783144657746;
        Fri, 03 Jul 2026 22:57:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:26 -0700
Subject: [PATCH 03/26] Input: maplecontrol - only enable present axes
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-3-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225738_771434_79DAD1A1 
X-CRM114-Status: GOOD (  13.31  )
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

The driver was unconditionally enabling all possible analog axes and
hats on the input device, even if the controller reported it did not
have them in its function data.

Move the input_set_abs_params() calls inside the capability check loop
so that only actually present axes are enabled on the input device.

Also, correct the D-pad (hat) axis limits. They were initialized with
inverted limits (min=1, max=-1). Correct them to min=-1, max=1, which
matches the values (-1, 0, 1) reported by the driver.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/maplecontrol.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 6293b6e8148b..a498fc322c4d 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -118,26 +118,19 @@ static int probe_maple_controller(struct device *dev)
 	idev->close = dc_pad_close;
 
 	for (i = 0; i < 32; i++) {
-		if (data & (1 << i)) {
+		if (data & BIT(i)) {
 			if (btn_bit[i] >= 0)
 				__set_bit(btn_bit[i], idev->keybit);
-			else if (abs_bit[i] >= 0)
-				__set_bit(abs_bit[i], idev->absbit);
+			else if (abs_bit[i] >= ABS_X && abs_bit[i] <= ABS_BRAKE)
+				input_set_abs_params(idev, abs_bit[i], 0, 255, 0, 0);
+			else if (abs_bit[i] >= ABS_HAT0X && abs_bit[i] <= ABS_HAT3Y)
+				input_set_abs_params(idev, abs_bit[i], -1, 1, 0, 0);
 		}
 	}
 
 	if (idev->keybit[BIT_WORD(BTN_JOYSTICK)])
 		idev->evbit[0] |= BIT_MASK(EV_KEY);
 
-	if (idev->absbit[0])
-		idev->evbit[0] |= BIT_MASK(EV_ABS);
-
-	for (i = ABS_X; i <= ABS_BRAKE; i++)
-		input_set_abs_params(idev, i, 0, 255, 0, 0);
-
-	for (i = ABS_HAT0X; i <= ABS_HAT3Y; i++)
-		input_set_abs_params(idev, i, 1, -1, 0, 0);
-
 	idev->dev.platform_data = pad;
 	idev->dev.parent = &mdev->dev;
 	idev->name = mdev->product_name;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
