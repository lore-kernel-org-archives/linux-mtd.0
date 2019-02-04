Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53720C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251382082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sgb6D8Sq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="KKUDvDa9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251382082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+EXJG++2Ev+mcf2h8F7/Srk0o1wxz/NvN295/VGLz50=; b=sgb6D8Sq68nndQniFTv0IfcRGi
	9JSjah7zmy6hPkjUuYObSbXF/tHSM8cC+MY8vou8Xf3Q/IKpaYSYCwxdRxcxHEtVvnlmmLMt+3nKY
	7LIUNBl7BXFA+PVJixkDtK6zEuMVAtVRzlDQj5f2cHZuDj9qH2EVv3nXOpD2XFjHi9OV3x9Zdn4R6
	tXM9J6kO6zRQhKoqHWMuIwJi8wZWzM6rpjW+e+qE2GMMzsujMlWDO1kmQcxaQY1J8vRmS2Ixmzgur
	NST49Mr1zopGHd672lluER+XZM8prHb2uYz3megHzT3wAyqPLRD4Jv/PMyWNyk7J1RoMeBrK6LVoA
	ohO+tlEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqimg-000220-0u; Mon, 04 Feb 2019 18:15:54 +0000
Received: from nh605-vm5.bullet.mail.ssk.yahoo.co.jp ([182.22.90.78])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimA-0001W7-HE
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:26 +0000
Received: from [182.22.66.105] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
Received: from [182.22.91.207] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
Received: from [127.0.0.1] by omp610.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 796639.24368.bm@omp610.mail.ssk.yahoo.co.jp
Received: (qmail 96988 invoked by alias); 4 Feb 2019 18:15:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304118; bh=r1NOxrm1fye5ZsOQOG2rvKKSUvIFic4BvlecvMQq64A=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=KKUDvDa9UDN3hLJi0W1nUUl3bVXrJPFw2yIz8hCGW4AplznQVI9+pWT2G9EN5cl/0xGyoQvVgNwm7rG3G0talQFZGkQtjZejDdj507SovKVVRYseQCy4Y0+u3YatdlPxiHbnw1AOAQFM3/Zok9LPBYaS6ruS7u9V59j1fVm0gVE=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=KQotSf1L8Hu0UAm/X9bvKGqea8h6TGs8uYrh2HG47vrmzji2mo9yumKYnmBzw+igspl+XfLoktiBIwWZhL1eACl+hLtKS2t5aUBJnfQjhfYgI9l67eRHekLyp6bu9w9QyMX/1gaBjJ1J4uhm0nTvBIU0CKt9f+iVZwQSkrYv3wA=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:18 -0000
X-YMail-JAS: SxUIEoEVM1kg.X1K7qTcT_HMhgZoIs7r6OzRa95lDEVIPy0a4H7eHvxmgyg4Pp4vaMMaukzpTSVBm5FQY9J3kiNxRMoExvpU2QWoVjKk4p8bvA9yQiL3QXub_5yJEdFKeJ3ERf.scw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: dbqjjQAVM1keUbA9W2iGnUuFk4uT1WFSenNsbYRDExid.F.
 AazBzYygigNOTUOueKQVP615dfBArTpCux2W4fYTb0EzAGnKdcRVB.VoXhyi
 Ps35sDxZFqmWYrOno9N1xsrDCnZVuSXMG_RLxoLw_Xevctildg51TuBWRruu
 18n.uhQ1Ko1EHDWVT4G4fTmq8hTUC_GqGpZcZArnvQa5fl27m6mid5QSutHW
 69uDunlfi8TZtUgkSgBd.hYwvZ9DrxAo74AvH.qFJsQavYZxbP6SKVdUpru.
 tCzpKIogjRbB9tx27S9nGES6LM7exW4ErqfQO.zeStggIA4dk_NfMoFADEbQ
 of2sW.xEwNwEbWeLJk91Ch3.6hBivWijrB52Iy2pp4Ny54vk3D.ZMqPD_qDs
 3vRa4DJiROwDxpjEhVZg9szHtdyzx6eD090Sl0RRXuy2x3yDvzP6Cgw6sAPE
 uvs3nI63_zZ8rY2qOaH5HfwC1iBQzf2bCU6mzDarIu2eKxOFoTHh1B1lYgGO
 q8YSNnC2DprJ2V.aqhi.ClqaIBTCtnGJ5NI8V8.p89aBq8pChTkD1dTXpMhG
 rsH119nX_vCTst4sEamUBNTWqclmhNn894iLSzjxWleQQ7XGe
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Tue,  5 Feb 2019 03:14:56 +0900
Message-Id: <20190204181505.29841-3-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101522_843675_F72A9E52 
X-CRM114-Status: GOOD (  14.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It is enough to use chip_good() only so chip_ready() is not necessary.
Since chip_good() is doing the same check chip_ready() is doing plus an extra
check to make sure we end up with the data we wrote.

For this change the order to check timeout also will be changed at same time.
The order is not a hard requirement, it's just better to avoid the case where
the data update happens just after the timeout has expired.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Update the commit message for the comment.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- None.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 91a491b..ca9d5fa 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1878,14 +1878,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
-			break;
-
 		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
 
+		if (time_after(jiffies, timeo))
+			break;
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
