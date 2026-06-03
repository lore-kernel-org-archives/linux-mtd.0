Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA0FCD6E55
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 17:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddzbxNmvDUvqdK3xLXZUt9kUWs1nnmzstiTVWNH3A0Y=; b=WsXurWWQ6vNxN0
	8HTJa6p3+cJNTIa0tuyidne4IJbqnxPMVaQ/1CL5hzUy5oAfH8cHKpLxz6KBCj/w563DUtXWqaL2L
	z9OvSaZ3HDDiWQQv3avJQ5zGxE1SheBHQ8YCCcghydZcImUZFeYEXXfhA8fCPXed8DImC4E0DwgTG
	z3OoVN9heGgiNpA1SYgcm/7EQis8axTiwgi82fhLJhWgAIZEBgC8mx9XBImIoZ0dtZZBArgKeaB21
	frscRDfdlGuEVHU0opS5KrHBPfuOMLQ7HnVbZmXFrTaF14m1uuPzP9P7ep/CNmOMaThzF433WYnL0
	/uCkS9E8/jwiaLfVQ3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpYd-0000000Fasu-3CEN;
	Wed, 03 Jun 2026 17:39:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpYb-0000000FasQ-2MQr
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 17:39:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68A9340D70
	for <linux-mtd@lists.infradead.org>; Wed,  3 Jun 2026 17:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465421F008A7
	for <linux-mtd@lists.infradead.org>; Wed,  3 Jun 2026 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780508348;
	bh=0r9RU/RX9+0fMVub0FLUJ/c2kPAlu3ZbUrrVbFmEVtM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S7PPd22usbLXBVl9jDTQ059NO0oHQofIn+K1aPjBCyT9LpfNGMp/gblzj/99kb5ds
	 RyNtsNxtIgMwXQdh6bR97DKg8Q+1HC8AYAr/dsv7nmn+suJ55hkk65ZWtpjTNSQMuO
	 rayazDKDkrtCL6PHfdoVlyyENmBEbbXtiEJvMfhZNCYuS5oczkvvN9xKXGuQ4/kjjA
	 VlDnlQVuFqbRc8gp2L8xY9LJgUxbeZOAXDpT8XJE7as1D698ZXR17VLlLdCanbKOHu
	 kzBaricDEcOesqgL4wD2wQysLVaeY3GvemtLOGdldguYSM5wAld/v5ukbvE2l/3fWX
	 uOOAMVK4/1SrQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68719234fd8so7696216a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jun 2026 10:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Xk9LlZfm6yuI6cUgzDfhy+73/6VTBlsSim1pjXv82k99SjQyKHRmy1F6N3gf6Gh1NpUhCJ1eD+lE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHLR+wGSjc1YFb2IcFBNIbS+A8JLpDlqkM/RkkIZn/RfggI4pu
	z4dHECXvKxngpBorv7me1lb4ru6sd7LHtYlr1mz87/55GuFpHlPoggcfdW7HQizYYYsIJDfnNBK
	4gr6OiGKvfKghoB0iHY09trj/zgAceQ==
X-Received: by 2002:a05:6402:2711:b0:68a:c8c8:bf70 with SMTP id
 4fb4d7f45d1cf-68e72e11b8fmr2505455a12.26.1780508346916; Wed, 03 Jun 2026
 10:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260527175527.2247679-1-s-k6@ti.com> <20260527175527.2247679-3-s-k6@ti.com>
 <20260602164945.GA475455-robh@kernel.org> <87zf1by5oc.fsf@bootlin.com>
In-Reply-To: <87zf1by5oc.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Jun 2026 12:38:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kf2I230VuAd1puqsHwde0Bn2izk7qL8QsSDkUDH3frwdNb_AgO2H9KCZw
Message-ID: <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Santhosh Kumar K <s-k6@ti.com>, broonie@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, 
	mwalle@kernel.org, takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, 
	a-dutta@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_103909_637961_FEAE8761 
