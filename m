Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732B5CC6B1C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MvkYOsEt+dcvN4psRFyGBKabkgjEbXkN4CVKPbRcwg=; b=POkpMMJ97WvKWt
	j+QuHvxFpGGVCq3kwp1a3guwIoWbtPI099tW4IZgY2SHsQbZ6HLMr4Ia10tsD3aumv4bHnO9QeYdK
	5pgxmOI+ga4ZbO8UNRT34Hmu25I5JdVTwvPrsKTAT3io9xlXzX4FgkqGEwUiXqNPDQbR91o0vSxAy
	Il/GeSVX6p/7OIouw4yetGgGBAzwjphyVA3HK4MT4BLcJ/GHaJBDXhLlpk+bRi8QYjCygrs/tJksi
	I7cpM4YRwzunEZgCmn9WAxC5ItpavIRhRQQnicMCUMZVWQEWd8k4U1JmZkcwIRhzLzKOeLiV1b9PE
	2SNuKNJzsNWlTnOiKuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFW-0000000Gk73-2RPy;
	Thu, 15 Oct 2026 03:35:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFV-0000000Gk5b-2Y9i
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 03:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5wEsnZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=; b=FULg4AOBtzDoFQiudsc94DIStk
	5NoLOwCxHPZgLJbIUi1BI6RkZcWo2g93CfPCG5+QPx5X0yykvI4EXBbEMPKuKwqp+aSLEhJhcx5a9
	sp0qZohIfYYxhluPPY0aKuerKmYnu8J4stPOLoAOgx1nGUosxlv5XngTr+UIMdQQrjB0QUBZzZRwW
	mv3Ibmsa+KhDhem+0qklqOp97s5c4pd7WqYTU/FKutTk+/FBf5SINMKTTtuRYoObemH63xntY2AkP
	z5PJJDvzSBUFCpHUPUlcFz+DGwaaBiVNPue3cbX/2wIafD63vncE45tF848P8+SOTKVPZKvn43J4W
	ad3skBiQ==;
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHCFR-0000000HQGj-2X4j
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:35:20 +0000
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3QVWx055238
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5wEs
	nZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=; b=i5XslI35pX+u4RO+NH0Q
	M/saAxZCph4aKwn1hEiK5MH/FylnSMA6/4ER5fG07V0/vkytBdhyhdrCpeJH2dJo
	9SG3/8+EBlrFmuMv8/SEf+RCTbEMxcSyit8rO5gpGABX4gzrFFlardNdlyf+EZl5
	JbjqSFqhtsUnzfQyI9Lln1ZB+ByMpmLKQJsEAT29VYs8ByOAmW2xgEiXX+Zsoubw
	GnYNOWUR2GSGvH1x4PLe/+FWhhYb6ohr0vzmGLc+4Q/HKo76UBoLzKeVmLmOZpTd
	++qmU5YSRIeBgK6Z9VyKm7U8NaebWBVGrPDRvqWEyMUn7aiwxm2SVt8cB56mfxMe
	cg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hagkhj7gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:15 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b8306ba68so22131766d6.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035315; x=1792640115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wEsnZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=;
        b=lbPgmJohoYobBHFxk4Ibvc2T8KuiXgjpWwPRu4feAVqzS4/vf0GCr1fOgpSLgaNB93
         vBDnZCDKbNAKcL6X3d4RC7q5aIYv4Zee82/DGbHlg0ZejPnkSvcTXQBvtvlSxcd+lUhA
         lUJdxPTPOG9/aRzH9bcK5v2PWEANI3827TlQxGeWUYSfRiiq/n1gn3WC9GU3B1jXek56
         Uxo0zxRiPcLeFK1mcQB/kXU0RdLyNj6wLJzj/J5+VT346xxC4IgPBSF+5oUBRyxyyvGY
         ikU+IxX+I7EYkkGIFD4vQdWfzbgQieSUGQQxC3IYHXucgSybZyAzciLoSu2kRMyhWaw8
         Gb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035315; x=1792640115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wEsnZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=;
        b=JcUCm1404iYHQ5tUTGrQHYTWlU+aLPU6Y/kHN6R2t861JpjIP12axc+0/52y2Y5B3q
         381CcgPU9PW8fehKbtDefemG0w8OZgzLVRetVjiK3l2j5nclgXp3Xy1UKE1QbOPWjT/x
         eAwb2jjgRAUDO2WueZulGKq/O06pSmCkufhT2z4cpT9Yq6OelE/dQnQLV5In6wGQ4OaT
         8pZ2g5gVcyVAzucJmQS5AdXpIVX5/FR/ZC+iCiWas+ol3RNJmQx8uTA57gavBggWumb5
         5esgQmWtzZ1vlx6RGeJgCpYLyiAf+8XhytqOKYazhWAa8tWKIJootKklSwkNlXd0Mz6T
         qlJg==
X-Forwarded-Encrypted: i=1; AKwUvBztK6gi9pdAi7Yl1smoQyQoyg4MCJay/LD6u+rtZU04eEKG7xuQI3UIxy9pjdC9vV3CAh6uZsyX1KQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYK04FkqPoVZVtYcNv0kt31NlFQD95ulGUU1HyURQktjxjq4XWUk
	nT4uLtYTRWuQi+Hcs0fhl43mZZNAeCx9TKhxlTyZRB+yjNE6K7C4kTkcSIhlq3f+dwK236hKdnz
	uLy58BnHppzo7mHFbg4a4oZRB7mS/kDZoTEW0p1OCLynE0MMRSmElJBegjpp0IDw=
