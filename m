Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C791CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFkrSoeL2u3TQVb7IOwdRwmsWZqrWeVrGGZ+84ceNUA=; b=pYwfZiQV3U+rgY
	fI6FRIJxeiINNpk8tRxz2j6rc+BhqWv3jSG7QvviPUxf18N+i8ZievUflgwalBJUxWKU8U8VAPRbc
	vgvoD3WL/H2r6Btj/Uy3xtwLUAUkMmuaUblVTe1TVoxs+UHDNykZ3ZHVYX10lRFyvq1OtVe2JhhbJ
	LSgGU1SILU/DAMmTchLhyEsL6+8w3TAvSpdf0RFxMXNK4kcar7d/a0gA9695Odug9hgELlNi40Sk6
	1D0BROV0CFrmlARvKjj+FQmn0f8VadancRx0UCvRqWLluGEW/ebQTbIaXWhHte/VjcqxksRrsqz1i
	/hNkDaIfrf7Q9WFK//eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHC5v-0000000GjFl-0stF;
	Thu, 15 Oct 2026 03:25:27 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHC5m-0000000GjDz-0e9r
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:25:22 +0000
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZTGc826280
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Z3B0
	VzQNULTJNhgjVIKqmL6RGJ59M3Q0Li1pDVIxsTU=; b=Ah4RNaEhbl9bS/ST5C+f
	t1JwEpf+jnHKIY2aDay3u23jIjzsa/hVKdNQnjmlgadGc/EO/3Hv0gxZA7O4l8+U
	S6e7gVeFaHWjI9cKylAMDi8MGpYSTG5XCCphD3vqFHmJFvM2tB8NOhobPHOt5L75
	zRjedtIPYRm61ORlYlr3Y5TZBqi4Eiyzl7OsR+K3f79PPmpb/+MP/pEAy5lEpbfe
	xsVFGZWHkxhV67TG//iZhuKzJ1MBGsvEHRXGTMAI9trBEJbnaOkjtEHZuCNc0ECg
	sDfjzZ0RLdNcr9J7Azl9AnVaMxZt8/BACD6++334s786O0uLNt01RSx+NNn2zz9p
	7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hahdr9s4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:25:17 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535066512b0so133032741cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792034716; x=1792639516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3B0VzQNULTJNhgjVIKqmL6RGJ59M3Q0Li1pDVIxsTU=;
        b=TKQbFkYicBWW8MLHi/aIEd4Ej4hkyd/v1H+8Wr1QGHrYhuiAxGuIqKoVY78DR8yXe6
         zw9vIGOOO3XJzyr4jo9klBIwTwOnwTgTHgPXojmXKprP139Q/dzeZliZrkEa9PJ5SBOI
         ERMx0K1Ey8ABZ0EOSAxqvUnKkAA5VUHMTOvhAznymcIMAIjnP9DXpcW/cjn9l1ozHVp7
         OMwVz749yGRpiE2GUSRBU9tt95E3maXm+xGRpxN+Ifh65oziA2qzuq5n+QWSI+eoEBQe
         hczhEEEccSLo3CDgFzuUUHs05O/Ufp0k94DxGnvZW0tOi6pR1H83UGAyHxeXVPRDfcCW
         tYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034716; x=1792639516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3B0VzQNULTJNhgjVIKqmL6RGJ59M3Q0Li1pDVIxsTU=;
        b=SWiJQB4mQ9E+PuP9NGHG1YMARzYhA7QDgfw/rE0OJiKlGkQHIVyu9X7N4yoJo5VjIj
         1HBboPtRUcZTUuPf4pemF5p1oPHZJhLQXKzCh6KDPNt1iKzJB05zBKKRLL+KpB1mdJ9L
         hjA/gAgr7lBVosL4PvPNPx9T+ZVpfhwO1ho95uYKH+xfBaNqdRjkqVP32SKCeNXodHhm
         U4cYrtmnePnwCE6folGvEEZNa2w94GzcnsT8k0xKqGixlszL23jyY5XRkKB3nhFNx0sk
         W9fJVRZ6HfO9H3U0piG/rXOOQZVc5kGde2lQAUq33EXz4MdWU5tOfakzGXSiyM2ajdL7
         h0IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLiEIHkEx1mtsYmvnL2bkRwNG3/Qs164E8i56z2xX2wh4zPv3sJJ8FY+mW/FCqRpfAQsYlqKi+tps=@lists.infradead.org
X-Gm-Message-State: AFq9FYJlWi2L3yzBMsNW0blYXPzPvOv0TOS9DLj4H8twlPakamG+nUR/
	6ojX/n2O4RjLIdHRSK2ncxEOUdoqDQIxIbq5fdx/+YDD46U9doe2pNgHdwcGVZpSOu8V3esTo4g
	YWSVEKL1yV75QeGe/9gEfA543Ff3cAG+gWLNEF0qtd2R/PCrCjC21ZUdns1oauUo=
