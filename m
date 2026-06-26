Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C72CDE00B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 01:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lyvk9mYuHlkhENOWP5HLFO+4+9bF3teGKtApFhA2Zw0=; b=CTWqOZWuVOQvVi
	M2eJnXgcmnYJlYARHzrRSNgGEcQdX3q39JRJhwm2ZSBx/9dk75wDZfClGekcL4p6SwqSHiqtcaHR5
	kZnt0u3p6o8dd000MM+tHkBv4BytsVeyR/e5BL96+f3vZRQndKWU6pNdizP+rpC3DjFL8dy/Td9ZS
	FAPLv3RjAyUNcmGg94zjXk7pwZ1aojB+Emsx9z80Rle5HOe+DMrs5Ym07raJDEoqy/bhaHS/GtAh+
	/U11+tvCaPv0UAOnrJPimEMLz82/n5NDIre9syRVDCy8t96poxA6FLkfAdUMWcDoakiLvWuxYbtas
	WOp/D6MsEqvl/8BJSecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvKM-0000000A58l-3JFm;
	Fri, 26 Jun 2026 01:25:54 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvKJ-0000000A57Q-0kKM
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 01:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782437131;
	bh=3fXfBwENMmiz90XicVnuAoBPRhmDgrRJrDZrB+n21oU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kptfRmdQQNMnuMYVsUrNCkVP4jkE2cAq6d4r7SPXrflg1rtQgbfNQmfIYU/H8TU2x
	 lxhx9f9nFdWPEcPtG3q5bdNSIQGHdb7nCVmfTxivFmE+4/MleBhXYvnOVVA3/zgWFz
	 a5x9Wq9dkDdFG9Z4QuLqPCxXLcvtVd846xAr24IA=
X-QQ-mid: esmtpgz10t1782437126t9549af7a
X-QQ-Originating-IP: /zeSQLUbbqHxJ4yuDgl62zoM2AdNb6AjNn+62Ll7Avg=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Jun 2026 09:25:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12274750682708982893
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: virt-concat: free duplicate generated name
Date: Fri, 26 Jun 2026 09:25:22 +0800
Message-ID: <363FB8CFA79EDF5F+20260626012522.3683748-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MBN1Gf7pvZQZVd/KoRNNiG4aCzL/sp7zK9B9eClFIZR0gz3VD13HSySo
	UT92DnRc78Q/q0D7IPly4nyimAUW7dg5ZM/jQyDcxZieaTzd5Qq4czynEeqhC+rMK+44d2G
	DhqO8w00s3IdVeHEYKrjtYGGue3HzR+vJKwxEPauOdq6EkDKSce9JhXMjtqIw6aNuM18WFj
	z6JwsyQGruoWspyjwarQR1bbkti2wKjYyIwHK2D6kFA7Xx/bmcl7UF09PJUIgtKUmk0ZIFQ
	WcQMS282pQCU3/Ad1Jvr6K2jrKkFaJ7nyHgJo+HXz2qa3iyR1GCRPKfkTvuFAghmYg4zgmx
	D0pn0qAEIDYf+Pl079s5CrJYiZPdVK5I5TSuu0d15Lyf+pXHZ8xL94diRn6NutCyisSxiTu
	vyWbWuSlMsMNlM22kFmd2/Lhq6IWrlBz3ecK/FPHKds+FCiKDGQOBJbl0Ew0kahVKzvEwPP
	qaGH5xefM2K66pLK3dxffx7XAgnAAF5eJb9poqkIKIhqkr2bZScE7ovxL2lM69qOETHJPKw
	mmdVXXnSaGiPrvhoDpP36CCEW0exFaAxUaQ5C5n4HkSXEn2B2ThPKoRPccXEsNjJDxsAuVQ
	UjE+4E664AOacEalMJQ7QYs1QMtkxe73fBkpHbM6/Ibp8O6MstR317n4ZmjQNti4C3+3egf
	YXnDHDvtyLiSpgcNhSKcSBVUw14i4O7a5g446LzNzps2qmOjnFE+TKxwbpfgwtXIWai4bdl
	B0rTeFtml2tjQWAOGEwDJZaFQFzr0CQFdvvG/NcahJQca/F+LhoKbZjiw64ekFq2Lv8IvRI
	xo9RAI3t1ZwnF1lzLnsLDA5VDC/EM2A+bEcYaAOY/OUP9I23DbnucqvviR4spX2YMDAVFSu
	r4KvLDxaZa5yztSSFsb55vjKZDPpaSZPCYK+ei+mMv6VZaq/49WiUgdibn/xchA6Bhgz/5X
	kQT5XPfEVhmwO2emX9j5XHyzmP+9SebR+Di3tt7EHrZ5V4YlYBwhnWKPq5v7NdGErO9yIKz
	k/6KsexE7sLjNboipHQv46D0kW5qTdEt55vkz9lrdEZsNeBwKk
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_182551_985883_915B912F 
X-CRM114-Status: UNSURE (   9.34  )
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

Every MTD registration runs mtd_virt_concat_create_join().  Once a
virtual concat has already been registered, the function builds the same
name again and takes the equal-name branch.  That branch skips to the
next item without freeing the newly allocated string.

Free the temporary name before continuing.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/mtd/mtd_virt_concat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 37075ea..5db6e64 100644
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
