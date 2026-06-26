Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A758CCDE008
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 02:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mANTCSfBWTpJ/7Yc8B9ko7VA1+hgSyTjE+n5Q6Eak4o=; b=P8VQHN5FvJlihp
	gruwLuIaI9qnpRN/tpvfx9EoJbKSjNSxSQFsFkMAppTAakC6HSvmEbRdDrpq0cqH7jlRx+StFpdzt
	uggcT0cSOPmyhjMECaqcGUv7XPJ7OxnG6RT02rbphVpn2yG3McDt6YovfpNZZ92PD9GpriwscNM72
	pfeHOheQl7Yvpe8WDUKRJrjc0rbu/5WeGNE49mFQRoCmObXcmLeLa/yBoDfhZLlgj8MKekIJHN+1T
	2+4z4nsxTj1BLrnFDM7gRRuKr5gWQq4exFMHQ7JLK0JWvEkFRkGAlBz6MV+WO4Za1JizCdR28ou2Z
	g6/N7+2r6g4CjfoWYJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcw55-0000000AG0g-3Upl;
	Fri, 26 Jun 2026 02:14:11 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcw4z-0000000AFyx-0Qt6
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 02:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782440025;
	bh=a5hzfcY1agv4TmXP7SyF5ysB26HFjfIb0LglhHv0lSw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ej4UE7Xtdz6qZmDtV9mrhNK2nJANbquC80Sai/bdYJobVGXBMbluTKr1RTSbqIVyy
	 KiAKVex9p0ZI6MPp2kP0bwO3L7ZF3M27vb5fYLVIqK7AO8L51BstlL1UQm+b51oznE
	 IctDOAnY/fT0laIRk0NEfljHVo+HX5OpalBjb+VE=
X-QQ-mid: esmtpgz16t1782440021t575635e8
X-QQ-Originating-IP: MoEoy4lkfilPPY2vRr5yX8VQ78pqebMiJchDmCFV+EI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Jun 2026 10:13:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 692030438400580657
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: virt-concat: free duplicate generated name
Date: Fri, 26 Jun 2026 10:13:38 +0800
Message-ID: <A9EF5AD55FADC312+20260626021338.3744161-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MBKLumFSBSSxcrQuXmw8jLY+gEcfnrdKLz7gNLw9JKo83h69DW02hqTX
	FSdwqgH9CKVPS0QtWTYSG09RfbGneqDWopbMNi51AIbuuMqXoxPcdlXlT9eOvtviQxSqeEe
	PkdnlfIhlCp5sMLqpEAmNiD/DC7VPxwJc1NAShIMi+kaRDQnhZFqOPVqPTwY8OvkhvEI9Ro
	+4heaEcHDRYzq++EktItyVPl+LTTEkjwHGB55wzlXaP2t6WUNFSAVQi1c8HCNTq1COAVls2
	+X94R5mgdrFuZDxey1fG4Fx8zV86i487749nELhltUEoebFPA4DCe1iyIcOwUqyznQXeb6T
	8gxepCeqJ/TmOtHowoccJ0SII6z63Xo3nfrjrVq7iY+a6z1cGTzwGSwJR3BYtmPwhu552Vi
	u1q5TJYHeEtmyA8mf9j//9KmMXijKK8Xyuu2XXn3h3Kov4SsSBkIDl59Mjn/Vtrj8hv/ZPP
	zp+xIPBoiOSGMGHGkj+fQoHJ/ntJAqlSDHuJfEQkrkZdMRRYDcTEIl4q296alDjgSvk0jy3
	TuSVubT08gFITUyI6itF7rsPZhcK71gDV7bRcLPOTxM/vb7tKkbV0O2TM+rDxJquvJNHm40
	I6P9BGRJCF5ZrFIYw5D1+CTss4uLSgRs23BjMXT2o0CwTQH5sPCAFulMsOeiSmLxQo8kDiM
	P61GU5W9veUeEVtFf4M2G8+AILb6/Hff2+hv7cIuTNcDZF8IG77ytLsCOWuloktRRd1dW6T
	WK6KphA0/D+bwtjtlz2JYaiRFQrAElCXYK2QdpfVDmKAKwjhJ3iYlJJNsJ6hcYSIcTEs3Fi
	COO1mQHPJ5+OpUmBaNsUe0Cmjes6UEPj8+e01NhXf3e/b76XVrzarMTBu+sWGtOdNzy8cwV
	XaTukXVma2PO57fPWRloLMfQ8svCy8rMeKgybj810LMyvI/9skqLxz2A11SpGTxpFC/BOJL
	LcnrqGwFroehQEfW8mp0Mk7jWSwt95hd7rdVEGPw3IYWsiUyHqdwTLkSVI3TmBDzdezzzJB
	aHaYcOST4E0u5tr0fqO58Wqjx4nfx3ZWseZCR1MxMJIRvXVKdck3ULcO7nIgh1fXkxLzAyz
	dr3DRYJRaoj
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_191405_642615_BBD01CE6 
X-CRM114-Status: GOOD (  10.06  )
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

Every MTD registration runs mtd_virt_concat_create_join().  Once a
virtual concat has already been registered, the function builds the same
name again and takes the equal-name branch.  That branch skips to the
next item without freeing the newly allocated string.

Free the temporary name before continuing.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changes in v2:
- Fix the subject prefix for a single patch.

 drivers/mtd/mtd_virt_concat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 37075ead0f33..5db6e648927e 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -321,8 +321,10 @@ int mtd_virt_concat_create_join(void)
 
 			if (concat->mtd.name) {
 				ret = memcmp(concat->mtd.name, name, name_sz);
-				if (ret == 0)
+				if (ret == 0) {
+					kfree(name);
 					continue;
+				}
 			}
 			mtd = mtd_concat_create(concat->subdev, concat->num_subdev, name);
 			if (!mtd) {
-- 
2.50.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
