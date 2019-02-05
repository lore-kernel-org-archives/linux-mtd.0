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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042ABC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A6F2080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gbMr7ECt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="DYpCPPKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A6F2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KD1WXFhfL+qDXNIRlM+1al/2RbLljIH9E549IGX9np4=; b=gbMr7ECtMI/qaiCGnO6h5EP4f4
	4Fb1IU+vL2f5VwmyN7o7kin6hFDEozZ2v0sQnjw/hiMfvxroMZmqX+vqIPC9l/WwBGCpvA+OzIIY2
	Tz5RBzRsUe40OwnQGstZQMOHpztULeElTuLyNeGruXoBrpPAH6L0Xfz78KwQmWjRM1RF55rRw40ZB
	I8Zm1tCAJ3k6ef9UI8agF5cqkFuwsDXCWK+Vn4ykH05pWhqlxpPt8O2r5qhCOFQd7stx+/oVcKdZ8
	TsJmlKGz8gHR+NuLt107ikkp5QqUYxGZ6ZPWG26UPYJ9azjVR4lkU4LIla4jljpT0kOmGYZi7JUFL
	qdlHAPlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1Qb-0000Of-Ll; Tue, 05 Feb 2019 14:10:21 +0000
Received: from nh503-vm5.bullet.mail.kks.yahoo.co.jp ([183.79.56.191])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PK-0006lr-3F
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:07 +0000
Received: from [183.79.100.139] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:08:59 -0000
Received: from [183.79.100.137] by t502.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:59 -0000
Received: from [127.0.0.1] by omp506.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:59 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 105648.46795.bm@omp506.mail.kks.yahoo.co.jp
Received: (qmail 45797 invoked by alias); 5 Feb 2019 14:08:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375738; bh=y0dblB+tqhR7P8h6hfIUrboO/khcJkBtBD9SV5tOC1E=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=DYpCPPKhBa9iO+9DH0zMQUZrWvbvB12ySk6rCLd3ah7t8sOy7oE0K6tvT6WAsq90GwVah31wA4dB9ZZK/ChZmuksfyZgZjC3tEhJHZRXodgb216qgxsly4nLQIcmvJpL5z/0HpOiAuZkSd6GncTp6PfUQeCYuG2fw4fPiEsmj0c=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=qXsqUEHm455rbO/Oho8P1sd2kPHP/ZBmu/0wlZiRpf6jzD4DCfZ1nHqmkAjiCp+FaNXh2f8uJmYIAAvgTRGaqLHNssUUMGLAbw1AhXQIZrtcZuDwwjjTTNf9t3wiv0ieSCjVul1WfmkaBMYMZSrilwLJNf6LL0WKXmHF7sLee9I=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:58 -0000
X-YMail-JAS: qiw0TaEVM1m81lkxkGuki4bmOxkGWF2h2zk00XjzaU.9YJAP2xSAYSqwpd0Qzhqr2BcNzeAa_q6PN1G0FLiN0M8V9UwMLA2wi9uWMhJkzRapUI1oEn_gk008qhsaGynGp603HerqPA--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: WIBXlB8VM1mN50QeZzJjBMf.7WQSOQHrXm5Ke3ITCdkatrF
 kTG5o17wPpj.fuxlw4djobpGOhsypnq7G0PqLVQyfmkTVudxqE3A8gyaCKJp
 DN2aZS7N.j.AZ_60xNw2YrOtOPVXnMJwKJe6jnYISfdz1ygAXo1VmOFUD1LN
 rUQUupyd5EKHzvp2zF0QtA6srEGWJPVmQ9pt1bbTSC0wJmhJXXg_klwbaKCO
 y7HtYaEG4S7rqqdCNAhx5fm4gq2w_ZHRme_IdmLHZNhv95ZjpOoPNBCkfqvq
 b_EpgkcV6b9lVnUZd68UcdoJr53uLzmDt7EOly7rTQ33v0wGYsvLGll44F._
 B.ZSrDskb79b2IcWuXeRXVNnK4Rq8F92LQeqf_UwoBeUXUiJN41VzB50F5OG
 9gWT5lTMjfXDPbBuvXtaDGUvb.J4be6vLe1XvmjF.qY2J0ss1TJReyAoSrMh
 YQ.PQkaTpq6UKfv09RefhfhnBntqUyiNnvW2rNSvPpqoQdtUSQwiPI_jNyfC
 sy.gIepLJiPqM6A6C7Nzxm7U3vD.DcFiPr8U3BuzadNq4S4heTmfzxKbZwfq
 SlYClO9Kyr3xlO7Y7_hGjR7.1_vsEi.i7AbVLAdAEax8gATSW
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 07/11] mtd: cfi_cmdset_0002: Remove op_done goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 23:07:55 +0900
Message-Id: <20190205140759.2360-8-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060902_625222_69F1FCC5 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: linux-mtd@lists.infradead.org
---
Changes since v4:
- None.

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
