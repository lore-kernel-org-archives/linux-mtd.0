Return-Path: <SRS0=M3+A=EA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9EAC388F7
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Oct 2020 18:03:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B105221707
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Oct 2020 18:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B8Q17eyj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B105221707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jjh1WzUJxJxK2w+HTkFTezjzj1LrISSCXP5vnP5BTeo=; b=B8Q17eyjy3wap6fwg0eheXwg9
	hn1FfU6vpm3jAJeodgUZeinm6puPiGRpCjg93GA1Oneiwn2JMhhqdxEJlu4OR7EUtPWiyNxz61itF
	R7E6n98IUqTDMb2IsDLWqafMMdCrIasxkVZN1/Un/LCtfmlyLTHFI82tci8li0PoAsCBkJgSGds98
	TvIRxQDa0p0iS9b90lrT1jHaonDZR7cR4egoiyHECtwTZ2vkVx+S+y4Z14bknQV2taOaiHfLxqkBN
	3vfl2gzPv9eKEkUIgrsxndLXHH08OJAlrnaNQh0TYNqK+OyvJn+3UNM+rmDN7jUgFNHZo0Y+v+4+k
	goOF45lIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWkLB-0001dS-OG; Sun, 25 Oct 2020 18:02:01 +0000
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWkL4-0001co-6u
 for linux-mtd@lists.infradead.org; Sun, 25 Oct 2020 18:01:56 +0000
Received: from dslb-188-096-140-166.188.096.pools.vodafone-ip.de
 ([188.96.140.166] helo=martin-debian-2)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <postmaster@kaiser.cx>)
 id 1kWkKp-0005i6-Js; Sun, 25 Oct 2020 19:01:39 +0100
Received: from martin by martin-debian-2 with local (Exim 4.92)
 (envelope-from <martin@martin-debian-2>)
 id 1kWkKZ-0006Ih-9D; Sun, 25 Oct 2020 19:01:23 +0100
Date: Sun, 25 Oct 2020 19:01:23 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Message-ID: <20201025180113.GA24173@martin-debian-1.paytec.ch>
References: <20201016213613.1450-1-festevam@gmail.com>
 <20201019091312.GR13710@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019091312.GR13710@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201025_140154_411981_C9C021DB 
X-CRM114-Status: GOOD (  16.29  )
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
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 miquel.raynal@bootlin.com, han.xu@nxp.com, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thus wrote Sascha Hauer (s.hauer@pengutronix.de):

> On Fri, Oct 16, 2020 at 06:36:13PM -0300, Fabio Estevam wrote:
> > No ECC initialization should happen during the host controller probe.

> > In fact, we need the probe function to call nand_scan() in order to:

> > - identify the device, its capabilities and constraints (nand_scan_ident())
> > - configure the ECC engine accordingly (->attach_chip())
> > - scan its content and prepare the core (nand_scan_tail())

> > Moving these lines to mxcnd_attach_chip() fixes a regression caused by
> > a previous commit supposed to clarify these steps.

> > When moving the ECC initialization from probe() to attach(), get rid
> > of the pdata usage to determine the engine type and let the core decide
> > instead.

> > Tested on a imx27-pdk board.

> > Reported-by: Fabio Estevam <festevam@gmail.com>
> > Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>

> I gave it a test on a Phytec phyCARD board, this fixes it.

> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

same here on my imx25 system with this flash chip

[    2.044024] nand: Toshiba NAND 256MiB 1,8V 8-bit
[    2.048721] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128

Tested-by: Martin Kaiser <martin@kaiser.cx>

I would be helptful if the fix showed up in linux-next soon...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
