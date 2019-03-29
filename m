Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1421CC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 13:35:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C94217F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 13:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfDLism3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4C94217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOdH/dCRLzo6Wq9IQaOK6enIokiI3xpHySP8yH94nRE=; b=PfDLism3gapl0W
	YHoUoh0Hdw9NvkiGFtxQDwql6f2IutjUBBUyp9XV6nKtrfyshD4Vqg68aMmuJK0OpUEp8xdKZwMb0
	gyYx8KA6em5woUIrODWoNFz3mTVP0HdQk4fGkxGDTdiPsKHnEe/ddu6ExznjcM0FntYQkI0Vf43BC
	gMu+plH16ExzAlvBOGnpbAfGih8XuarGsh3xrIFqeXuBJFotCIQWqgrFYUXD2E663Lm1L1QLYsuz7
	1kf8IOyJzs3hxfcDb4gfCghzFIkYHrlFtp4qm02UBd8YhgvIM9aECUgNB/EVp1DwM2nNyh9FUqktL
	2+e5fpGC8UKFCcG8YXhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9rfF-0005PR-AN; Fri, 29 Mar 2019 13:35:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9rfB-0005PA-Nm
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 13:35:19 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1h9rf8-0001IG-0P; Fri, 29 Mar 2019 14:35:14 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1h9rf7-0004uX-AC; Fri, 29 Mar 2019 14:35:13 +0100
Date: Fri, 29 Mar 2019 14:35:13 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: nand_op_parser_exec_op should use longest pattern
Message-ID: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:22:58 up 11 days, 33 min, 58 users,  load average: 0.10, 0.12,
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_063517_934323_DF3A3AC0 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: Stefan Agner <stefan@agner.ch>, Boris BREZILLON <b.brezillon@overkiz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

I just played with the new exec_op interface for the first time and
together with Boris we found a problem in the pattern table parser.

The vf610 driver uses this pattern table:

static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
		NAND_OP_PARSER_PAT_CMD_ELEM(true),
		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
		NAND_OP_PARSER_PAT_CMD_ELEM(true),
		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
		NAND_OP_PARSER_PAT_CMD_ELEM(true),
		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
		NAND_OP_PARSER_PAT_CMD_ELEM(true),
		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
	);

It has two patterns, one supposed for writing and one for reading. All elements
are optional. Now with a typical page read we'll get this:

[   33.932464] nand:     ->CMD      [0x00]
[   33.936338] nand:     ->ADDR     [5 cyc: 00 00 00 0a 00]
[   33.941755] nand:     ->CMD      [0x30]
[   33.945628] nand:     ->WAITRDY  [max 1 ms]
[   33.949909] nand:       DATA_IN  [2176 B]

Only the first four elements are executed in one go, the fifth is
exectuted separately. This is because the pattern table parser finds
that the first pattern (supposed for writing) already matches for the
first four elements and then uses it instead of realizing that the
second pattern matches the whole operation.

I have no fix for this, just wanted to let you know. It turned out that
in my case for the GPMI nand driver I probably won't need any pattern
table.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
