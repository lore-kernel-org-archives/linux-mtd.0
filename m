Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12851CCF2C7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmhVs4j5yih4R+b0ebI1S5icKHQVc7ittqRd2JrtqMM=; b=Cq0PR6dfOQRKd0
	lhDLysmzFOaBWdELTD/JrLzYWRLufcebOSZQsUqPCkd+m5DS1rEeR6SW0WosbACEHs4xnd71RFJFo
	vAdmb2OiE873zyyrZb08wWfKJjTxM39ZDF30qY8H1DQlsi2gY4EukSVSdflVGqSIV+mMizNBqtlaD
	ymPkYdXKvuX++JnmFpsrTkuBrqlVfn2pGybOEB9Sx1IQlWPqActzDMl6yoEFJEp/4XyQD8aFMa3+T
	bkbyknIP2jpY9ox7tBI+4jrp8zUk+V12qUXJifXEbU8ZwXmeqBHWub5w3/qghGJ98D7RX3vPIA7+U
	sKHM6KpqbE4Xv75tyQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL6-00000003peT-2UpX;
	Fri, 16 Oct 2026 19:11:36 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnL1-00000003pbC-1gGt
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 19:11:33 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIbvxK1352633
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7reK
	9IL0rKrZfnHUnNNVAKzIpY5gnM5qXSoGxoG9+30=; b=WjqVHEjDkmJ1z0teN4Fy
	EqYaeVYeFzWBTxFYSGO9XJV1uUQ0Q/Ny7TpGhU83y3tyYpF7St8Esva1cDu3Oep+
	P0kAZReRm6p0ci0LkajWfFU3RMDa3B8z0u4goWagoBfasP4loqaYQVFS56hodDVH
	p1KpaN5PBAm3XiF1yoZlc9eCZrhjiiacnClC0uZhNb66RqPMVF0e7petx8B828c0
	axsC30iPKB+ojHb84jqupuGYcxN3/P/RJ3RT/U9yAa/Sh0SO/fpTmy4ptbPkLumw
	PJNtVb2b5AfdWR39xKIVOYktSsE/vzZW6BCwyaB9+VIAzlEQW5QZdrD6W16x/F6J
	HQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbrtt8uhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 15:11:30 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b92acedd9so8535556d6.2
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177889; x=1792782689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7reK9IL0rKrZfnHUnNNVAKzIpY5gnM5qXSoGxoG9+30=;
        b=5p17D48KQEAu1rjgVcRDVJub+rGPqsOsiiHUcKLcaNh+i5FjTm85KN0ck+yGDQPqfU
         4FNnVrgB+VRlrdhd9LcuYdLIRYdXk8j5FOZHS6mp8i5IXayiykQEMbKQbp2ZS8oy1bi6
         Asu6x7Sc4t176nmm+XX3QfCUJJ5AinUQur9vCF30XSCSnvxNc0TxUpJXZtdY2D7JUHZz
         ozmBzT5srg8+ClNlqE1yDj3vb7nFf2ShWP7qPqGnehQZJae9AwsOHCQHUn8Rl/jhaXEO
         waHC2o60+F6ANryZqvLp5kuccavArrDsQ8b+Hzi2wQhuitc+8Gc1r8+gfiKcSA+aKaTV
         hXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177889; x=1792782689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7reK9IL0rKrZfnHUnNNVAKzIpY5gnM5qXSoGxoG9+30=;
        b=DYxjtPk23UO9Z21rTOUH/vBirDVBJjVt3wQVgaH2iYduWuSsHTBee+ScZbRSYWoVpa
         NfkEtdTKL615F7GgsFwwy/KPjVogQdb0qMPUF9k6BkAunLBj+YVNdGrVU+pPT4aeVzWv
         Jww51wIUTwM/HtvPQTmRJ6Ux7ZM1TFRo5Lg8ka8XuoaDkPxpz69EYoZwAXtxsnefLUSw
         awjHJjdMOxqgvXK3WVaS97pUGJ5wUw7XH0xJJc/M4aYGIr4ec8Eb+NWcuH/0Ymun0Wu8
         PCxFi/Uj6NsMIeplOF/liIk3LGkWgrsEfZuhBtH7NVbyYcKhiKdEkB9XGDZvN67g9UTF
         TdXw==
X-Forwarded-Encrypted: i=1; AKwUvBwCXrGw7O7pC2KxjH3jEnzTfDqaCSgBSdsILWhK50YrV+TGnfXsmjXTn8CXirx2YABru73vGJbnF+s=@lists.infradead.org
X-Gm-Message-State: AFq9FYJpKGne5O5yp5HtwnqvVLfwNLk29ajXNJ+RnrwtrNpw9jgVN3bE
	kEpBjarZdp7qE2L6NOCmwnee2V5xUa2f03QrRkf3IeAXuW8xz96cSvxrQDxbJIWIFt+MejVXfOQ
	INr4paerx900jbdk+5zOrHly4SelS1fXdey3GUoPflhCiBANXitoupXYu6cbT+44=
