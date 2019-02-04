Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B076C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD4320821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhd1u6jI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="PMXzDYbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD4320821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VotfOjfugFc0Sa2oWQ+RRDTPF3R54bGIPU+Z83QZTU8=; b=nhd1u6jIOKpa6fmC+KL2Wmc7AN
	QdUPGahXa8f1xe5v0pokqJbZK2ejOkcVbIgXrA8R+gDLkR5+l/wb0GwEmcckzeLq+6Juj0JMo3dwN
	xRNLXPfKdFBtOjdiWQXTW+HQNkdGYFneMxAP0fjPPcaiTB/8s7s7vAa16j6W98IdgJt/UfRv/3SgO
	7suEX6nwC8MJBZJjwDqJYn8i9btJkp1bUdJkfXa19z7wqy28gQstluajg88s2uFxTbOvKxQQm30kY
	XanN/KvR1mJ/ZQ8nBBaOZsjThGde/ReEBCN5lRziqK7efzCNfMu4tv9OxnIRIvi6useGm7B5/jzLG
	Sxz8Peaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqisN-0007DX-DP; Mon, 04 Feb 2019 18:21:47 +0000
Received: from nh504-vm5.bullet.mail.kks.yahoo.co.jp ([183.79.57.91])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqr-0005ji-96
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:20 +0000
Received: from [183.79.100.141] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:20:11 -0000
Received: from [183.79.100.133] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
Received: from [127.0.0.1] by omp502.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 822749.50557.bm@omp502.mail.kks.yahoo.co.jp
Received: (qmail 42072 invoked by alias); 4 Feb 2019 18:20:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304411; bh=StDNXym23Q4WfgxqsEOFINQwiU0ybYur7zq13ywG4LQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=PMXzDYbRtNnOgDAVKQmHeemLykUuCTskoQFSFzAf4Bd8MmJdFSuSbVvfzSnT/hMn8jx/TmH1tvlLZBK9o0huAl7W1hbA0E0JJsCxzBMjaJQv2SMkoPTaisIT4ChWV3FUWfa92pa0rRvZfU9C/kETqnmFaOLujAXrIULHZP+iqLg=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=hwkoN7Wla5f4scbPIZdCknuy57PYNB6pptoKXz4g5gLGGQpMev8mL0BmZ57saZ02+NFXpl1/pNq3R51Ix1hs2flqMS7hEu0LR/qE2sZmI14fAMGoybRjCCgScuCRBFWMc/ERzMVbXr8KcO/8L17FzY5hBCmsSmZrovVmtvL0l9I=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:11 -0000
X-YMail-JAS: UzMMa0gVM1mWms_LOl6Zur2Kd7FJjO1dtmucjlx3VPnMFohZJJBpwhNNUTjtyGrQseGx1dZo8LzS7fTtRmDluG09.qhgo2f9LTFydxl.SWHc81Q70xOwwE0gppefZq0Zj2Ljfj2Mrg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: PjQbz0QVM1n6ML7JjDNhqQuBZ784vF11_HI3JlNhtmItCyK
 uvwbzaxJbbcsOo0F96OVj_.RiF5h.1SCYKT5lsaaJwytMz_hdFQDIpkbs7BU
 Agw8uSoZU5trwlf_s6XdNPi5sntJjQFPfNjxt22BdP.3Fb5WJIEO2lbOoKDb
 D4eMzZVrEI.efbIHpFo2touVDCbE9c9pg.IIBjWtnkYtJc.7PFglDSdxIYNy
 1uQEUo7rLNylHYQ3Pz.oD5dnA7cWnBETcFq_aPtMVbGIKlSwBw4sxDj7fxGM
 stJj9I2DcYXPhHnRZCzzn9IuO1rOEXkIv.DgZ3n9esYtSze23dInVTdx.gxh
 LzmMOAT2kZ7mOfHZCXhqNBhpnIuz7dG9KLNzbBS0dvYF6tgW9Z7TNmrryi9j
 JZYwlyOrfXQAWom2obBGjX8UJm0u19LtNF.td7x.dEfyrVktfike3PiITsuf
 lI5VmP7kkMgFc8hBJJ5nfVY0_WMGFtvyvf7n2BHus5wCbhBeDoE.0egSYWUE
 cdnqXblLpjSjvrTK4JeR3Nw42a7wCugQG_U3QSSMPJ7Ir3t5z0ULLcv4J6v8
 .Jm6L9.1oX86uI1m1tJVEZ_Rl3bIMM4S8DrNb5Im2YFEZ3yyQ
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 08/11] mtd: cfi_cmdset_0002: Remove retry goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 03:20:01 +0900
Message-Id: <20190204182004.29894-9-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102013_791673_9D4180A7 
X-CRM114-Status: GOOD (  11.13  )
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
