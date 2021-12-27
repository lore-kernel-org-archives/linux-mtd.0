Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCFAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 03:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4g3/wVn67xelKfUYAYfqrGjyEITdZjrJFNVIEcBwmo=; b=txufsKBaHlRBJr
	/y8rvFHPPZ0E1t2QHteZmaHrGmn7GhszJSOWk7I4SFZRLbLie5eK44eW6N8AsH24mxOoPSaYaaf/T
	uKuoLWdXFVy7W1YlBGojkMX15Zye2+Rt+v/LracU6OrHIE9dPeUc9vb1IKlBT5Plm5FTC72kiKNm3
	iF6IIKuStEif9rETkcF5XBMki7ZfZfdIcj8OE3GPHWH1K1UzWaxGDhYt4UZeb0hukvQW0mQkV0b3v
	XeU6XNtYiB8/zEDKpPSHgf3tOYdh/2EstpDbAvjN+14WDTsChR9YG/AQyWKXLC0rro5wC/iGoeqWf
	AYNW1fsfHjB1bFmfrArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1gVW-00G5Mx-Mw; Mon, 27 Dec 2021 03:17:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1gQm-00G3ym-Fx
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 03:12:17 +0000
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JMjNy3Mfpz91vN;
 Mon, 27 Dec 2021 11:11:14 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 11:12:08 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 27 Dec
 2021 11:12:07 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 09/15] ubifs: Fix read out-of-bounds in
 ubifs_wbuf_write_nolock()
Date: Mon, 27 Dec 2021 11:22:40 +0800
Message-ID: <20211227032246.2886878-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211227032246.2886878-1-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_191212_924133_40F867C4 
X-CRM114-Status: GOOD (  12.30  )
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
