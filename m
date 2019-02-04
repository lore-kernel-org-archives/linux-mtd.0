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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA27C282CB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C00B20815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZz+2yNM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="sHmdXM9S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C00B20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WVhoP+0RvuXgzv2hCsYZVwtN5oupzCTAc3TwXUmyRVY=; b=kZz
	+2yNMyZTE/Osw/gi/hB/YEo98akZtLehYDuxACPOCgA0SsI84sLSdeYZFSDYEZ2wnq5jKM8KSOrHb
	SMZBaj9oBDsNRMwnDe6/TkH9Npq7lB3rFeA3DwLeKcYQokZ2k+ti1smxZ800jIkXMBMA91FcXRTDY
	HK80NxaaQpKRoR4y45tPkjjp4cv7ewhxIRS8xikM/r8dIePtJHRG+m1EgwhXvWav89w5WVBjYnUtW
	xQH8kWE5x3BqbavTVcW4CXIO65tlyhCsrpvok0Qbjo4kFwiwf6LWP/Nu34ub4QSSPXmtZFlNZhXx6
	ot+fS6npiP1Ddnw1/u/n/H8fWmkmhEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiAy-0002bC-HP; Mon, 04 Feb 2019 17:36:56 +0000
Received: from nh604-vm4.bullet.mail.ssk.yahoo.co.jp ([182.22.90.61])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAk-0002Pq-EP
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:45 +0000
Received: from [182.22.66.103] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:39 -0000
Received: from [182.22.91.204] by t601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:39 -0000
Received: from [127.0.0.1] by omp607.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:39 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 214232.90427.bm@omp607.mail.ssk.yahoo.co.jp
Received: (qmail 78127 invoked by alias); 4 Feb 2019 17:36:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301799; bh=oYBeR2pH4HvnOpYoWLY2DsXAjH4ujzpRd4ZHLgF5f5E=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=sHmdXM9SFP6QVmHl3i+Gh719uqOUVL+njKjnYFAcElfEoPCKmJkDxb8FTw9ENLQkwtsA7LewoHUv8Eo+mSO/tg6aa4p7hoC1K7wcf8MAoKOi49LicrrDOwEjFNUAHRqt6966hNVM5GeV5LPkBp631GgNS9yJiptSM82Bsm+ThWI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=lmNvPs4GNCRjn5ZNcv1Er+sbE5SZ6Vf+lBXQ/8s6+3Ej0+2X6vX0hXH0cEhUNkYu2fP8Wg/+JXD7m/3BTPxJSCwUg79r3aDoV5GMczD7R5YBpswPxhzDZpMzfE26ofkdgtNcb6Xp0eScLGBO7BsmLj91lKf6rAVlLHVKwMFspm8=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:38 -0000
X-YMail-JAS: 9Ab3XFkVM1l..2jgNcD.JkODHqHDmXKZ1GWeQV4ptiw2othLnXm6HShVUEICfBWAkNw.66wzGHYTVFZH8Ht7jKKFnrgzVP2YEvziPSbL6vJbe.9dWGsbg61jJBg_IZmksm0lW43KHQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: dM08MgoVM1nVKt_rD946ivASdjFnYhpa0rV5.IOFw.h6ypi
 U0meAZiiE3fnJScpqDQvY.U8B5ykVWg6RbIc5yG_KxrFJxombOdl8xcsFAah
 d.D50.WpXS081VkfuZ4WW8VMytPxU8t6JHdqD62MaUGbQmCwP9hSV1ZSENUP
 ahMYROk6JujIqpm5I4ylyzQjDk9ZuIW8JkM.MjjKawgEes3nho3nBrsoInsD
 U0j0Z9DADJkopWFDDWLOWq1YIU5okTw79DIsNBumrg_PDsMO9j5oAaiSXAi_
 76aEMsb4e3PL_myJDcZvO7XrOa9SRzr4z61vwgLPBFMktNMwLsXJQj1Kx.Gw
 Si0WxOBU5kE3tAGDQ4tC8adlDMbQnhFiYlIae6N7TV2Mlgi2zA0Lc5qvLF5D
 47V79bi9KNr2fNtd0E8mV.4GVb9_zPmb91.DejhlvKUzNTiqSk2W85ZiSgnE
 ME2rjZzYUQDN4Si9MTuhUBexCHbjDRDloZPpZ.Uya2_PxveSKQkGC8dohALj
 QRAnfln8I_emY29qUbzL6tb4Cp8wnLtyiPjoLamcvAaksQ0IDOed31nNUppC
 OtXbMWPkw7fnIRMGJWr1_Ls_43NB10VEqvkMm.B4V8Ty7O3Q9
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 00/11] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Tue,  5 Feb 2019 02:35:39 +0900
Message-Id: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093642_892218_80B97572 
X-CRM114-Status: UNSURE (   6.90  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
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
