Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB50EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0XinADNrONb+Ez9h9lblVy1+2Tl6EwlJdZIgXFXF50=; b=d38qNf+vRdY5J0
	I64XoFLHHFJCSPQs40DRH0q3U3+S4Yq8FAibC+LACgxqgYP0nqJXpJv3WqnqYhfFQ6D7WFCMDeYfM
	tuyLC5e/qXK33C9qQKeCgUfrxNyTVx9m1HXurq3UdLmEvh+v7zA6PHiirqXVPbcHOnkjqeBubD1tq
	jjhL/HiJJI3Xfvjt14ofoKaB25CkCFOMTjUC3+Hay1V/rWQzWxqrg4QgVMSj8mcXlp6wZ8hhSZxs5
	mHv8/29eJ/PqZ/3fmYbXbWyX8d7wPKUPAmgeoofZ4pTTxJbC6lEivu4SzrCk83LioPLZ0GG0UQ3X5
	wHZoEbur6r86P+n/4Iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJfG9-000yQ5-1B;
	Wed, 12 Jul 2023 19:12:21 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJfG6-000yPL-0U
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 19:12:20 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:964:4b04:3697:f6ff:fe5d:314])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 36CJC4sB582186
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 20:12:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1689189119; bh=bAuupQqEj0rLd6YFhbA1xsWbLkHvKMPgSN/mA/Dnmbg=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=LWOE7r2s2p+WKjdWpcXHmtG8608u2duj7xx2SmOOArmvae5/9nitz75cEHWvEqLa0
	 2ur751xWyR9lEcSU4vIEzYKA37YQZWWKJX7fvzfQvClrFLcsB+y5QkLYdr6tH/99OD
	 n62xiCHH5iEpAkwx9NyQfxgd2si6uc8bTiPMHG+Y=
Received: from miraculix.mork.no ([IPv6:2a01:799:964:4b0a:9af7:269:d286:bcf0])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 36CJBxHN2295209
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 21:11:59 +0200
Received: (nullmailer pid 603544 invoked by uid 1000);
	Wed, 12 Jul 2023 19:11:59 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>, linux-fsdevel@kvack.org,
        ezequiel@collabora.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: MTD: Lots of mtdblock warnings on bootup logs
Organization: m
References: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
	<877cr5yzjc.fsf@miraculix.mork.no>
	<CAOuPNLhUtVtrOQQ1Z_rA0NAerG5PSfA26=hoenuCtCBDvz1CJA@mail.gmail.com>
Date: Wed, 12 Jul 2023 21:11:59 +0200
In-Reply-To: <CAOuPNLhUtVtrOQQ1Z_rA0NAerG5PSfA26=hoenuCtCBDvz1CJA@mail.gmail.com>
	(Pintu Agarwal's message of "Wed, 12 Jul 2023 23:55:41 +0530")
Message-ID: <87sf9tx7uo.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_121218_342085_5F750F57 
X-CRM114-Status: GOOD (  12.31  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UGludHUgQWdhcndhbCA8cGludHUucGluZ0BnbWFpbC5jb20+IHdyaXRlczoKCj4gWW91IG1lYW4s
IGlmIHNvbWVvbmUgaXMgdXNpbmcgIm1vdW50IC4uIC9kZXYvbXRkYmxvY2sqIiB0aGVuIG9ubHkg
d2UKPiBnZXQgdGhlc2Ugd2FybmluZ3MgPwo+IE9yLCBpZiBzb21lb25lIGlzIHRyeWluZyB0byBh
Y2Nlc3MgdGhlIG5vZGUgdXNpbmcgb3BlbigiL2Rldi9tdGRibG9jayoiKSAuCgpvcGVuKCkgd2ls
bCBjYXVzZSBhIHdhcm5pbmcuCgo+IEJ1dCBpbiB0aGlzIGNhc2UsIHRoZXJlIHNob3VsZCBiZSBv
bmx5IDEsMiwzIGVudHJpZXMgYnV0IGhlcmUgSSBhbQo+IHNlZWluZyBmb3IgYWxsIHRoZSBOQU5E
IHBhcnRpdGlvbnMuCj4gT3IsIGlzIGl0IHBvc3NpYmxlIHRoYXQgc3lzdGVtZC11ZGV2ZCBpcyB0
cnlpbmcgdG8gYWNjZXNzIHRoZXNlIG5vZGVzID8KCk1heWJlPyAgU29tZXRoaW5nIHRyeWluZyB0
byBmaWd1cmUgb3V0IHRoZSBjb250ZW50cyBvZiBhbGwgYmxvY2sgZGV2aWNlcwpwZXJoYXBzPyAK
Cj4gQ2FuIHdlIHVzZSB1YmlibG9jayBmb3IgbW91bnQgdWJpZnMgKHJ3KSB2b2x1bWVzLCBvciBo
ZXJlIHdlIGhhdmUgdG8KPiB1c2UgbXRkYmxvY2sgPwo+IFdlIGhhdmUgYSBtaXh0dXJlIG9mIHNx
dWFzaGZzIChybykgYW5kIHViaWZzIChydykgdWJpIHZvbHVtZXMuCj4gQ3VycmVudGx5LCB3ZSBh
cmUgdXNpbmcgdGhlIHViaWJsb2NrIHdheSBvZiBtb3VudGluZyBmb3Igc3F1YXNoZnMgYnV0Cj4g
bXRkYmxvY2sgbW91bnRpbmcgZm9yIHViaWZzLgoKSSBkb24ndCB0aGluayBpdCdzIHNhZmUgdG8g
dXNlIG10ZGJsb2NrIG9uIE5BTkQuICBXSGljaCBpcyB3aGF0IHRoZQp3YXJuaW5nIGlzIGFib3V0
LgoKCkJqw7hybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
