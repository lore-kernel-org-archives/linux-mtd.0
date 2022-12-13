Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097B7C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YM0TMNYzkTXI4f90kkfziCSfEXn3ojDNt8/k/Ft2M0=; b=WuF+3Hfupmr9sq
	t9mA7T0LOE2eyvr8nl5WMtpnNMiHjbsHqCGFb/E/oMc9IPKYk81u4ev8Murpfwpof9kA+LJmlKRLN
	puduT9YgKK5dUg8mSrXTGNjGiufQFK0mqKLTAre5/PzUloFnZmO0dRA5n8l6hVqQorKT8nqUQWTxO
	G/e7c9hNNXz78yC3qyGS+/0euQMyy0H6Q4GsfNrByrTRvTBdFGiUK2WPlGr8azcn+1NGcAtA9pmad
	9BNtPaIqbxju55zdJyECDYPJ6W8Utqp3kOH/PzLQM+au5CcpRXk4fII/jy59rbRDGX6AMqrA9iuCu
	yj1PsFT6Z3zDa+nhEkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58YA-003Ab3-23; Tue, 13 Dec 2022 16:54:38 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58Y5-003ANl-QA
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2022 16:54:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AA6A1FF80C;
	Tue, 13 Dec 2022 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670950469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i+2/HPdAURjp6RtvmxYlKckI0Zp1d0ZU+1+vdt2LPM=;
	b=nCauKpCkinbLKRtBfPsHoK1kLxryO91ZfnZobkfPWaB2fnoh0Byw2Iqsrc/u8hH3GICRAy
	sSQJEEY+wcB7guQHaVHQ3IBY20o3pX3t0tXQyRPVh5aUf+WiTwVHdskYfz0XrjjFNTVEfx
	wrc3Hs1stmZtQXExvmQpcPQCWZFcCi2Mp0l2iwHoreod71UpuJhWcR65fOWCrpiLaad1dF
	fFXGegRiBK0LkKcFeZLaStIet5lcz0LSGaqrr30KXigt5DvWz7INxQ71s4rDiSgBmFAFQI
	I56Cyrz1Tx/pxkecLNK2U5G0nVwvUqnvSIBVGs2VQP+qHU66TINAU6n2CBgVsA==
Date: Tue, 13 Dec 2022 17:54:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Thorsten Leemhuis
 <regressions@leemhuis.info>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
Message-ID: <20221213175424.79895b63@xps-13>
In-Reply-To: <CALHCpMhOku2b+1y5Z=N5RJ6SvCvNakD2rSyRAqp6Gz3JWVvXGg@mail.gmail.com>
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
	<CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
	<b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
	<CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
	<20221212101449.4e465181@xps-13>
	<CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
	<20221212173730.64224599@xps-13>
	<b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
	<20221213104643.052d4a06@xps-13>
	<CALHCpMhOku2b+1y5Z=N5RJ6SvCvNakD2rSyRAqp6Gz3JWVvXGg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_085434_167678_FB3932DD 
X-CRM114-Status: GOOD (  33.68  )
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

