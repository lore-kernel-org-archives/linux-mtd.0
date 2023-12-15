Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4080C35274
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwj+hHYZtPkzKNtjuHC6hXK5ugTzOFhkMfjYGc/7eBg=; b=r2/Eev4RYE4Hnv
	1r8jbLm3nhtuckeLEx/dOmThA2qTGZDtZYrhXg1HpXs5j2DIgjSRtd4AFyeGiaa5yrbkii+KB4/K9
	6sQ/dkSx36rzxnqMbcTq0lbCNJZ7yBx4hPjy+o2I1g+wyAckg11JGD4YuLTl9MV+UstQjK/tj8VxM
	0eBevyLFEcKlWR9FudJb+rB+GpJXjE2Qm39u9SgiRNbFVJ4lAzkb9JNHqGlIJ50ZBMec+zetXbNbW
	AdFgJvqqqdZW/MIO62b6KYKzCS/Hz2gsOkVqyqRax2eFaG2RilaXVdFtvpb3BGzSOAhMryObjcF84
	P96piASaU+kVXiMMnwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE72B-003B1c-0u;
	Fri, 15 Dec 2023 12:11:15 +0000
Received: from forward500b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE726-003Ayg-1Q
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:11:13 +0000
Received: from mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net [IPv6:2a02:6b8:c00:2fa5:0:640:c484:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTP id 9850561127;
	Fri, 15 Dec 2023 15:11:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xAkSiXC7ZCg0-EBrPXiGt;
	Fri, 15 Dec 2023 15:11:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1702642261; bh=lZeX91pSyKjX9MalpRfW5x58QbhpjjA4uel8bsqd38c=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=bASdyfDLxjkqXLdON+HHxDpFfxAXEzhcyAv3Z+h0zfaMznOphofMOWzjoKiA9Zfnb
	 SvbzcJniuSh/kiEFiW3x54JWrzvou066XphnW7NbyI3CAj0rYB/iW9WRmhdOszMhrI
	 36jRHfapqAd/YWmv0vybVncvE0IhpD71I0hgV4hU=
Authentication-Results: mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <4a47fe75a4df63e732d0d4bacef279cc91288d1f.camel@maquefel.me>
Subject: Re: [PATCH v6 20/40] mtd: rawnand: add support for ts72xx
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Nikita Shubin via B4 Relay
	 <devnull+nikita.shubin.maquefel.me@kernel.org>, 
	u.kleine-koenig@pengutronix.de
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>, Linus Walleij
 <linus.walleij@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Date: Fri, 15 Dec 2023 15:11:02 +0300
In-Reply-To: <20231215111648.196c0c46@xps-13>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
	 <20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
	 <20231215111648.196c0c46@xps-13>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_041111_539833_63A14F21 
X-CRM114-Status: GOOD (  11.14  )
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

SGVsbG8gTWlxdWVsIGFuZCBVd2UuCgpPbiBGcmksIDIwMjMtMTItMTUgYXQgMTE6MTYgKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgTmlraXRhLAo+IAo+IGRldm51bGwrbmlraXRhLnNo
dWJpbi5tYXF1ZWZlbC5tZUBrZXJuZWwub3JnwqB3cm90ZSBvbiBUdWUsIDEyIERlYwo+IDIwMjMK
PiAxMToyMDozNyArMDMwMDoKPiAKPiA+IEZyb206IE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHVi
aW5AbWFxdWVmZWwubWU+Cj4gPiAKPiA+IFRlY2hub2xvZ2ljIFN5c3RlbXMgaGFzIGl0J3Mgb3du
IG5hbmQgY29udHJvbGxlciBpbXBsZW1lbnRhdGlvbiBpbgo+ID4gQ1BMRC4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KPiAK
PiBJJ20gZmluZSB3aXRoIHRoaXMgdmVyc2lvbiwgSSBjb3VsZCBjb2xsZWN0IHBhdGNoZXMgMTkg
YW5kIDIwIHRocm91Z2gKPiBtdGQgYnV0IEkgc2F3IG5vIGNsZWFyIGFuc3dlciB0byB0aGUgY292
ZXIgbGV0dGVyLCByZWdhcmRpbmcgd2hvCj4gc2hvdWxkCj4gcGlja3VwIHRoZSBwYXRjaGVzLiBM
ZXQgbWUga25vdyB3aGF0IHlvdSBwcmVmZXIuCgpUaGlzIGlzIHN0aWxsIHBsYW5uZWQgZ29pbmcg
dmlhIGFybS1zb2MgYnJhbmNoLCBhcyB0aGVzZSBwYXRjaGVzIGFyZQpwcmV0dHkgdXNlbGVzcyB3
aXRob3V0IGVwOTN4eCB0b3RhbGx5IGNvbnZlcnRlZCB0byBkZXZpY2UgdHJlZS4KCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
