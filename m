Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C45DC388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B58D223B0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLRPD90v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gynwMwCL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opBwhrxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B58D223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xMq+x52hv0S47USEc6kSR00N4utMwKTqtcqsBq7W4RA=; b=oLRPD90vYuyBVaJPjyxCD70FF
	j/6flY2ciNVE/4w/X8/uhmTepwW2c0ikQv61f9Gzb6cuuEH8/w0pLVhpn1SlaFJ22GkMth2cbQnx9
	N6e//M2ZN/fmUCLFsEKfCV1BtYyopZZQ8cWQpwbE9gWCoeKOXQbBpHSC1elBg61nGyS5iLumomdFb
	NOAkztxNzDFjAG1eHQvXylrzy6xVY4jiSH3tbpFNGEnQqDoOGlzZ6y3mbNq42jg5kyh0OeRYtF/7z
	ga94h/ByE63ag+auWknO+Sdhm+kb6iVZA0mxE/B4AbZLom8HGfFMRtzVod3fB1NGVO2h3sEHwt2MD
	rnqVAAobg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYhE-000452-Df; Mon, 02 Nov 2020 12:12:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgu-0003p2-Bj
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=; b=gynwMwCLc0+LXPkf4XzfbHJztq
 BOUmYo6cy6lRj/JIM0RNECi1DmKfAZpUKWVPfICbNVsT7jWftIJOJvOfwOsnn0dGAObn7HxhkcTQX
 mz8QcgNkI+P3daV0rtzSBizxgcEZHMVf7DplTIQ2VwNkbVDmAFCpWGY3W3webpFZthwzlEqExaRLS
 IfaM+5BzBUsD9HU+Y2gSRgpYEnp32ur13s9HUoMhxERzbEpx/yw83Qp3kD0sI2EUnJ8OiVuivSk5k
 YbPC8MkWigra3Cj2LJkHuXeT5W9Osvp6Y3BbHabcKmajds9f7wM0N+2HIqIkh/UHptfP+4eZ3N02Q
 0ZfoqJVg==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPu-0004ri-U9
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id i16so8834675wrv.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=;
 b=opBwhrxLDDOijB/+6w0qKgtlnTAnSYM4uhprrPkJ9C3OtHPXIDM2Rf5IU/mmjdS3AV
 PhSjyKbvUb1D1DhP3/69ICZJTZNjyxqoO5bagSZy3o6ovSKW57KJryFUjgQY15PSLMG+
 a5HnXkkhUOuhw5aMJwRRXrKFqqDX3oYAcL6z2tSkcVapWDlr9iRxSeMI0NARDRsWWMxa
 YX71OJpG0fGny9J4O/WWj2F/kiO7SC9kRW+nF1PGUECszF08zIAJrtAfIUsUZ7ZgGpMG
 eQDt909GDycd9buJqg8nBRhIOsrykhLgf268VB7fCmuqoiYiuXDFGX00vcPVtTTwHK2U
 q58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=;
 b=W7BiHNRDk5tCb0N9OFCvl1ENVKt9SHcN6CkAezyL6LX4hZW0VzEw/QEBzU63mjCE3O
 1UJJYEcABxNhfqmMkYni5yqVW2fMqzXaQtcpqHtAh1HzSFPV5x0xNWfYahPZYi2iQv0q
 CwKMoQSk1CJhDGZeJIE8r6byNRtlAT4MPHWm/g5bv3rSZvG9MniDvzcl6mlCEhoS9Wu1
 uJ0mKjXBuexihEQjWsLG4kmAQ9uwGtr1OX2IO5/ut30CXiXCbExhkKuRlMBmEbs0yCPq
 x65hyoerUsxStA0bFzR2pVDUvv7xmcN4WEUk2M0CxBdeHcfkLTNHwUOHZ25Cyu9EGdhe
 1Zhg==
X-Gm-Message-State: AOAM533Q8f0SHz+DBtFlx9ZojD8AXqqBG4Mn6vqNN44x/hukKvHksMIk
 FGPg3MLyEZ3DwCquw4U1igwm2g==
X-Google-Smtp-Source: ABdhPJwxzsFyIA+Yg1CglN1R6rmmAXo9pfMhFKXJu0Gimkd0jsZ691A7wWzZjoNud7hrDZ5CNQ9FHg==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr18475908wrp.44.1604318068665; 
 Mon, 02 Nov 2020 03:54:28 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 12/23] mtd: ubi: wl: Fix a couple of kernel-doc issues
Date: Mon,  2 Nov 2020 11:53:55 +0000
Message-Id: <20201102115406.1074327-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115431_846177_FBD9DA8B 
X-CRM114-Status: GOOD (  14.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/wl.c:584: warning: Function parameter or member 'nested' not described in 'schedule_erase'
 drivers/mtd/ubi/wl.c:1075: warning: Excess function parameter 'shutdown' description in '__erase_worker'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/wl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7847de75a74ca..8455f1d47f3c9 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -575,6 +575,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
  * @vol_id: the volume ID that last used this PEB
  * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
+ * @nested: denotes whether the work_sem is already held in read mode
  *
  * This function returns zero in case of success and a %-ENOMEM in case of
  * failure.
@@ -1063,8 +1064,6 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
  * __erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object
  * @wl_wrk: the work object
- * @shutdown: non-zero if the worker has to free memory and exit
- * because the WL sub-system is shutting down
  *
  * This function erases a physical eraseblock and perform torture testing if
  * needed. It also takes care about marking the physical eraseblock bad if
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
