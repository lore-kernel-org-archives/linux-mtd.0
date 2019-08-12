Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98944C31E40
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 19:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D2B20673
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 19:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAom8rdV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D2B20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qyd+eQo9lAmcCWkMxJASE3vYHCf9WMZyjA/YQrZo5gc=; b=XAom8rdVBwiSBZ
	kFlL/msrGRySja495zg0LRGlqG4MH3Mh/kch78wQL9xCrmSt391Ur8gG8RY4uw/NDyZBBFf+IxEMB
	FJMmTg+qUQ1x/cSkkQSxI9XHAYlZTDz52posUBiGe6tTRsZYQHf/RuN9bxmK6+3J8f/07N9GXJkVD
	VBdZ31ax4EvVZIEcAhKkO5rlLyXYTyUnxH6hpIhYLqra68HgLRcfUygC2sva+VyBk3Dox5cNvUlD7
	wwcslWqyZoFlMY6OejDiyGg5UxENMFC9zVHKIGlO4yDJBS5oYowx4hG3KSOLclKlECHq8Fr0ivWSR
	xiRwVwf/6P0olIx39NKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxGQ3-0004Pd-51; Mon, 12 Aug 2019 19:55:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxGQ0-0004P5-AY
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 19:55:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0E9EC6119B47;
 Mon, 12 Aug 2019 21:55:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id olv2A2vDsvKi; Mon, 12 Aug 2019 21:55:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BFEEB6119B7C;
 Mon, 12 Aug 2019 21:55:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qAHqHZW32J3C; Mon, 12 Aug 2019 21:55:37 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 995186119B47;
 Mon, 12 Aug 2019 21:55:37 +0200 (CEST)
Date: Mon, 12 Aug 2019 21:55:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Han Xu <xhnjupt@gmail.com>
Message-ID: <411166061.63863.1565639737497.JavaMail.zimbra@nod.at>
In-Reply-To: <CA+EcR23V1nP9d6iYysT6vR+n8-BRnU-vursaxvcGB1LdBy+8NQ@mail.gmail.com>
References: <AM6PR04MB496741DA4839DC07450F3E3997150@AM6PR04MB4967.eurprd04.prod.outlook.com>
 <CAFLxGvwZ_85eR5Qkjka4CyDOAP_jw-hpk7WwttbAzjLFS4MavQ@mail.gmail.com>
 <CA+EcR23V1nP9d6iYysT6vR+n8-BRnU-vursaxvcGB1LdBy+8NQ@mail.gmail.com>
Subject: Re: 5.2.0-rc1 UBIFS bad unlock balance
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: 5.2.0-rc1 UBIFS bad unlock balance
Thread-Index: FSIvKhkFdmoVgwf6XyFt4+BIL/3lvA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_125548_516100_804DDDC7 
X-CRM114-Status: UNSURE (   4.09  )
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
Cc: Han Xu <han.xu@nxp.com>, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBJIHNlZSB0aGUgYnVnLCB0aGFua3Mg
YSBsb3QgZm9yIHJlcG9ydGluZyEKPj4gQnV0IGl0IGlzIG5vdCBpbiA1LjItcmMxLCB0aGUgYmFk
IGNvbW1pdCBpcyBzbyBmYXIgb25seSBpbiBsaW51eC1uZXh0Lgo+IAo+IFBpbmcsIGFueSBmaXhp
bmcgcGxhbnM/CgpIdWg/IFRoZSBiYWQgY29tbWl0IHdhcyBkcm9wcGVkLiBBcmUgeW91IHN0aWxs
IHNlZWluZyB0aGlzIG9uIExpbnVzJyB0cmVlPwpNYXliZSBzb21ldGhpbmcgZWxzZSBpcyBiYWQu
CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
