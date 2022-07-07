Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD5C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1aC1uqGLmWc5S785fmNxTYMn407jJQhr9A4GVb4ZSYw=; b=hPw0q10scrL9Gi
	52Md8NcQ7/KzP0hRhC2IIPeaPrrSd1LDdyztAXwjsYOSQFTvdEAYd8zQrPU/Zx7uWQyblkHsXT7Rp
	qkmEMYpGIMp2oAYwmlLqWm+DpCuc24shHWJMF+eageJYMqQyvGCL3sOkfWL5rLL2Hqz41sRTxvZXe
	u3VYPWhhCONu/edllHGyTCmE4miXsRbpYmKJe8e/m42tsUK55ac1kQUpI3DP/Th5K137IZS4qlEFW
	ex4rJK/Fsa4eX52N6FbYwlDK5rl3QgH3NVw/h7+Sx3op82JjaANrK+1zsvscKTAL6z/i4IwTcpclh
	4QQliND/FeENiWA66tFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Qei-00G0DX-VZ; Thu, 07 Jul 2022 12:30:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Qee-00G0Cp-LE
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 12:30:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id y9so4840691pff.12
        for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2022 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WpJSj+10jDxel+mpKutSYvc+nWQYQ3afAUsJ/It2YN0=;
        b=nirKL1QWHP36hMwqbfs7j/3M3CnFOdyU/mhq6mjzaNOZVW8BJhiMuFxnDbifijLiv2
         EU6RLfK8UYogFyr6hO57mF6rQ2LcQPznrIJ+WoCCADtotE105rv5ly07PyR/sPehMWpn
         JiDpSPcxYzoGeevzVUxFzoBhc7Es+fnpAWlMTYQhM+9gVj2ErKPIhF7aTQZIvy3L1BkX
         prLdikSsA/noeiCaShNHE0E5dYn2Aa+xzRQPnAaN0n5WGo1ulKGTDVLAiB4vOb8YVk84
         VabbgRlpFN5/hLdDxGunqNQ/DbcICvb+B3MQa/M2pBn8ozzLx5u97X4erW4whBY3ZOlD
         UReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WpJSj+10jDxel+mpKutSYvc+nWQYQ3afAUsJ/It2YN0=;
        b=PaPT0rfDOgvKkUF98xANRECuQKp2BhFvk3hxZbXM+Vtqmyi8BAqX27bBXHCWlU5hv4
         4qPvg7lcht8l92lBJf+POX7TcOx2I5ITd6YiJyTVksIMGy7De/TgMapMdDJ0PggmaSr9
         bHaZPOpaCpXth/6tXJ+40tc4D2EMHiN5/pRNVzuloiDc/ArJ1gPnXAbzv6pL2O+jhhZE
         w6Ex7NklA+fR+rggdYihN2lL8E8yMre+Z7K6F91IPXvL8PwBgdsVzq1BNVWhYQ+eFvST
         xDKVoLAYIeYLGo27Iprg3L9+v3SS5u0owAxW7jcpPbEzbV17EJ9/MVanjDDM4BXskkeY
         ZKGA==
X-Gm-Message-State: AJIora/cbOKiCGZ5BBrhUgg30rToZotHPwO8vwZHUiXp7wT23UWullqr
	lQHrVb0q3sC4W8qRpiNuzUk=
X-Google-Smtp-Source: AGRyM1shHuIiMyP1DQPGo092XN38rExXflU8JvJ88A9rk6HCbBx7m2Zz0/KEEA62b1u3b9+vSTZwFQ==
X-Received: by 2002:a17:90b:48c7:b0:1ef:a692:9593 with SMTP id li7-20020a17090b48c700b001efa6929593mr5010948pjb.184.1657197045039;
        Thu, 07 Jul 2022 05:30:45 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.232])
        by smtp.gmail.com with ESMTPSA id l18-20020a635b52000000b003fba1a97c49sm25884833pgm.61.2022.07.07.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:30:44 -0700 (PDT)
From: Guowei Du <duguoweisz@gmail.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	duguowei <duguowei@xiaomi.com>
Subject: [PATCH] ubifs: sequence each shrink task
Date: Thu,  7 Jul 2022 20:30:33 +0800
Message-Id: <20220707123033.29042-1-duguoweisz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_053048_758113_81402C82 
X-CRM114-Status: GOOD (  19.92  )
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