SGkgTWF4aW0sCgpiaWd1bmNsZW1heEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMyBEZWMgMjAy
MiAxNDowMjozNCArMDMwMDoKCj4gSSBsb29rZWQgY2xvc2VyIGF0IGNvbW1pdCA2NThjNDQ0OGJi
YmYgYW5kIGJjZGYwMzE1YTYxYSwgNWRiMWMyZGJjMDRjMTYgY29tbWl0cy4KPiBMb29rcyBsaWtl
IHdlIGhhdmUgdHdvIGRpZmZlcmVudCBmZWF0dXJlcyBiaW5kZWQgdG8gb25lIHByb3BlcnR5IC0g
ImNvbXBhdGlibGUiLgo+IAo+IEZyb20gb25lIHNpZGUgaXQgaXMgdGhlIGFiaWxpdHkgdG8gZm9y
d2FyZCB0aGUgc3Vibm9kZSBvZiB0aGUgbXRkCj4gcGFydGl0aW9uIHRvIHRoZSBudm1lbSBzdWJz
eXN0ZW0gKDY1OGM0NDQ4YmJiZiBhbmQgYWM0MmM0NmY5ODNlKS4KPiBBbmQgZnJvbSBhbm90aGVy
IHNpZGUgaXMgdGhlIGFiaWxpdHkgdG8gdXNlIGN1c3RvbSBpbml0aWFsaXphdGlvbiBvZgo+IHRo
ZSBtdGQgcGFydGl0aW9uIChiY2RmMDMxNWE2MWEgYW5kIDVkYjFjMmRiYzA0YzE2KS4KPiAKPiBX
aGF0IEkgbWVhbjoKPiBBY2NvcmRpbmcgdG8gYWM0MmM0NmY5ODNlIEkgY2FuIGNyZWF0ZSBEVCBs
aWtlIHRoaXM6Cj4gIC0gfAo+ICAgICBwYXJ0aXRpb25zIHsKPiAgICAgICAgIGNvbXBhdGlibGUg
PSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAg
ICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+IAo+ICAgICAgICAgcGFydGl0aW9uQDAgewo+ICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibnZtZW0tY2VsbHMiOwo+ICAgICAgICAgICAgIHJlZyA9
IDwweDQwMDAwIDB4MTAwMDA+Owo+ICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICAgIG1hY2FkZHJfZ21h
YzE6IG1hY2FkZHJfZ21hYzFAMCB7Cj4gICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg2PjsK
PiAgICAgICAgICAgICB9Owo+ICAgICAgICAgfTsKPiAgICAgfTsKPiAKPiAKPiBBbmQgYWNjb3Jk
aW5nIHRvIDVkYjFjMmRiYzA0YzE2IEkgY2FuIGNyZWF0ZSBEVCBsaWtlIHRoaXM6Cj4gIC0gfAo+
ICAgICBwYXJ0aXRpb25zIHsKPiAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9u
cyI7Cj4gICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAgICAgICAgICNzaXplLWNlbGxz
ID0gPDE+Owo+IAo+ICAgICAgICAgcGFydGl0aW9uQDAgewo+ICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAidS1ib290LGVudiI7Cj4gICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAwMD47
Cj4gICAgICAgICB9Owo+ICAgICB9Owo+IAo+IEJ1dCBJIGNhbiBub3QgdXNlIHRoZW0gYm90aCwg
YmVjYXVzZSBvbmx5IG9uZSAiY29tcGF0aWJsZSIgcHJvcGVydHkgYWxsb3dlZC4KPiBUaGlzIHdp
bGwgYmUgaW5jb3JyZWN0Ogo+ICAtIHwKPiAgICAgcGFydGl0aW9ucyB7Cj4gICAgICAgICBjb21w
YXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiAKPiAgICAgICAgIHBhcnRpdGlvbkAw
IHsKPiAgICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxlbnYiOyAgIyBmcm9tIGFjNDJj
NDZmOTgzZQo+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnZtZW0tY2VsbHMiOyAjIGZyb20g
NWRiMWMyZGJjMDRjCgpXaGF0IGFib3V0OgoKCSAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVu
diIsICJudm1lbS1jZWxscyI7CgppbnN0ZWFkPyB0aGF0IHNob3VsZCBhY3R1YWxseSB3b3JrLgoK
PiAgICAgICAgICAgICByZWcgPSA8MHg0MDAwMCAweDEwMDAwPjsKPiAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiAgICAg
ICAgICAgICBtYWNhZGRyX2dtYWMxOiBtYWNhZGRyX2dtYWMxQDAgewo+ICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwIDB4Nj47Cj4gICAgICAgICAgICAgfTsKPiAgICAgICAgIH07Cj4gICAgIH07
Cj4gCj4gPiBjb21wYXRpYmxlOiBEdXBsaWNhdGUgcHJvcGVydHkgbmFtZSAgCj4gCj4g0LLRgiwg
MTMg0LTQtdC6LiAyMDIyINCzLiDQsiAxMjo0NiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT46Cj4gPgo+ID4gSGkgTWF4aW0sCj4gPgo+ID4gZmlkb19tYXhAaW5ib3gu
cnUgd3JvdGUgb24gTW9uLCAxMiBEZWMgMjAyMiAyMDo1Nzo0OSArMDMwMDoKPiA+ICAKPiA+ID4g
SGksIE1pcXVlbCEKPiA+ID4KPiA+ID4gT24gMTIuMTIuMjAyMiAxOTozNywgTWlxdWVsIFJheW5h
bCB3cm90ZToKPiA+ID4gIAo+ID4gPiA+IExldCBtZSB0cnkgdG8gcmVjYXAgdGhlIHNpdHVhdGlv
biBmb3IgYWxsIHRoZSBwZW9wbGUgSSBqdXN0IGludm9sdmVkOgo+ID4gPiA+Cj4gPiA+ID4gKiBB
biBFdGhlcm5ldCBkcml2ZXIgZ2V0cyBpdHMgbWFjIGFkZHJlc3MgZnJvbSBhbiBudm1lbSBjZWxs
LiBUaGUKPiA+ID4gPiAgICBFdGhlcm5ldCBjb250cm9sbGVyIERUIG5vZGUgdGhlbiBoYXMgYW4g
Im52bWVtLWNlbGxzIiBwcm9wZXJ0eQo+ID4gPiA+ICAgIHBvaW50aW5nIHRvd2FyZHMgYW4gbnZt
ZW0gY2VsbC4KPiA+ID4gPiAqIFRoZSBudm1lbSBjZWxsIGNvbWVzIGZyb20gYW4gbXRkIHBhcnRp
dGlvbi4KPiA+ID4gPiAqIFRoZSBtdGQgcGFydGl0aW9uIGlzIGZsYWdnZWQgd2l0aCBhIHBhcnRp
Y3VsYXIgY29tcGF0aWJsZQo+ID4gPiA+ICAgICh3aGljaCBpcyBhbHNvIG5hbWVkICJudm1lbS1j
ZWxscyIpIHRvIHRlbGwgdGhlIGtlcm5lbCB0aGF0IHRoZSBub2RlCj4gPiA+ID4gICAgcHJvZHVj
ZXMgbnZtZW0gY2VsbHMuCj4gPiA+ID4gKiBUaGUgbXRkIHBhcnRpdGlvbiBpdHNlbGYgaGFzIG5v
IGRyaXZlciwgYnV0IGlzIHRoZSBjaGlsZCBub2RlIG9mIGEKPiA+ID4gPiAgICAicGFydGl0aW9u
cyIgY29udGFpbmVyIHdoaWNoIGhhcyBvbmUgKGluIHRoaXMgY2FzZSwKPiA+ID4gPiAgICAiZml4
ZWQtcGFydGl0aW9ucyIsIHNlZSB0aGUgc25pcHBldCBiZWxvdykuCj4gPiA+ID4KPiA+ID4gPiBC
ZWNhdXNlIHRoZSAibnZtZW0tY2VsbHMiIHByb3BlcnR5IG9mIHRoZSBFdGhlcm5ldCBub2RlIHBv
aW50cyBhdCB0aGUKPiA+ID4gPiBudm1lbS1jZWxsIG5vZGUsIHRoZSBjb3JlIGNyZWF0ZSBhIGRl
dmljZSBsaW5rIGJldHdlZW4gdGhlIEV0aGVybmV0Cj4gPiA+ID4gY29udHJvbGxlciAoY29uc3Vt
ZXIpIGFuZCB0aGUgbXRkIHBhcnRpdGlvbiAocHJvZHVjZXIpLgo+ID4gPiA+Cj4gPiA+ID4gVGhl
IGRldmljZSBsaW5rIGluIHRoaXMgY2FzZSB3aWxsIG5ldmVyIGJlIHNhdGlzZmllZCBiZWNhdXNl
IG5vIGRyaXZlcgo+ID4gPiA+IG1hdGNoZXMgdGhlICJudm1lbS1jZWxscyIgY29tcGF0aWJsZSBv
ZiB0aGUgcGFydGl0aW9uIG5vZGUuCj4gPiA+ID4KPiA+ID4gPiBSZXZlcnRpbmcgY29tbWl0IGJj
ZGYwMzE1YTYxYSAoIm10ZDogY2FsbCBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIGZvciBNVEQKPiA+
ID4gPiBwYXJ0aXRpb25zIikgd291bGQgSU1ITyBub3QgbWFrZSBtdWNoIHNlbnNlLCB0aGUgcHJv
YmxlbSBjb21lcyBmcm9tIHRoZQo+ID4gPiA+IGRldmljZSBsaW5rIHNpZGUgYW5kIGV2ZW4gdGhl
cmUsIHRoZXJlIGlzIG5vdGhpbmcgcmVhbGx5ICJ3cm9uZyIsCj4gPiA+ID4gYmVjYXVzZSBJIHJl
YWxseSBleHBlY3QgdGhlIG10ZCBkZXZpY2UgdG8gYmUgcmVhZHkgYmVmb3JlIHRoZQo+ID4gPiA+
IEV0aGVybmV0IGNvbnRyb2xsZXIgcHJvYmUsIHRoZSBkZXZpY2UgbGluayBpcyBsZWdpdGltYXRl
Lgo+ID4gPiA+Cj4gPiA+ID4gU28gSSB3b3VsZCBsaWtlIHRvIGV4cGxvcmUgb3RoZXIgYWx0ZXJu
YXRpdmVzLiBIZXJlIGFyZSBhIGJ1bmNoIG9mCj4gPiA+ID4gaWRlYXMsIGJ1dCBJJ20gb3Blbjog
IAo+ID4gPgo+ID4gPiBIb3cgYWJvdXQgdG8gY3JlYXRlIHNpbXBsZSBkcml2ZXIgd2l0aCBjb21w
YXRpYmxlPSJudm1lbS1jZWxsIiBhbmQgdG8gbW92ZSBhbGwgdGhlIHN1ZmYgZnJvbSBtYWluIG10
ZCBkcml2ZXIgd2hpY2ggc2VydmVzIG52bWVtLWNlbGwgdG8gdGhlIHByb2JlIGZ1bmN0aW9uPyAg
Cj4gPgo+ID4gVGhpcyBpcyBwcm9iYWJseSB3b3J0aCB0aGUgdHJ5IGJ1dCBJIGRvdWJ0IHlvdSBj
YW4gbWFrZSBpdCB3b3JrIHdpdGhvdXQKPiA+IHJlZ3Jlc3Npb25zIGJlY2F1c2UgSUlSQyB0aGUg
bnZtZW0gcmVnaXN0cmF0aW9uIGhhcHBlbnMgbm8gbWF0dGVyIHRoZQo+ID4gY29tcGF0aWJsZSAo
bm90IG1lbnRpb25pbmcgdGhlIHVzZXItb3RwIGFuZCBmYWN0b3J5LW90cCBjYXNlcykuIFlvdSBj
YW4KPiA+IGRlZmluaXRlbHkgdHJ5IHRoaXMgb3V0IGlmIHlvdSB0aGluayB5b3UgY2FuIGNvbWUg
dXAgd2l0aCBzb21ldGhpbmcKPiA+IHRob3VnaC4KPiA+Cj4gPiBCdXQgSSB3b3VsZCBsaWtlIHRv
IGhlYXIgZnJvbSB0aGUgZGV2aWNlLWxpbmsgZ3VydXMgOikgYmVjYXVzZSBldmVuIGlmCj4gPiB3
ZSBmaXggbXRkIHdpdGggYSAidHJpY2siIGxpa2UgYWJvdmUsIEkgZ3Vlc3Mgd2UnbGwgdmVyeSBs
aWtlbHkgZmluZAo+ID4gb3RoZXIgY29ybmVyIGNhc2VzIGxpa2UgdGhhdCBhbmQgSSBhbSBpbnRl
cmVzdGVkIGluIHVuZGVyc3RhbmRpbmcgdGhlCj4gPiByYXRpb25hbGUgb2Ygd2hhdCBjb3VsZCBi
ZSBhIHByb3BlciBmaXguCj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
