Return-Path: <SRS0=W5Gy=YQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE43CA9EB6
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 14:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D6A2086D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 14:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MadtYPXk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FL4VXDLo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D6A2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cvVbapXigQ0Z6IAHK1PddbwgtgfECa0jVmPMsvqqYoE=; b=Mad
	tYPXk1RfguVxNzYvgZyuDYU3rFosTGbQqnLgV6H9vb6oi7VQtMatYuK+se67mmP8ZaZjPDySFXHGc
	1IncmAYm63nZ1leBLwkaQAA7Dd/9QnABbOGCawk6vWAu4s0MwvkCSJGyFiTXiZ0ijJoHxiCHi9Y3E
	6nsfUIzu5LiAbzfTD2/swE/DeXmCymCvdpZmtxPt1HOBKakiZH9eEJwmHEeLJGGTfn2QNvhTDXKuY
	09ZoeRtM3upNBUIjlmK9Ghw1VzLzCz4jV6Exhv1QZJTh97tA++JsI9t6w1wlnbPJCIokfvjtzrkom
	JQdaPS/gxitMozmDL15qWWKSitAAEfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNHwN-0007cG-59; Wed, 23 Oct 2019 14:48:47 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNHwJ-0007bn-Ao
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2019 14:48:44 +0000
Received: by mail-oi1-x22b.google.com with SMTP id s5so2202738oie.10
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2019 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xLnC4tgyDoE4OxM8yE8n8T50IQWIyxG9XEity9pmo9M=;
 b=FL4VXDLoIIDCyd6oVhsrQqurRp1VdIFhzM1z9BxMBDXm0OkjPzAY7LJrmCr/y1hTK9
 RAYqAOSUSkIzEohX8BxUNfEd+pnXV2pL+WpglivQuWxi3CUjPbcsctRnZIFFRz++K9yY
 QRkOPBjfapRXBKZuhOtPs1Nh9TfsWH+LhKQhcy8hqejiooJhecIORGJRvgEZMsBFxast
 Upd/gp6a3yX5jFwGrHPylV4MjoocFU7vYCSSyUeQvX6F2yeZoFxFX4LsvYxr2iPBU7S8
 lAuWVOlW/CFuLHNXCZoEXwXDeqttkDF/5wv0EENYgYVKVi1OOFHkStoDmWfMUoNUPPgQ
 0Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xLnC4tgyDoE4OxM8yE8n8T50IQWIyxG9XEity9pmo9M=;
 b=ttnofAXSlRQA4CPi6l44YXcaAsuV+ld+vpMrPLvj6yNteY8gL2IcEhw44tFvIcBWNI
 iGLYw4LOS3bhejdxh6NDv73OrX0Zp6tHN1+KwZ0psQYpFfzkvPsQCiRlOoODyod/W15t
 b/izNm9hyYLXL7bUyWkowZsfjdsMdjjE/1VkzD/rK9D9inhuCBtxJ5R+HEUpMOjGUi0t
 FUth+3yZqzBcKZ2Mq9ytZ/42PTi7W0xUkXVPQRd82QOJnFffwJHBp0UN2vADlGVVyVsf
 2nxkhd+zjwsTIczkdLQeaLjw8MJ1U/Bw5JUTtQJUYNYf2ZcpcyLd5kBWBXKAj6q9U22K
 UUQg==
X-Gm-Message-State: APjAAAWKxascBl+qSKI9Hkb5WVshvUh/3BA/Zoh6pmcTl48Wij/rV95a
 Iirnq5lD2lyebML6UPyQNrLlb6hR
X-Google-Smtp-Source: APXvYqwxcvUFH7TdnDwNxaOITkuhoTTKJ5nD7A+ssPAcKnf7IVyj6VIxgi8BY8XaJGL5RoDofftqcw==
X-Received: by 2002:aca:3846:: with SMTP id f67mr140438oia.71.1571842121551;
 Wed, 23 Oct 2019 07:48:41 -0700 (PDT)