From: duguowei <duguowei@xiaomi.com>

Because of 'list_move_tail', if two or more tasks are shrinking, there
will be different results for them.

For example:
After the first round, if shrink_run_no of entry equals run_no of task,
task will break directly at the beginning of next round; if they are
not equal, task will continue to shrink until encounter one entry
which has the same number.

It is difficult to confirm the real results of all tasks, so add a lock
to only allow one task to shrink at the same time.

Signed-off-by: duguowei <duguowei@xiaomi.com>
---
 fs/ubifs/shrinker.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
index d00a6f20ac7b..900644ef432d 100644
--- a/fs/ubifs/shrinker.c
+++ b/fs/ubifs/shrinker.c
@@ -42,6 +42,9 @@ static unsigned int shrinker_run_no;
 /* Protects 'ubifs_infos' list */
 DEFINE_SPINLOCK(ubifs_infos_lock);
 
+/* Sequence each shrink task*/
+DEFINE_SPINLOCK(ubifs_shrink_lock);
+
 /* Global clean znode counter (for all mounted UBIFS instances) */
 atomic_long_t ubifs_clean_zn_cnt;
 
@@ -145,13 +148,12 @@ static int shrink_tnc_trees(int nr, int age, int *contention)
 {
 	struct ubifs_info *c;
 	struct list_head *p;
-	unsigned int run_no;
 	int freed = 0;
 
 	spin_lock(&ubifs_infos_lock);
-	do {
-		run_no = ++shrinker_run_no;
-	} while (run_no == 0);
+	shrinker_run_no++;
+	if (shrinker_run_no == 0)
+		shrinker_run_no = 1;
 	/* Iterate over all mounted UBIFS file-systems and try to shrink them */
 	p = ubifs_infos.next;
 	while (p != &ubifs_infos) {
@@ -160,7 +162,7 @@ static int shrink_tnc_trees(int nr, int age, int *contention)
 		 * We move the ones we do to the end of the list, so we stop
 		 * when we see one we have already done.
 		 */
-		if (c->shrinker_run_no == run_no)
+		if (c->shrinker_run_no == shrinker_run_no)
 			break;
 		if (!mutex_trylock(&c->umount_mutex)) {
 			/* Some un-mount is in progress, try next FS */
@@ -183,7 +185,7 @@ static int shrink_tnc_trees(int nr, int age, int *contention)
 		 * OK, now we have TNC locked, the file-system cannot go away -
 		 * it is safe to reap the cache.
 		 */
-		c->shrinker_run_no = run_no;
+		c->shrinker_run_no = shrinker_run_no;
 		freed += shrink_tnc(c, nr, age, contention);
 		mutex_unlock(&c->tnc_mutex);
 		spin_lock(&ubifs_infos_lock);
@@ -283,7 +285,9 @@ unsigned long ubifs_shrink_scan(struct shrinker *shrink,
 	int contention = 0;
 	unsigned long freed;
 	long clean_zn_cnt = atomic_long_read(&ubifs_clean_zn_cnt);
+	int ret = 0;
 
+	spin_lock(&ubifs_shrink_lock);
 	if (!clean_zn_cnt) {
 		/*
 		 * No clean znodes, nothing to reap. All we can do in this case
@@ -293,7 +297,9 @@ unsigned long ubifs_shrink_scan(struct shrinker *shrink,
 		 * later.
 		 */
 		dbg_tnc("no clean znodes, kick a thread");
-		return kick_a_thread();
+		ret = kick_a_thread();
+		spin_unlock(&ubifs_shrink_lock);
+		return ret;
 	}
 
 	freed = shrink_tnc_trees(nr, OLD_ZNODE_AGE, &contention);
@@ -310,10 +316,12 @@ unsigned long ubifs_shrink_scan(struct shrinker *shrink,
 
 	if (!freed && contention) {
 		dbg_tnc("freed nothing, but contention");
+		spin_unlock(&ubifs_shrink_lock);
 		return SHRINK_STOP;
 	}
 
 out:
 	dbg_tnc("%lu znodes were freed, requested %lu", freed, nr);
+	spin_unlock(&ubifs_shrink_lock);
 	return freed;
 }
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
