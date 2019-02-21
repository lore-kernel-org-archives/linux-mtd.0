Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D629AC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A31EF20842
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bGJdatNw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A31EF20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zt9oFpEk4nV7ZB6nmA+rOWKAeE6vKsbQjAdWrcE9WYI=; b=bGJdatNwUJqVDL
	DVen0puXHpTQfejVL0R4TzNz7D5e8sbehpA9t5Ru0rV2EW0iFCF7sFpiTf+fNvgGtZM6w9dxTutzS
	w5St/oa8AZmvAQ7TuXzGea36r6rxVhiUcb0QJ84E95fEnnEZhINRtBjrFSAx7zSb3nKoA1VTnEHtR
	Ns+v3ppd68jYh+cTyYVXP3hZY/WKGX2TiC1Q3Hdvfcru/lq3tz6s+oxA4NwYv7G6HqrNFHn4LkVCo
	NFgidPliDmCXgxjNyrgUTS2yGtYXTbUNv1ENEyN/ghKkkdMLhBvRHKcvQNhyJDFcgiiOn8dwzUjJX
	SXboImFrm6Uts9camJGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwjpt-00024n-UG; Thu, 21 Feb 2019 08:36:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwjpp-0001wc-RH
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 08:36:04 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gwjpn-0007xL-IY; Thu, 21 Feb 2019 09:35:59 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gwjpn-0005e6-1Y; Thu, 21 Feb 2019 09:35:59 +0100
Date: Thu, 21 Feb 2019 09:35:58 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: About protecting and unprotecting in spi-nor
Message-ID: <20190221083558.hphqtaflavieau6l@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_003602_037126_4A9AFD6C 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: kernel@pengutronix.de, Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I already mentioned the topic of this mail in the irc channel #mtd, but
I think it is easier to discuss it here.

In the past some developers at Pengutronix noticed several problems with
the code in the spi-nor driver that handles protecting blocks. The
result is that we effectively disabled all the logic implemented in
stm_lock() (making it a noop) and stm_unlock() (making it unprotect the
whole flash).

The problems I'm aware of are:

 - There are parts with three BP bits and others with four. The code
   only handles those with three.

 - The position of the optional TB bit (that selects locking from the
   bottom up instead of from the top down) differs between parts. The
   code only assumes a single position.

 - For some parts the smallest protection area is 1/16 of the device,
   others have 1/64 or 1/256. The code only handles 1/64.

 - The API to call the locking code is more flexible than the hardware
   capabilities. So with the API you can request an arbitrarily
   continuous range of blocks to protect (or unprotect) while most
   hardware can only work on some powers of two starting from the bottom
   or going up to the top. For both locking and unlocking the behaviour
   to handle non-matching requests is to not affect blocks out of the
   requested range and in doubt handle only a part of the requested
   area. The problem arising from that is that assuming a part that can
   lock 1/64 and a 1/32 from the top, the following can happen starting
   from an unlocked flash:

   	lock(last 1/64) -> success, last 1/64 locked
	lock(the last but one 1/64) -> success, last 1/32 locked
	unlock(last 1/64) -> -EINVAL

   So unless you have some domain specific knowledge the only chance to
   reliably unlock a certain area is to unlock the complete chip. Ditto
   for locking.

   IMHO the algorithm must be changed to have locking as is and
   implement unlocking such that after the call the requested range is
   unlocked (maybe unlocking more than requested). This might result in
   other surprises though if you rely on certain blocks being locked.
   But then you are in trouble already today.

I'd like to prove the first three items with some data sheets, but the
information which parts are affected didn't make it into the respective
commit in our trees, so I cannot provide it without some research. Maybe
you believe me without this prove or even noticed the same problems?

In my eyes it's questionable if repairing all that is sensible and I
wonder how the problems should be addressed. I tend to suggest using the
approach we chose: Make stm_lock() a noop and stm_unlock() unprotect the
whole chip.

What do you think?

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
