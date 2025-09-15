Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F32ACAC592
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Sep 2025 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oLeeRxDpylo6itmQ86BBP1ZKImF3sRdihz+gbYd24c=; b=dYm/eWePMf6c6x
	gPmv/bQmio/hCmqfkOnGuYyp/cM4h4sCa7pVfa4Xfn5XJHsuMY5qU1Bw4yQJl7Of4G5rSNsVwFxIU
	2pZ1PXECdjgd0ePchP0MAMkIhHVmzWcdnsFPKIgXXc7Y2AAV8L5vedQEINX/5BVLgNRLawYsEzPKg
	hl/Sk7hC4KdatsM2lVX964iv5GOzAtq6pBoEfRPPgCeFeBnkfWM3wcS/XTaTSUeNHHjllY5FF/fO/
	FfrKlADgMZ1GmHEWK3Baxl3EI0x3gma9lTMil7wo3nccR5ZAZT/avzuZZcKRd2tx2hIHb0UjJAy2N
	rzHaLJH+wybMGvs6nxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy86T-000000045aR-0MVR;
	Mon, 15 Sep 2025 12:14:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy86S-000000045aE-1fzx
	for linux-mtd@lists.infradead.org;
	Mon, 15 Sep 2025 12:14:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B47EE601A3;
	Mon, 15 Sep 2025 12:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CD7C4CEF1;
	Mon, 15 Sep 2025 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757938479;
	bh=Nplu63hbwvBurIHD5jSaAPK8bssNwOtDPm4uZIkdcjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iB6UEZviTQTBrbCphhfx+f5Xqf+5+w6w4FVFUh3BjpTQ9p2jvbKMoKvUSXBWeTxtI
	 jZwFarYj567+w3ww6g0FGXANmO/ObzoOhmSHDvvpf3Nn9CoxB3WNHJZM0smljj+QK1
	 f4P/40HI2ozQwZpvsO6SqRXdLD7O4SfPp8qwWGR2QQOZ6PhqpbCX0Z71ko4H+Y7fUV
	 OJZQx1gHH8I/ycU6SPDEroDadJuW6MPc58q9CMKb/rqTlPaSHVvEOjIs9e2zHRXWdm
	 H1dirV40CAw1EC3/Gh2t2Y5gVUtfzZw0GfKDx6ylUsuCsriii78M2Kd0TfbJhfZcZT
	 FWMbErye35k4A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Kang.Kerry =?utf-8?B?5bq35a6H6Imv?= TAO <Kang.Kerry@inventec.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: mtd: spi-nor: Add Winbond w25q512jvdtr
In-Reply-To: <31265f84726047ebb49b3ea2e7836830@inventec.com>
References: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
	<mafs0cy7yjon6.fsf@kernel.org>
	<31265f84726047ebb49b3ea2e7836830@inventec.com>
Date: Mon, 15 Sep 2025 14:14:37 +0200
Message-ID: <mafs0o6rbj4k2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

SGksCgpPbiBNb24sIFNlcCAxNSAyMDI1LCBLYW5nLktlcnJ5IOW6t+Wuh+iJryBUQU8gd3JvdGU6
CgpQbGVhc2UgZG9uJ3QgdG9wLXBvc3QuIGh0dHBzOi8vd3d3LmlkYWxsZW4uY29tL3RvcHBvc3Rp
bmcuaHRtbAoKPiBIaSBQcmF0eXVzaCwKPiBJIGNvbmZpZ3VyZWQgdGhlIERUUyB3aXRoICdjb21w
YXRpYmxlID0gImplZGVjLHNwaS1ub3IiOycKPiBhbmQgZW5hYmxlZCB0aGUga2VybmVsIG9wdGlv
bnM6Cj4gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9eQo+IENPTkZJR19NVERfU1BJX05P
Uj15Cj4KPiBIb3dldmVyLCB0aGUgZG1lc2cgb3V0cHV0IHNob3dzIHRoYXQgdGhlIGtlcm5lbCBp
cyBmYWlsaW5nIHRvIHJlY29nbml6ZSB0aGUgZmxhc2gncyBKRURFQyBJRC4gVGhpcyBzdWdnZXN0
cyB0aGF0IHRoZSBnZW5lcmljIFNGRFAtYmFzZWQgZHJpdmVyIGlzbid0IHdvcmtpbmcgYXMgZXhw
ZWN0ZWQuCj4KPiBbICAxMzUuMjk0NjI0XSBzcGktbm9yIHNwaTEuMDogdW5yZWNvZ25pemVkIEpF
REVDIGlkIGJ5dGVzOiBlZiA3MCAyMCAwMCAwMCAwMAo+IFsgIDEzNS4zMDE2MDJdIHNwaS1ub3I6
IHByb2JlIG9mIHNwaTEuMCBmYWlsZWQgd2l0aCBlcnJvciAtMgo+Cj4gSSB0aGluayB3ZSBuZWVk
IHRvIGFkZCB0aGlzIHRvIHRhYmxlIHRvIG1ha2Ugc3VyZSBXMjVRNTEySlYtRFRSIGlzIHJlY29n
bml6ZWQuCgpUaGlzIG1lYW5zIHNwaV9ub3JfY2hlY2tfc2ZkcF9zaWduYXR1cmUoKSBmYWlscy4g
Q2FuIHlvdSBjaGVjayB3aHk/IFRoZQpmbGFzaCBkYXRhc2hlZXQgc2F5cyBpdCBoYXMgYSBTRkRQ
IHRhYmxlIHNvIHRoaXMgc2hvdWxkIHdvcmsuCgpCVFcsIHdoaWNoIGtlcm5lbCB2ZXJzaW9uIGFy
ZSB5b3UgdGVzdGluZyB0aGlzIG9uPwoKWy4uLl0KCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRh
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