X-Gm-Gg: AYBFou2aGJ/KK662+OtlSHBkuLctVduE8qgMRHrse1nTo/0tfc0dOVwB8S2aNlCC6Uv
	FsvoDHQiNP/NUTe2cG2ZmhK4sAp8jLrFTHbrXXjYUe/iDlIyt0Q6/7l62gll6FCL0pKmEqLCndU
	xN8S8oodkviK/jCyIzackgdjsr2TL3xNlXjF1G/8+Ouf+0q61007AQfpJ9+vTaPQaYFn6+DARl0
	n662PlPi0JsABsIoHrEoVubiw9TJT3r+hc070jaw1DC1q//Z4DO7V8O4Oj4YnT1VV0OAXZiFih0
	gCKPIvHbxkg/0NIFE7gF274obEcGY8bNBsd8sQKl938bsYmgMQbUlw2cR6NoMdvGrh6xA5k3JMB
	oNrgNT9RczXpOA23TqA1Dw6FcHkupva6LQrQmZhFlr+7q
X-Received: by 2002:a05:622a:1e1b:b0:532:cebf:489e with SMTP id d75a77b69052e-5359faddf6bmr279562791cf.15.1792034716150;
        Wed, 14 Oct 2026 20:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e1b:b0:532:cebf:489e with SMTP id d75a77b69052e-5359faddf6bmr279562601cf.15.1792034715630;
        Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127bac07sm15022721cf.14.2026.10.14.20.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:24:59 -0400
Subject: [PATCH 2/2] mtd: rawnand: nandsim: stop pre-populating the cache
 file's page cache
MIME-Version: 1.0
Message-Id: <20261014-nandsim-nofs-v1-2-47e49f37e387@columbia.edu>
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
In-Reply-To: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792034707; l=5558;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/F1Xym/plZbo1pfkzzAb8MvFGTETsyWQ9+sr4h1es04=;
 b=8uT6TvQobQiYAqv0rTOpufo+w8rCOigosEixXsjaZzrly9YXH2KdyJoClhTJyWRdlLuSE8XFJ
 GGD0eP8YGxgDakLiOO1H7tqPASyYLOSzLLy2msB9nwH8a7WQEI72fPr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX8JECS+A54Uqz
 /XnAKTSR0Cxuv/nmZHdDYJhH8YrsfigWM+WX3MlCxRVRHR8+iIeJCcCvxg82etOKJ3yMZILPxZR
 XYktpSAots0QcI+xzUnzAKyToxE39t4bpxYlMcEBgdnz/BrYKJ1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfXy7KEPxtpxL/5
 9x+aBk1QwoG1LTxAU808Wgd9pfjjraMxLv2Gd/pIst+tMqc6Tp2470w3UzWmq5sgzEsSn85dKe6
 DGOh+jQoe94EQPO84EpvJWuuPkBTraTU3+bxJwQB+BAiyCvt8fVrTv0jwW6T9+idy5ZK0L3Ydds
 gFPtcX9FBlgoXI1MUH00RLGHDJ/MpUk6PR4l7dS3GPE2xD5ljkgGHHKApvsLm4UsX2ITkgYa2Ks
 XgO3G/TVmWFaIp7/kSxXlPKMXICQnQ5+ZpupGgHWNnewJeShILahXz5IJzlkKh/F0v48eNJBp/8
 Se6lOlh9yOvlfIMDgIUhKKMqkAoo0AG6/9OX8ZNPcdAWsu55Bm/+s7+vM7kCNu0cH/cUSuEPPSj
 KkVRdjVYR/b0RYezRWHzAef1ekNLmMENbQKa7bNX4fr0MqbmFxe0Z0CpJiuaCWdLGHHyjx/2V+1
 oPh+ORN7+hQdPcPkABQ==
X-Proofpoint-ORIG-GUID: hqaFt659xtsBDgICBksn1tWWU1OMOzEl
X-Proofpoint-GUID: hqaFt659xtsBDgICBksn1tWWU1OMOzEl
X-Authority-Analysis: v=2.4 cv=a7KlZkSF c=1 sm=1 tr=0 ts=6ad0479d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=CwNomYb1yIFRST93nhMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=10 spamscore=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 phishscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_202519_055167_7C01B948 
X-CRM114-Status: GOOD (  20.11  )
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
memalloc_nofs_save(), the pre-population no longer buys anything.

Remove it, and the nandsim parameter of the two helpers that only it
needed. This removes the last struct page usage in the driver, and its
last callers of find_get_page() and find_or_create_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 73 +++++-------------------------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 4559df2cfa3c..7de2f584795e 100644
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
 	unsigned int nofs_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	nofs_flag = memalloc_nofs_save();
 	tx = kernel_read(file, buf, count, &pos);
 	memalloc_nofs_restore(nofs_flag);
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
 	unsigned int nofs_flag;
 
-	err = ns_get_pages(ns, file, count, pos);
-	if (err)
-		return err;
 	nofs_flag = memalloc_nofs_save();
 	tx = kernel_write(file, buf, count, &pos);
 	memalloc_nofs_restore(nofs_flag);
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
