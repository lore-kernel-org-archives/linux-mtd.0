Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D81C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 15:32:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C9E20729
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 15:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLDp6tIv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="POX89PUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C9E20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bczc5eEc2zZ+Td/8SOF4UcvkArh8SxW3ePI2lbrTk2A=; b=PLDp6tIvX2akKLN/DpHH5l5S0
	WooYLAaIzFbozVIqOrIy38JlE9gkSRESj8LhXF4KMmeQHJLDySy0QgXGTPbgKZG6VfaX9vQcljQh7
	SUdaOYnXgNg7gfw1PZ2ORFwPlwBoqwHBh+wKUps+0DhtHfm/7wQBy4B77Ypdxc8R5AkZ3oQfUv+o/
	PoSyT/CjkfXlK0uC9qkO8hKFKoJBQxLA0RmrDTKQYlmZsUOoJ94zqPfz0dpvEE9Ts26wAQkjccRw9
	hwzgWghXckdsdGyymsnsD63fEgWrkcfEoLs4NbvuGwkRbiT2GmlRB5hizPkNfGEaVOUQep0DBQuep
	btx6e8SCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k056M-0007r2-Kv; Mon, 27 Jul 2020 15:31:42 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k056K-0007qC-AE
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 15:31:41 +0000
Received: by mail-qk1-x742.google.com with SMTP id l6so15597899qkc.6
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2020 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tc6U4B4ifrBotOh/fXS5TVXJl0j6RPCfuacCtXdF/Bs=;
 b=POX89PUxNVTvKUH1A4IvhZs88Vh004sHJ6vDsdtT1qEnZTeAPN9d4ux66c8fnpxrLe
 GFGANIM94UQHjSOL5C71fJf7QzOZId/30YS5Ou0PhM0TJLI9TSgzRlPogD77U0QuBXwT
 0uwHQgRBAlbeQQ9+6j8K9dA5uoqGwT3TzdEuiPHM3pGN/IkvAI3aZWgz9jQoB6Do/BK4
 rGSeGwbUzBeaisWIlSSv99+V+BhnkHa5t3otM4Y93xF/iLBsSLdplEJm6KdgNARJONoG
 3csM6GxAGc3rQZK+s2fndFK/n4xtDktyPnOscTVI2U1B+DyQ7aEZIKxxzelNQuUUXZ5E
 ga3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tc6U4B4ifrBotOh/fXS5TVXJl0j6RPCfuacCtXdF/Bs=;
 b=asNLwE5XzcOBgFh1TpzNAi/axsOahzH9gNnbFyRL85+TZQlWe6OfgOt4jGc2hGO+j0
 nzSt6HmGc0Z2aI9r0fhcIVHYdAjqq3/GtuLSDSkLn6EOkWH9kaFkSGqDRWTYXQ/fPN/X
 ZJ3Z1+pYlAnfO9CgYOMel+0ToA6HCG1NPGWVbgiJNAGzbgUrb9AHKYGbnnyNofVibQ/y
 1rIJT9Ls7eNsnRX4hQPUIpEkAYO/VgzR1jj3bt4LTIhgYWxbj/RckR0RC/kLwDEoFmxT
 qZtDA49AKcRYFlw17NeOArey3vnzRu+OMIDHC4O+7rsXT2khWxWFFYEuAv6ihx71VceG
 wSWA==
X-Gm-Message-State: AOAM531MWtvQKvEqDwqmP6XWLJjZ8eWMM+Gojm2qYoMLZ+OWQRfRaGS5
 92P/9SvfGT9ZDBZSl/ultEbHst3r/5iSKFX2O1w2JQ==
X-Google-Smtp-Source: ABdhPJxyNMAKvg1LEG48ofJJNYU+f8IxgUp0EcqzWaM5nc5Eojucgiz/T7/9vC6vuPXocWDtZtqeYPIuc6dsnTOw1Ws=
X-Received: by 2002:a37:278d:: with SMTP id
 n135mr22801202qkn.486.1595863898240; 
 Mon, 27 Jul 2020 08:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
 <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
