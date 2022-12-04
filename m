Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE9C4321E
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Dec 2022 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRjX3XOK1jnsJdkqvX+M25uo4MpR7I6le7fjHM1/dRw=; b=irVDv+bIq9m+Z8
	JYHsAmMulAugma5MC3zDeS8LkY3P5QgA5TTZTanBU7QygnR+nJq06XV01XD4ebThMc1AnlN9+UH8N
	rTxfxSxNmT11Rs83nP8Qyh4C5H0oW1VNoPdIuL1tDJBgVISM+0b8TYCRBHg1CnYEkg2kmjg+zCX7S
	zzBbl1HR9rFmUR3QDjPl5uHlwQgo21sT8UVUm7me2TNZeadmlukO5rZfvLGtCHWE6DRVeRJE28hjk
	o698UXWdvFV2fdpskClAk7HMkO9bvNBwKKf+Xb8IEyrUqEwyHHofA95sZcD7mB8TZz8WWbwI7eWo6
	bV08TSTjzH0aUzfiZpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1rI5-009Sk8-CD; Sun, 04 Dec 2022 15:52:29 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1rGa-009S2j-0V; Sun, 04 Dec 2022 15:50:57 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 408BC856A7;
	Sun,  4 Dec 2022 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670169053;
	bh=IkR+a0wQaJHRUyMrC/B8vmTUXFxr7Nz0B/kASdDdyME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QGB/noS9hEw7tUeyhzSPXkVR0slEXfMJH46Efp3PCdmTi24HbOGAUzTQkVOwJSf0z
	 TtEDXD22kAFZZVMhKEuaL9o5gGa/9IbI41bhmSyQk0q9MSt3Dtf1K02hE5u8L4gAuN
	 d5EKAzrlYiSv4nyx/iz88xtiwqQ0/074wzm0ivtNLbRwkdXvKn+nynOjy7LOfC10WL
	 MkETaHB+DSpkibUp5gLiD8k5/g0w3x25TsZr5MoeMfIYWZLsPLCaNEqUrZu2L1jIkO
	 T1GZaLpNSu3iPIUmLgC07zpr4AL+Wke22o/31LFklHxZSAUl6y7plER7xKxJIHmL3b
	 x/cUYO351kXqQ==
Message-ID: <7feb2cde-bfeb-5f8c-8cc4-7870e6fcf56c@denx.de>
Date: Sun, 4 Dec 2022 16:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <f6417f32-cf30-2e01-701e-ed1634055c6a@leemhuis.info>
 <cc497c19-050a-b3c2-d3e2-640c07338ff6@denx.de>
 <b652fe29-5fbc-b548-266a-d494733b6e32@leemhuis.info>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b652fe29-5fbc-b548-266a-d494733b6e32@leemhuis.info>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_075056_473985_ED105628 
X-CRM114-Status: GOOD (  20.18  )
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

