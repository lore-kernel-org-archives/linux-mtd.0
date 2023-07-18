Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122ABEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFhnldBpSi3sX9/21xC/hq1s27aWGO5lG7r4HvwNcZc=; b=BoG8IL5+wSBPIJxIOMbvGwpD33
	cLR7WiGdG9l7My0PLQJ7zqwbfHFdujTMcA986PnkFzf73Wa/Jpuaw/clFYPV4vpByeuCm1lTyrfi8
	27kVMKhgo77yawPpxRifd4u0bsECiLtBL7SOpyuUtOt2j82igTg6/cpL1t1OG/cmWT6OaPVrfTphR
	kMuj3vxRm4uXTKlm3n+QSOuyqJJ9mPDc2p09IK31Yp5fod3j/E0OtpqD4T1ydXubQs50W7W5/zpMj
	cBzWCvnlvFLnbzkzWY8yXKiEuXq4BKQauDq22u6bUfVncdDf2Z1hDsB7AfOI2wBM3CIUAh7CrBHHu
	4xLbHx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM171-005zJ6-2l;
	Wed, 19 Jul 2023 06:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM16w-005zDj-2u
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v4SBXoVwuzLZBjyBRWdVUzfBu7mTaGP8lodd6f21ilk=; b=PfRJcmRFC0lxTJq65dZnj5Be1h
	l8EwGvAKtvffUaQQ7CYYikmRIKl1ky1ow//9cmAyppl9KCpChw0PxiJJ7/336+0AeVZqipBor1Mhc
	QLbGUdsHQjh5lJq0e6lbZcyAA7c3HRaxSIURhTMP7YGK+jCH/P98WGPf10U/O61vgsFHsAFJ+koMq
	n/cYVL3qzi7Z9fUlIX5jYe+4gFlAqavGGv/yPFLJmkuSlo2g+9de9uwcqLJG/CgURYuXYGhdxNleE
	g+tsZ7YMhRlIsgqkDM0wFmV5HWEIgS5imoTAbVjxKfkEtpuzQWyHgkOK+rl5jS0lUHvWddNfCFMVZ
	tb7rTaTA==;
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLg93-00BJDx-10
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 08:33:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C0E71126;
	Tue, 18 Jul 2023 10:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689669159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4SBXoVwuzLZBjyBRWdVUzfBu7mTaGP8lodd6f21ilk=;
	b=GLlwLbLUrdFeCqJ7kKhU1jMXQq9lYv+sVjOXbUz/X4v2NXz+pVjy/KynohNRGSD/U9n1qH
	y4ksz0MuaD+NS5StRfCcVrbIjXxLwzne2AbaxeHUwL2l5ilnL9GqVDZBpVU2p9mhgM2WmR
	EPbqsc2B9V4Vl832ejXLMQrUaKP42ipBkGJst6awN7TcDO44cFIZN6zLRsyuf6evKV3O53
	MjdXn46moZmMKtyoGgefaiT+6pCEEcKONJlIkSKdTQteFz9q42+3X/28G356/+qcpSEeBa
	TE0qmwHX4Xhm74wWR1HE7zLxuVd0R+asM0xzZCdY4Ne/DaGMZuLGd5egQ77GBg==
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 10:32:39 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
In-Reply-To: <2d71326c-023e-69af-9337-62672f50fed9@linaro.org>
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
 <0525440a652854a2a575256cd07d3559@walle.cc>
 <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org>
 <e642ff27fd0bc0f1f0e293972145f680@walle.cc>
 <2d71326c-023e-69af-9337-62672f50fed9@linaro.org>
