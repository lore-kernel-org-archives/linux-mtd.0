Return-Path: <SRS0=/21v=2X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD73FC2D0DC
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 12:30:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07BC215A4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 12:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j+K4Kw+b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUSsfVTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07BC215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=61xBJZu40buSuArNFba4QRNC6N6K1xumxL+EHFTJ3T0=; b=j+K
	4Kw+bXsGf9Svi+H6y5dq+xjZplFDeGQEDK0xI7aIltVP5dmAITm71tdv7XqzJfpNqIxutiWhDLIEd
	CV1jXUXAeBRTWafMmTD8kv2UIzffBNKZ1c+7pGT3TMCccPyXaaXIsqj+xaUsMAYKhuOereEpGrhhY
	gFCzEM/R+noiWtLJLlGqW2k4TQ1yj2oBQMpxVYmyDpY3Lv2nQ+bXIPlDcVljS5DNy2KCBt1kWBJgv
	2Jfwe9bieSW5hiZG69K0ZHUivF4eSCAIPkuHBz70JW0xj44Qd9RxKACfykr2aeV8XYrPs/sLg6sVR
	IP8IdmheRs6UJqBchaPKMwk5Kjh3DIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imzbx-0001pv-Ey; Thu, 02 Jan 2020 12:29:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imzbr-0001p5-2L
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2020 12:29:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id t2so39075277wrr.1
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2020 04:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cA+TQSaGTxt5xkD1p6TsF9sSnBcZqg21qSn7PyozrCg=;
 b=DUSsfVTGufuKvgqV80Hxrcz8IAJ/YPFc7UJcVwXNcrOlnZwiNVIv5iu6HK+RB8fL66
 KuhQ3o/sYd1UuyWJk+7Az2+bFrrc9hUPs8MU0V0pigDjZUeenr/BU+tfy62Gxccik1dc
 qjqllv6zhTFwlEXyKapfLsH9g5gd3GKzyYSN6wLpVb+prxWlOVtpMAHtjIqtOKo8m2Qg
 eyz+bGylQ20+rCQh9FOT+evGsoyZADgKEw7KacVNdORLQeOuHe91h4L5C7gppBaJUChy
 w4esiV2Em19+JEkHWQBAO6Ip2oPeDOLpWcD7dUS+CkPuXT0bcQSbGPaVIDONuMceSPSh
 /A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cA+TQSaGTxt5xkD1p6TsF9sSnBcZqg21qSn7PyozrCg=;
 b=KHmCZRIeiiGdgv30DEjrOb1VrBuPj9d1xyQnOkNrnBAeM4/H8PaKZrOPuSWTLgy/7B
 RLZoRQKQirZu6FX/8kd8c4R1k/zvd1h2Ws7EMTZ3A5VDX/Pzkop5+fyHl2FB594qs7yW
 M22pqm8UFFk56pSK4Z+7u8csei25F/kUqsTL+k9UJWP9abkxh7T4SmBt0yDW5Wzh3Vun
 P3GyeoMoyW+CV1U6VmFj/wGBmoBmTRmFGM/AEk2325SSF0CFvZ9JjTNnj/J0ry7x1PdL
 Rdu4tNY95zf10OFXj0V0IjVO2k6Azi6lpw401E/hPelFI6/AuX++SwrNGHoXzU+fQU7g
 gyCw==
X-Gm-Message-State: APjAAAXfFz6zax/ePzKxYinnGQmq9qp0woPq8HD4ckBEgXvcqcA4LPE+
 iGhyIBMTVTFCfuzAnR24Vfk=
X-Google-Smtp-Source: APXvYqxKcQ9mP3w5Unv4wDGAsFl944QhBVqL/Fdgr1Jvi3G6QvE+DyQFUlowthQ66TuJtjhjwil91g==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr77975580wrp.12.1577968189318; 
 Thu, 02 Jan 2020 04:29:49 -0800 (PST)
Received: from paul-Precision-3510.be.softathome.com ([149.6.134.59])
 by smtp.gmail.com with ESMTPSA id b16sm57419391wrj.23.2020.01.02.04.29.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 02 Jan 2020 04:29:48 -0800 (PST)
