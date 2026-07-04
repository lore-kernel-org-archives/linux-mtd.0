Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D67C43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csSVBnnp9669HGPodgwHPADy/m1Q8o6hkMbVf3q/4Qo=; b=LlHIKV34Uuy9ix
	ATZKGqyIAbuz8VipNoNTRZfcbuOPEZ4zSlmDbq/CG0IGbASQZib0/e3Q2+ZrngPWZYgzAqMLi1GOd
	Vu3msVJ9Yx3CrP3Bx5MMlO5ly7pn56Gw1p0juvinHBaCscZZj1DnzoWSPIm30DNF1298Al62g3Z0r
	Ez2DsXYf0ImHCZbLrrH+o+zEo0fHNt001BRMnjjLzCq1ISfD7JlYgkF88JJum0PuMfaqvGjdGETc+
	LmXt0TrHe+VDl8qE2bOexOkmMX1m0DGipdrpE6Euzg0LItm7+uyS3D+HdFjxbwhCOSIIyOQkWTHzA
	+5Nym+v8qkVHrk38Vc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOD-00000008CB3-3Dlz;
	Sat, 04 Jul 2026 05:58:09 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOB-00000008C5h-11vz
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381216921aaso1142278a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144686; x=1783749486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtRA/Iz7xW+gdF1+FPWoWbYlNNq+Ml51Iu6T+Ii+D0A=;
        b=CAxHvigXI3bLkQjagpEEcHWj3y7oBABRrWUm5MirTMS2vicitgbnhwIqdnaoMWhBny
         PBLHiGo1BBkWJ6PiIQgQdr2NJn/LkohfcVupWzCTiUvuboOSaBaziaSrMsMHLIFStR1Z
         i0hnwS5IyjCG2cUkk3yZd8QxGM4JmD+tQG6s2pxY91vi3QUdDHy3U6SXuJQHDKJMWz+5
         vyQh2D66+qGRs7K3/gqTYH6xTmTDPbj3OrZO7dgd3ekj7YKKiX9kJjVE/Ukogxq7gbDe
         MOFRVGeQXsMX44YCsw87mKJHZrgSOiIaHNlHIYd3Ufg4SOEXccEVBaPXiLu2s0amJaG/
         68SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144686; x=1783749486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtRA/Iz7xW+gdF1+FPWoWbYlNNq+Ml51Iu6T+Ii+D0A=;
        b=G9J3eLjO7+4r/Z3aH4qzvO9+PpLTAoImTaqLxn0qk8tcy8GH3E3QP677M0eQfHFcaj
         GLt7isYIEHtN31iJ/oGz6hAP1P1qWeFWSu8DWyErxmZ1NLvMYkrmN7EW56ev7u0dpc9F
         1t3CDsJPUxdUYoQPavT/xP+GvvLvqMxYminELO9Cl5jFtTvgXdI2VFq463sKom+Gtjnu
         dYqNTdYq225uMbqJq28jPBVqbS8ikHiuYk+f4Jt31xBzrIvYaP8sL5rUJonENEikJU/W
         t3JuLL9LAXKR1GrifFNdykgh3//r9Ruv2X7ng9yKkcBy5Yh4widhykIOiJtY+VZNHExn
         KPxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+X/VrcLUq0oRvy+j32A55Kww9hS/cnS9vXQZLvbXGNy193A2ASFeQ6LQEdljHQi6QdGEKWUC88x0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwd+10DhiAxQHMPOzo888jYZCTuxo/ic3l+MlFGses+3meyNiB
	vMBICzLcySrrBg7iroL95nR8HN0qTbjEL8DLDyQPhOYJfBqyjpwhGqvw
X-Gm-Gg: AfdE7ckdoQdFpCij3+4o+wSSRUaxqV95H7w/mfEAWokrhfTz4h+WFMiezKARgEfUfD2
	VjTddL9czLhbCE9yFZZPySOybFu2SMNhx4HeiERnlunV9EzgEItXLqw4q5FOzxKARvPNjR2k7BR
	PcDh8BQAb4JmeD2PvBwxemgg7ecUHklnrMSL3WiSA3W7w5r0+QXhEmjZxC2u24vmcncy7wepfFl
	jKcuZ5E1H5bYuAZMAPR861o204mvJpVVRmFFgLtJpJTkLIhBZSTFh5Hjf6zVYATMlGxNYvhtBrk
	jV11zIhbgeN3dFcyfxPkMrxsLjjHAi+cBtecd5Hyzv7HxuFPExA3cpNainmrpVHgyZUto2YgmuO
	FGsM3XPlGg3voMpDBkSzwytvEzE/27USDSmODHP/O1pf6aK3j9K3ftpNbhyLRIoVdwvUmjXaLLm
	r3Z1Y5nYZNs9S+dwPgqkjDrrtRrh5OJ85XtteDfaJgstvKaEuMJjvJyeqPZMpFTo8eNnDR/KZAK
	QA=
X-Received: by 2002:a17:90b:3f8b:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-38281185463mr2376208a91.14.1783144686491;
        Fri, 03 Jul 2026 22:58:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:43 -0700
Subject: [PATCH 20/26] Input: maple_keyb - convert to devm
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-20-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225807_305781_915D87F4 
X-CRM114-Status: GOOD (  11.14  )
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

This eliminates manual error handling in probe() and removes manual
input device unregistration and memory freeing from remove().

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index aa9a4a80e26f..bd4ce803a13e 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -155,17 +155,13 @@ static int probe_maple_kbd(struct maple_device *mdev)
 	struct dc_kbd *kbd;
 	struct input_dev *idev;
 
-	kbd = kzalloc_obj(*kbd);
-	if (!kbd) {
-		error = -ENOMEM;
-		goto fail;
-	}
+	kbd = devm_kzalloc(&mdev->dev, sizeof(*kbd), GFP_KERNEL);
+	if (!kbd)
+		return -ENOMEM;
 
-	idev = input_allocate_device();
-	if (!idev) {
-		error = -ENOMEM;
-		goto fail_idev_alloc;
-	}
+	idev = devm_input_allocate_device(&mdev->dev);
+	if (!idev)
+		return -ENOMEM;
 
 	kbd->dev = idev;
 	memcpy(kbd->keycode, dc_kbd_keycode, sizeof(kbd->keycode));
@@ -179,7 +175,6 @@ static int probe_maple_kbd(struct maple_device *mdev)
 	idev->keycodesize = sizeof(unsigned short);
 	idev->keycodemax = ARRAY_SIZE(kbd->keycode);
 	idev->id.bustype = BUS_HOST;
-	idev->dev.parent = &mdev->dev;
 	idev->open = dc_kbd_open;
 	idev->close = dc_kbd_close;
 
@@ -191,15 +186,9 @@ static int probe_maple_kbd(struct maple_device *mdev)
 
 	error = input_register_device(idev);
 	if (error)
-		goto fail_register;
-	return error;
-
-fail_register:
-	input_free_device(idev);
-fail_idev_alloc:
-	kfree(kbd);
-fail:
-	return error;
+		return error;
+
+	return 0;
 }
 
 

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
