Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6015C021A6
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=97v65jBauZbTcccoAF/PmmhEuGMer2BRO/j2P0KQK14=; b=W3vSZjquU2Rw9K
	V+hyQDNhMx87KpN2/SymGQH+baWa4mY7PBOEXCpt+rwfy3vR1LIzWATZlTQ9d1lhcMA/do602gPSW
	pGZIXgPZgNUeXoQIT3dGpvAZLkVybMnDKReYzXvK4scoLpAj1v9jkR55j1/kgiBJTCScbiW7nzjPM
	ISAYeF1ZeMFjmXKblxfPKHUozbgRoOD5QjeqL3cxo8kIY1ihsXx+8TTpSnJDDJI4zmQx0L5UgThgP
	tLDJf+8ioHAugzKBMb8fxlJkWTt1+8+ggGEOCTN8LRUlGIcgHqKpoenny0svnjguIAyVP+bN1p5mg
	GIb5dtQl/cHEKIjpDg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYXX-0000000DtaX-2HVC;
	Mon, 24 Feb 2025 13:30:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYXT-0000000DtYb-2CZl
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 13:30:30 +0000
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAAnLAxldLxnkjsEEA--.4476S2;
	Mon, 24 Feb 2025 21:30:17 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	David.Woodhouse@intel.com,
	jarkko.lavinen@nokia.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: Fix potential UAF for mtdswap_dev pointers
Date: Mon, 24 Feb 2025 21:30:07 +0800
Message-Id: <20250224133007.3037357-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnLAxldLxnkjsEEA--.4476S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrtr13trWrGF4ftry7Jrb_yoW8GF1UpF
	Z8CrWay398Jw1fG3ZrAw4DAFyFkw15urW5Gr4rJ3y2vwn5A34fAr90vayY9Fy3KF4DKa4Y
	qrsFqr98Wr1rGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbQVy7UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_053027_921511_A11E4B60 
X-CRM114-Status: UNSURE (   7.34  )
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

In the mtdswap_init(), if the allocations fail, the error handling
path frees d->page_buf, d->eb_data, d->revmap and d->page_data without
setting these pointers to NULL. This could lead to UAF if subsequent
error handling or device reset operations attempt to release these
pointers again.

Set d->page_buf, d->eb_data, d->revmap and d->page_data to NULL
immediately after freeing them to prevent misuse. Release immediately
and set to NULL, adhering to the 'release implies invalid' defensive
programming principle.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: a32159024620 ("mtd: Add mtdswap block driver")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/mtd/mtdswap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 680366616da2..b315dab2a914 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1318,12 +1318,16 @@ static int mtdswap_init(struct mtdswap_dev *d, unsigned int eblocks,
 
 oob_buf_fail:
 	kfree(d->page_buf);
+	d->page_buf = NULL;
 page_buf_fail:
 	vfree(d->eb_data);
+	d->eb_data = NULL;
 eb_data_fail:
 	vfree(d->revmap);
+	d->revmap = NULL;
 revmap_fail:
 	vfree(d->page_data);
+	d->page_data = NULL;
 page_data_fail:
 	printk(KERN_ERR "%s: init failed (%d)\n", MTDSWAP_PREFIX, ret);
 	return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