From: Paul HENRYS <paul.henrysd@gmail.com>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Subject: [PATCH] ubi: Update mean Erase Counter calculation at run-time
Date: Thu,  2 Jan 2020 13:29:00 +0100
Message-Id: <1577968140-11528-1-git-send-email-paul.henrysd@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_042954_710931_C2A9E715 
X-CRM114-Status: GOOD (  15.85  )
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
Cc: linux-mtd@lists.infradead.org, Paul HENRYS <paul.henrysd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mean EC value was only calculated when attaching a UBI device
but not updated afterwards. A new parameter is added to the struct
ubi_device to keep track of the sum of the erase counters of all
eraseblocks for a UBI device while they are erased and potentially
become bad. The mean EC is then calculated on request when reading
the "mean_ec" sysfs file of a UBI device.

Signed-off-by: Paul HENRYS <paul.henrysd@gmail.com>
---
 drivers/mtd/ubi/build.c | 10 ++++++++++
 drivers/mtd/ubi/ubi.h   |  3 ++-
 drivers/mtd/ubi/wl.c    |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d636bbe..3291fa4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -126,6 +126,8 @@ static struct device_attribute dev_volumes_count =
 	__ATTR(volumes_count, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_max_ec =
 	__ATTR(max_ec, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_mean_ec =
+	__ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_reserved_for_bad =
 	__ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_bad_peb_count =
@@ -364,6 +366,13 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi->vol_count - UBI_INT_VOL_COUNT);
 	else if (attr == &dev_max_ec)
 		ret = sprintf(buf, "%d\n", ubi->max_ec);
+	else if (attr == &dev_mean_ec) {
+		/* Calculate mean erase counter */
+		if (ubi->good_peb_count)
+			ubi->mean_ec = div_u64(ubi->ec_sum,
+						ubi->good_peb_count);
+		ret = sprintf(buf, "%d\n", ubi->mean_ec);
+	}
 	else if (attr == &dev_reserved_for_bad)
 		ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
 	else if (attr == &dev_bad_peb_count)
@@ -391,6 +400,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_total_eraseblocks.attr,
 	&dev_volumes_count.attr,
 	&dev_max_ec.attr,
+	&dev_mean_ec.attr,
 	&dev_reserved_for_bad.attr,
 	&dev_bad_peb_count.attr,
 	&dev_max_vol_count.attr,
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 9688b41..d796217 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -472,6 +472,7 @@ struct ubi_debug_info {
  *
  * @max_ec: current highest erase counter value
  * @mean_ec: current mean erase counter value
+ * @ec_sum: a temporary variable used when calculating @mean_ec
  *
  * @global_sqnum: global sequence number
  * @ltree_lock: protects the lock tree and @global_sqnum
@@ -580,8 +581,8 @@ struct ubi_device {
 	struct mutex device_mutex;
 
 	int max_ec;
-	/* Note, mean_ec is not updated run-time - should be fixed */
 	int mean_ec;
+	uint64_t ec_sum;
 
 	/* EBA sub-system's stuff */
 	unsigned long long global_sqnum;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5d77a38..24c47ce 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -442,6 +442,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
 	unsigned long long ec = e->ec;
+	unsigned long long erasecycle;
 
 	dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
 
@@ -458,6 +459,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 		goto out_free;
 
 	ec += err;
+	erasecycle = err;
 	if (ec > UBI_MAX_ERASECOUNTER) {
 		/*
 		 * Erase counter overflow. Upgrade UBI and use 64-bit
@@ -479,6 +481,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 
 	e->ec = ec;
 	spin_lock(&ubi->wl_lock);
+	ubi->ec_sum += erasecycle;
 	if (e->ec > ubi->max_ec)
 		ubi->max_ec = e->ec;
 	spin_unlock(&ubi->wl_lock);
@@ -1164,6 +1167,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	}
 	ubi->bad_peb_count += 1;
 	ubi->good_peb_count -= 1;
+	ubi->ec_sum -= e->ec;
 	ubi_calculate_reserved(ubi);
 	if (available_consumed)
 		ubi_warn(ubi, "no PEBs in the reserved pool, used an available PEB");
@@ -1738,6 +1742,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	mutex_init(&ubi->move_mutex);
 	init_rwsem(&ubi->work_sem);
 	ubi->max_ec = ai->max_ec;
+	ubi->ec_sum = ai->ec_sum;
 	INIT_LIST_HEAD(&ubi->works);
 
 	sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
