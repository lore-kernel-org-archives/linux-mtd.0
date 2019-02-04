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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E758C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68E420815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bZsBGZfA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="KMDjitVa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68E420815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ybhHiSZdz3Wk+Nm0XSMafx531lPqONUB+MWC8ZRtfg0=; b=bZsBGZfAR9TKkt5jjYkeFPgTI6
	odGh/zRBO0ckshecb6Ss5wNk9Td5ZqAubRyhyvnW4CZ5QTOxKozKq5KRWCZr7zC++dKTontHce2RV
	XvirE2D/RkZx5J+b3C0LwTdpY6k7ehLjn3Brd7RGAqnrg7q0UDlnuDrrs5EJEgdHFUBitFstqBpKu
	6+jxXVVOOq4Zalb72fTEaALeF/Z7tfcB8WTDsoMi5FnpDfDzzUZ2NqELJILuA9TRngpmO8y+lwWzZ
	sQHpBkCaqF6suI1uCJ8/yi0Stu1rVI92HAHBFemARxs/90NEH+f8ivK/nByteL0fn+155GZjZm+X6
	ROeM/c6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiC3-0003Zs-3Q; Mon, 04 Feb 2019 17:38:03 +0000
Received: from nh603-vm5.bullet.mail.ssk.yahoo.co.jp ([182.22.90.46])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAk-0002Pu-TN
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:47 +0000
Received: from [182.22.66.106] by nh603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
Received: from [182.22.91.131] by t604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
Received: from [127.0.0.1] by omp604.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:40 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 986187.29830.bm@omp604.mail.ssk.yahoo.co.jp
Received: (qmail 78173 invoked by alias); 4 Feb 2019 17:36:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301800; bh=rh+LHwxFvJ0kO4P71+9Ieo+0h9Jy/qqHUQvFkOL8TtA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=KMDjitVa9Qk2DQnytrCcPip1PaIMVTjMBfFYdP8+Re+NBnEaksQeWK4QGLrw1duHru33gApNdv8DjggSdpMZ1Fg3n1u+o/F+DYde4PNBHhiLsRW4E4MvPVjyY9taW6DEbV9fScQAJq4/y5nkz72/2pBWnUSJHplGJI9UjHig11c=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=ewKdw2mhqCt6MAormJ9OcDwdMbvjvpsSGWxw9gcrLcHDX2V9Hv+4NzGmQslf3GDLb0UbzqeaEfmxSh/tB+Dl2/j5kmjILnYqt3Bs8f5wxtqRO9rcKmjS8nmpbNfCrBwr/css3ZgwgqrkGiktbKjca6zdK8RCZPp4FAM0Z3liHWE=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:40 -0000
X-YMail-JAS: Sccm03EVM1nGHX4AuybR9DBnNv6hbX393ix2_uGwZZ3DpQHb6I0nJzNSlZ2VjBwvyrxGfYpVjpnoar0vAIonkwzEGjeSK.bRJlU.dleVkm7Cx1fnG8Dn1rjU5NoRXm9ZvoItOW04QA--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: KNJSNBIVM1mUNeELnnt91VL99e70vvVSEtq0eTFh9pA6Nld
 4n3vLkJn2A.4xtoSfkdEFQhTGRa5e85xJ4gNu6Pvevck3DX83b4bloto36f5
 RoZs0hChlMPxY.OH5omMPhbMJ6QFwvc5xo5sqQr8hTZv1otaA4BYzUuo8ol4
 H.E0P8fOZsC1Uz_RIHJRikF3FzL5EPjuMFOzMkfUMB4u01ZqF6jrStwFqW.L
 D7Jv9_bQVD5PpSZZ8MIYYLOzbHgQnDDiZip8LRp5J9VVROny4Em.3NyL8.Zd
 QI3hSaU5pAboO2ZqeCKvb.XGoHYY6dlDvLP8H1z4u6Q1URWygSEIP4Q3mdtb
 xmZqhri3kTDUBlj8rR8qDMZVASa4ls4vvcuGxhvZ2A_3oi2vSSMCvaRokK8D
 BvOxXYcPvcngJdlVstYhItwY6umaZtkenvD7474UzY3rZdXV6yZ.SLKf6_tP
 aZSgCXl.vaazSUwtH5hypx9z8DZ1x3riFs7HmVW65UK3bWAD8dGI2EAYxjkq
 EmrLOh.MzCUu.AR_DGDRFzB4E2Poli7k5uoDxZ8Bn9394I.Qr6Lpyh00S71f
 XNQpVaVQZhaC5N69un5i_9EOiJIwNzYsdLPvQcj91s1XysSyX
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 04/11] mtd: cfi_cmdset_0002: Call xip_enable() once only in
 do_write_buffer().
Date: Tue,  5 Feb 2019 02:35:43 +0900
Message-Id: <20190204173550.29703-5-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093643_215408_1E77BA2C 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
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
