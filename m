Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC3BC3A5A2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 10:48:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721DC2067B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 10:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qv8aSrI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721DC2067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J551mlBfP26OrNF/Wz8yURD228gVHw8ta5ncZHbVhro=; b=Qv8aSrI8QKFtbR
	UnHDJzuuZb3cy+lJqC+EFHInoBun29M1+Gm5DzvWi0OG3D/ZRmEBZbt90oBT9Th2mh8vSZird4JGS
	K1wuP0JAqdUPwlvKvHzH9yKQTsWyufINwZa6U/UEEnZOn8Q07tzD6Ys96bz72H30gZONc6IQSktJw
	i2Y4ZBE6cbsBUGqSCj+sQqqE4CDIopFqEs4kQdRbFG4QDhGhV/0yeO14oh5Ff8fvVRnI3dQWlsHHz
	XSzqsvSLgITqaei/8jUJ7x2jgEzYfUdHxS5COU/dLJwHIE6NyIvNpIaxeQJZJHTVHN9fTOTSwBZhm
	qjhLmiqmkagbEjLNfJug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7dh0-0000gd-1L; Tue, 10 Sep 2019 10:48:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7dgw-0000g6-MO
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 10:48:12 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1i7dgt-000563-SO; Tue, 10 Sep 2019 12:48:07 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1i7dgt-0007sJ-Du; Tue, 10 Sep 2019 12:48:07 +0200
Date: Tue, 10 Sep 2019 12:48:07 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:45:12 up 64 days, 16:55, 83 users,  load average: 0.51, 0.20, 0.15
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_034811_078943_E2965618 
X-CRM114-Status: GOOD (  12.45  )
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

On Tue, Sep 10, 2019 at 12:18:25PM +0200, Sean Nyekjaer wrote:
> 
> 
> On 10/09/2019 11.55, Sascha Hauer wrote:
> > > [    2.434057] Bad block table written to 0x00001ffc0000, version 0x01
> > > [    2.437254] Bad block table written to 0x00001ff80000, version 0x01
> > What about this "Bad block table written" message? You should see this
> > exactly once. Do you see this multiple times, especially when switching
> > kernels between the good one and the bad one?
> > 
> > Sascha
> 
> Not exactly sure what you mean, but here is the dumps:
> 
> Before (mtd: rawnand: gpmi: Implement exec_op)
> [    3.389352] Bad block table written to 0x00001ffc0000, version 0x01
> [    3.399019] Bad block table written to 0x00001ff80000, version 0x01
> 
> After
> [    3.301096] Bad block table written to 0x00001ffc0000, version 0x01
> [    3.310599] Bad block table written to 0x00001ff80000, version 0x01

The Bad block table is written once. When you see this message multiple
times then this means that Linux can't read the BBT and writes it again.
So the question is: Start the good kernel multiple times. Do you see
this message once or on each boot? Then start the bad Kernel multiple
times. Do you see the message once or on each boot?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