X-Gm-Gg: AYBFou2F0KPzFvahVZ4U+jDe5gOhVaB5bwMXpU2/7VrIy6zQ3p9kAb3lTTm6hdXOT97
	K/MfB6cBfFI2EaCIRhLPKyzRiWbssJzfhO6dz0ZqifrCYqKDL+I3vR7QDVS58g0ZjeLMfIg+RF6
	y5Ce/HWI9tHC9cJz8CumF3t27cbn5PgZW4oT6f9xwbChQvNhY5cvY94dN0R+0prmSm3FmArx4kZ
	mdq58rZelH5x/jeCjsNGmrXRHGhdMOkKhuBJFap6DtrpLQ884Xu4xXiG5b3NonQlzY07o6Lbegf
	lFaGChBlED1PbPU6TxWLMjj+l139wosNbob0xNCxfMU03+gcJtXBqafgewkxBHHK6V77Zj4zg1/
	M7sdVRH7yOKv7CtahQJsO8aJLoAIEHwqUaN3dnPCzdixwk2U=
X-Received: by 2002:a05:6214:23c5:b0:91b:5d39:e13c with SMTP id 6a1803df08f44-91bdf40b4b9mr16382456d6.49.1792177889436;
        Fri, 16 Oct 2026 12:11:29 -0700 (PDT)
X-Received: by 2002:a05:6214:23c5:b0:91b:5d39:e13c with SMTP id 6a1803df08f44-91bdf40b4b9mr16381966d6.49.1792177888882;
        Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:09 -0400
Subject: [PATCH v2 3/4] mtd: block2mtd: convert _block2mtd_write() to
 folios
MIME-Version: 1.0
Message-Id: <20261016-block2mtd-folio-v2-3-8280c99e55c0@columbia.edu>
References: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
In-Reply-To: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=2375;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ba6wHdZ5jYtlG/mAQ6lUyzY39YTkKcDwucFfXseGkDA=;
 b=otjLd6vj5+MsD2V71nWTN0O8k7Hhigk7YWwxYtShsgly8SVD8WEOLC5AuUcgUEWZRn9OanRQq
 /fpsEWofJeTDX6VhUYnJjj4cbRwPKhJMyuiHbhzMKRgJRv0Axtxv2kG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX623fXADjn6/H
 p963Y/lBLYQDmWvkt01ppoXwzZ1Xsec4eXkjP8e0Jp4QXcg86oeNQPq86Rsbx3eSbWIjdfAHw+4
 oG3lWus3g+yFlbaD+3w0w8DqrnTVVCFDYFoCPpgNQbsHaxSDcST2J/FP858+Wfwe4gnv10zyyTM
 l/cpDLKoFR76WmJlV7+TXk5UaEZPyYGMQHuUXcPHzy5Taox/eIKiu4Zq8yk2nk9g2pnI27yGMNq
 l/sgWfcL19LSq6LUmqnhP0IRGVMUOZycGnrmV4DZALPVDJMfS0EBS61pLMb+w0chhnuZ1tw9Cik
 1cooE5AZViGgAUolZry7CzWADbBscbMkgu1zHpuJx6SED4beWyVAqOJ0rqhkmQiLQa1SMIVkFsU
 0quRkU/5yDmJQhJQqGMtMXN8IZHTsdXNJwwTvtoGK045MCGmO3u6FaLR8coiUN/IDoqkurgAoU4
 WfChEREhfe0lWCKn/YQ==
X-Proofpoint-GUID: rVTC5frZnYU53sllUcQEmcnFKSxW5Gea
X-Authority-Analysis: v=2.4 cv=e8GT2qp/ c=1 sm=1 tr=0 ts=6ad276e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=qqL285nydZm1SHY3jKwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: rVTC5frZnYU53sllUcQEmcnFKSxW5Gea
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfXx/IW13TzencE
 twiRHM2qzLshMHFYGKtzq+VtVgiJmUrwkBo648zH+ZXxWOUNWE6RZx+Ruw/LlkQsI7MGOOiz7XD
 J5w3cvesDC2BPWY/ucSruBlsPZcYGD+sDMBZFIQoyleaJzOgHoUQ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=10 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_121131_773416_EE31766E 
X-CRM114-Status: GOOD (  15.23  )
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

Write through a folio instead of a page, looking it up with
read_mapping_folio() instead of page_read(). This removes four hidden
compound_head() calls per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 48 ++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index db5472c6b8c2..acfd3754c2b3 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -139,44 +139,38 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 		loff_t to, size_t len, size_t *retlen)
 {
-	struct page *page;
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int offset = to & ~PAGE_MASK;	// page offset
-	int cpylen;
+	struct folio *folio;
+	size_t offset, cpylen;
+	void *p;
 
 	while (len) {
-		if ((offset+len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;			// this page
-		len = len - cpylen;
-
-retry:
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		if (memcmp(page_address(page)+offset, buf, cpylen)) {
-			lock_page(page);
-			if (page_folio(page)->mapping != mapping) {
-				unlock_page(page);
-				put_page(page);
-				goto retry;
+		offset = offset_in_folio(folio, to);
+		cpylen = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memcmp(p, buf, cpylen)) {
+			folio_lock(folio);
+			if (folio->mapping != mapping) {
+				folio_unlock(folio);
+				folio_put(folio);
+				continue;
 			}
-			memcpy(page_address(page) + offset, buf, cpylen);
-			set_page_dirty(page);
-			unlock_page(page);
+			memcpy(p, buf, cpylen);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
 			balance_dirty_pages_ratelimited(mapping);
 		}
-		put_page(page);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
-
 		buf += cpylen;
-		offset = 0;
-		index++;
+		to += cpylen;
+		len -= cpylen;
 	}
 	return 0;
 }

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
