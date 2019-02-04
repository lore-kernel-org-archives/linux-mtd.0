Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19189C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF772082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjjY+312";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="EUKTM0SJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCF772082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nhH77m0FxpKE2ngVo3s9z0QR4l8W6AILrV2SGR0lghM=; b=Xjj
	Y+312ehS04CixBWDDFfGwBD1rHmQ90mcQMofVDSvUs7bUmoiin6EohQjosHGbhdW9DpabFNgDKUuF
	h59OuussZUhwO5LYCnVFxS5wo9w6JXxg01lc+P544cSzxuGFwOpVcGanUyZQQZW5i6C8oVrzxMJjY
	IJwQu9gyhl4wmLQLZC7oASRYlhasVMCkcsDaKi8s+oDLkrC4bzchYMGayzfQWRDRtvjQLFnSAG4Ff
	KbhPjuDVb2EnvubCt+0yTGlmbT0HgXQ0h/NTX1wfGB/EFoMegqFg9mBKU5JArRe4sT7764TtJlV56
	f1DayEwKt71WWv5nP86z3cVIBqMWNeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiqs-0005lR-9u; Mon, 04 Feb 2019 18:20:14 +0000
Received: from nh601-vm9.bullet.mail.ssk.yahoo.co.jp ([182.22.90.18])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqo-0005hJ-Ru
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:13 +0000
Received: from [182.22.66.105] by nh601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:09 -0000
Received: from [182.22.91.206] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:09 -0000
Received: from [127.0.0.1] by omp609.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:09 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 445236.36526.bm@omp609.mail.ssk.yahoo.co.jp
Received: (qmail 41969 invoked by alias); 4 Feb 2019 18:20:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304409; bh=Zr/VNgYFvgJe8h7Fzfy5wvrsFquSBp0R3Timf0Cqrwo=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=EUKTM0SJmzYeWaYiponnq5ITeFqas74joAQ+qA3A2lIS8FZBxb5iQRSoUTrd/0D0skLvJRKa+fzXwLS1U0qLM7FC8YUI4reIAyUaoIHU8+PTCcYP1eoGXdRMHlg3YAMvj5mexhwngUKPoQc9Wk/jzckgMlGaf7TCh+KqkhMbCGQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=m9PvgjEU4Q8qh6QGmpdNeoD3BglgWJUEIMuNdvc6ma/6oRWhwjl9RQXGn/br2HzwZStBAMFgyux+oGgVqNmR3oigeQDzTjbgoo9IwrXcechWUoaSrs41tztJR3Ycr8X7IQoROVTBt6/pzUW8kJCvKme1G2WyQbUnX9vxeuQmHaI=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:09 -0000
X-YMail-JAS: XsW4XckVM1klhOHepx7XMRmikxvgtfEt6CThK2ouEuIDbuRXKm3GjF7mVaJkwUaw8C1j2MhGcpoK4ynwOdZsAClSckPoxGsn2AFEO1BOhUmcj0JNQ_Pv.MHDgvTErmqfH9mP0rvb8w--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: NWpYBWQVM1m_hhjuBrHn3Gk3nPbqteMR0lxcgDpQ_xmAvfP
 kLBxYAmxiHaj6BX68o5iLlunw5yD9Qb7..3YaGaYwc4LP6JDwNtl4etQDuWn
 lWd7ZF.I7LOqjNOsD.SrC6O9zLli3aGmUpQItzLl1H6uQ.5gaUc1YZMLd9w6
 Q2R2Bt3wVo1GMUQa_mMAtr7PvWSxWtFu0fjL5S81RBOS2VA6EXPyXtlugpXN
 G0RCLoHpQnr5ud2GDU_41JzA_AqT1FOstXLWKzjJhNa9FuUOwEn5KDocUpFK
 Adz4vvRg404aiIKB12uXcIMzZjngcXZiKEU.NRsDlRLZaoLaUs6z74WCdOU.
 e9YAI6POwJxrSWOhS.3XBCpHq27oV937B5JUltB8auK9RLOZVRvFG1ADriq9
 pHlDt2fbdskpf3j25kGwmy1lWMQXXs5jE8U4Azlw.eVYq0b5W1iaVobsE_8l
 RlLNIHc7mVz78u.dro1j72qyC52HjrxT8nQxAB3XGYKKbkkDMXhg0o4vWS01
 d6YGf81GjBDdaCEI3qSavKVy5up3IN9_4tkm2uzM7V1UdoBPPhRSYFYVxTTv
 dKIR02Iz.54FO90zU0W0eHfb66MNAldQsGS_HwtVRMpI255Om
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 00/11] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Tue,  5 Feb 2019 03:19:53 +0900
Message-Id: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102011_163766_8D3AF657 
X-CRM114-Status: UNSURE (   6.68  )
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
