Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD11BC88E72
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rr1sXF7IqqCkhdha7Q5/JJR3YYOD5OiwQXoltrjQOvw=; b=IYKQ6gQNwpAXom
	NTfRyZc1e52Ja/UoSF4tBAljB8exyqBv1lH98fZwhrXDpuURo0M8q0fl7C5ZC1IlYeM6qNuv5BtPL
	TYSm16wXA8FVbz7/3G69hlWsBVXVhirY/Beownp2too0xtqtGncsB1i1CXJp5Zsu+g9l61cYWjyJ6
	QSGK1xS7RmIM/Fc4cxsivzSXsJmSC0XwzsxQEwpKrNF4vSrkD1Wz1pMOHGMQNS3TyCmwtx7QVW6zz
	KUzIhWtThw66pCx6M5jXZT19iWMDeha3jKk3ihOBVTFb7lkBG2fwDvwvfmSJjLV8gX4Yn2sjiCAAG
	vxu+aQgIGtBla388Y8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DUV-0000000Bazb-1KAz;
	Thu, 17 Sep 2026 14:53:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DUU-0000000BazF-2Jd4
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 14:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11B95409F2;
	Thu, 17 Sep 2026 14:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869C61F000FF;
	Thu, 17 Sep 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656814;
	bh=Zme1/j//8hVtp+4/QWWa3g4/McE5mzwvHjuUv+HdYe0=;
	h=From:To:Cc:Subject:Date;
	b=n7KPNBt8BssW6FjCsgT4HnAFxsE7sITGXB31GVgcqwajO+DfTErWNwVJSJy94EzC0
	 RJAmRRdTtYMIIT2Ddf2S3Xn6EmDVd6Sl2Ql13BAnu8MXPj3I7AoxxAa/gcQsDVEKfm
	 XMzU93nnERkAs83o0xTW8Cb0fBWS9iVaFHcW4KyauigE9RZ4Mae5XuAxVZA4cfUucx
	 M4ZsWx9aUsYLXF6SrF3n3FKYIRFZ0vXGwXLMDoRysrHBMInW/tl5UbrVnZ66pknus0
	 oDFTnMVy7zp7/GlyWubCnlaTsQieYC36pJTQgtQA4IfghmGaOKqnRUK0sqL+d+btV8
	 +1s9Kec9+Ggbg==
From: "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	miquel.raynal@bootlin.com,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: Call get_wunit() on the master partition
Date: Thu, 17 Sep 2026 16:53:29 +0200
Message-ID: <20260917145329.380628-1-rw@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
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

From: Richard Weinberger <richard@nod.at>

The code checks whether master has get_wunit() but still calls
it on the child. Fix this.

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 16629382a787..82b1e6392b16 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -563,7 +563,7 @@ int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
 		return -EINVAL;
 
 	if (master->pairing && master->pairing->get_wunit)
-		return mtd->pairing->get_wunit(master, info);
+		return master->pairing->get_wunit(master, info);
 
 	return info->pair;
 }
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
