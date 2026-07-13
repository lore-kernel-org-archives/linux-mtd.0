Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3344DC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 05:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f1cQmLUIKv5qElEbZBkkpSI7Gr0fgs0erdFAv8pSB8I=; b=QJYoNSUKTlFV9Z
	qRnnW8Eky58H/X0Mb2clzoQvmrvMRxUYaSMq50xwM4e7A9H4l1geU8Lb31B0fH3TLk8fyauVvNKDW
	u0QhVByZVqWZk8O3LYeKrmr0SwT26HkPDP3Mu9sUDcNZa7Wldr2WCAm+a/z1PcF6MSd2Pnh1o4cNT
	4JrWp2DZyK5dJlQ01MzLbDj/F9rEyuOxiF7rezH22KTp/R7xKc0KkSUwmKVGqrcDR259aHotuFM2K
	3EVdTlFeW+Tpj5xXZZLdsZSnqNZl/L09BhrlQb1pICvIoE1qAYi9XqJw7CnARlyi2upmZgHKql/xl
	Bg/zck65YyP7PU9tQ9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj97n-000000089Rx-2PBh;
	Mon, 13 Jul 2026 05:22:39 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj97i-000000089Qs-3dNR
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 05:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783920131;
	bh=fM8Q1SD7XfugxOcJgMLQxjpqmZ4SQOJLImfo/tMCzlA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RQzHJEJklgJsNetIRAk63Iq6MonT4XksBMG3i59t/aFxDvoBlzTQmwAooXEy/GvLx
	 xFDag2eidAx/l87DZ/JKMo6Zp8Pm6kGAJZtkEyeOCEa03DdKaGjLGVVyLz9S628LWP
	 s85PTc+quhMjwAbVMnGRiMigpzQRxsjmInGPZ4eY=
X-QQ-mid: zesmtpgz6t1783920126tc35ffb0f
X-QQ-Originating-IP: VPaKhDxv5lrTk04FFn2/VRP/TWvfOBAM+q2sqajFpoE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Jul 2026 13:22:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14185114708170478530
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	stable@vger.kernel.org
Subject: [PATCH] mtd: mtdoops: free page bitmap when the backing MTD is removed
Date: Mon, 13 Jul 2026 13:22:03 +0800
Message-ID: <11D80ECD6F2BBA62+20260713052203.3130998-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M+fRGLN47oKLNN+1WT3o4y7kGNRtG6QWTN1Ahd3yrvE76c6k+8+VOgUX
	DdQn4+oV1tgSIZxRhI0RSP8mG2WUb22HHPh50tEWJY/tYLIpwPWF3pAdITZ6YJIooKBsKrd
	unr8ZBiGxxd1fuD7tmW3mffv5sT1wCitI7lAFBLoH8bQvorsfjfW8DAuEGqcBTrDga/ffl3
	yDcGmbbceavLIeDIhbYLmK1qTj8x7PIkMoL67YHnxy1qai2CuFk81b5mpinHmM7UuFkgI5o
	8VsHLcUELzCYsEUSkn1mcrEDKujRzeh0ZSb2cKqyDvm20D/nb2NwutmH+KAIcpyMiS449Oz
	gRVfdRhC0pOC97nGCUx60Scilgn5LW8pPlY5K3cc++rLPa8UOYByYaFlhz8mn0pa6meEVcp
	0ZxugGq/wrtYu6Ieaei6u99zAsjbLChwtnEiHneHjaL2HJWAFkEPtcqZrxH7l1uvNK9OghB
	0dpr9piaemlqJCv1vkzU0I8dIK8ntKNBtUZz9Gu6KL3lHG93Lkv6r1f6kmrsCRroAXNSJ1z
	KBtUAOvDeAPds5DI3TCbmEPVdHKtCEEqXPBlpufMTqDHSB7LdV7CIL40Wv+QG83vYsO3A0x
	ipZLdpvYEn7gkguyA7WXigmLBgC36NbNhz0TP3uZGMZ0cb7dWR2Cb6uHzp/GpVqLgoToC1F
	lFXXw+iXjo4qHdsrohDZ9qKQiiVv+OQ5FMqiBuFSDyexuZixZNfO8OpztC+TGBLLxXoHvtg
	Qx6hIKj6P6NfJ4hJ8un1bveht+b3d/A92yW5ltn1MR3kdJUNy6rGumrhu94XQGaA70aCNok
	ZeAGr+1v1Up44eiMMYb7t7Peo3HN0e07mn5seXmH9Qo9S0pESVhc4mRasVAsjNL7SqUVOwr
	94HpnKgFCdRPEWQzSDfYsmlwqFAjAU/NJEIZ1qlfj71KkCE8VX2C0W2li6kDCp7KfkRQ/za
	qXvFob5xuMPTjQki8CrmdzLh2ejLfbQYcSNONm+PK0L+PtG1dqgdqux95BMND3HzBVz3Vbk
	BMu1aEyfmTXoGc0NfH+ZmqMMFHXXRAx+vomqHGntxXR2uHHkTo
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_222235_400220_E7F2B13D 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Xu Rao <raoxu@uniontech.com>

mtdoops_notify_add() allocates oops_page_used when the configured MTD
device is registered.  mtdoops_notify_remove() detaches from that device
but leaves the bitmap allocated.  If the same MTD device is later
registered again, the add path allocates a new bitmap and overwrites the
old pointer, leaking one vmalloc allocation per remove/add cycle.

This is only visible when the backing MTD device can disappear and be
registered again while mtdoops remains loaded, so the usual static MTD
case does not expose it.

Free the bitmap after unregistering the dumper and flushing the pending
workers, then clear the pointer and page count before a later attach can
allocate fresh state.  Clearing the pointer also keeps the module exit
path from freeing the same bitmap a second time after a remove event.

Fixes: be95745f0167 ("mtd: mtdoops: keep track of used/unused pages in an array")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/mtd/mtdoops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 39df7ce8f55f..1da7ef06a7a9 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -392,6 +392,9 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 	cxt->mtd = NULL;
 	flush_work(&cxt->work_erase);
 	flush_work(&cxt->work_write);
+	vfree(cxt->oops_page_used);
+	cxt->oops_page_used = NULL;
+	cxt->oops_pages = 0;
 }


--
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
