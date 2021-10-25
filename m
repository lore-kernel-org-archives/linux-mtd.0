Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFD9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 03:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEAB160230
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 03:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEAB160230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4g3/wVn67xelKfUYAYfqrGjyEITdZjrJFNVIEcBwmo=; b=NJQo5v3LGTrR4H
	GuyWtTVc7WVG/5/CiRuyOA1wSJ3rvx46sx3NOS/OPqTHmBvhXr5uRtR701BB3o5ZJvB+Ku1e+zfaz
	VCVzC8T09zu8B580HyvHAVvgzpjMxYo8fqaJbjVjU+4ZZZZmsGsa6kjGgOhY0o6TwOKLwRQoo/aVp
	ecoJFfczgLq/+PjZwMO2k1SExm9uPv131KJcq+QKDzPiK3eu+7cD+r3QqtEBqIaWDmwcvAwlhvykV
	wYgOKkG5lYFdFlTEHI0RQsyr9JZy7uhtwx5Z7y/JMgiyoxCwpOTVS17vst2OT/fIh6u8b6a7HdqHO
	ZadnK/pQZOhsWAizu77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meqiY-00F90B-W1; Mon, 25 Oct 2021 03:32:11 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meqf3-00F7sm-2Q
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 03:28:35 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hd0jk6kHTzWXwd;
 Mon, 25 Oct 2021 11:26:34 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Mon, 25 Oct 2021 11:28:27 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 25
 Oct 2021 11:28:27 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH 09/11] ubifs: Fix read out-of-bounds in
 ubifs_wbuf_write_nolock()
Date: Mon, 25 Oct 2021 11:41:14 +0800
Message-ID: <20211025034116.3544321-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025034116.3544321-1-chengzhihao1@huawei.com>
References: <20211025034116.3544321-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_202833_677644_38723E88 
X-CRM114-Status: GOOD (  13.30  )
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

Function ubifs_wbuf_write_nolock() may access buf out of bounds in
following process:

ubifs_wbuf_write_nolock():
  aligned_len = ALIGN(len, 8);   // Assume len = 4089, aligned_len = 4096
  if (aligned_len <= wbuf->avail) ... // Not satisfy
  if (wbuf->used) {
    ubifs_leb_write()  // Fill some data in avail wbuf
    len -= wbuf->avail;   // len is still not 8-bytes aligned
    aligned_len -= wbuf->avail;
  }
  n = aligned_len >> c->max_write_shift;
  if (n) {
    n <<= c->max_write_shift;
    err = ubifs_leb_write(c, wbuf->lnum, buf + written,
                          wbuf->offs, n);
    // n > len, read out of bounds less than 8(n-len) bytes
  }

, which can be catched by KASAN:
  =========================================================
  BUG: KASAN: slab-out-of-bounds in ecc_sw_hamming_calculate+0x1dc/0x7d0
  Read of size 4 at addr ffff888105594ff8 by task kworker/u8:4/128
  Workqueue: writeback wb_workfn (flush-ubifs_0_0)
  Call Trace:
    kasan_report.cold+0x81/0x165
    nand_write_page_swecc+0xa9/0x160
    ubifs_leb_write+0xf2/0x1b0 [ubifs]
    ubifs_wbuf_write_nolock+0x421/0x12c0 [ubifs]
    write_head+0xdc/0x1c0 [ubifs]
    ubifs_jnl_write_inode+0x627/0x960 [ubifs]
    wb_workfn+0x8af/0xb80

Function ubifs_wbuf_write_nolock() accepts that parameter 'len' is not 8
bytes aligned, the 'len' represents the true length of buf (which is
allocated in 'ubifs_jnl_xxx', eg. ubifs_jnl_write_inode), so
ubifs_wbuf_write_nolock() must handle the length read from 'buf' carefully
to write leb safely.

Fetch a reproducer in [Link].

Fixes: 1e51764a3c2ac0 ("UBIFS: add new flash file system")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=214785
Reported-by: Chengsong Ke <kechengsong@huawei.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/io.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 00b61dba62b7..b019dd6f7fa0 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -833,16 +833,42 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	 */
 	n = aligned_len >> c->max_write_shift;
 	if (n) {
-		n <<= c->max_write_shift;
+		int m = n - 1;
+
 		dbg_io("write %d bytes to LEB %d:%d", n, wbuf->lnum,
 		       wbuf->offs);
-		err = ubifs_leb_write(c, wbuf->lnum, buf + written,
-				      wbuf->offs, n);
+
+		if (m) {
+			/* '(n-1)<<c->max_write_shift < len' is always true. */
+			m <<= c->max_write_shift;
+			err = ubifs_leb_write(c, wbuf->lnum, buf + written,
+					      wbuf->offs, m);
+			if (err)
+				goto out;
+			wbuf->offs += m;
+			aligned_len -= m;
+			len -= m;
+			written += m;
+		}
+
+		/*
+		 * The non-written len of buf may be less than 'n' because
+		 * parameter 'len' is not 8 bytes aligned, so here we read
+		 * min(len, n) bytes from buf.
+		 */
+		n = 1 << c->max_write_shift;
+		memcpy(wbuf->buf, buf + written, min(len, n));
+		if (n > len) {
+			ubifs_assert(c, n - len < 8);
+			ubifs_pad(c, wbuf->buf + len, n - len);
+		}
+
+		err = ubifs_leb_write(c, wbuf->lnum, wbuf->buf, wbuf->offs, n);
 		if (err)
 			goto out;
 		wbuf->offs += n;
 		aligned_len -= n;
-		len -= n;
+		len -= min(len, n);
 		written += n;
 	}
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
