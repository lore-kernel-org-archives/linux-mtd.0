Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB8CCF2C3
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bskZfb3IWyXrHHG9olidT4jjlkzD1ML03zSF6ZXJp4M=; b=DoelhIj7VHAK72
	H3CVDBsC5/I0dup+P9mq5H2pDKIV66DREkachjbM4pj7nCXoCB612TNZ/60tcFQWlAQFYsMTJrlun
	pmIo4XtssGPe0wl2OVxEKtApR9ttb4xgfdmfMtMtlrbvL3BcuquRSmb+nQ2tt3P+bp1AL2Zy2+Lrk
	lk70TeZVu0gfSanRaYQFQm7A8EBlo+rzVVBt8UM/qiIX35zuwTTYhNZVc/sljXqIuNVhNMcAKv1F6
	msnAgQaRo9ILjNGyZnqkCj7z3RQjrhML+npFov+bHLxGvlLcs59uSMJuht9DM20GUmuJy9TkBuPmk
	Cw8FLw8ot/gEfH6iaFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmiW-00000003g83-08Oe;
	Fri, 16 Oct 2026 18:31:44 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmiR-00000003g6Y-1h5G
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 18:31:42 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GI0Nri1250962
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=O8eL
	C8DAH1u/wzn7V277vG0eEMWSE8tpiIZ8joadYhU=; b=b+xbGtwv3JbekXUySiWx
	AGkKgYse6CxobVwBFmZjXuoXjZmV2QKoxTTjo514IOTb7EYpf6lG64xDUmJzcgiG
	Rq/z8ke+bnUUewPWFHrUQ3hmKYCWHL6QSPkkdwGEHIseK94vQl/OoB953CLrAqNN
	n0hf+bDuqsMnmpkK+S8jh8mQKrw8LfwtRkF97L0QSRNSCRmkkCB1JDeX9u4aOyzM
	3EpJpYDry/MhdoARibp8lzhommFoXfCIt/y9Q5GLlrK1ggL0ndfSRpzCaiVdpFc0
	Fa9wc9yDKiX7J4sa8jPlPPDELdL6U6qjyKrxwciavLaiSqtrYC4gYTBGh+IM/jNh
	Lw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbrtt8g4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:31:37 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106fce784dso5461236d6.2
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792175497; x=1792780297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8eLC8DAH1u/wzn7V277vG0eEMWSE8tpiIZ8joadYhU=;
        b=ixwIwy01r3qc2cASTwkqK7TP/UuYFLeG8fQRSL0OMq9uxmdIz8uQ8fMdOpOLRLAlHg
         lSb/GPxrG1twvqJ54w4Bq/EkELQV/7nL8Q4W03bxY+gMsrMh8BD9r2yluGG6NfJb+lDj
         H52W4BXXQ2VxL15LjT+HJr3BGIakh0DSsEZ/Nz4yuuuvZyARBQKTpYJqaPxBJyEjvc2i
         02KPtfiSLGvou4H5jA6NAiEru/fuWV8VOgyNI3lXB/3DT9Vs5olRxK7LNkWcYpKC5M8X
         gVahJxQtiCtUqRuV8YpiCPNzQ59D+DDFuyDp0ERBc7JSWxDrZRzbnU1GoiwVJr+Wil4z
         jfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175497; x=1792780297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8eLC8DAH1u/wzn7V277vG0eEMWSE8tpiIZ8joadYhU=;
        b=L4sGGu15pM3SI25X3v6P5RI1qdub5fnkEseqI29TCf7shdbDMedvgV7kxcwwnJdIac
         +/+CzQe9N50WNn72h9Rs26JEOKIP4krvEqF+7n89BE1cuhnLz7YOZH92m+SJb+tc5o4M
         cmNL5ivZIX51API/GD2BCOLgFk237lexqyrtKAXvyoJEqDNXUOpmy5/+40prtWnqT8YQ
         rJWqEuY8YXe3NRfSlKcxzM831dAR8+7eXZT8zOMUsFngtb/u17IUJS5I/Q97YsxELDPk
         7hUsYoEPK7xZ11gvW8Jkor3JHd03oipNPnWRhzPutLX6JgaZn7dw4ACyKwZ3OGwDyGMm
         zVZA==
X-Forwarded-Encrypted: i=1; AKwUvBxQW494Wlc0m0B7eAL+uuV6uSPKhTTbYCekPzART19mPylPqr53pb/hO11+FBq8eLlW52PEujaG8a0=@lists.infradead.org
X-Gm-Message-State: AFq9FYLx2iLKWZfY1BP/9FIY6ytbcXB+++ox5a2l80PKHKY9ds63f6Io
	CqeZTxxl1hpeGal5ZG60R3yMF1bCTrI0/4zbL31tGLNeREjPfqseOik+L69r+29wF5LlBw3m6y3
	rS849Bo11y18StQjIuvmFUzbGfp2dz125yO9efJYJ59pHdq3Rf44oJ+giw9vJTJ4=
