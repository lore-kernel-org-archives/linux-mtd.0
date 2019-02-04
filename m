Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D340C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0033D20811
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qu1VCf3q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="FtXKsT64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0033D20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/FzAcyb0YDttVQKjsoACMkoK8UMq7JGHzOQDQTcyq7A=; b=Qu1VCf3qpaa/9L+hUEqprIwE5T
	kUF42KMyKWNVwY/9DcvMMGh8mnZ7YOxsz3bHCsntpz7r8Hh/yCwSORzKeOeY04eAbh4Xan+Z4J9jj
	z+ubfzdFt0ltyt9vxljmCMO/mvhSV9tW997g0Kbga5bYg4XV1NlCjkHVTpISnlH6JhACDaZYVTav2
	zY5l5xEoB55XMPPMm7WBswQzKkpbVAaH1GZytNzTgcMoQyZJKxbibOvjpPkguJfTbjwyISCkoj9oT
	21oBEc0zUNe3rO+fKzjnlEMD25vPKNJEKkNo56xfckhzJhUiaqyspjZlBzejCwrepF5IUGgzTBpwq
	6jix5UUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiCq-0004St-5A; Mon, 04 Feb 2019 17:38:52 +0000
Received: from nh605-vm12.bullet.mail.ssk.yahoo.co.jp ([182.22.90.85])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAn-0002Ql-0L
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:54 +0000
Received: from [182.22.66.105] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:42 -0000
Received: from [182.22.91.205] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:42 -0000
Received: from [127.0.0.1] by omp608.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:42 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 784994.9710.bm@omp608.mail.ssk.yahoo.co.jp
Received: (qmail 78247 invoked by alias); 4 Feb 2019 17:36:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301802; bh=M3HAQy8Ls5sroPNXdb2whdI78J/JC98y+85zcsGwkUA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=FtXKsT64VkxoWt5gMXNCi9a9nVCjBCEacQ53aFEkt/m9lI9BEuj/QBCVbmRPRQkNKzBF0VsISOl9FNjMwbQmRtJiJs2iXECw5LdfYztu7jAuORaRX/pUG8fqw8oFEyj9yo7JHgDSW/gjeOdgMDYMcjs91pMwpA7SVpm81a7w9J8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=PRffbzaTBrNp5rN0hpgHOUz3f9sB3NP7vVlJBeGt1NkXn3hCmwmZJAM5ts/8XoFTEy/rtcad8W+2avlAfZB1hRn7Y21I+BebWc1XULPAak64uEKIlU0qTmMoSVda3uHYGoqb7R4e521RoonLo/7oIJfNSQARvpeW49W8T6aBjoA=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:42 -0000
X-YMail-JAS: 8bTrFDUVM1kjI8eAiCJW66ghnSqZxAUn197J7xv_aRxMXZz_qmckdhSZXo69KWOHqZNZAWRxMyzWMin9u1dqYJYz5m_ZoB1RavjQd653k04jGN5ZqZ.PxyzSGESKInZD_R6kD_RFag--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 2B5pmboVM1nv417s.NuZLeD72AjaML8M8TxCA0B7J68PiHK
 fHRfdeR7Q6zyTNXLVXohb_JOwT5X98vs8zgT_DGP_TI5sHpTEz6iPLptecKg
 lASI7oChhOOfqyx8sCP8VPOssqsYpAxoR88jKH7PxsC.rXv5BqIgS6ptQ0sF
 yo5shfy2BErO.bVbFV_cPhHleRtgrTqpYZPnS6FtSdUwPmxzKDVqd9bvIqmf
 SGIMh6Bpsmhhs8CcjUpzxmqb9BrUwtl0SBUH8LYsN4zRcWTW.GJKPq5NE6JT
 tJkcegz3Jeveu37e_tDE7WNXaCcdTBpNpioXTmju60USK9T47Y_Vr9.fjAlt
 .eey.J0okt630EjhLSUjQZGm6zU9jf72szGj_lbIshYHcmhP2OHH2dcV49_C
 lNYCmAX46vqXLjqKGqUWt7wBGMTKdr_qZ7jo_G.LnPwr6.zVXMKS398vCf70
 dTanQbWkYDMqXt0ykwJYReBhNsl26eREXATANEvx1ARaJzVaH67ByVyn4Avt
 y4H2RoHIGcxrYeM8rake4nrkrZ_fMm4eI73kHj0o4NIkVypN7HW15xeDdkJj
 i4HQ0KL3fjP.2M3CDNi9dIt58yiG4bHJpI4g61lKueMyTX3Cv
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 08/11] mtd: cfi_cmdset_0002: Remove retry goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 02:35:47 +0900
Message-Id: <20190204173550.29703-9-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093645_501955_F4A888D1 
X-CRM114-Status: GOOD (  11.24  )
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
