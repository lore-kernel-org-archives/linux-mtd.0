Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D1ECDE001
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2026 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8EGtB8L7uBQlOVhw35Ei/rffj2Lw+Ucl48c135eBWuM=; b=xEnAR3LgRGSIzCa9kyl70xjyHl
	cSNkDp43xae/HS4TnpTzQgfHlw4P4/kmXH9i7qHvNhwIBbqjjr0XpCo2WtbPgEX12JrtB0w5Xk4Qb
	ips+LqPrmkMux9TeR6tISe0p9GnIVLA7hyE3LHBJj3MbmMQBlC1koqua9Z2NLr9KNU3icRQLw76Ie
	yy50MMhigKQGq5aqLS+OEEpLgWjCtRvUC3qkKzN9+sQ/r3s3YDX41oLQiKLAtmxdLgIC+YjD0Zeg9
	K7Kj4plYQp8QZVC5BPTs6Q10UHDz1wIeXI157V0IEQXR2sBFHGVb7ZcLfm0RDT9ADOJJdTMftb2HE
	ZHq4/5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckne-00000009IVk-2AWv;
	Thu, 25 Jun 2026 14:11:26 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckna-00000009IR0-1d69
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jun 2026 14:11:24 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 140797A0119;
	Thu, 25 Jun 2026 10:11:19 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 25 Jun 2026 10:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782396678;
	 x=1782483078; bh=irN3hpLEXejWK47u9zWCVY1FdJn2peRwQ/2YusrqX1w=; b=
	mv7OtS+MrEqVqqZ5hmp8tjhVGXHh9w8i6jWHnDyFSBlXy3iNjC2zctGTU28sedRH
	P3vstekHqhHGjeiGSV76pL7Lyor7OQStqpQGFlW0x94qHLGesjMckkApAQzeKoIj
	Xa2r05bTjRHsOKi6JYtp9Z8OE7TmjBa+XZxJSNePrODn/vTMsjwVUtiQ2kE7EusD
	bb5FK/JHjP6pkTCYT90kPo37Es5iiy5es9BapojuvvsDUJoIAkBsVdpBNhPQWPsl
	wu6dE3j8GwVPIgt9nbluQdaCyQeOL965Zn6i0kLavdtypOpcf3Efjb2iGT1j5+Jg
	bG/64udVrHkCd/UQ78M1NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782396678; x=
	1782483078; bh=irN3hpLEXejWK47u9zWCVY1FdJn2peRwQ/2YusrqX1w=; b=a
	P2ieQEPhs29/cYFHxxm7t9JdiWuLnrLsufiS48qpQ6ob+Kqa2F7kCvs14czosiMk
	19Lc/0pmAwtP9H1Y56RYJPDuFzpT8Aqj5PB+jSIdLldjpR+OyvgZT8p2HyDvoYvC
	bwqmFMLG2uRSn5kSM1dbkqY3gWrOhSvQiPQVXC+qRSN47UtHp3xeG4/vWd8QKJ4e
	66AfIXViUySpOotjx3clL/QHIJQLDbP8CaA8FFU4reWx6kfhWBEBESxjQm52ORPf
	YNNV9hAPIIA8qMXz1gq6wStP3bHOtVDW8BTVXLUm+iDtmP4hVjV40fhfn8dDLRES
	NH7HxijcBzg/1mSp3Dr1Q==
X-ME-Sender: <xms:BDc9akJP64MtvgBxIixdgKfJbXsRWeEam5jd8biA2x9Kp0LKE37X1g>
    <xme:BDc9au_ezLweH4jeS409EDCsCd07wkzKIf0TOgDNS49heYL23b4bSv-nlvLqKQ1ya
    rFNqljJ9FhpdbBrqDqgJV03YSqCYs9WsWtQHzBvq27l7F_8SnMapuM>