X-Gm-Gg: AYBFou1OU5tm+izSOZg5Oi+cbL6M0+w4rAsfpRNm64w2uZ0+nZ0zRpu0wIMrEvCsVa8
	N1ml3FpWaeZ9O7CieJg2aVVHoBgMI2/9shnr7KFDud6i3B7+N7Na1sgcrKzY2zeNeQzcBpmY8/e
	Ks60PHpVgu/Hg5CFrpab1AsJPCkYJseMttdZtiZgyojuPBMIHq3auFEW05JjlmiajNLzcD1h7Qs
	z3FzhUNBz8VG2+RBR6OBfiUsC1Kd3A35pssE1ituqch3eH4/IQnvnOlnqQIQT9FGJqpMy8Ws9OS
	5iEeYxRpn5HJpsrq0qEGM0KD1HUJ704MHseB5nHrLdbPu8U/ExWM8dHNAPwBWMqbJ+Na2isgomI
	f+JUyF73Hf2Q0B/EXomoOjyjApsbdQK2I3ZnKd9qvHHRA6/Q=
X-Received: by 2002:a05:622a:c85:b0:535:a5fb:644b with SMTP id d75a77b69052e-536460f7150mr5637071cf.69.1792175497126;
        Fri, 16 Oct 2026 11:31:37 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:535:a5fb:644b with SMTP id d75a77b69052e-536460f7150mr5636471cf.69.1792175496631;
        Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb30509sm29187696d6.36.2026.10.16.11.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 14:31:20 -0400
Subject: [PATCH v2 2/2] mtd: rawnand: nandsim: stop pre-populating the
 cache file's page cache
MIME-Version: 1.0
Message-Id: <20261016-nandsim-nofs-v2-2-f705c8819d11@columbia.edu>
References: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
In-Reply-To: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792175493; l=5558;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=XTm4Qvoor35FUd7u0ZYHFCtCOMIvIwCMsY0IIsQzD0k=;
 b=nhAk4Hp+snp2ongccKLDRV9YzotpC2vYEwTYWbMVB0XTreCHbsmDqIO0FgAQtr+UE3hpUzEwp
 2Xm8MB9yNZZBsPRqM4RFXrPhtOcnyYa4fRObTomUMrx7s2U9u47JERz
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX84XfwC6rPWbe
 m+CQMTdL8eN7MPWafu3i1oaCd7qgslaFtLTyY4kxjcnmH4q4GxSuwAVgqK45LSgVwSpj9FQbXxd
 I+xJ0rksaU1min0UqvUHz2ouYIw8xO05GaEVu/oVKFUlBjhRXmzg6H+ry6bA/ygd/iNehIPExe2
 +ZBrIFWpaTdJ20h7KDxzWl4YGZGTYrB0uwnPTm3hehioSZOzTT+hZpr9tGHRZ0XQBhy9S4wK1ot
 QAiUCyHD5EfvrszTFh35mkGa5AyUjxC1SZyg+GJPO06atAMqvxEhe3OZ9bO7Az9J/0rdoiBOUPu
 V9lUy4INnIAZIOTpPhA0R/f6UmZFBBHq4ObtCWxlWdeqwlUoD9L+qgXea9Das/Z5lqcEa3OSeW8
 /nBGoEMrwxOG8uGnp4kLRjhWTd55dAsaZ/r8dQZ3RMA09K9daC9rRtQPKpxUnk+2ZGnVDL1kwJl
 mvauq6/GgKEDA8M2C6w==
X-Proofpoint-GUID: 8kBIBqFWHtqD8umQtJKWpF1HnyATCVD5
X-Authority-Analysis: v=2.4 cv=e8GT2qp/ c=1 sm=1 tr=0 ts=6ad26d89 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=CwNomYb1yIFRST93nhMA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 8kBIBqFWHtqD8umQtJKWpF1HnyATCVD5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX/PAmF+arz5oq
 tQw/QugD5yrQDfQK/sTxt5ublphWbH+YWIw0lyXtHghEkkRJOiic7NGB9OtMxNbPfFD0pzf0cyp
 NXRcBwwWl8sKNukTEdTt5IFjQgDiz+zcmj413Vh4g3hjIfUsAPBE
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=10 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113139_569805_B3592D5B 
X-CRM114-Status: GOOD (  19.05  )
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

ns_get_pages() grabs the page cache pages for a cache file access
ahead of the read or write so that kernel_read() and kernel_write()
find them and don't allocate on their own. Now that the I/O runs under
memalloc_noio_save(), the pre-population no longer buys anything.