Message-ID: <62083227d40d7b631c2eeac1e40c6b56@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_093321_507135_07EF8EE3 
X-CRM114-Status: GOOD (  44.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4gSm9rZXMgYXNpZGUsIGJhc2ljYWxseSB5b3UgYXJlIHNheWluZyB0aGF0IGlmIHRoZXJlIGFy
ZSB0d28gZmxhc2hlcwo+PiB3aXRoIHRoZSBzYW1lIGlkLCBvbmUgc3VwcG9ydHMgSkVERUMgb25l
IGRvZXNuJ3QsIHdlIGNhbiBicmFrZSB0aGUKPj4gbGF0dGVyIG9uZS4KPiAKPiBJIHNheSBJIGRv
bid0IHdhbnQgdG8gc3VmZm9jYXRlIHRoZSBjb2RlIGJhc2VkIG9uIGFzc3VtcHRpb25zIGFuZCBJ
J20gCj4gcmVhZHkKPiB0byB0YWtlIHRoZSByaXNrIGFuZCBicmVhayBzb21lIHByZXN1bWFibHkg
b2xkIGZsYXNoZXMgdGhhdCBkb24ndCAKPiBzdXBwb3J0Cj4gU0ZEUC4gSWYgd2Uga25vdyBmb3Ig
c3VyZSB0aGF0IHdlIGJyZWFrIG9sZCB2YXJpYW50cyBvZiB0aGlzIGZsYXNoIElELAo+IHRoZW4g
d2UgaGF2ZSB0byByZXdvcmsgdGhlIGNvcmUgbm93LiBPdGhlcndpc2UgSSdsbCByZXdvcmsgaXQg
d2hlbiBhIAo+IGJ1Zwo+IGlzIHJlcG9ydGVkLgoKT2ssIGZhaXIgZW5vdWdoLgoKPj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEspIH0sCj4+Pj4gCj4+Pj4gVGh1cywg
SSdkIGFsc28ga2VlcCB0aGlzIG9uZS4KPj4+PiAKPj4+IAo+Pj4gS2VlcGluZyB0aGlzIG9uZSBk
b2VzIG5vdCBoYXZlIHRoZSBlZmZlY3QgdGhhdCB5b3Ugd2FudCBhcyBTRUNUXzRLIGlzCj4+PiB1
c2VkIGluIHNwaV9ub3Jfbm9fc2ZkcF9pbml0X3BhcmFtcygpIHdoaWNoIGlzIG5vdCBjYWxsZWQg
d2hlbgo+Pj4gUEFSU0VfU0ZEUCBpcyBzZXQsIHdoaWNoIG1ha2VzIHBlcmZlY3RseSBzZW5zZS4g
TGV0J3MgZHJvcCB0aGlzIGFuZCAKPj4+IGlmCj4+PiBidWdzIHdpbGwgYmUgcmVwb3J0ZWQsIEkg
Y29tbWl0IEknbGwgZml4IHRoZW0gaW4gdGhlIHNhbWUgcmVsZWFzZSAKPj4+IGN5Y2xlLgo+PiAK
Pj4gTWhoLCBJIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBjdXJpb3VzIHRvIHdoeSBMaW51cyBuZWVk
ZWQgdGhlIAo+PiBQQVJTRV9TRkRQCj4+IGZsYWcgaW4gdGhlIGZpcnN0IHBsYWNlLiBUYWtpbmcg
YSBjbG9zZXIgbG9vaywgdGhhdCBpcyBiZWNhdXNlIGluIHRoZQo+PiBsZWdhY3kgYmVoYXZpb3Is
IHRoZSBTRkRQIGlzIG9ubHkgcmVhZCBpZiB0aGUgY2hpcCBzdXBwb3J0cyBkdWFsIG9yCj4+IHF1
YWQgcmVhZCAod2hhdGV2ZXIgdGhlIHJhdGlvbmFsZSB3YXMgZm9yIHRoYXQpLgo+IAo+IGR1YWwg
b3IgcXVhZCByZWFkcyBhcmUgcGFyYW1zIHRoYXQgY291bGQgYmUgZGlzY292ZXJlZCBpbiB0aGUg
Zmlyc3QgCj4gdmVyc2lvbiBvZgo+IFNGRFAsIHRoYXQgd2h5IHRoZXkgYXNzb2NpYXRlZCB0aGVt
IHdpdGggcmVhZGluZyBTRkRQLiBOb3QgZ3JlYXQsIGJ1dCAKPiBpdAo+IHdvcmtlZC4KPiAKPj4g
Cj4+IEFsc28sIGlmIFBBUlNFX1NGRFAgaXMgc2V0LCBub25lIG9mIHRoZSBub19zZmRwX2ZsYWdz
IGFyZSBldmVyIAo+PiBoYW5kbGVkLgo+PiBJZiB0aGUgY2hpcCBkb2Vzbid0IHN1cHBvcnQgdGhl
IFNGRFAgaXMgd2lsbCBqdXN0IGZhaWwgcHJvYmluZy4KPj4gCj4+IEFzIEknbSByZWFkaW5nIHRo
ZSBjb2RlIHJpZ2h0IG5vdywgZm9yIHRoZSBuZXcgYmVoYXZpb3IKPj4gaXQgaXMgZWl0aGVyCj4+
IMKgKiBleHBlY3QgdGhlIGZsYXNoIHN1cHBvcnRzIFNGRFAsIGlmIG5vdCwgcHJvYmUgZmFpbHMK
Pj4gwqAqIGV4cGVjdCB0aGUgZmxhc2ggdG8gZG9uJ3Qgc3VwcG9ydCBTRkRQLCBubyBTRkRQIGlz
IGV2ZXIgcmVhZCBhdCBhbGwKPj4gCj4gCj4gc29ydCBvZi4gSXQncyBtb3JlIGVsYWJvcmF0ZSB0
aGFuIHRoYXQuIENoZWNrIHNwaV9ub3JfaW5pdF9wYXJhbXMoKS4KCkkgaGFkIGNoZWNrZWQgdGhh
dC4gQW5kIHRoZXJlIGlzIGVpdGhlciBwYXJzZV9zZmRwID0gdHJ1ZSwgd2hpY2ggd2lsbApmYWls
IGlmIFNGRFAgaXMgbm90IGF2YWlsYWJsZSAtIG9yIFNQSV9OT1JfU0tJUF9TRkRQLCB3aGljaCB3
b24ndCBoYW5kbGUKU0ZEUCBhdCBhbGwuIEFuZCB0aGVuIHRoZXJlIGlzIHRoZSB0aGlyZCBjYXNl
IHdoaWNoIHdpbGwgaGFuZGxlIGxlZ2FjeQpiZWhhdmlvci4gU28gd2hhdCBhbSBJIG1pc3Npbmc/
ICkKCj4+IFNob3VsZG4ndCB3ZSBoYW5kbGUgdGhlIHRoaXJkIGNhc2UgaW4gdGhlIG5ldyBiZWhh
dmlvciwgdG9vOgo+PiDCoCogc3RhcnQgd2l0aCB0aGUgc3RhdGljIGRhdGEgd2UgaGF2ZSBhbmQg
dHJ5IHJlYWRpbmcgU0ZEUCB0byAKPj4gYW1lbmQvY29ycmVjdCBpdC4KPiAKPiBUaGlzIGNhc2Ug
aXMgYWxyZWFkeSBzdXBwb3J0ZWQgYW5kIGl0J3MgdGhlIG9sZCB3YXkgb2YgaW5pdGlhbGl6aW5n
IAo+IGZsYXNoCj4gcGFyYW1ldGVycy4gQ2hlY2sgc3BpX25vcl9pbml0X3BhcmFtc19kZXByZWNh
dGVkKCkuCgpCdXQgaXQncyBub3QgZW5jb3VyYWdlZCBmb3IgbmV3IGZsYXNoZXMgYW5kIGl0IGRv
ZXNuJ3Qgd29yay4gT3RoZXJ3aXNlCndlIHdvdWxkbid0IGhhdmUgYSBwcm9ibGVtIGhlcmUuIEl0
IChzdXByaXNpbmdseSEpIG9ubHkgcGFyc2VzIFNGRFAKaWYgdGhlIGR1YWwgb3IgcXVhZCBmbGFn
cyBhcmUgc2V0LgoKPiBJIGRvbid0IHdhbnQgdG8gZG8gdGhhdCBmb3IgdGhlIFNGRFAgY2FwYWJs
ZSBmbGFzaGVzIGZvciBub3csIG90aGVyd2lzZQo+IHdlJ2xsIGhhdmUgYWdhaW4gcGFyYW1ldGVy
cyBpbml0aWFsaXplZCBhbGwgb3ZlciB0aGUgcGxhY2UsIHdoaWNoIAo+IHJlc3VsdHMKPiBpbiB1
Z2x5IGhhcmQgdG8gcmVhZCBjb2RlLiBZb3UgaGF2ZSB0aGUgZml4dXAgaG9va3MgaWYgeW91IG5l
ZWQgdG8gCj4gYW1lbmQgU0ZEUAo+IGRhdGEuIEFuZCBzaW5jZSB0aGUgZmlyc3QgdGFibGUgb2Yg
U0ZEUCBpcyBtYW5kYXRvcnkgKEJGUFQpLCBpZiB5b3Ugc2V0IAo+IFBBUlNFX1NGRFAKPiBhbmQg
Z2V0IGFuIGVycm9yLCB0aGVuIHlvdSBzaG91bGRuJ3QgaGF2ZSBzZXQgUEFSU0VfU0ZEUCBpbiB0
aGUgZmlyc3QgCj4gcGxhY2UuCgpVbmxlc3Mgb2YgY291cnNlIHRoZXJlIGFyZSBmbGFzaGVzIHdp
dGggdGhlIHNhbWUgaWQgd2hlcmUgb25lIHN1cHBvcnRzClNGRFAgYW5kIGFub3RoZXIgZG9uJ3Qu
IEJ1dCBhcyB5b3Ugc2FpZCwgd2UgY2FuIGhhbmRsZSB0aGF0IG9uZSBpZiB0aGVyZQppcyBhY3R1
YWwgYnJlYWthZ2UuIEknbSBmaW5lIHdpdGggdGhhdC4KCj4gT3B0aW9uYWwgU0ZEUCB0YWJsZXMg
cmV0dXJuIHZvaWQgYW5kIHdlIGhhdmUgYSByb2xsYmFjayBtZWNoYW5pc20gZm9yIAo+IHRoZSBw
YXJhbWV0ZXJzCj4gc2V0IGluIHRob3NlIG9wdGlvbmFsIHRhYmxlcyBpbiBjYXNlIG9mIGVycm9y
cy4KPiAKPj4gCj4+IElmIG5vdCwgd2lsbCB5b3UgYWNjZXB0IGJyZWFrYWdlIGZvciBmdXR1cmUg
Zmxhc2hlcywgdG9vPyBMb29raW5nIGF0IAo+PiB3aW5ib25kLmMKPj4gZm9yIGV4YW1wbGUsIEkg
Z3Vlc3MgYWxsIGNoaXBzIHdpdGggMHhlZjQwLi4gMHhlZjUwLi4gYW5kIDB4ZWY2MC4uIAo+PiBz
dXBwb3J0cwo+PiBTRkRQIG5vd2FkYXlzIGFuZCBtb3N0IG9mIHRoZW0gb25seSBoYXZlIFNFQ1Rf
NEsgc2V0Lgo+IAo+IEkgd2lsbC4gTm90ZSB0aGF0IHlvdSBoYXZlIHRvIGFjdHVhbGx5IGhhdmUg
YSBwaHlzaWNhbCBmbGFzaCB0byBkbyAKPiBjaGFuZ2VzLAo+IEkgZG9uJ3QgcXVldWUgdW50ZXN0
ZWQgcGF0Y2hlcy4KPiAKPj4gCj4+PiBJZiBib3RoIG9mIHlvdSBhZ3JlZSwgSSdsbCBhbWVuZCBM
aW51cydzIHY0IHBhdGNoIHdoZW4gYXBwbHlpbmcuCj4+IAo+PiBTbyBpdCB3b3VsZCBiZSB0aGUg
Zmlyc3QgY2hpcCB3aXRob3V0IGZsYWdzIGF0IGFsbD8gVGhlbiB3ZSBjb3VsZAo+PiBkcm9wIHRo
ZSBlbnRyeSBlbnRpcmVseSA6KSBBbmQgaWYgd2UgZG8gdGhpcywgdGhlbiB3ZSBzaG91bGQgYWxz
bwo+IAo+IE5vLCB5b3UgaGF2ZSB0aGUgbG9ja2luZyBmbGFncyB0aGF0IGNhbid0IGJlIGRpc2Nv
dmVyZWQgYnkgcGFyc2luZyAKPiBTRkRQLAo+IHRodXMgeW91IG5lZWQgdG8gZGVmaW5lIGEgZmxh
c2ggZW50cnkgZm9yIGl0LgoKQWgsIHJpZ2h0LCB0aGV5IHdlcmUgYWRkZWQgOikKCj4+IGRyb3Ag
YWxsIHRoZSBvdGhlciBlbnRyaWVzIGZvciB0aGUgbmV3ZXIgd2luYm9uZCBmbGFzaGVzLgo+IAo+
IElmIHlvdSBjYW4gdGVzdCBpdCwgYW5kIHRoZXJlJ3Mgbm8gZGVkaWNhdGVkIGNvbXBhdGlibGUg
Zm9yIHRoYXQgZmxhc2gsCj4gSSdtIG9rIHRvIGRyb3AgdGhlbS4KCkkndmUgaGFkIGEgbG9vayBh
dCB0aGUgZGVkaWNhdGVkIGNvbXBhdGlibGVzLCB0b28uIFRoZXkgYXJlIG9ubHkgbmVlZGVkCmZv
ciB0aGUgc3BpIGNvcmUgdG8gcHJvYmUuIEJ1dCBpZiBJIHJlYWQgdGhlIGNvZGUgY29ycmVjdGx5
LCBpdCBzaG91bGQKd29yayBqdXN0IGZpbmUgd2l0aCB0aGUgZ2VuZXJpYyBkcml2ZXIgKGV2ZW4g
aWYgaXQgaXMgcHJvYmVkIGJ5Cm5hbWUpLiBSaWdodD8KCj4+IAo+PiBJZiB5b3UgZGVjaWRlIHRv
IGJyZWFrIG9sZGVyIGZsYXNoZXMsIHRoZW4gSSdkIHByZWZlciB0byBhbHNvIGRyb3AKPj4gdGhl
IG5fc2VjdG9ycyBhbmQgc2VjdG9yX3NpemUsIGkuZS4gSU5GTygweGVmLi4uLiwgMCwgMCwgMCku
Cj4+IAo+IAo+IElzbid0IHY0IGFscmVhZHkgZG9pbmcgdGhpcz8gSSdsbCBhbWVuZCBpdCBpZiBu
b3QuIFdhaXRpbmcgZm9yIGFjayBmcm9tCj4gYm90aCB5b3UgYW5kIExpbnVzLgoKRldJVywgSSdt
IGZpbmUgd2l0aCB0aGUgcmVtb3ZlZCBub19zZmRwX2ZsYWdzIGlmIElORk8oLCAwLCAwLCAwKS4K
Ci1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
