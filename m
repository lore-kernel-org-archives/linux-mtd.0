Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557BDCD128A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SduVKFGUWjLE8ZQwCOEr8b8ksYFzjG+m+IlspR1pLmA=; b=HrAgk3giwmf+Ee
	scMYTMtGFTz8UjW15JOClAnImy71KPPlUiNMm2bjfoL9pkWYM02zjOlTk2oq+lu07d2UVgOCIKsBJ
	4jpIqCNBUCiTWG7dBBGd4i02QLGTQG991zzklgTyePOpYxEJEsFJyMadJbkoWYUdG/9Zdfc2gUV5C
	sDarm8B7Nq3BFeZr8pe1Az6KfXTxfheEBX80OEGFErsPVxmjh6TxGrArvHGi+9NcCNiF3jQlxKcam
	zhUEYaMrddtTBAqkQrq6l6bpGfP8CVxb8rwmOWaYKStfIWj0WQrxNTcfDcluUgSkUVUB/iYJ6/ber
	EJ/lbci8NMjoRP+hCJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurKX-0000000BRvn-2jYR;
	Thu, 11 Apr 2024 10:06:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurKK-0000000BRsp-3kM6
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 10:06:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1rurKB-0003SH-75; Thu, 11 Apr 2024 12:06:31 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1rurKA-00Bf6E-MW; Thu, 11 Apr 2024 12:06:30 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1rurKA-007g8g-1z;
	Thu, 11 Apr 2024 12:06:30 +0200
Date: Thu, 11 Apr 2024 12:06:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com
Subject: nand_ecc_is_strong_enough() doesn't trigger
Message-ID: <Zhe2JtvvN1M4Ompw@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_030641_197990_3EB6CEBC 
X-CRM114-Status: GOOD (  12.67  )
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

Hi,

I am currently working with a NAND chip requiring 4 bit correction per
512 byte data while my NAND driver only supports 1 bit correction, so
I would assume this to trigger:

	/* ECC sanity check: warn if it's too weak */
	if (!nand_ecc_is_strong_enough(&chip->base))
		pr_warn("WARNING: %s: the ECC used on your system (%db/%dB) is too weak compared to the one required by the NAND chip (%db/%dB)\n",
                        mtd->name, chip->ecc.strength, chip->ecc.size,
                        nanddev_get_ecc_requirements(&chip->base)->strength,
                        nanddev_get_ecc_requirements(&chip->base)->step_size);

nand_ecc_is_strong_enough() works on nand->ecc.ctx.conf.step_size, but
this only ever seems to be initialized by the various ecc-sw-*
algorithms.

This was changed in 8c126720fe10 ("mtd: rawnand: Use the ECC framework
nand_ecc_is_strong_enough() helper"). Before this patch the initialized
values in &(struct nand_chip *chip)->ecc were used (and which are still
used in the warning message above).

Do you have a direction how this should be fixed?

Thanks
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