Remove it, and the nandsim parameter of the two helpers that only it
needed. This removes the last struct page usage in the driver, and its
last callers of find_get_page() and find_or_create_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 73 +++++-------------------------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 586f4622b59e..0a2a37619389 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -30,7 +30,6 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/fs.h>
-#include <linux/pagemap.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
 
@@ -272,9 +271,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
  */
 #define NS_MAX_PREVSTATES 1
 
-/* Maximum page cache pages needed to read or write a NAND page to the cache_file */
-#define NS_MAX_HELD_PAGES 16
-
 /*
  * A union to represent flash memory contents and flash buffer.
  */
@@ -353,8 +349,6 @@ struct nandsim {
 	struct file *cfile; /* Open file */
 	unsigned long *pages_written; /* Which pages have been written */
 	void *file_buf;
-	struct page *held_pages[NS_MAX_HELD_PAGES];
-	int held_cnt;
 
 	/* debugfs entry */
 	struct dentry *dent;
@@ -1297,77 +1291,27 @@ static int ns_find_operation(struct nandsim *ns, uint32_t flag)
 	return -1;
 }
 
-static void ns_put_pages(struct nandsim *ns)
-{
-	int i;
-
-	for (i = 0; i < ns->held_cnt; i++)
-		put_page(ns->held_pages[i]);
-}
-
-/* Get page cache pages in advance to provide NOFS memory allocation */
-static int ns_get_pages(struct nandsim *ns, struct file *file, size_t count,
-			loff_t pos)
-{
-	pgoff_t index, start_index, end_index;
-	struct page *page;
-	struct address_space *mapping = file->f_mapping;
-
-	start_index = pos >> PAGE_SHIFT;
-	end_index = (pos + count - 1) >> PAGE_SHIFT;
-	if (end_index - start_index + 1 > NS_MAX_HELD_PAGES)
-		return -EINVAL;
-	ns->held_cnt = 0;
-	for (index = start_index; index <= end_index; index++) {
-		page = find_get_page(mapping, index);
-		if (page == NULL) {
-			page = find_or_create_page(mapping, index, GFP_NOFS);
-			if (page == NULL) {
-				write_inode_now(mapping->host, 1);
-				page = find_or_create_page(mapping, index, GFP_NOFS);
-			}
-			if (page == NULL) {
-				ns_put_pages(ns);
-				return -ENOMEM;
-			}
-			unlock_page(page);
-		}
-		ns->held_pages[ns->held_cnt++] = page;
-	}
-	return 0;
-}
-
-static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
-			    size_t count, loff_t pos)
+static ssize_t ns_read_file(struct file *file, void *buf, size_t count,
+			    loff_t pos)
 {
 	ssize_t tx;
-	int err;
 	unsigned int noio_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	noio_flag = memalloc_noio_save();
 	tx = kernel_read(file, buf, count, &pos);
 	memalloc_noio_restore(noio_flag);
-	ns_put_pages(ns);
 	return tx;
 }
 
-static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
-			     size_t count, loff_t pos)
+static ssize_t ns_write_file(struct file *file, void *buf, size_t count,
+			     loff_t pos)
 {
 	ssize_t tx;
-	int err;
 	unsigned int noio_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	noio_flag = memalloc_noio_save();
 	tx = kernel_write(file, buf, count, &pos);
 	memalloc_noio_restore(noio_flag);
-	ns_put_pages(ns);
 	return tx;
 }
 
@@ -1436,8 +1380,7 @@ static void ns_read_page(struct nandsim *ns, int num)
 			if (ns_do_read_error(ns, num))
 				return;
 			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-			tx = ns_read_file(ns, ns->cfile, ns->buf.byte, num,
-					  pos);
+			tx = ns_read_file(ns->cfile, ns->buf.byte, num, pos);
 			if (tx != num) {
 				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return;
@@ -1511,7 +1454,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
 		} else {
 			all = 0;
-			tx = ns_read_file(ns, ns->cfile, pg_off, num, off);
+			tx = ns_read_file(ns->cfile, pg_off, num, off);
 			if (tx != num) {
 				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;
@@ -1521,7 +1464,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 			pg_off[i] &= ns->buf.byte[i];
 		if (all) {
 			loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
-			tx = ns_write_file(ns, ns->cfile, ns->file_buf,
+			tx = ns_write_file(ns->cfile, ns->file_buf,
 					   ns->geom.pgszoob, pos);
 			if (tx != ns->geom.pgszoob) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
@@ -1529,7 +1472,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 			}
 			__set_bit(ns->regs.row, ns->pages_written);
 		} else {
-			tx = ns_write_file(ns, ns->cfile, pg_off, num, off);
+			tx = ns_write_file(ns->cfile, pg_off, num, off);
 			if (tx != num) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
