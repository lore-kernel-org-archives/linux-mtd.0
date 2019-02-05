Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E18C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458A02080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YWuF4kC7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="pKZXAn87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458A02080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xd/Od9cEPn5yOGOnyivAfSgJfk2uNVZ9IrjGBWSMhLg=; b=YWuF4kC7kDDUpCA9zdkXoKnStw
	NRrfbwGVK0nBbPvab35Hr+fLFM53KuUbKZCS8C4p5yTH0ws7su4w3zeODqrZuOeuUkh3NNUaUDBWx
	ADZxPL7MU67ujl0OAMHBlf0b2tUyhMqTBThyeBjjcZ9JuDIPumdfEtZaZGd75/gsku1iAiXgwpyM3
	D0ss5LSd6LLGZWHWTKszCXVFxmmE/+GDtTXtyVlN9rJczwpMmSvNSQL3+ZKywsQwT8FTe0ZoMrN7B
	qr1MxFs6EOdnMAK7XoSrPHoCsc8fYsPUJ2MB3AwytFV8TuK7lCS9WXyMCpbd3oFQOZAbXwoiYdZuc
	5ZZE8k9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1RL-0001X3-4r; Tue, 05 Feb 2019 14:11:07 +0000
Received: from nh605-vm0.bullet.mail.ssk.yahoo.co.jp ([182.22.90.73])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PK-0006ly-3u
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:12 +0000
Received: from [182.22.66.106] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:59 -0000
Received: from [182.22.91.133] by t604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:59 -0000
Received: from [127.0.0.1] by omp606.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:59 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 604745.86071.bm@omp606.mail.ssk.yahoo.co.jp
Received: (qmail 45839 invoked by alias); 5 Feb 2019 14:08:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375739; bh=hyJLy706ToPV3Zd7RIHvxdxFx6jR8N9N3oSoU8fY+ow=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=pKZXAn877UK8whZYj7bywa97dunLGxWFOgaLQcAZftQAmZoaIpHiIUsspBibkbqKYVKxGdd4NqhANhpBwrcJ5MK3QkREBX1Zv/5mF6JbmOHvd337tAeY/+euusISZbO8X3JuxrB85SaFD3jiITAzGhylACtJxyXAkiA0BrrZr6Q=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=JkkeQU7iApG4Jxo3HpwDVvUNipL/SmDpE+JPTNLVLSXvcPiLZBYjlyVlIGo9rqnUEPLiN8LQnxJNZzvTFDZyU+v6mnlQe+h0V9/iJd5l3YapbnTpZ3dIdRPONyJ8vyY8NXDlIV9bJfYSBNtJwj0kK7Cc39YL8NABK5QN7+bqdsU=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:59 -0000
X-YMail-JAS: MeyelX0VM1mSxBoju.h4HOdwCh_ECAwEeS5p1NJ56vNPtrfToW95ROoI9Km2LzuxYTogesiVIpxLNLbqhx2R6W3zfH0isbI4tOBZ8vGn2YjEClxglFHRATfXER4j2_yE.nnPumiSGg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: k4zqR8gVM1mTwV_Oyt1C.de5FDFT_GDdzU_5Sq1pUTh36I4
 mbBHRS27mSS5nCEl.tg98ngoLVoE3D8FStm0apv5Q3q_yO9K42PTtmyeFU5h
 bIjJhcasfy4Mu0XvUQAKHPmW_E4arZ4d9NhvoRsUoI.By64nQODmCo8Mw68Y
 FrBwBXPDNWmvtJ8BkmuVvzK_zdbZXcAJiEDw_jRg7BOAUN1D4SB7N6DrLuHL
 jSuMHo0Cd2anVNOQzI40KkJ1tdGjrJ4S7W6NWmbVlIVX3Fmtr1qcC.y.Bax7
 sKsOlvGsuI8RM0dxXA4_589toobSGtV_FwZJhuRvO16VFqchDkPLQqAOh11U
 hLllTt6h5wHpX258D.Naqvs.f80NS8SUkbpEw25t7Tebc0N30e.XuC9izwCk
 CLoyJHBRdRtqgPXC.G64JITHLvsVoWHszAVXRBRAQK2p6c7ckNMQ2C0UkFh7
 N71DqTaMNlJEPIVFQ1x_qGWo9S1PNlZTZMpxs4OrwUq8fkAjlxztodU9tGyt
 85KQHr7PUULvpeiN.jtPMDM65e7IIu_0WXElG6P4MyKG6crHtgQNnOxASJbq
 LuGdNU6T3YVmZo2QtmKNHhU0Y.q_SGACF4tLgb6ebrLG1m3pj
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 08/11] mtd: cfi_cmdset_0002: Remove retry goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 23:07:56 +0900
Message-Id: <20190205140759.2360-9-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060902_653991_741463DD 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is just to refactor the function by removing the goto statement.
Change to use the for loop instead of the goto statement.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v4:
- None.

Changes since v3:
- Rebased.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a5513bd..81f5e5e 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1679,17 +1679,15 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
- retry:
-	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
-	if (ret) {
+	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
+		ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
+		if (!ret)
+			break;
+
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
-		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES) {
-			ret = 0;
-			goto retry;
-		}
+		/* FIXME - should have reset delay before continuing */
 	}
 	xip_enable(map, chip, adr);
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
