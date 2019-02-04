Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EA3C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:15:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E272082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSeWdcmI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="cGy0s80n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E272082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nhH77m0FxpKE2ngVo3s9z0QR4l8W6AILrV2SGR0lghM=; b=CSe
	WdcmIK+IG+jNTxlyTqZZ79pfBe4hxVFWu8EugDK4svm3cnA7ulPWg8e7dQiGzywDADWJR/SYl/yK/
	vMENo7nmUR0bLR7dCKKyQs3HRG9i8+x5P2XLe8ZEgljmqr9OLjpQreSs6JEkqAnLthEVaM5JpDWEk
	Eo6QOPCZM5KnhFHGjKoknuSc7vuVhuivQqHzDYCOdfHWAHirpiMa9ji/E4tAypna5C28KjqkF/0Rn
	cw74kHN0yE6WWDh0QBkVlXPAsjLDzsyclVTJf8VFfw5mbGTJ0hZI5/I4ICPyf854hXLTzgABf2Ses
	u1Qlum6szAn6qW0ptjPBWfT/RDAYR+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqimE-0001ZU-NU; Mon, 04 Feb 2019 18:15:26 +0000
Received: from nh602-vm13.bullet.mail.ssk.yahoo.co.jp ([182.22.90.38])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqim9-0001W8-Fv
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:24 +0000
Received: from [182.22.66.105] by nh602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
Received: from [182.22.91.130] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
Received: from [127.0.0.1] by omp603.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 93869.51114.bm@omp603.mail.ssk.yahoo.co.jp
Received: (qmail 96942 invoked by alias); 4 Feb 2019 18:15:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304118; bh=Zr/VNgYFvgJe8h7Fzfy5wvrsFquSBp0R3Timf0Cqrwo=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=cGy0s80nKsI5pNGMWnwvFB3EkfpqJljYgvsEzvKl7lPJQsXuTvOLDOqg4zOHGYVBgMEpNWAtPetvXHQppskiFtb5RfAPMVMz584rWm84vOB+2eMaSRuM77f5n/QR37qR77xXQtWwnggIf4a1Lkfc/fRLTeCPdFH/JzevTx2Zijc=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=q4xQpYAdVtA83OLZVhDtE3YfxbXdbn8ZMs44ngKDdnsNXeLzGp7YzCyqBgZmd66L1QFFM4nMSzai/t6mN/zs0TYDm7kkMsiCamp2rdyUoykFjY6X3DLz+lO2w0FR7DISjgBnk24O5CjulufP5NWPdWez0erj3WF+BsJwHTSKqgQ=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:17 -0000
X-YMail-JAS: EI1SmR8VM1nEIZPYk9wNnjOURdOLHMmw50xQS96gdZmsUAa6wg1qexpakfrKT8kZJ8L8RDd5MO7YumLiZ2.ai_cwzvkJnM65J8W107D2ON31SCh.oIaZb_HSY.Owmwd7DiAIpLnSAQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: h9NwWRoVM1mWlYwKqvjXtNo2JuFSyBkofsTMhrJjBTqRZo8
 4ZZFBmVUHw7iRyXyYZNBlx2_B9hFSXJ0SQD1z5AuQfOeJwozkciadoLsjBlV
 4s0w2YExG8l5Ba6BJvvw0agoeT3KBYWVGavqM4zkeqsoKwwuZ9I3DoRhpDFF
 z6X3XZhXKRiOLhWJjUL17sKiJaeC5vAVAui5nnLz0JEcp4f0Ci8Bap92to4x
 FeXUgkTPbzEDEPFttCg.41ZTT7L_c4tss6DuvcfTT7EGyHx5OdY_y479a03n
 5TSDE6t84OrIfE7eQb01I89s3F9SORJbgqAIvWbVlojRfdeEXj5h0ZUwpcGs
 DaAVukDjkafphMr1QXihYmO5J4s.lqkweTZKTCBNi50KQwcwIXyS.WZZ3dag
 420scWaOKPkYWBHYqWznE401mWKB1kFzb7dBHZtTza1iLHdAuCcJ9M9Gk0W7
 hgdBY1T32RPYIxKKE8CUyzqP1m5bvw9gUkXSV883sxV.8pP9HK5No1Y0DTqk
 Qgc5Wj09GQd_rPLCjqMb1maevcsuzRlb0b54_3FtdSuv1AypWac9FKQ55EDM
 arWBvstlvDmoy54QX2UMyN_beoz9cTxaRTiNpscRgWMEwls.1
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 00/11] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Tue,  5 Feb 2019 03:14:54 +0900
Message-Id: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101521_855182_59EC10C4 
X-CRM114-Status: UNSURE (   6.89  )
X-CRM114-Notice: Please train this message.
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

The change is based on the fix for flash erase to use chip_good() done in the past.
And it is fixed as same way in the OpenWrt Project as below.
  <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
Also includes some refactoring changes.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org

Tokunori Ikegami (11):
  mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
  mtd: cfi_cmdset_0002: Remove chip_ready() from do_write_buffer()
  mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
  mtd: cfi_cmdset_0002: Call xip_enable() once only in
    do_write_buffer().
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
  mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
  mtd: cfi_cmdset_0002: Remove op_done goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Remove retry goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
  mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths

 drivers/mtd/chips/cfi_cmdset_0002.c | 274 ++++++++++++++++++++++--------------
 1 file changed, 168 insertions(+), 106 deletions(-)
 mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
