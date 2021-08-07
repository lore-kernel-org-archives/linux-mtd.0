Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFD7C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83DC561050
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83DC561050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGsLmIxc62nymsZjNrcc+Lc8HpXbj2LiR6cTis05Y/M=; b=IK/3fCALIUPhx1
	GSee+BCBCY0wSN04OjU/GmLpDDpzY6t3Poie4iZ39JAMeB2YsG7zzk3hGWhIwwWEiF/bS53HIGTHz
	vwUTrWB+RJPOzlGyfPHOCJ30eahFmxsLYwUMk6XJNvQdbhLKW1IcHtLC6YSbvXikUC0iM1D1zkxPT
	vLyANPulK/C7SrE2U+cZC7mgFN/RywU2QPV9qZqt6jbWhM4ebmlZVCD6h5MyOVM4f+fri2rsNB2ei
	GznGxGFTDPF69qDxigDb4+1G58SGdM6KAtrOg6/ihYWqgJ+t/rsTAO53skJ7e9E7BhBqHmremYKsA
	WNv+w2dacrNrGUCr2RVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCU9t-00FBjS-UC; Sat, 07 Aug 2021 21:47:09 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCU8U-00FBL9-M2
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:45:45 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 3CBA6C65C5; Sat,  7 Aug 2021 22:45:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372739; bh=rc7BV6tLqXbCZ3fv9Fqcr8k5UAfEn7fWiH7I8n4lLos=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P4v4/fa2P1wNi6gokeKTV+DC4VTc6NvnPQ8VIlP1+lySDU7V/hq26aKXvvGnKI8n2
 Gwe5Lj/xHkU3eDXuvWHPbmwOhd9zKCs/3s4xK8UV2NJEAv4LGj8wd/vZul7bnlDpgr
 9sM/f+c3yQmnL/A0R0hHaYpHm6HSmq1BksA+gmEjPNzGSTZXVlaNLPRjVjYz4wEL/w
 88oaGH3ULFNvdYXmmbVJuzpGlrpnalBUUQT6lEa9k+X1bUdbYCzStC45OKve6jjcKm
 06tdEYaIDkisq05ribhxdizwzP/H0AlV7gAyfTQtmwgVcAG2EKKqVGchHOIUB9zo5C
 l0APpYSRi162Q==
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/5] mtd: rfd_ftl: add discard support
Date: Sat,  7 Aug 2021 22:45:35 +0100
Message-Id: <20210807214538.14484-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210807214538.14484-1-sean@mess.org>
References: <20210807214538.14484-1-sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_144542_949467_16D1787E 
X-CRM114-Status: GOOD (  12.39  )
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

I proposed this change 16 years ago before discard was a feature in
the block layer: https://lwn.net/Articles/162776/

Now that the block layer has discard, we can finally merge this change.

Discard is also known as trim. By implementing discard, both fstrim and
the discard filesystem option can be used.

Implementing discard in the ftl means that when files are removed, there
is less data in the ftl mapping. This means less stuff to move around for
erasing and also less erasing to do; this means improved wear levelling
and improved performance.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 7b243f2b2fa3..7f5f6d247cae 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -705,6 +705,34 @@ static int rfd_ftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *
 	return rc;
 }
 
+static int rfd_ftl_discardsect(struct mtd_blktrans_dev *dev,
+			       unsigned long sector, unsigned int nr_sects)
+{
+	struct partition *part = (struct partition *)dev;
+	u_long addr;
+	int rc;
+
+	while (nr_sects) {
+		if (sector >= part->sector_count)
+			return -EIO;
+
+		addr = part->sector_map[sector];
+
+		if (addr != -1) {
+			rc = mark_sector_deleted(part, addr);
+			if (rc)
+				return rc;
+
+			part->sector_map[sector] = -1;
+		}
+
+		sector++;
+		nr_sects--;
+	}
+
+	return 0;
+}
+
 static int rfd_ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
 	struct partition *part = (struct partition*)dev;
@@ -786,6 +814,7 @@ static struct mtd_blktrans_ops rfd_ftl_tr = {
 
 	.readsect	= rfd_ftl_readsect,
 	.writesect	= rfd_ftl_writesect,
+	.discard	= rfd_ftl_discardsect,
 	.getgeo		= rfd_ftl_getgeo,
 	.add_mtd	= rfd_ftl_add_mtd,
 	.remove_dev	= rfd_ftl_remove_dev,
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