In-Reply-To: <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Mon, 27 Jul 2020 12:31:27 -0300
Message-ID: <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_113140_485736_B5615AC7 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMTI6MTUgUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAyNywgMjAyMCBhdCA1OjA1IFBNIERhbmllbCBH
dXRzb24gPGRhbmllbEBlY2x5cHNpdW0uY29tPiB3cm90ZToKPiA+IE9uIFN1biwgSnVsIDI2LCAy
MDIwIGF0IDQ6MTcgQU0gR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBTYXQsIEp1bCAyNSwgMjAyMCBhdCAwMjoyMDowM1BN
IC0wMzAwLCBEYW5pZWwgR3V0c29uIHdyb3RlOgo+ID4+ID4gRWwgc8OhYi4sIDI1IGp1bC4gMjAy
MCAyOjU2IGEuIG0uLCBHcmVnIEtyb2FoLUhhcnRtYW4gPAo+ID4+ID4gZ3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+IGVzY3JpYmnDszoKPiA+PiA+Cj4gPj4gPgo+ID4+ID4gMSkgSSBqdXN0IGRp
ZCB0aGUgc2FtZSB0aGF0IGludGVsLXNwaS5jIGRvZXMuCj4gPj4KPiA+PiBObyBuZWVkIHRvIGNv
cHkgYmFkIGV4YW1wbGVzIDopCj4gPgo+ID4KPiA+IERpZG4ndCBrbm93IGl0IHdhcyBhIGJhZCBl
eGFtcGxlLiBXaGF0J3MgaXMgdGhlIGN1cnJlbnQgbW9kZXJuIG1lY2hhbmlzbSB0aGF0IHJlcGxh
Y2VzIGluaXRpYWxpemF0aW9uLXRpbWUgY29uZmlndXJhdGlvbj8KPgo+IEknZCBzYXkgeW91J2Qg
Z2VuZXJhbGx5IHdhbnQgdGhpcyB0byBiZSBhIHBlci1pbnN0YW5jZSBzZXR0aW5nLCB3aGljaAo+
IGNvdWxkIGJlIGEgc3lzZnMgYXR0cmlidXRlIG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UsIG9yIGFu
IGlvY3RsIGZvciBhbgo+IGV4aXN0aW5nIHVzZXIgc3BhY2UgYWJzdHJhY3Rpb24uCgpCdXQgc3Rp
bGwsIHRoZXkgYXJlIG5vdCBlcXVpdmFsZW50LiBUaGUgaW5pdGlhbCBjb25maWd1cmF0aW9uIHJl
bWFpbnMKY29uc3RhbnQgZm9yIHRoZSByZXN0IG9mIHRoZSBsaWZlIG9mIHRoZSBkcml2ZXIsIHdo
ZXJlYXMgdGhlCnN5c2ZzIGF0dHJpYnV0ZSBpcyBzZXQgYWZ0ZXIgdGhlIGluaXRpYWxpemF0aW9u
IGFuZCBjYW4gYmUgcmUtc2V0IG92ZXIKdGltZS4gSSdtIG5vdCBhc2tpbmcgbW9kdWxlIHBhcmFt
ZXRlcnMgInRvIGNvbWUgYmFjayIgaWYKdGhleSBhcmUgbm93IGNvbnNpZGVyZWQgb2Jzb2xldGUs
IEknbSBqdXN0IHRyeWluZyB0byB1bmRlcnN0YW5kLgoKPgo+IEluIHRoZSBjaGFuZ2Vsb2csIHlv
dSBzaG91bGQgYWxzbyBleHBsYWluIHdoYXQgdGhpcyBpcyB1c2VkIGZvci4gRG8KPiB5b3UgYWN0
dWFsbHkgd2FudCB0byB3cml0ZSB0byBhIGRldmljZSB0aGF0IGlzIG1hcmtlZCByZWFkLW9ubHks
IG9yCj4gYXJlIHlvdSBqdXN0IHRyeWluZyB0byBtYWtlIHRoZSBpbnRlcmZhY2UgbW9yZSBjb25z
aXN0ZW50IGJldHdlZW4gdGhlCj4gdHdvIGRyaXZlcnM/CgpUaGUgZGV2aWNlIGNhbiBlaXRoZXIg
YmUgbG9ja2VkIG9yIHVubG9ja2VkLiBJZiBpdCBpcyB1bmxvY2tlZCwgaXQgY2FuCmJlIHNldCB3
cml0YWJsZSBkZXBlbmRpbmcgb24gdGhlIG1vZHVsZQphcmd1bWVudCBpbiBpbnRlbC1zcGksIG9y
IHN0cmFpZ2h0IHdyaXRhYmxlIGluIGludGVsLXNwaS1wY2kuIFdoaWNoIGlzCmRhbmdlcm91cy4K
SSB3YW50ZWQgdG8gbWFrZSwgYXMgeW91IHNheSwgdGhlIGludGVyZmFjZSBjb25zaXN0ZW50LgpF
eHBvc2luZyBhbiBpbnRlcmZhY2UgdG8gdGhlIHVzZXIgKHZpYSBhIHN5c2ZzIGF0dHJpYnV0ZSkg
dG8gdHJ5IHRvCm1ha2UgdGhlIGRyaXZlciB3cml0YWJsZSBpcyBkZWZpbml0aXZlbHkgYSBiYWQg
aWRlYS4KSSdkIHJhdGhlciBkbyBub3RoaW5nIChubyBtb2R1bGUgYXJnKSByYXRoZXIgdGhhbiBv
cGVuIHRoYXQKaGVyZS1iZS1kcmFnb25zIGRvb3IuCj4KPiAgICAgIEFybmQKCgoKLS0gCkRhbmll
bCBHdXRzb24KQXJnZW50aW5hIFNpdGUgRGlyZWN0b3IKRW5naW5pZWVyaW5nIERpcmVjdG9yCkVj
bHlwc2l1bQoKQmVsb3cgVGhlIFN1cmZhY2U6IEdldCB0aGUgbGF0ZXN0IHRocmVhdCByZXNlYXJj
aCBhbmQgaW5zaWdodHMgb24KZmlybXdhcmUgYW5kIHN1cHBseSBjaGFpbiB0aHJlYXRzIGZyb20g
dGhlIHJlc2VhcmNoIHRlYW0gYXQgRWNseXBzaXVtLgpodHRwczovL2VjbHlwc2l1bS5jb20vcmVz
ZWFyY2gvI3RocmVhdHJlcG9ydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
