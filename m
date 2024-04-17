Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9910CC04FF9
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tCx32Mdy3kqQjYh2XZc3/J1gBvxCKSkhnv1SxMDbMZ8=; b=herytA4Y6z6jvy
	NvEMFBj9k1i4yXmaw/kFXQgTVxlJV3CvhwBC6QCoPvviQ/8VoJqYxG/e2bB+FvUhoQd5GM9UuTTpY
	jWVUgEG3FCiKb3WCTnjeYK52MsB6R6gWsD8E5yblAu2hVCXPWwm1lPKRQ7KngPWH4BN/SluUiPkUp
	X8paw7LVWosw1SxirUuCN+iF5Z4PwjO47ODkRT3VK/gjgxFDDz+QO74RhsTO4qs0UHQgoWhpyBzFl
	jb8YN79iv5FbnkoB/LFcrsTq63OAvxofvoiRZ59H0yftH0N7L9DQWU3dXDUpgoaS4yQwJahJ885g+
	kZoDF2NxBOGK49Exyahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzUN-0000000EzNN-44Mr;
	Wed, 17 Apr 2024 07:13:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzUL-0000000EzLX-1AH0
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 07:13:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rwzUB-0003W2-EM; Wed, 17 Apr 2024 09:13:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rwzUA-00Ckan-Ai; Wed, 17 Apr 2024 09:13:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rwzUA-004DbZ-0U;
	Wed, 17 Apr 2024 09:13:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/4] mtd: nand: mxc_nand: Convert to exec_op
Date: Wed, 17 Apr 2024 09:13:27 +0200
Message-Id: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJh2H2YC/yWMQQqAIBAAvxJ7bsFSUPpKdCjdag9aaIQg/T2p2
 8xhpkCiyJRgaApEujnxEap0bQN2n8NGyK469KJXQnUa/eUwzMGhz/YHymTxOFGaRS5GWCW1htq
 fkVbO33ucnucFA9omhGsAAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713338018; l=923;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=BmEr6PI9JmP6srt84r2Hs54N86dOzRtv6ztVCh0F30g=;
 b=y2YQOTHK2FkEXTJ1pkQQTy8Gb6++35MsVfFqBGxixH90xHYNEquICdXd5uPblhOl2uFNWN0lm
 3cf5/X2AHsrCXT93eqWpIgWOaIMLLLtX4p2mtAnrS/8I+cTViqwIrD8
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_001349_356402_C6725C8A 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series converts the mxc_nand driver over to exec_op which gets
us rid of a bunch of legacy code. The motivation for this series is
a board that has a NAND chip connected that needs 4bit ECC whereas the
i.MX27 hardware only supports 1Bit Hamming ECC. With this series the
driver now supports software BCH ECC.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Sascha Hauer (4):
      mtd: nand: mxc_nand: separate page read from ecc calc
      mtd: nand: mxc_nand: implement exec_op
      mtd: nand: mxc_nand: support software ECC
      mtd: nand: mxc_nand: disable subpage reads

 drivers/mtd/nand/raw/mxc_nand.c | 568 ++++++++++++++++------------------------
 1 file changed, 219 insertions(+), 349 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240417-mtd-nand-mxc-nand-exec-op-38b3b80c4377

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