X-ME-Proxy-Cause: dmFkZTGxqXUJ95yTHOhxnRhvFHQR9BUBrL3WFwu80qqbXrbatc/jWu1+hNaAbrLA/Vt+ag
    wzDsog94ra4FMh51/djXKoyqNNxUvcZTanJsAPJbZQiyRH+0qil65RNMbRvzqRusgtFWA7
    jEuhBr2zi+Tc5br/nACAHSRGxU/x0RC7m0qdPM9xIFXfgg8I0l31GlPX/+D2+J5iNPdiIZ
    cFDv4pXTsQ+7QlHOxrna7r0RXd6OzPGb/dgAd3Xf3vicOW1yUBkyWgfD88h0d1K83A6YpT
    iZ5ANStVsrLWTQD4co1WPP/+2JHHb1w3d1mmtMl4oNut2r74XFJhdy4jKtoT7cHsZNdDpX
    Q3aV7Id4pkmDGgAyjeNBJ5xF1Q8+rOJLAIkwVy16lt3tHbt+gPTkraRYJexb1cg74yBajM
    5cyTxn9Cu+zOyMtvJ9q0tTbeatjzq6a3EfcHOp7zcByvZlCqyYPZYgBOuNDRl6nfYpxt49
    T5WINCKbGCBOc2FJo88YIGKqI2U8M7gWsRJjgCzWCEdyTpBKQa6xBYhHHuPPpY8qJokSBQ
    W/z46MNhzV7z3Cdbhr+HKTOBWnnJrjY5pv2sLeHqVovP13Ik1Wk83dY7UGlTbwyMdhwrhA
    Q3xbRs9GYzYHa9A8HxXBSsNY2QNQTGXinpAJybWlS1PRODpNsTvyN8YFYcAw
X-ME-Proxy: <xmx:BDc9agEn5LnvaM2CVE-wW5qRlog8evd8jL5IF20OtPSJDPm2vwGfCA>
    <xmx:BDc9avv_hUZAC8qXgBQhNAwoZH03NxD3elSBn2fHnFiChUK2hKvN-A>
    <xmx:BDc9amahXY1v53czDkXWqkFUa4S9g0NS-vbrqejPwk5qlIinjdJ9wA>
    <xmx:BDc9av77VPOxH2OVN_ngSUxq64tqjoGjJ763UuN7y18cD55YZ63FAw>
    <xmx:Bjc9ajc2uGjin6OqW-SWB7us2wYgW87X5onElJVzHCMo0nXUplI6k3gv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F0890182007E; Thu, 25 Jun 2026 10:11:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASdx1_WPg8_k
Date: Thu, 25 Jun 2026 16:10:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Ungerer" <gregungerer@westnet.com.au>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Randy Dunlap" <rdunlap@infradead.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Message-Id: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
In-Reply-To: <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_071122_829767_435A6944 
X-CRM114-Status: GOOD (  16.64  )
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

On Thu, Jun 25, 2026, at 14:07, Greg Ungerer wrote:
> On 26/5/26 20:32, Arnd Bergmann wrote:
>
> It is used on some ColdFire platforms, and was working all the way up
> to being removed in the current merge window.
>
> The ColdFire platform startup code (arch/m68k/coldfire/head.S) has a
> somewhat unusual setup that can copy an attached filesystem blob to
> _bss_stop, and this is one of the places the uclinux.c map driver can
> use as the filesystem memory address. From uclinux.c
>
>      static int __init uclinux_mtd_init(void)
>      {
>          struct mtd_info *mtd;
>          struct map_info *mapp;
>
>          mapp = &uclinux_ram_map;
>
>          if (physaddr == -1)
>                  mapp->phys = (resource_size_t)__bss_stop;
>          else
>                  mapp->phys = physaddr;
>
> No out of tree code is required. Most of the ColdFire defconfigs have
> CONFIG_MTD_UCLINUX enabled, since it is commonly used.

I see, this is surprising from reading the source and
git history, but I can see exactly how it got there.

So this is not actually a device but rather a replacement
for CONFIG_BLK_DEV_INITRD that does can work with CONFIG_BLOCK=y,
right?

> Can we get this reverted?

Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
can you just apply one with Greg's explanation and my Ack?

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
