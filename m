Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4897BD68B12
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nkq7kst2fEovfRnsE77cypAyPpgzRnoAWKrYMFMX8Vs=; b=N3uKu21VtkLgfS
	nDp65BZw3EhQB4oz58DBtLs7SqZ4YuP9r/YCtjV4WLU6eDrS/PGoF8Aj1XTz97MROwIL95xv7G8GK
	ZTVwemZxD8wrzGY+zAwb5Zc2O8+kHRhsgbVZk/V9z6ytUOCxYvgGE1upRcEYTl0v2ZxbsC6P/mOxx
	6vvh5SLknux+cZMPDmZ1SRt5gFXo1Akik9p2y8Z//cNM9ArlWeRVQ+0Wl87ncsyxgO4/vWIo0YAgl
	4pjQESYRJATov/y30J/n2PGMq1Mj/HCJOiW+U8J/4u2LhSS6jJqGNDNx79foSNn5XIXemlS7GMnUv
	rvJnlylT6Z0tGBZd2i+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZva-0000000A3dg-2kor;
	Thu, 14 Nov 2024 13:30:30 +0000
Received: from forward100a.mail.yandex.net ([178.154.239.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZvV-0000000A3Yu-3hIj
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 13:30:29 +0000
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2e9d:0:640:5e79:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id EC13A46D7F;
	Thu, 14 Nov 2024 16:30:15 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 5UMhj7SOkOs0-Qt1Ry5e6;
	Thu, 14 Nov 2024 16:30:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1731591015; bh=gZ0+WktCY4kae80cYlBSDWycDxoMAO9lo1JSMCTl8nY=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=GnJWUYsTIi2Ty+Ei1xGBklJLAaqMyxNKPCViRssH/3GGkgxcVMGTmU9ynFNKUTTPd
	 /YYkZHGFi9+S1sEhnOjMyjxh7EwlOqBcfxDagaD8T9gostyS9CWZonhTkvsAr+2ZxI
	 9KS27V6FZ30e2Q9nUseAOo1Bxrak0AhBuYAyX+Lo=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Ivan Stepchenko <sid@itb.spb.ru>
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Ivan Stepchenko <sid@itb.spb.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: onenand: Fix uninitialized retlen in do_otp_read()
Date: Thu, 14 Nov 2024 16:29:51 +0300
Message-Id: <20241114132951.12810-1-sid@itb.spb.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_053026_519464_675DC58D 
X-CRM114-Status: GOOD (  11.33  )
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

The function do_otp_read() does not set the output parameter *retlen,
which is expected to contain the number of bytes actually read.
As a result, in onenand_otp_walk(), the tmp_retlen variable remains
uninitialized after calling do_otp_walk() and used to change
the values of the buf, len and retlen variables.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 49dc08eeda70 ("[MTD] [OneNAND] fix numerous races")
Cc: stable@vger.kernel.org
Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
---
 drivers/mtd/nand/onenand/onenand_base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index f66385faf631..0dc2ea4fc857 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -2923,6 +2923,7 @@ static int do_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = ONENAND_IS_4KB_PAGE(this) ?
 		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
 		onenand_read_ops_nolock(mtd, from, &ops);
+	*retlen = ops.retlen;
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
