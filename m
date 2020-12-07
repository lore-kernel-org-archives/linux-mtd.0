Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F98C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 09:51:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F4C922B3B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 09:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F4C922B3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n1L47SXVCdoa7tg/hZK9oYZn+p1zwDe0ec4w+oGcW6o=; b=jkxMfQxvJrdYPxw5t5oxmPrtk
	D4ZsXPA+awYX88BlrDyt/RCFav5DqAxclS258FxM48lZK1wVvBBb08jemy+icXMHuOduxtE7qlbMy
	ftryQLE5UPy5Dnae4M6fbw2Y9Byj+PcMS5/avx2jHEFiak5NtNnxxQiLE56WNMgqmh/KYnIMrTnlG
	W3wz+jqhzGc1zuTDVWkdI8IYc/FdzPHa0yfjL4D2zoWvN4QMmXr3gMQEOEadO6LmfW2p7/i1F/Gqx
	spxX7Rqkk0PIyXYZGm+dj9aIOT2M10qLCpdYYhnzzqdRofytUEqBlWpaqXZEIaqqkdJkVJkbxEqT9
	0WR50gxzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmD9n-0000hf-9O; Mon, 07 Dec 2020 09:50:11 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmD9l-0000gc-3L
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 09:50:10 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kmD9j-0005HY-5s; Mon, 07 Dec 2020 10:50:07 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kmD9i-0003gZ-Df; Mon, 07 Dec 2020 10:50:06 +0100
Date: Mon, 7 Dec 2020 10:50:06 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only sense CS0
 R/B issue
Message-ID: <20201207095006.GK3977@pengutronix.de>
References: <20201205063004.3099-1-han.xu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205063004.3099-1-han.xu@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:47:25 up 4 days, 22:14, 60 users, load average: 0.16, 0.31, 0.31
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045009_317352_5CCD0A63 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Dec 05, 2020 at 12:30:03AM -0600, Han Xu wrote:
> set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B signal
> from all CS.
> 
> For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
> without the patch.
> 
> [    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> [    3.770613] nand: Micron MT29F64G08AFAAAWP
> [    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
> [    3.786421] Bad block table found at page 524160, version 0x01
> [    3.792730] Bad block table found at page 524032, version 0x01
> 
> After applying the patch
> 
> [    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> [    3.770941] nand: Micron MT29F64G08AFAAAWP
> [    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
> [    3.784390] nand: 2 chips detected
> [    3.790900] Bad block table found at page 524160, version 0x01
> [    3.796776] Bad block table found at page 1048448, version 0x01
> 
> Fixes: 3045f8e36963 ("mtd: rawnand: gpmi: move all driver code into single file")

I don't see how 3045f8e36963 changes his behaviour. Are you sure it
worked without this patch?

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
