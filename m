Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA2EC282CB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5B402082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PBwU4eA4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="LHb+EgCz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5B402082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CQoEdKKo6U65Rem6yVAjsC9NxKxYH65aa41ycOBeCxM=; b=PBwU4eA4hWvnwme/Yt7Af6eeBc
	MP+mWDRE0yW5JwfwsPHIQmewXLoOlgQ3I+25+h9WsP9BphISLd/YmMlCslYnwBeX4OJrexLSfdSWT
	M4sXBkmSaQkvg9bVy+ZruRw8EmQhWn4qNSLNdW8AmTbjqHkGH6Otg0nWDDft/e1jtsixAM/j+LJ/T
	VcyCcbQGyp+LbTVX/iFk4r6mFZOEHCqucO2IKoYDJAPn8vwrN4cLz9Gv42EpPimIcptuMlyGK00zS
	uFG4XzsOW+1dKrPanD4s8xjEFy/9KAa2UfrePT52W3Om0ErshejdyrS07JL9Dv9m8X8daDGrY+ZYJ
	gMrd4BGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqinl-0003B8-C5; Mon, 04 Feb 2019 18:17:01 +0000
Received: from nh503-vm13.bullet.mail.kks.yahoo.co.jp ([183.79.56.199])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimB-0001WD-PC
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:28 +0000
Received: from [183.79.100.138] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:20 -0000
Received: from [183.79.100.132] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
Received: from [127.0.0.1] by omp501.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 436023.65100.bm@omp501.mail.kks.yahoo.co.jp
Received: (qmail 97071 invoked by alias); 4 Feb 2019 18:15:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304120; bh=ywmKhGC8bfvMf1RR+wF3qWzFRROCd0GEqpd6O1YcSdc=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=LHb+EgCzN4FC1S79lwZP7mOhi5dAkGJluog6r9BYr1FXy9Ut8mXMKhUju3uj4owjRQR13hqkPu2chqEQFHmTzoL08eqrkCpn/f4y7wRIGbTnNns9YJtERNU0TpfVKFLlGcw5d3kf8ic3Wcrr6OICJK2ZsHQ+D5/u5Ad+4O64u+o=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=fmYoRS/VQgmdwAfgjqP9yj5lKJWimfsLGmYXqDfg0hO/p0SGFaHKTXzHoK5nTXXxEc6gqZe5c7eFbsoOz2h6MQl2Rm2gV338qVeyAYNd4n52tpWKZ2lHVwiRYDUCsOwyeWObce1fxnX7IiIourcekN6Xtywl/tQVRvtQWJDXXsA=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:20 -0000
X-YMail-JAS: bkZXRqYVM1kIISrwe6hp8k4IUojFcksmt376iI0TQGW.eVaNgzkBOk2LDPUjnY9tQkpb7NVt9IQ1X0ZMJdNvzueaDou8oW4062tOkdihRVWdaXunOZ.ueKTq1ngQGyHGvRjZKXJ3vg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: mEfjFEAVM1mbTIaAA01xI3bkzzzzNY9l99qMlPbeThWhgum
 zVedTvNiR.xa23PHm1gC9LElUF5JNNSj99R973M12dyozSgI_dSEiZkdpfWI
 POERSlrKYvnd_Npr4YQ.fRu6Ci.3yYfov8nZVf8vube0C37vKCA7fYUpuev_
 wA6CDEsi3hGGBa8FqKcBOzBIwf0s2ve5F1YbKRQSdd5YDx1Tuy4ZYcyqcwlc
 qZS7sJjrqTDXl5WOhlWRh44IFhCmqYNj8RnBAWilxdAhG2WwayRVMoDkixaP
 895IcrdK68f4l7pRq.wUYnVm194wsbcKuCfw4mmnCGqKykOhg85wKvKXfnhn
 ZjKV3FxBkzqozHrKnZszwEpARLokqpZzLTpDOMgxs3ZmTT7NNV9pQV2ZvAid
 yxQLHTAMjcPJqS8gWdAo.oZy.1FVDgxM9kA12o9rGqYKcJcdzRQzquIAEPz8
 I0Fof46ENPHii0DRSp7C9zhaizmJ29g9xUgdMRZujywMHn.NFUhI1HCqPsD3
 tMwAhr91wbNGwkQom2W5yU1LQYzh8HOCkrLMAOV8L_i8el1EtwNrIb0nqwDS
 r4jR26ZbwKcfjkFHXJy8rT8yiKSJKw3Y7gLxh3tfu02s6Co.W
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 07/11] mtd: cfi_cmdset_0002: Remove op_done goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 03:15:01 +0900
Message-Id: <20190204181505.29841-8-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101524_099496_5B7582DD 
X-CRM114-Status: GOOD (  11.00  )
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