Received: from u48aed0cd04b25c.ant.amazon.com
 (cpe-70-124-158-177.austin.res.rr.com. [70.124.158.177])
 by smtp.googlemail.com with ESMTPSA id l12sm5599734oii.48.2019.10.23.07.48.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Oct 2019 07:48:40 -0700 (PDT)
From: Rob Lee <rdlee.upstream@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: Add mean_ec sysfs node and accounting
Date: Wed, 23 Oct 2019 09:46:56 -0500
Message-Id: <1571842016-30323-1-git-send-email-rdlee.upstream@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_074843_399333_5DD18C17 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: Richard Weinberger <richard@nod.at>, Rob Lee <rdlee.upstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds the necessary runtime accounting to keep mean_ec
up to date as well as code to export mean_ec to sysfs. While
mean_ec already existed as part of the ubi attach structure, it
was currently not exported to sysfs nor is its value update after
device attachment.

From a production device point of view, tracking the overall wear
rate is critical to determine wear lifetime and catching abusive
write behavior to the storage device that may lead to excessive
wear.  The currently available sysfs information, max_ec, has a
rate of change that is somewhat erratic and thus isn't a sufficient
for this purpose.

Signed-off-by: Rob Lee <rdlee.upstream@gmail.com>
---
 drivers/mtd/ubi/attach.c | 2 ++
 drivers/mtd/ubi/build.c  | 5 +++++
 drivers/mtd/ubi/ubi.h    | 2 ++
 drivers/mtd/ubi/wl.c     | 6 ++++++
 4 files changed, 15 insertions(+)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 10b2459..a5af3be 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1596,6 +1596,8 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	ubi->corr_peb_count = ai->corr_peb_count;
 	ubi->max_ec = ai->max_ec;
 	ubi->mean_ec = ai->mean_ec;
+	ubi->ec_count = ai->ec_count;
+	ubi->ec_sum = ai->ec_sum;
 	dbg_gen("max. sequence number:       %llu", ai->max_sqnum);
 
 	err = ubi_read_volume_table(ubi, ai);
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d636bbe..24d48bf 100644
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
@@ -364,6 +366,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi->vol_count - UBI_INT_VOL_COUNT);
 	else if (attr == &dev_max_ec)
 		ret = sprintf(buf, "%d\n", ubi->max_ec);
+	else if (attr == &dev_mean_ec)
+		ret = sprintf(buf, "%d\n", ubi->mean_ec);
 	else if (attr == &dev_reserved_for_bad)
 		ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
 	else if (attr == &dev_bad_peb_count)
@@ -391,6 +395,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_total_eraseblocks.attr,
 	&dev_volumes_count.attr,
 	&dev_max_ec.attr,
+	&dev_mean_ec.attr,
 	&dev_reserved_for_bad.attr,
 	&dev_bad_peb_count.attr,
 	&dev_max_vol_count.attr,
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 721b6aa..e188ace 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -580,6 +580,8 @@ struct ubi_device {
 	int max_ec;
 	/* Note, mean_ec is not updated run-time - should be fixed */
 	int mean_ec;
+	unsigned int ec_count;
+	uint64_t ec_sum;
 
 	/* EBA sub-system's stuff */
 	unsigned long long global_sqnum;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 3fcdefe..a8641a1 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -449,6 +449,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
 	unsigned long long ec = e->ec;
+	int ec_incr;
 
 	dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
 
@@ -465,6 +466,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 		goto out_free;
 
 	ec += err;
+	ec_incr = err;
 	if (ec > UBI_MAX_ERASECOUNTER) {
 		/*
 		 * Erase counter overflow. Upgrade UBI and use 64-bit
@@ -486,6 +488,10 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 
 	e->ec = ec;
 	spin_lock(&ubi->wl_lock);
+	ubi->ec_sum += ec_incr;
+	if (likely(ubi->ec_count))
+		ubi->mean_ec = div_u64(ubi->ec_sum, ubi->ec_count);
+
 	if (e->ec > ubi->max_ec)
 		ubi->max_ec = e->ec;
 	spin_unlock(&ubi->wl_lock);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