X-Gm-Gg: AYBFou1Vm5mQ2fBhc1xL5AmTAlNre2wgH65BOfukiW70uAa59AljqfEtDtknBKrhXcw
	jAux5aE+rLbAayCVS5jKPvh5HKL9Sgo7sJ8ozRvWlvE5kKYYTkGGewyE6VZUmN0daVzk1vpduVE
	T4WjVnpF92VJUkCbNq5NHrFE/chbi70bs6p4VgGjtIyJMeQ9QSxOlzL/MueFP7Psvo+krO/dsvi
	vVEBrFAViIQq7sN20fEy87VMljsg9DddYem93Us2pc6zgzz7XlXOM+IsutU/TakZnobtACjbZpF
	u9U4dO3fxtqksHmJSRYxIkpmFtw9NBwSzkJmhcBBbz2onsmHatzwEQJzpjPLroKCaGfOu4c/lY1
	4n+7l5pv1VTGDGoMgSinAfKtEnpBdFxGc4rdnPxjot5Wr
X-Received: by 2002:ad4:594b:0:b0:912:2d72:c08 with SMTP id 6a1803df08f44-91b554f5ec4mr309505466d6.13.1792035315480;
        Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
X-Received: by 2002:ad4:594b:0:b0:912:2d72:c08 with SMTP id 6a1803df08f44-91b554f5ec4mr309505266d6.13.1792035315084;
        Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:34:56 -0400
Subject: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
MIME-Version: 1.0
Message-Id: <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
In-Reply-To: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=2291;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=w+sv6HzCDt2siaTQzxT+ALfMq9a1wr2zBRTinsSzzLo=;
 b=uTALCie/DfGenDNM1iizTq1GvPwsMazfazwkjLE6MfFgAYOyt44pbfWlvlxmpcDbWa4W6aI6E
 1JB0UtML5xyDm/LaxOcf6/QwzPA3GO/DDplRPZmNUb4aUEVzXRcwbs/
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Upr2pOwB c=1 sm=1 tr=0 ts=6ad049f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=0LsfiDYzd38Z0ysWLZ4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: E0SC8a30h5o9iYIrBP5P1JhiyECNEkzU
X-Proofpoint-GUID: E0SC8a30h5o9iYIrBP5P1JhiyECNEkzU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX47M/UVd+//DC
 o/x6I+PGrBSoLc2jOwDVBNe0/l9LJ9hVhZzepUGoXDQrVtRzS6UlDHIOw/2cvtP+y5d5LfbjdKA
 BPr3WJYAjr7h4rsC2VhntUp/SjVxItrsnfel49MQH//Xavag+3yp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX2qdZXn5GWQqh
 lz8UuKJKPQynBAFjsD/KvfEuyn9KcAYjvOF88ztRHwNdJy58azJWitfk4Tk5zVDx3DhSXJMdNRw
 Ek1PdPb9bN2geYpSTb0ATQ9raM+0eVXxFbGJQ/8Swu1RKGzOZY+1W10nf4V2scxwjvWUPRENbIf
 BkAwQiMkT4vooC6aIoxivvpXiylvN6eBWkbtxVdLKTrIatOk+SNGKxgl2cW4iqdNJlBD+vymj7F
 F7K36pEEkjqoT39D1hL7MoQLFp8mipVCGBqcQAEHRUSOA5MqOnNi8z0pkoas4ckEsXTYuvC0Nx+
 O7qZItW6raltiHpPlW7T04XVqflt8rN21Z97Tc3QROkUyh3M/6sQKn+4MNVHyRu/dJRzVIYr9Xk
 2eCdEDA2uQrW+ZH7KDUt/5ZLrmcefIWk42lO4plcZZV+VwBnQBlAfxRPRHndu0yvnaJKYL30Yn7
 jMPJeVQfPKCh0BeCPlg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=10
 impostorscore=10 clxscore=1015 malwarescore=0 lowpriorityscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_043517_867824_3EA5240C 
X-CRM114-Status: GOOD (  16.82  )
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

Erase through a folio instead of a page, and use memchr_inv() to check
whether a range still needs erasing instead of the open-coded scan.
This removes four hidden compound_head() calls per page, and the last
user of page_read(), so remove that too.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 51 ++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 910669d6bb94..a1d24fef415d 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -47,40 +47,33 @@ struct block2mtd_dev {
 static LIST_HEAD(blkmtd_device_list);
 
 
-static struct page *page_read(struct address_space *mapping, pgoff_t index)
-{
-	return read_mapping_page(mapping, index, NULL);
-}
-
 /* erase a specified part of the device */
 static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 {
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	struct page *page;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int pages = len >> PAGE_SHIFT;
-	u_long *p;
-	u_long *max;
-
-	while (pages) {
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		max = page_address(page) + PAGE_SIZE;
-		for (p=page_address(page); p<max; p++)
-			if (*p != -1UL) {
-				lock_page(page);
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-				balance_dirty_pages_ratelimited(mapping);
-				break;
-			}
+	struct folio *folio;
+	size_t offset, chunk;
+	void *p;
+
+	while (len) {
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+
+		offset = offset_in_folio(folio, to);
+		chunk = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memchr_inv(p, 0xff, chunk)) {
+			folio_lock(folio);
+			memset(p, 0xff, chunk);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
+			balance_dirty_pages_ratelimited(mapping);
+		}
+		folio_put(folio);
 
-		put_page(page);
-		pages--;
-		index++;
+		to += chunk;
+		len -= chunk;
 	}
 	return 0;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
