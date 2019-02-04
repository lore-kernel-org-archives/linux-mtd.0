Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2027BC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73E42082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fDIopSEy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="LjxdMmuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73E42082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ybhHiSZdz3Wk+Nm0XSMafx531lPqONUB+MWC8ZRtfg0=; b=fDIopSEygaLgGshzRhSaQQT4JG
	OV8cFhEj4zakPUwouNdcpDysCnnJ9d9iiBvUIXzb8KEcsB3RVIE5kNfjOI6PBLVq8R3k3xlr3m4LR
	31eDb1on6b1Pta5eHMi81MVA8AfkjHy/b84j040u4b3NVxsfKTYN3iriH2DrimFWbeVyPgV0c7epk
	jqiUSVMxI0WKpoqJM93cR/sRONgTVahbFbf7wzUWV190CMoK7Ncv2qyuU2+FvnqF4EpmsJnA+TlXy
	hxQtcor7QLuCynFj6TZBhjeOWS7UDqxpXny5ULOCsbyInXGGoW8gqv7052GUxKsFJmSevAr7P829k
	Q5hDzg1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqimt-0002Gc-Hk; Mon, 04 Feb 2019 18:16:07 +0000
Received: from nh503-vm11.bullet.mail.kks.yahoo.co.jp ([183.79.56.197])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimB-0001WA-Mi
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:26 +0000
Received: from [183.79.100.141] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:19 -0000
Received: from [183.79.100.134] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:19 -0000
Received: from [127.0.0.1] by omp503.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:19 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 541749.85057.bm@omp503.mail.kks.yahoo.co.jp
Received: (qmail 97021 invoked by alias); 4 Feb 2019 18:15:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304119; bh=rh+LHwxFvJ0kO4P71+9Ieo+0h9Jy/qqHUQvFkOL8TtA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=LjxdMmuc7h5CE2vz+4bLuKLQh0b8udfNQBjrYjsB6NwyogSmsyfMka3Nv7DixGlVteirY8TQlR6PHC03n1ut5aMJ68CQ0l4g9Y+A02ygYt/0wXL1InHIIoXf64KA7Cb6UnsJr0x/T3N2oxkPF8xgpKThkl2H5g0Z13vcFxKuYZI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=iADhKClRmJEdpNie+uq1sCQCmPn/SrOnMToimvhHinlHVGUpLEou/JRZ54cTiVZ8vfR2rcCSAMw1M2nyDu9YcNwTEVIgivpJVoQCvric4LEHytpxS8VIpyx1YI4kJxIMdPl3C4OaYPJ5VweYl8vMBOMKErd2IhIFRCf7uX7xC8M=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:19 -0000
X-YMail-JAS: T18F8y0VM1kX8Lut44qNDqRKqQXOtlWEgnYz4OPQqrKh_GnZATKBXc4qMcXkmcMq1BNYy.6HEqavlP2iK_Z7GN2Ji2egLfrgr7deoXOm7g3_TisNhStvOHJsKJwkvAISLswWgb1h2Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: z7KVlQAVM1nxQhsXhvRxNrvyroAFLppvHZcRQu8mQW1koIr
 k6oGnRm4_eXMIbreToZtieJ0BwYaJmkw5pwdoCdM7hKUpX7F1bMUKszVqKGW
 s0ddzKhiyoiS6aWZDOnCDHMT_VegSFy9lOhIn0MR_S0hnqFAOFYbnx8Izsdv
 O_oKSaS2paw.HFsDUnKq99R_VMkJYQPMlimFVtzL6byFQbntEAWeeH27u3tW
 i_j9DK6xMdIzM_V6EcIli5iuFAkJY0JseeymEBze2V.XnB.p7SUeXQJU5D1i
 6M8SCXvpwLNmD_zk8rVn3Hwl9TRp6GNzKFAuM0qft90EsjYKSRpsvZNH2Xf3
 F6Em5Q4DfozjGUfQckHVSCB4CaQX5m2etG8IbP1q9mY_.27eIwEVAckJuU.v
 GGZlY8aEeoU.yAAfHu2SBXb.IPgC_BkD41UVk7fLw0i9LyBtoosJ5gtd.Rxp
 5Zbdvo_CtEqTLJyvzfX7.jr59nkldEelBFtOaGtqQgQ3v56um1AysLmPF6Re
 Lf.6ngRh_dEwWcU5qjsZuSiqbE_dss1I50O5.uId_eExmrOxITxk9X3XSEG1
 CmUM3NpNtzV6d7fKvaM4ZJqwDA3phE2P4qawdU2d38McI1XjB
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 04/11] mtd: cfi_cmdset_0002: Call xip_enable() once only
 in do_write_buffer().
Date: Tue,  5 Feb 2019 03:14:58 +0900
Message-Id: <20190204181505.29841-5-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101524_009318_61BA948B 
X-CRM114-Status: GOOD (  11.15  )
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
