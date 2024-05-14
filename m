Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EFFC04FFE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIROHUdK3vHFfOPalsBba5FZTO9uVavFEHK6txA3r58=; b=fO/K/vAG4SLWiu
	GOzs2N7zMs6GkugFnZGsFKiFKiZaI1KSdgk/lkrmO+laCkRSlanf1lLXiFgCP5GbRAfCmerwZFU2Q
	GFff5yQ4ynDOQOhBJy/+I77d+JDJntqls5v2uZ1BCj/PqvUt8j5QxWGTKe55e9f5SvPPZxp3XfquI
	4jTLxL+OMJDdMDhShpjXAvFZXwK2mgGsfDy467TvhHbZdFhGkL4BDZoVKpRs9or1OYybgh9NLpAbr
	RvM1hfeUbKs1N0OuJol+FcfD1ofP+6bzapJmubrzfWYRCkuk1mV5VliSN1N61R3PnUcYAGFwZPvTm
	jfY5pDFulExNFe4emZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6qeB-0000000Fli2-3t3s;
	Tue, 14 May 2024 11:48:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6qe8-0000000FlhC-0UMC
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 11:48:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6qe4-0003nI-Ov; Tue, 14 May 2024 13:48:36 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6qe3-001LUZ-EO; Tue, 14 May 2024 13:48:35 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6qe3-00BG4Y-1B;
	Tue, 14 May 2024 13:48:35 +0200
Date: Tue, 14 May 2024 13:48:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Using nand_change_read_column_op() in nand_onfi_detect()
Message-ID: <ZkNPkzKmwMWzbyWJ@pengutronix.de>
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
X-CRM114-CacheID: sfid-20240514_044840_182186_708710B8 
X-CRM114-Status: GOOD (  13.82  )
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

Hi all,

I am currently stumbling over this in nand_onfi_detect():

	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
		if (!i)
			ret = nand_read_param_page_op(chip, 0, &pbuf[i],
						      sizeof(*pbuf));
		else if (use_datain)
			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
						true, false);
		else
			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
							 &pbuf[i], sizeof(*pbuf),
							 true);
		...
	}

nand_change_read_column_op() heavily uses mtd->writesize and bails out
with an error when the writesize is 0. mtd->writesize is still
uninitialised at that point, it's initialized a few lines further down
in the same function. It looks like this code never worked as expected.

Also it seems use_datain is always 0, see 1), so existing code only ever
reads the first parameter page.

The same pattern is in nand_jedec_detect() as well.

Not sure what we make from this.

Sascha

1) https://lore.kernel.org/linux-mtd/20240514103355.817056-1-s.hauer@pengutronix.de/T/#u

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
