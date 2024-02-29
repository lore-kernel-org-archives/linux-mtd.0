Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A31DC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=raDhXUx1Qq4yCm/9+gvrvMMBh8n+DLO5vTGwEh0lYVo=; b=wIIxLuXXtKE6O6
	FEyZOPh+1ctjv1je7M52KnmYBtEsZhpvDkiSTXj4VDrPiF3rUkNxrMwP+M4dKPQqYG1o9VBK0WoNG
	sY5DTVcOKzf8nqj5a/wokGKYwytD3jtBl8yYssR+w+2mZvjcy9jWt6358EGiSRseCVWSrDcyxsd5i
	u0qmBhL/eZi/T4T0hZ4rS2TuDcpr3oJY0YTkrbu9ve7P3D0SyE5ztO2OSS9OaZct8T7HzHO5L6aXI
	rF+0ULG5pHySlaxkv5+vSGQWAr6zUxz/Uf7xSBqA33Y9Ed1R/j8bmQ+OSKuxaASSdnQZoZnXmyK03
	eqVPlkvgtSX1WwDQKTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnG7-0000000F8s7-2osU;
	Thu, 29 Feb 2024 20:44:13 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnFU-0000000F8fb-0VmF
	for linux-mtd@lists.infradead.org;
	Thu, 29 Feb 2024 20:43:29 +0000
Received: from localhost.ispras.ru (unknown [10.10.165.8])
	by mail.ispras.ru (Postfix) with ESMTPSA id 3295940B27A1;
	Thu, 29 Feb 2024 20:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3295940B27A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1709239372;
	bh=eANDFJjcF28TbbY3NAVdjRQJ+bbD85155CR8rqMcY8E=;
	h=From:To:Cc:Subject:Date:From;
	b=SfBEQkleMTQQB8i9ri0DjO6Qh0zDw1x5+QA69r+8BbMw93Gf8bbETFYaG4995ugcW
	 lxfXENFRm1JGJ1peL2XYto6WOYj07fixAqX41BTfoWTSAD/03u4eLrGLcwVomxKABH
	 sU264do6bHhtUbcKqgQjdJfblDDtLGX38dd5fH6E=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] ubi: eba: properly rollback inside self_check_eba
Date: Thu, 29 Feb 2024 23:42:36 +0300
Message-ID: <20240229204237.30453-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_124324_765517_365CDCCC 
X-CRM114-Status: GOOD (  10.43  )
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

In case of a memory allocation failure in the volumes loop we can only
process the already allocated scan_eba and fm_eba array elements on the
error path - others are still uninitialized.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 00abf3041590 ("UBI: Add self_check_eba()")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8d1f0e05892c..6f5eadb1598d 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1557,6 +1557,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 					  GFP_KERNEL);
 		if (!fm_eba[i]) {
 			ret = -ENOMEM;
+			kfree(scan_eba[i]);
 			goto out_free;
 		}
 
@@ -1592,7 +1593,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 	}
 
 out_free:
-	for (i = 0; i < num_volumes; i++) {
+	while (--i >= 0) {
 		if (!ubi->volumes[i])
 			continue;
 
-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
