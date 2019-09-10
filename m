Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BC1C3A5A2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 09:55:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B5B206CD
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 09:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pI6iWMcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B5B206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoHFOOmqd+K48wWmAKsS8wQbyFJZgndkneHXn2zqfy4=; b=pI6iWMcRl0cmOP
	Jteseio59nbCxWALNmShvCqaqD5BRbndkwhvRt72S/ETEhGHl23J8slupYX4NHURv7hG7Bahtfp16
	iWdE/M1kFdtioezxHFDStJRPUL5gX0w271SUX0spnypwrfpuEQ6am2wmliHp/BTUuGgM9iiQEPZot
	43ZZ7CKVOYkGfncOGQ4+lZXbptMXdk+JxdUd9Ax7qjveVNoKBJdcLmuESsPmDUHqkhlI/wgZiskLv
	uTVNe4ly/erPdpwRSlXg9/X1n/B8n7J0jlloJhXjipU4DEN7MynakEi19JMeLG0IcJ5aSIoxcLK1j
	Nra/KSOGhbgK6IB9Pzaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7crs-00061y-4R; Tue, 10 Sep 2019 09:55:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7cro-00061a-W8
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 09:55:22 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1i7crk-0007xl-Rh; Tue, 10 Sep 2019 11:55:16 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1i7crj-0005W2-Ek; Tue, 10 Sep 2019 11:55:15 +0200
Date: Tue, 10 Sep 2019 11:55:15 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:48:43 up 64 days, 15:58, 80 users,  load average: 0.07, 0.17, 0.14
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_025521_038323_573213DB 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: mkl@pengutronix.de, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 05, 2019 at 10:26:06PM +0200, Sean Nyekjaer wrote:
> Hi,
> 
> I have been troubleshooting some CAN problems on our imx6ull with a raw nand
> flash.
> I normally run with a 4.19 series kernel, but to verify those CAN problems
> have been resolved in newer kernels i have been trying ~5.3-rc6.
> 
> [    1.231060] ---[ end trace 12b9d19a5aac4c9f ]---
> [    1.234710] Bad block table not found for chip 0
> [    1.236076] Bad block table not found for chip 0
> [    1.236113] Scanning device for bad blocks
> [    1.244907] random: fast init done
> [    1.701764] Bad eraseblock 798 at 0x00000c780000
> [    2.132734] Bad eraseblock 1536 at 0x000018000000
> [    2.133094] Bad eraseblock 1537 at 0x000018040000
> [    2.434057] Bad block table written to 0x00001ffc0000, version 0x01
> [    2.437254] Bad block table written to 0x00001ff80000, version 0x01

What about this "Bad block table written" message? You should see this
exactly once. Do you see this multiple times, especially when switching
kernels between the good one and the bad one?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
