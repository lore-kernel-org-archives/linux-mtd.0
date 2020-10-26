Return-Path: <SRS0=RTUQ=EB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBE3C388F9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:47:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37EF2225C
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auEzole5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37EF2225C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z1A0s5KWd+UtgG1I1BeXZDijg4iO1aFb7LuELRtW7kA=; b=auEzole5PWQVFKU3CdZXQo6oo
	iqRfXAIGzKqIoJT1Bd7Z7ezbcw8lnKbGAOtsyjLpRVD8OzDu5QQ7nmX9H1mUwfq6zMNuAFTw41KIF
	OlutQjXyKPPf/o0a2w2rsdafDcL0KC8hj+jhfEAKCBUCWJG429Mpjnfj+/PkcuosDt8O1IR/eesJG
	exANY4bHs/brAkt3Kdiwv1vAPqOzVMhk1i9ncyitHz4jzVbKsx77kv6PtV1cw2Y0XUXrnJiLXEuYP
	Kd5jqFBYzVJUaaP0YWvDVr/8R3v1ZVvrE0LG8/5eV9159faL9Nwm70t+lV0A3kpsdY5Eej/iIZ7YE
	3SaS+1jGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6Yq-0005mi-A4; Mon, 26 Oct 2020 17:45:36 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6Yo-0005lv-HZ
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2020 17:45:35 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id BB626200007;
 Mon, 26 Oct 2020 17:45:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>,
	miquel.raynal@bootlin.com
Subject: Re: [PATCH v3] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Date: Mon, 26 Oct 2020 18:45:32 +0100
Message-Id: <20201026174532.6090-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016213613.1450-1-festevam@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1b8d1070857da3c11307b3130eb4b05bee7d521d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_134534_695529_060F144D 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, han.xu@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 21:36:13 UTC, Fabio Estevam wrote:
> No ECC initialization should happen during the host controller probe.
> 
> In fact, we need the probe function to call nand_scan() in order to:
> 
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
> 
> Moving these lines to mxcnd_attach_chip() fixes a regression caused by
> a previous commit supposed to clarify these steps.
> 
> When moving the ECC initialization from probe() to attach(), get rid
> of the pdata usage to determine the engine type and let the core decide
> instead.
> 
> Tested on a imx27-pdk board.
> 
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>
> Tested-by: Martin Kaiser <martin@kaiser.cx>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
