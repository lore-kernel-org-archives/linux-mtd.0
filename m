Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35E8CFC518
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Nov 2025 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZeyI6QuT6BGCOq6pU/oPg68dV2kcASm0RaRqKITF/SI=; b=kRZ9VXeEGFqHxc
	wMjKkuzhdfYEuf1UKZ8V69uM3ZWrnsZQDBtcbLxpT/YkiCOHr9in8wVpM9mNd5WdoVTi/ihDEcIEA
	5Yc5BQKKmvhpyrepRgifOmJxocy/TwztHUt51tyXdHv8VJkDWqj+RPefo1zI7bjlovkhBqlW9o/pU
	dq1WjxSK9bknMOvh6LZZaOWCYOOPfPEkwn3eueR1E2JOeOUjXbzFxZCRjOf6/9Exsvd+8mwfWUkHb
	Y+PQgbK1hgZTzn63m+wsymMuahe+BKAldyX2SO1f4uXXorFwAfuL56bwnwhASzxcu9jVe35Z6w/bs
	J2C7eYd/EOwcGB5PiDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNEj1-0000000Aboq-3zxs;
	Sun, 23 Nov 2025 18:22:15 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNEiy-0000000AboR-15io
	for linux-mtd@lists.infradead.org;
	Sun, 23 Nov 2025 18:22:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763922127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3J9JjQtfgm8UYDdC2K3YVWzSmm5VOLmlGlWZR4kUgKM=;
	b=n5PUgc53IGZk7rnW45h7xIOX4WjCtu+cu6AagnyTbyCY1bY4GsEmn1VJYa6zBEQMAv2HAp
	+wE2qig8eRx9I/7f9cuRc5rS/h3piqzFC2exF8NdWMsACE4/NxcdXh4MfBgKlCavLu1zLq
	FTEh/MvHTRf+nndQwMdCdM1pqCoVzZY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: sm_ftl: Replace deprecated strncpy with sysfs_emit in sm_attr_show
Date: Sun, 23 Nov 2025 19:21:02 +0100
Message-ID: <20251123182102.548130-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_102213_333886_4D6F50F8 
X-CRM114-Status: UNSURE (   8.81  )
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

strncpy() is deprecated [1] for NUL-terminated destination buffers
because it does not guarantee NUL termination. It also unnecessarily
NUL-pads the destination buffer if the source is shorter. Replace it
with sysfs_emit() using the "%.*s" format specifier and supply the
length 'sm_attr->len' to improve sm_attr_show().

Return the number of characters actually written to 'buf' instead of
'sm_attr->len'.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/mtd/sm_ftl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index abc7b186353f..987d481bf265 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -44,8 +44,7 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 	struct sm_sysfs_attribute *sm_attr =
 		container_of(attr, struct sm_sysfs_attribute, dev_attr);
 
-	strncpy(buf, sm_attr->data, sm_attr->len);
-	return sm_attr->len;
+	return sysfs_emit(buf, "%.*s", sm_attr->len, sm_attr->data);
 }
 
 
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
