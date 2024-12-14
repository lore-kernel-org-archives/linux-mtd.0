Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EE7E7716A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6klkb0iVm9Wu1pKNgkimLWROdi/SDOH5jiVyFwQgN4g=; b=s+UY2K+6wEpMO8
	6ICYQ2PZUbACfULyMCjdrRHzAnwoRnux9XRofjvPdVYjLdLaBNxyF4Lyz9WFGCEwoaYp938NdYT0M
	G9ZOxlgfK65jwioDoJYghDP1Vp+t+IBydz31Sj21PZj0P3VTPgvA4ufW5eZe6ARL9fBerHUzJOXrQ
	XsAw/RPDQwS1GGvTkBA+CliQ31iq6m+1VWnC3HISFx/o84jCN+qO4JFrTQWV/NrOrRY+A343YJ+XU
	p6Dg1F6RagYzReM3eX/xUZP2v3HIGyF4bJv09yBSO0xl+KbGb7Cw3J3HjW14Fs9653texWpeIlrGY
	sM6Jfy2yoJv1tKDRpSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMSIA-00000006Ovx-2RW1;
	Sat, 14 Dec 2024 13:34:46 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMSI6-00000006Ouj-1puC
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 13:34:44 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e3c47434eso2644493e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734183280; x=1734788080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyVLk3q2sonALF+MqTAOvJbPXZyYdr+nfKYD4flnZbs=;
        b=H+Dhx1d7bCdyEdAm+Ajn0u+tTaDBvbdHD96lum8B3PotSi3bdNANPBn0ES/36du0Cz
         caSBGZAowZgdSkKk/Dh+tWuu2RlfDdri0wPMw8Xxr9k3eFmeDdc1bcq6GfSJoC5sogkB
         nqOxrSfdhqRZLRdVHTyJJlPdYpHfZXT76JVY+a9+3TDtVRgsGRfDY9pU0mzXHAbUZOlD
         luPxhGfHoGlLvQ5U/yHk4w5voXlZDfDZBChgljYcU18n2+0yHtPtRRa+klZRdMJya4ym
         fSeWL3CYImGrE0kQ1GD5R3r10TXr9w4PXjhCxPfEGKYuU/CG7E1qXZLNe1dnEboAqUXJ
         g8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734183280; x=1734788080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyVLk3q2sonALF+MqTAOvJbPXZyYdr+nfKYD4flnZbs=;
        b=X0DQMgrx2jRsxTtZi41GjlsC9YVFbz5bu9euTf5PZMunrPykXjJ3VEo7oL4aXTuwk+
         Gal3wcn+VyBduBQDpgHOIFTgWf5+MK+eQZy7y+tKOnbRF1ELbne/Ryq3YI0Z+NsXbQ9t
         94goRD8BW+NPdqNfLCD8naUrs9cdhie/q/BgB+idmwqYSYw8iiadXKRwMV/miM4qT10/
         2hu2d6GRwFJ6TkB9mf+zEWtcblOucUq0Yu+WbR7PFYrXAurK+LSpGrLUsV9l2I9H6bak
         j77iw+G78uH5PmygFU1bZNNmpxL6wrnQe6G/xjmyHF5ypkMwAwUv9pI5/7Zj/GofCH6O
         AYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxtpgnuMH35aoSjU1VWKw4pHm71+weH76yxBAXT2p/v81Vgjhcx060mqj90uWnjcTbgrsdn9H4POY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbBuMlZ6AQE286DNB/GqKuZsxDNIShPkbS1k4CwoFPB7/6dIvq
	FMVfCXYdriUhsdnxue78DPx1tt4Sa29UbYF0eIstWwdhGX6JnXLJ
X-Gm-Gg: ASbGncspsQTIe17US/0rVnhlhSZjA3tLpPfIpk44wfjrcyI7n9p27Qn3xhL/CqbJVbB
	Zytauf+cut3WvPkV20hJkGpDjnKRoCIEXM1QY4Be16nP/0eMxqwZv4I/8dwWw3d6Cn9/ny8fbpy
	5tC0aphDgPn2tBxedV7eZPiRnlRhywzT73yboDZUhSIASU9zny4iLEvT1yRfupTQ0JCiHL8v5rK
	Alwk9i2xCrwDUml6bNQVh8K7Aun32UE8bEAOR4siB5g/Tr3L3NW1rlydrljJFLBUd9uVNUYv9Lz
	4kDgOhxfgyB1jHkfSGvd1dgfuMujzjhsqQtKYFs=
X-Google-Smtp-Source: AGHT+IFcB43eQbOd55geZy0v8dCVFO3Pa1P9Q14CUe7FzNR44RIyTMUupt/vSUqma757csuGwdBAOw==
X-Received: by 2002:a05:6512:2356:b0:540:15b2:fd27 with SMTP id 2adb3069b0e04-5408cee91f9mr2176166e87.7.1734183280346;
        Sat, 14 Dec 2024 05:34:40 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f3basm218913e87.15.2024.12.14.05.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:34:38 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ffsX-utils: Fix integer overflow in jffs2dump.c
Date: Sat, 14 Dec 2024 16:34:53 +0300
Message-Id: <20241214133453.102014-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_053442_557853_73A1410E 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Report of the static analyzer:
Pointer 'path', returned from function 'xstrdup' at jffs2reader.c:690, may be NULL and is dereferenced at jffs2reader.c:692.

Corrections explained:
After calling xstrdup(p), a path == NULL check has been added. This prevents a possible NULL pointer dereference in the event of a memory allocation error.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 jffsX-utils/jffs2reader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index 87a2167..f776466 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -694,6 +694,11 @@ static struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, uint32_t ino,
 
 	pp = path = xstrdup(p);
 
+	if(path == NULL){
+		*inos = 0;
+		return NULL;
+	}
+
 	if (*path == '/') {
 		path++;
 		ino = 1;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
