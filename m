Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F48CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=99a7SipNck0Pfa0eK4r6LgYSpYnoN0Mv2td6QI7Dotg=; b=XO7
	3DMdf9Eu95DlWrvr7fsV0ta1K7N3Ci1dW2aRN/Kb4v1crSI3eVfwRKtld5LwsPRfdtZiJ38oRWSir
	jQ0uVFjnuiWjH9hbyC0PSgH+PvDY98BNpn1JzioyxaTOTczeG2PtWqq4BrmopTn9lxY2D3/tL0/yH
	BpV5bDkkHcztmJXaeTUCmIfZ8oRPyqlNe7FACNEjNEsbDvOfo8aGXJrlok7XrdGXVZCuSrdZx/YdH
	UHPYYY76Ax5kfYdw1CYYYK9BjHN3C/xCCXRZDVFMEWNbdiPKelAdc6S89YicYCauj8HS/74yFCS27
	wRFiJtyKov2BdL0mIwmy0PYzuBlfuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo04a-00000007WPD-478O;
	Mon, 18 Aug 2025 13:38:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvWY-00000006yNO-2OB6
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 Aug 2025 08:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wJ7ve2VeGZuVEtxxB6wfQ+BWF08gw9l4Vgj1AVU/PQ0=; b=YDFMNZMfQED45NAukqEDJrPKZy
	ltHsfeCyxfWI2vWHx2OGA+Wnstboxqd81safPaN+wliGKrR2FC8nSJSMTOx1xj9U6KyiD2fjprAMG
	z3vAToEaKUIb802t7Zjoiot8eUl1DoP3t6ZOfk2Abrr+IRdBjztDwysetRkRaGuc11PQJsQB2ERCN
	BjDtya5BuoKZn/QhAHdq35GNaY7xKaLiuBEOnjeftV6FlRLPrKvts5w02oCdZfw3v7SSnoPUBopkC
	h+U9V/gixf2HC/JA7Pid4WQ4XTZHaZtazwlWknEblU2ulGRPrQKgtIxWu0y1+BW2FsdsClpSACS7s
	RkvPR4nA==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvWU-0000000HKt3-3wyY
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 08:47:24 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4c55tb2WNYz5B13h;
	Mon, 18 Aug 2025 16:47:03 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 57I8kXYv051001;
	Mon, 18 Aug 2025 16:46:33 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 18 Aug 2025 16:46:35 +0800 (CST)
Date: Mon, 18 Aug 2025 16:46:35 +0800 (CST)
X-Zmail-TransId: 2afa68a2e86b157-0e1c1
X-Mailer: Zmail v1.0
Message-ID: <20250818164635573BQolnx5DcBqRicqxF0DMl@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <chengzhihao1@huawei.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <yang.tao172@zte.com.cn>, <richard@nod.at>
Subject: =?UTF-8?B?W1BBVENIXSB1YmlmczogYWRkcmVzcyBiaXQgZmxpcHMgaW4gdW51c2VkIGZyZWUgc3BhY2U=?=
X-MAIL: mse-fl1.zte.com.cn 57I8kXYv051001
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 18 Aug 2025 16:47:03 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68A2E887.000/4c55tb2WNYz5B13h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_094723_348915_6834C9FF 
X-CRM114-Status: GOOD (  13.12  )
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

From: Shao Mingyin <shao.mingyin@zte.com.cn>

When the recovery detects a free space bit flip, the UBIFS mount fails,
rendering the UBIFS unusable. This issue can be addressed by reclaiming
the affected erase block, which involves relocating its valid data. So
attempting to fix free space bit flip during recovery reduces scenarios
where users cannot access UBIFS normally.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Signed-off-by: yang tao <yang.tao172@zte.com.cn>
---
 fs/ubifs/recovery.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index f0d51dd21c9e..cebf4098557c 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -77,6 +77,25 @@ static int first_non_ff(void *buf, int len)
 	return -1;
 }

+static int ubifs_buf_bitflip_count(void *buf, int len)
+{
+	uint8_t tmp, shift;
+	uint8_t *p = buf;
+	int i, count = 0;
+
+	for (i = 0; i < len; i++) {
+		tmp = *p++;
+		if (tmp != 0xff) {
+			shift = (uint8_t)0;
+			while (shift <= 7)
+				if (!(tmp & (uint8_t)(1 << shift++)))
+					count++;
+		}
+	}
+
+	return count;
+}
+
 /**
  * get_master_node - get the last valid master node allowing for corruption.
  * @c: UBIFS file-system description object
@@ -690,6 +709,12 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			 * See header comment for this file for more
 			 * explanations about the reasons we have this check.
 			 */
+			int bitflip_count = ubifs_buf_bitflip_count(buf, len);
+
+			ubifs_assert(c, bitflip_count > 0);
+			ubifs_msg(c, "corrupt empty space LEB %d:%d, corruption starts at %d, bitflip count %d, try to rescure",
+					lnum, offs, corruption, bitflip_count);
+			goto rescure;
 			ubifs_err(c, "corrupt empty space LEB %d:%d, corruption starts at %d",
 				  lnum, offs, corruption);
 			/* Make sure we dump interesting non-0xFF data */
@@ -766,6 +790,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	len = c->leb_size - offs;

 	clean_buf(c, &buf, lnum, &offs, &len);
+rescure:
 	ubifs_end_scan(c, sleb, lnum, offs);

 	err = fix_unclean_leb(c, sleb, start);
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
