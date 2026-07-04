Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9207C43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIPv0YX9SiOpOLltbQJpJ1z0tse08drLsxzSQKg2CNc=; b=s/5LVhCjbq2Eet
	ClMrurtmcGR78uB2JWfTVHr1VK/Hw5W7Ez8z+EZ78DL4CBAmS+urUEKpgt/fSixVqydXDfd6CVGoR
	yVMvXdVT+v2V87Sjt+jRzKo/ztbHTJhsY4PnFuZrNEXjPXt9B2CbXQgyRJQIpcnNdAYY8GpumiVkg
	HxV+CBcLR/jSvCCEOZM2VpzOV/s2EibH5z3S/F83gTgb5U3clXymo0EpFF6h4W60pyswxcF9jwx3I
	w7T5XjTSMM8CrPdYvw/46cw6K7seJrbWF5Mh8k4Z6bkv/9+Z4eihcLVJ4jKDvJdT1I98RBTjosjxm
	vOnzCBBdkCeV95dlqYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO4-00000008BuZ-2I7s;
	Sat, 04 Jul 2026 05:58:00 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO1-00000008BoF-04Q6
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:58 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso852946a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144676; x=1783749476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdTmxlQdCLPDy6vLV7fvg2daIcNL2JqaHKiT0xd47mo=;
        b=jLu9JVWVtEOeUIF2Qphl4cg6ELKD3/evueWNQo6fLe3j1wfKQGGnZZpvcQZqP+2fhy
         TiQcg9KNUGxulErAmOqQRReXrJmQLBsFCUoXKz/KDpbCfsCkFf5bEWybE5LrGsG3dBua
         d9H/gzwU8tnwNeLo8fzcD1PCO+SY9krPSAIaeTtdVnxbEcSfM1B89nX8GM6KRi5dHGYH
         E1jPoHPE3s/fQlfGcjzRJWsZvoxf6rHdP2zOyWhN6OkBShK00ikZr+5O9CA1Lz6j80Ls
         uriHUUht3UW+1gHgJfLRtZiRtpdbOsapFyG111PmJ1ys/3KFM1ynpYUiqRUoLgTwkkVu
         zB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144676; x=1783749476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdTmxlQdCLPDy6vLV7fvg2daIcNL2JqaHKiT0xd47mo=;
        b=SLlnBxa0dycWs3Jh6xj5LLXruPH0wtpbzfuoIePaJNibxaZUGHDlZJCVRD290CmKc/
         ZjQTtPAsIZLWCTENUqeJrdRQbunaKI1zcpowDzQ4IC+RHK/pTNfIvlNa6tVmx/FeERLh
         ohmfiHKMNt/daTVL8U1qBgBAauSPI8Hwp3GnLgbYgnQf/YdaquvT9bxKfJNx6ag/JWJt
         2TKServkmHG3tOnhsRT3FBeAn+pgGMTgBlR+OjNFwgYThUTilBEGQLqUQunz5Co/wl4S
         WyM1yjf2x0gV5KnbgD/vC0vzBOQQPVmcysxprh02WJkMaxwJs8W6z6amG9o5JfDM7Ueq
         F+GA==
X-Forwarded-Encrypted: i=1; AFNElJ9X4wvZBbOGrqhmtYhYvzWgu+Job7d4Q/CWfF9eUYhkF7MHVefrZSBQGn0D3bnF8GRNpjblToAIHKk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/sQ8CZF00o5C248GwMqUwR6B9wQC5xzivkweEZMCqWzk+lBQ5
	X08ms27A8ZqnfwatxtLt8OAj9i+fVwpCre9PcWWVQ7As8fg84GZM/nk1
X-Gm-Gg: AfdE7cncEEShRU8ty6yTJiqquiKFvQUFumkxjGPhTJzt1/V1FC9xJgharxnnvWt6Hrm
	6yQfWSNnBQTpDV3MfCtbjZgjS7KC8hGZRNkXhUXPM5BizVXOxW49Wz43Vrwm63VNQhXRni+Dwa+
	snlY64sVVxblo7cURIzCB5GZWFuLnr1hX0gLEv8yXQ3C7tOxhFOe+K2dHzgzgVGsxGGuazIq/RZ
	qxhiecappXg8U8EtwECgt8IqxuZKweIH4QJLPonTXU1MnZ7cCgTZXuxKstbfSAEFW6yQ5ZfVziT
	Driz4yCZsAW4cHBc7PJgkgurpoy9u+Z24RWY24u4TYZ9u+tobyxGeUYCGxF5uZ8/U48CwIFZj52
	NMi1wPSg8Nq0+62JTmKHbww3JRdn63gdRiZRfKDXveNv6uAoacrZLyGvipmW5xPVtIIwdYOOSt7
	AIv7Yied7r5qjL69ESLZyONzk5XMEBIHsfmzL/MEukhj75sdEnfalf97ilfw1o6B2H6Y380EtS0
	g4=
X-Received: by 2002:a05:6a21:1bc3:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c03e21c2e6mr2608163637.14.1783144676040;
        Fri, 03 Jul 2026 22:57:56 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:55 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:37 -0700
Subject: [PATCH 14/26] mtd: maps: vmu-flash: remove unused mdev->driver
 assignment
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-14-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225757_064438_564423AC 
X-CRM114-Status: GOOD (  10.53  )
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

The driver field in struct maple_device is no longer used since
commit 1795cf48b322 ("sh/maple: clean maple bus code") which removed
the reading of this field.

Remove the unused assignment to mdev->driver and the now unused
mdrv variable in probe_maple_vmu.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mtd/maps/vmu-flash.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 10244e6731d0..8f7028ac1b56 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -772,11 +772,9 @@ static void vmu_file_error(struct maple_device *mdev, void *recvbuf)
 static int probe_maple_vmu(struct device *dev)
 {
 	struct maple_device *mdev = to_maple_dev(dev);
-	struct maple_driver *mdrv = to_maple_driver(dev->driver);
 
 	mdev->can_unload = vmu_can_unload;
 	mdev->fileerr_handler = vmu_file_error;
-	mdev->driver = mdrv;
 
 	return vmu_connect(mdev);
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
