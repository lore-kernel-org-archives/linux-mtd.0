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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51739C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251EA2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qh2QB/3n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="GhK3npT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251EA2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/FzAcyb0YDttVQKjsoACMkoK8UMq7JGHzOQDQTcyq7A=; b=qh2QB/3nKrKlYalbf918Blxbuh
	oKk3kQQAMpDBs/Q18pIdng+vW0Ya/QJvqFJe6J9BSJEWAWd+wq0mKaopz9ofxImUXzbgtjppvaFH7
	11tzT+k0KIFAYt5hddLKUg4rKWK2BRhicGFLXkQrPd99eiPUIbW0WZoHZuFqK0MJYNH0jgSLOAJYb
	MpF4r+Ia5YV7FJacCY2a/AjlrOt7kZIZj7hGxSkyFtzLR4WFjXEdfXkExsyIhQQmzMvpBes4st7bP
	yJmvI8Z/mNO7h/m2WfIl8EvP1LgADwjy9t5ggKVQSt0arocA7re9X6rNiKYQoWItPA5nwHvd8R+/a
	JjI+89aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqioH-0003fv-HQ; Mon, 04 Feb 2019 18:17:33 +0000
Received: from nh605-vm11.bullet.mail.ssk.yahoo.co.jp ([182.22.90.84])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimC-0001WE-5K
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:33 +0000
Received: from [182.22.66.104] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
Received: from [182.22.91.131] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
Received: from [127.0.0.1] by omp604.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 826546.61971.bm@omp604.mail.ssk.yahoo.co.jp
Received: (qmail 97088 invoked by alias); 4 Feb 2019 18:15:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304120; bh=M3HAQy8Ls5sroPNXdb2whdI78J/JC98y+85zcsGwkUA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=GhK3npT1xGCfpK0EP47WurW4Caif38B+mi/kuF2v1UJtu71j9qJahlk6ewq4idJtiWp1HNAi9cxnUymAR9uliMcTeCpsqLi8sOK91bHBGgo6P436nebKWi+WGo0RoCZdC/1p308FqVnJTT4b4t3JehAMNtrtNMSMM5YwMsZcK7Q=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=PqGYnGlUX1hSoleOoz06BJX2KGh0YaY4ykExJQoHPrmdc07pCuqjoZ2RmIgKVRsSuxcDERiT0a2PV1JGyr5PI2eI9yWW9OIdKoOy00r6idFxQihKEoHn0UnbjfB44Xe/4AU9L5iHFxn7pEjo5FjQTkLxC8bOWPlxZ1jHYkKC5fQ=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:20 -0000
X-YMail-JAS: bkZXRqYVM1kIISrwe6hp8k4IUojFcksmt376iI0TQGW.eVaNgzkBOk2LDPUjnY9tQkpb7NVt9IQ1X0ZMJdNvzueaDou8oW4062tOkdihRVWdaXunOZ.ueKTq1ngQGyHGvRjZKXJ3vg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: XuPz7oUVM1kgq1QgEM2fJSCWWsmSwUSKPXbW_yoK3LrjiNb
 2tpNsFzH_V2msljONfky6AMJNgzzcClYNJmdvnEMyOhmA0qtL3mMXgBa_X8n
 g225cPl9teH..3061t586MAVHLf5IG6apz.TmrbdDXS5ASNAgr3KmzGaZNbc
 MRpmCixDnlCdP.7Olf5pE.7Tu47mYSi2cHDhNGB85EUXgpOM6UGpvxNz8O.F
 1Gf_Z5zFX7rUCtyDG033bzZhnzrHKgi074wRce0LAgE_8Gy7Ni5P0usvNAZU
 AeXR7OGSki7_olY8REsCwNYeJv3W6rLZ6VI4Lq4oPlpfNed.0F9xVd1jLv47
 q01m0uGPxLw5dG6mPntC14gCy8SA5qy_EqwRkgtzRYVxqnXcXiz.VjwREgk6
 sdonUDNaPxENz80y6srOCwa5b7a_JPS0bUsNJoNmXeldIBzzn9lZdtNDFqMA
 8u_g8h838szqg..0vUCSB4EKDiCzWHOBxpgolgu3yaUIFBizJKlnqQLimvPr
 V8B0tR1iymTNG36i6TClf2tsMJtlAu9TVSNhpSNEcYlqoXVn6v6Aauv9kt1s
 fhCAWmQuOtCmgun5ntLFjxtSHKiv3TLKuFit1yWkwXPdyjJdf
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 08/11] mtd: cfi_cmdset_0002: Remove retry goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 03:15:02 +0900
Message-Id: <20190204181505.29841-9-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101524_624304_EC3D5AFA 
X-CRM114-Status: GOOD (  11.56  )
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

This is just to refactor the function by removing the goto statement.
Change to use the for loop instead of the goto statement.

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