X-CRM114-Status: GOOD (  24.38  )
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxMTowMeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiAwMi8wNi8yMDI2IGF0
IDExOjQ5OjQ1IC0wNSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+
IE9uIFdlZCwgTWF5IDI3LCAyMDI2IGF0IDExOjI1OjE2UE0gKzA1MzAsIFNhbnRob3NoIEt1bWFy
IEsgd3JvdGU6Cj4gPj4gUEhZIHR1bmluZyByZXF1aXJlcyBhIGtub3duIGRhdGEgcGF0dGVybiB0
byBiZSByZWFkYWJsZSBmcm9tIGZsYXNoLgo+ID4+IFdoZW4gbm8gcGFydGl0aW9uIGlzIGV4cGxp
Y2l0bHkgaWRlbnRpZmllZCwgdGhlIGNvbnRyb2xsZXIgbXVzdCBzZWFyY2gKPiA+PiBhbGwgYXZh
aWxhYmxlIHBhcnRpdGlvbnMgdG8gbG9jYXRlIHRoZSBwYXR0ZXJuIGJ5IGxhYmVsLCB3aGljaCBh
ZGRzCj4gPj4gb3ZlcmhlYWQgYW5kIHJlbGllcyBvbiBsYWJlbCBuYW1pbmcgY29udmVudGlvbnMg
b3V0c2lkZSB0aGUKPiA+PiBjb250cm9sbGVyJ3MgY29udHJvbC4KPiA+Cj4gPiBJIGFncmVlICds
YWJlbCcgaXMgbm90IHRoZSBiZXN0IGNob2ljZS4gU29mdHdhcmUgc2hvdWxkIG5vdCBjYXJlIHdo
YXQKPiA+ICdsYWJlbCcgY29udGFpbnMuIEl0IHNob3VsZCByZWFsbHkgYmUgJ2NvbXBhdGlibGUn
IGluc3RlYWQuCj4KPiBCdXQgY29tcGF0aWJsZSBkb2VzIG5vdCBzZWVtIHJlbGV2YW50IGluIHRo
aXMgY2FzZSwgcmlnaHQ/IFdlIGFyZSBqdXN0Cj4gZmxhZ2dpbmcgdGhlIGxvY2F0aW9uIG9mICJz
b21lIHVzZWZ1bCBkYXRhIGZvciB0aGUgY29udHJvbGxlciIuCgpjb21wYXRpYmxlIGlzIHdoYXQg
dGVsbHMgdXMgd2hhdCBhIHJlZ2lvbiBjb250YWlucyBhbmQgaG93IHRvIHVzZSBpdC4KVGhhdCBz
ZWVtcyBleGFjdGx5IHdoYXQgd2UgbmVlZCB0byBkZWZpbmUgaGVyZS4KCj4gPj4gQWRkIGNkbnMs
cGh5LXBhdHRlcm4tcGFydGl0aW9uLCBhIHBoYW5kbGUgcHJvcGVydHkgdGhhdCBhbGxvd3MgdGhl
IERUCj4gPj4gYXV0aG9yIHRvIGRpcmVjdGx5IHJlZmVyZW5jZSB0aGUgZmxhc2ggcGFydGl0aW9u
IGhvbGRpbmcgdGhlIFBIWSB0dW5pbmcKPiA+PiBwYXR0ZXJuLiBUaGUgY29udHJvbGxlciB1c2Vz
IHRoaXMgcGFydGl0aW9uIGR1cmluZyBjYWxpYnJhdGlvbiwgYXZvaWRpbmcKPiA+PiB0aGUgcGFy
dGl0aW9uIHNlYXJjaCBlbnRpcmVseS4KPiA+Cj4gPiBEbyB5b3UgaGF2ZSBhbnkgZGF0YSB0aGF0
IHRoaXMgYXBwcm9hY2ggYmVpbmcgImRpcmVjdCIgaXMgZmFzdGVyPyBJbgo+ID4gZmFjdCwgaXQg
bWlnaHQgYmUgd29yc2UuIEluc3RlYWQgb2Ygc2VhcmNoaW5nIGp1c3QgdGhlIGxpbWl0ZWQgbnVt
YmVyIG9mCj4gPiBwYXJ0aXRpb24gc3Vibm9kZXMsIHlvdSBub3cgc2VhcmNoIHRoZSBlbnRpcmUg
dHJlZSBmb3IgYSBtYXRjaGluZwo+ID4gcGhhbmRsZSB2YWx1ZS4gV2UgZG8gaGF2ZSBwaGFuZGxl
IGNhY2hpbmcsIHNvIHRoYXQgbWlnaHQgc2F2ZSB5b3UKPiA+IGhlcmUuCj4KPiBUcnVlLCBidXQg
YmVzaWRlcyBwZXJmb3JtYW5jZSBjb25zaWRlcmF0aW9ucywgSSBwZXJzb25hbGx5IGRvIG5vdCBm
aW5kCj4gZWxlZ2FudCB1c2luZyBhIHBhcnRpdGlvbiBuYW1lL2xhYmVsLCBidXQgbWF5YmUgdGhh
dCdzIGp1c3QgcGVyc29uYWwKPiB0YXN0ZSA6LSkKCkkgYWdyZWUuIFRoYXQncyB0cnVlIGZvciBh
bGwgdGhlIHBhcnRpdGlvbiBub2RlcyB3aXRoIG9ubHkgbm9kZSBuYW1lCm9yIGxhYmVsIHRvIGdv
IG9uLiBXZSBzaG91bGQgZml4IHRoYXQgYXQgdGhlIHNvdXJjZS4gSG93ZXZlciwgeW91CmFscmVh
ZHkgaGF2ZSB0byBzdXBwb3J0IHVzaW5nIGxhYmVsLCBzbyBhbnl0aGluZyBlbHNlIGlzIHN1cHBv
cnRpbmcgYQoybmQgd2F5IHdoZXRoZXIgaXQgaXMgY29tcGF0aWJsZSBvciBhIHBoYW5kbGUgcHJv
cGVydHkuIElzIGl0IHJlYWxseQp3b3J0aCBpdCBoZXJlPwoKUm9iCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