T24gMTIvNC8yMiAxMzo1OSwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4gT24gMDQuMTIuMjIg
MTM6NTAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxMi8yLzIyIDE2OjU2LCBUaG9yc3RlbiBM
ZWVtaHVpcyB3cm90ZToKPj4+IE9uIDAyLjEyLjIyIDE1OjMxLCBNYXJlayBWYXN1dCB3cm90ZToK
Pj4+PiBPbiAxMi8yLzIyIDE1OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+IFsuLi5dCj4+
Pj4+IDMuIFRvIGZpeCB0aGUgY3VycmVudCBzaXR1YXRpb246Cj4+Pj4+ICDCoMKgwqDCoCBJbW1l
ZGlhdGVseSByZXZlcnQgY29tbWl0IChhbmQgcHJldmVudCBpdCBmcm9tIGJlaW5nIGJhY2twb3J0
ZWQpOgo+Pj4+PiAgwqDCoMKgwqAgNzUzMzk1ZWExZTQ1ICgiQVJNOiBkdHM6IGlteDc6IEZpeCBO
QU5EIGNvbnRyb2xsZXIgc2l6ZS1jZWxscyIpCj4+Pj4+ICDCoMKgwqDCoCBUaGlzIHdheSB5b3Vy
IG93biBib290IGZsb3cgaXMgZml4ZWQgaW4gdGhlIHNob3J0IHRlcm0uCj4+Pj4KPj4+PiBIZXJl
IEkgZGlzYWdyZWUsIHRoZSBmaXggaXMgY29ycmVjdCBhbmQgSSB0aGluayB3ZSBzaG91bGRuJ3Qg
cHJvbGlmZXJhdGUKPj4+PiBpbmNvcnJlY3QgRFRzIHdoaWNoIGRvbid0IG1hdGNoIHRoZSBiaW5k
aW5nIGRvY3VtZW50LiBSYXRoZXIsIGlmIGEKPj4+PiBib290bG9hZGVyIGdlbmVyYXRlcyBpbmNv
cnJlY3QgKG5ldykgRFQgZW50cmllcywgSSBiZWxpZXZlIHRoZSBkcml2ZXIKPj4+PiBzaG91bGQg
aW1wbGVtZW50IGEgZml4dXAgYW5kIHdhcm4gdXNlciBhYm91dCB0aGlzLiBQQyBkb2VzIHRoYXQg
YXMgd2VsbAo+Pj4+IHdpdGggYnJva2VuIEFDUEkgdGFibGVzIGFzIGZhciBhcyBJIGNhbiB0ZWxs
Lgo+Pj4KPj4+IFdlbGwsIHRoYXQgbWlnaHQgYmUgdGhlIHJpZ2h0IHNvbHV0aW9uIGluIHRoZSBs
b25nIHJ1biwgdGhhdCdzIHVwIGZvcgo+Pj4gb3RoZXJzIHRvIGRlY2lkZSwgYnV0IHdlIG5lZWQg
dG8gZml4IHRoaXMgKnF1aWNrbHkqLiBGb3IgdHdvIHJlYXNvbnMKPj4+IGFjdHVhbGx5OiB0aGUg
Ni4xIHJlbGVhc2UgaXMgbmVhciBhbmQgdGhlIGNoYW5nZSB3YXMgYmFja3BvcnRlZCB0bwo+Pj4g
c3RhYmxlIGFscmVhZHkuCj4+Pgo+Pj4gRm9yIGRldGFpbHMgd3J0IHRvIHRoZSAicXVpY2tseSIs
IHNlZSAiUHJpb3JpdGl6ZSB3b3JrIG9uIGZpeGluZwo+Pj4gcmVncmVzc2lvbnMiIGhlcmU6Cj4+
PiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL2hhbmRsaW5nLXJlZ3Jlc3Npb25zLmh0
bWwKPj4+Cj4+PiBJT1c6IElkZWFsbHkgaXQgc2hvdWxkIGJlIGZpeGVkIGJ5IFN1bmRheS4KPj4+
Cj4+PiBJJ2xsIGhlbmNlIGxpa2VseSBzb29uIHdpbGwgcG9pbnQgTGludXMgdG8gdGhpcyBhbmQg
c3VnZ2VzdCB0byByZXZlcnQKPj4+IHRoaXMsIHVubGVzcyB0aGVyZSBhcmUgc3Ryb25nIHJlYXNv
bnMgYWdhaW5zdCB0aGF0IG9yIHNvbWUgc29ydCBvZgo+Pj4gYWdyZWVtZW50IG9uIGEgYmV0dGVy
IHNvbHV0aW9uLgo+Pgo+PiBZb3UgbWlnaHQgd2FudCB0byB3YWl0IHVudGlsIGV2ZXJ5b25lIGlz
IGJhY2sgb24gTW9uZGF5LCB0aGUgZGlzY3Vzc2lvbgo+PiBpcyBzdGlsbCBvbmdvaW5nLCBidXQg
aXQgc2VlbXMgdG8gYmUgZ2V0dGluZyB0byBhIGNvbmNsdXNpb24uCj4gCj4gWWVhaCwgY2FtZSB0
byBhIHNpbWlsYXIgY29uY2x1c2lvbiwgYnV0IHdhbnQgdG8gbWVudGlvbmVkIGl0Cj4gbmV2ZXJ0
aGVsZXNzIGFuZCBhbHJlYWR5IGhhdmUgdGhpcyBwcmVwYXJlZCAodG9nZXRoZXIgd2lsbCBhcHBy
b3ByaWF0ZQo+IGxpbmtzIHRvIHRoZSBkaXNjdXNzaW9uKToKPiAKPiBgYGAKPiBBIHJlZ3Jlc3Np
b24gY2F1c2luZyBib290IGZhaWx1cmVzIG9uIGlNWDcgKGR1ZSB0byBhIGJhY2twb3J0IHRoaXMg
aXMKPiBhbHNvIGFmZmVjdGluZyA2LjAueSkgY291bGQgYmUgZml4ZWQgd2l0aCBhIHF1aWNrIHJl
dmVydCBhcyB3ZWxsLiBCdXQKPiBsb29rcyBsaWtlIHRoZXJlIGlzIG5vIG5lZWQgZm9yIGl0LCBh
ZnRlciBzb21lIGJhY2sgYW5kIGZvcnRoIHRoZQo+IGRldmVsb3BlcnMgdGhhdCBjYXJlIGFyZSBj
bG9zZSB0byBjb21lIHRvIGFuIGFncmVlbWVudCBob3cgdG8gZml4IHRoZQo+IHByb2JsZW0gcHJv
cGVybHkgc29vbmlzaDoKPiBgYGAKCkFDSywgdGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
