Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A21BC43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 11:59:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A112100A
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 11:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hkdqd2Po"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A112100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9qt+oTsLIzEpQuOaVgfaf8F0SG73RtG9AGhkIRCYLcM=; b=Hkdqd2Poq4K5BxKbu2uIBgGTT
	idnxRHs5ex2PDIZimdShk4QAN2MTPUY+rqI4/coO/pRvAz0l1f+LAZB9ZW19j48cfPcaTIWWmTRb+
	gukFBGaPrC7NinIQydyQ4c4l/xc1lNbICr6IZukkGk0AO1+tBlMQxC2wcHktxIpu7YjPrC0wZ1Hvo
	joJW5wcKc1zoVvI4zC93IBQ7RPx6ZRqG1xlV3koskcEUhUrh38++XGFhlJ0gYLF1VwJzL32qZn3jZ
	1o5s6eCUbsF4VfA1iM33784rAnbw8zwEosMMC6NxNWMNjFJoAV/7IcAIUTUl4pmiX7uWSTwEZoH+r
	Tno9o4hPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJF1r-0007L0-N9; Fri, 18 Sep 2020 11:58:15 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJF1o-0007K8-HH
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 11:58:13 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D787660072;
 Fri, 18 Sep 2020 11:58:08 +0000 (UTC)
Date: Fri, 18 Sep 2020 13:58:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL] mtd: Fixes for v5.9-rc6
Message-ID: <20200918135806.00b76de3@xps13>
In-Reply-To: <c6965ad6-7d32-7dd9-21f8-346cfa634147@ti.com>
References: <c6965ad6-7d32-7dd9-21f8-346cfa634147@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_075812_680331_E783096C 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+IHdyb3RlIG9u
IEZyaSwgMTggU2VwIDIwMjAKMTY6MTM6NDcgKzA1MzA6Cgo+IEhlbGxvIExpbnVzLAo+IAo+IFBs
ZWFzZSBwdWxsIHRoZSBNVEQgY2hhbmdlcyBmb3IgdjUuOS1yYzYuCj4gCj4gSSBhbSBzZW5kaW5n
IHRoaXMgb24gYmVoYWxmIG9mIE1URCBtYWludGFpbmVycyBncm91cCB0aGlzIHRpbWUgYXJvdW5k
Lgo+IAo+IE1pcXVlbC9SaWNoYXJkLCAKPiAKPiBDb3VsZCB5b3UgcGxlYXNlIEFDSyB0aGUgUFI/
CgpJIGNvbmZpcm0gVmlnbmVzaCBpcyBhbGxvd2VkIHRvIHNlbmQgTVREIFBScy4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
