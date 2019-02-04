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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B6BC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFC02080A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjlvFmnv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="ZtWNcnPJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFC02080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CQoEdKKo6U65Rem6yVAjsC9NxKxYH65aa41ycOBeCxM=; b=YjlvFmnvHNpNdb2ja64PXljoAC
	/uOJC6vAcXtQAXVaXjZft28iBH1KNuWGurdTLocf713lEHMo/Fwb8GpaocCUHBUpB+WPG/AxZ17S3
	DxFYBvMg97JbNh9swePLzpcNFA6vgeWn4COAmRpw6VfbB0OJQlQPTxoWt1P2tLp/UxKm7EBajjIGQ
	036ZcT/ivSCYeqQaeVXvkrHOS/y8Ne020XINvI43+RtX36ru9pPcfYq4LLaOuMNKeFog/APXfiMwj
	E4dPbF+/RDQnk7PtD8X6hXE59elOvTSIQcGNNdjw2hrQjWwX6nSdxDi94VQLVy7zju9JkbCoUMv31
	a2t4paWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiPN-00013B-T6; Mon, 04 Feb 2019 17:51:49 +0000
Received: from nh502-vm7.bullet.mail.kks.yahoo.co.jp ([183.79.56.152])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAo-0002Ra-TK
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:54 +0000
Received: from [183.79.100.138] by nh502.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 17:36:42 -0000
Received: from [183.79.101.121] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:42 -0000
Received: from [127.0.0.1] by omp508.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:42 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 223765.59179.bm@omp508.mail.kks.yahoo.co.jp
Received: (qmail 78212 invoked by alias); 4 Feb 2019 17:36:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301802; bh=ywmKhGC8bfvMf1RR+wF3qWzFRROCd0GEqpd6O1YcSdc=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=ZtWNcnPJVrfhUuyewopRg/uHxoNqDKXSSc+pUtFJ3oihz6/ATL0A+6JgRNmngqu+/EuawxzQZYieQ/SQfHnxoZiD0IZER2j1UrhxFIuYP+WhHaRKbpXiFToeThDYog178TR31bPevQNS4H5bqfxPx8wan9AENdOcFqmapbkWmK4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=deha2SwArCkG7HN9JPv/qYjiDbEidSJyps5k4uwgOn1Mej6zVMItDFDShO07n+Qjf/DiSL7JYQm22uL4qbnUk4l62XFcFzBT7l8M2QCc+J13RxTP0n8JNFvc5Pzbb0/Z3jhHEarr0bSs2jpJvFLRoIngA0HLBVJ01EElNqJf+dQ=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:42 -0000
X-YMail-JAS: 8bTrFDUVM1kjI8eAiCJW66ghnSqZxAUn197J7xv_aRxMXZz_qmckdhSZXo69KWOHqZNZAWRxMyzWMin9u1dqYJYz5m_ZoB1RavjQd653k04jGN5ZqZ.PxyzSGESKInZD_R6kD_RFag--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: dmyzCLMVM1np6hEilfLEM1BTlFnRMsWP_nONcK40NjtaJpY
 ugXUJ7x7lh3HqKjx9w3cFIvK.gB.Up9Cz4IcmChuDi0jyfhsjwiAaxpuSjMi
 W35xOhAwFYQOJrCr840PUophi3KBAt6V7.H3tJkZ0L3Wj_NHOxZZPkob0YEd
 jRkb6RvK4fEAEmIBiTJEe_ZDDOPylEI825wwIZJuwVe5jXEBHYjuluQQnkFE
 lBFg7kbGp.M4Lo1dwep3lm_LZrV4hek_EqOqOc5N6BqQah6XpuoKHH8kLq_z
 tZvEw99b_GievZnvw9KNIWsU.3CQH27ajHh.o3KzNrljergYUai_wGiXQNaE
 USpVbfAsMcvc6jNeURnSBFc3PELgkG1yGehC__vmaL2Zf0ugxhEUkAw99WZQ
 bFfzYHPQruPXHXXPAnqJiUOqJhGhE8MAdg9zx7WvaQ5_akKrOq0Csk1CjrIV
 cnwBuVaiYyGi.kb0ZA.D3RZaBFZF6e7DZHY7IkLLJFiYjD2ZxceXuR_F..WO
 frOp8ZjbmgOXLhtZrgVkeLuiqjNfInqph.reGAWMtkxGVxyQw0C_YIr7gOpW
 _mRStL6aYwoouSCPGyLyK0otYcfgvkfGVsZnweQHpYIcHc0gN
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 07/11] mtd: cfi_cmdset_0002: Remove op_done goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 02:35:46 +0900
Message-Id: <20190204173550.29703-8-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093647_645216_342E2F33 
X-CRM114-Status: GOOD (  10.30  )
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
- Rebased on the patch v4 01/11.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just rebased.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a11dc40..a5513bd 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1671,7 +1671,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		goto op_done;
+		do_write_oneword_done(map, chip, adr, mode);
+		return ret;
 	}
 
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
@@ -1691,7 +1692,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		}
 	}
 	xip_enable(map, chip, adr);
- op_done:
+
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
