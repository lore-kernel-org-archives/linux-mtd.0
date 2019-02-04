Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE712C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1D420821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTGXZm0S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="ut5VW/Cf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1D420821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q8VR0yVhkIV4kXdHPl5bbVjO0RB9ZvlLVgpyruX8LlY=; b=rTGXZm0SofV6gs6jjOGWmtrltE
	XvgB0yRveJJwxb9YxE3Y6hvDdIG2gLNJc9zziIz4D+H1G7JerIA7gi0gQHCV9bla/fDjtaDGpEZq2
	AlLtLn3Ok+/De2NmzztisB51H+i/qA7OGBGRBVRV4Xo8VKRyGk/J9+DqPFC4lKNuUG6ob1KH0vK1l
	T0ar7mAa0KW7NmOda6ovn8VIlWS+vyva8XmHpprfzhDjI5KMKxp8ZyI8NjGVESnWJC1zdFb0YGtS8
	eIvwMyB198kt13RylSaEfVdYkLjM95Q255Rd5VEAAzAiI6k5Fit8ffzrnf75mzuVdeYfLIt9GveDF
	xuO3t8Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqirv-0006mo-QU; Mon, 04 Feb 2019 18:21:19 +0000
Received: from nh604-vm8.bullet.mail.ssk.yahoo.co.jp ([182.22.90.65])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqq-0005j3-0V
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:15 +0000
Received: from [182.22.66.104] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [182.22.91.128] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [127.0.0.1] by omp601.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 594380.85735.bm@omp601.mail.ssk.yahoo.co.jp
Received: (qmail 42018 invoked by alias); 4 Feb 2019 18:20:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304410; bh=GiYcqEaS072E7wSbj2HhBqLUQeHAyVSQ/9KzmefoYOk=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=ut5VW/CfznvtVGs9dWZvumXtnKRihoozKTjzT72b3sY4Mgg5qCbxm8vXVzbo93eLif6qdQjb9oJXhbSzA+AlX+v4eg+Xm+YgZ6E/oIBYgQ7mSW4NCwCxecLuyK9no0KBUeeaK8KZjKbKjDvtyHTw1UBLiZ6PciKnXQdvFgbTn38=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=FGGIHVEZiAoStXDJomDxg4+P+UArb1DXuGa0HWaqHDinRF74GAbnavsxMj57v99DghEsrt1qyrzkl9+w3AkcRJatDiEDnBSp+DBXB+gJ1rj5v+yHUcp/RvDA+2Vj1O7gFSgzPKzCiFIe8JwX4ipeqpPl4KowWprNve2BW0Y4cr0=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:10 -0000
X-YMail-JAS: RtmTJv4VM1nf4e1VQbHkp6qLbY3vmJfj2fQcSHUA6LwkhM0t8SSb3SEydt.pAJACsRifURPlY1qCnOBSvB0SgsGtVzi84vrE_PmGnKo9wUGOvfON2dnbHkpjohPTJdxxEBtG_texLw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: Sz4wXv8VM1liwwssZtEsdir76F.t0iGqGG1AHMiV56JobjC
 v0be4AOHIUCMfzTyLV7svLYzN24Jt.ztFl6caFwTa6c9N4ygWViyHZuYpoVw
 k58p7eOOX1FMXI03ds0TVqpcU9vZ7E3aUb3n2U3UMJ_Zu5pis1Ipe_blUBej
 gJt1p79uKnqkYSL8VAQmNceu4501oXSDBolBCA6WnMZQbPHqmV1qLQ6Rmdey
 s6uHv5ysz.z3FTVpETJzw_g2VPBR_w6Ep206_EKiSO.s47dTdwNZPjXZr2Vx
 wySI1fPW3hqathNu86S28m1EWmUyUAGEkKWGjwjHU99C4JOquLiuwkSbh1Ua
 WUpPb2R9sogztXn5gKaw2P5nepSAbw6oWL1bzA8Kyr3Luopx8LMaUW..0429
 DhNIlrh9MkSmQLRQs4QYGIeOQfWvd5RFNc3ExwkrMEzp2Tz5hX9GgrBoz9qh
 FL58QCboinkV2LKyKdZVhEtIfVQkAODj9OorPDSjFPAKyOgUvYSK9xmF1rco
 Hu3Zf0YyZYMPom2bMMrTfviWKsQLqvxqNV9Z8yH8eHrAyhyjD_ljONqJvbc7
 3J9y666H8ROrEPeZDtCisgZsFq2p3P2pHWxFdHzsDelW5FyFd
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 04/11] mtd: cfi_cmdset_0002: Call xip_enable() once only
 in do_write_buffer().
Date: Tue,  5 Feb 2019 03:19:57 +0900
Message-Id: <20190204182004.29894-5-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102012_310717_55E8A77D 
X-CRM114-Status: GOOD (  10.73  )
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

By the removed goto statement it can be called xip_enable() once.
Also for a maintainability refactor it to call the function only once.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Split from the patch v1 3/3.

 drivers/mtd/chips/cfi_cmdset_0002.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1aacf22..92d3e82 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1878,10 +1878,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (chip_good(map, adr, datum)) {
-			xip_enable(map, chip, adr);
+		if (chip_good(map, adr, datum))
 			break;
-		}
 
 		if (time_after(jiffies, timeo)) {
 			ret = -EIO;
@@ -1907,13 +1905,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				 cfi->device_type, NULL);
 		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		xip_enable(map, chip, adr);
 		/* FIXME - should have reset delay before continuing */
 
 		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
 		       __func__, adr);
 	}
 
+	xip_enable(map, chip, adr);
+
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
