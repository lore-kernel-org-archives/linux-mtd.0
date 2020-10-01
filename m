Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BA5C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:12:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848A5208B8
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aq58oKfD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848A5208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNa3Wzw2tpWCPzFKm8/AT0A9jzCJmdZQA5seNHOYtyc=; b=aq58oKfDH100LSbRbQAsupmSF
	XfHhcBJ6MPsuugMXK/ZwclXZFibG3jUGBPPCscP0PPfJqv/Oz19ihGac5/2dj/3A02fwFrsElFZEB
	UVqYcdWdVkMXJrovA3IjM5jGPW6bgcvxF3uSmk+05o2fyTMt/qglPyPKWmQ4ZDx7FXG/TIDewctI5
	QUxF7UpDzPPevmeJDjHZrtLkvXGODnKR9wqAx533FZtQmB84H5NEP1hLv51X2+zUsWfOIg/sgFoW6
	kpCxTNTbjd/vmPfA7Ma0SqaeO0O1o2jUhifGc+l/wQP3ZEhVppdzz7b12w0+2DcH9VHlWIM/Sw2H1
	16UMwnchg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNthH-0008Bd-On; Thu, 01 Oct 2020 08:12:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNthE-0008Au-VQ
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:12:14 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ECF2124000D;
 Thu,  1 Oct 2020 08:12:07 +0000 (UTC)
Date: Thu, 1 Oct 2020 10:12:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
Message-ID: <20201001101206.6e4beea7@xps13>
In-Reply-To: <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
References: <20200930210824.GA12277@embeddedor>
 <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
 <20200930213634.GA12855@embeddedor>
 <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_041213_114455_B4E373C7 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-tegra@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFubiwKCkphbm4gSG9ybiA8amFubmhAZ29vZ2xlLmNvbT4gd3JvdGUgb24gVGh1LCAxIE9j
dCAyMDIwIDAwOjMyOjI0ICswMjAwOgoKPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAxMTozMCBQ
TSBHdXN0YXZvIEEuIFIuIFNpbHZhCj4gPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
PiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAxMToxMDo0M1BNICswMjAwLCBKYW5uIEhvcm4gd3Jv
dGU6ICAKPiA+ID4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMTE6MDIgUE0gR3VzdGF2byBBLiBS
LiBTaWx2YQo+ID4gPiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPiB3cm90ZTogIAo+ID4gPiA+IFRo
ZXJlIGlzIGEgcmVndWxhciBuZWVkIGluIHRoZSBrZXJuZWwgdG8gcHJvdmlkZSBhIHdheSB0byBk
ZWNsYXJlIGhhdmluZwo+ID4gPiA+IGEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5n
IGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQo+ID4gPiA+IHNob3VsZCBhbHdh
eXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJlcnPigJ1bMV0gZm9yIHRoZXNlIGNhc2VzLiBU
aGUgb2xkZXIKPiA+ID4gPiBzdHlsZSBvZiBvbmUtZWxlbWVudCBvciB6ZXJvLWxlbmd0aCBhcnJh
eXMgc2hvdWxkIG5vIGxvbmdlciBiZSB1c2VkWzJdLiAgCj4gPiA+Cj4gPiA+IEJ1dCB0aGlzIGlz
IG5vdCBzdWNoIGEgY2FzZSwgcmlnaHQ/IElzbid0IHRoaXMgYSB0cnVlIGZpeGVkLXNpemUKPiA+
ID4gYXJyYXk/IEl0IHNvdW5kcyBsaWtlIHlvdSdyZSBqdXN0IGNoYW5naW5nIGl0IGJlY2F1c2Ug
aXQKPiA+ID4gcGF0dGVybi1tYXRjaGVkIG9uICJhcnJheSBvZiBsZW5ndGggMSBhdCB0aGUgZW5k
IG9mIGEgc3RydWN0Ii4gIAo+ID4KPiA+IFllYWg7IEkgc2hvdWxkIGhhdmUgY2hhbmdlZCB0aGF0
ICdkeW5hbWljYWxseScgcGFydCBvZiB0aGUgdGV4dCBhYm92ZQo+ID4gYSBiaXQuIEhvd2V2ZXIs
IGFzIEkgY29tbWVudGVkIGluIHRoZSB0ZXh0IGJlbG93LCBpbiB0aGUgY2FzZSB0aGF0IG1vcmUK
PiA+IENTIElEcyBhcmUgbmVlZGVkIChsZXQncyB3YWl0IGZvciB0aGUgbWFpbnRhaW5lcnMgdG8g
Y29tbWVudCBvbiB0aGlzLi4uKQo+ID4gaW4gdGhlIGZ1dHVyZSwgdGhpcyBjaGFuZ2UgbWFrZXMg
dGhlIGNvZGUgbW9yZSBtYWludGFpbmFibGUsIGFzIGZvcgo+ID4gdGhlIGFsbG9jYXRpb24gcGFy
dCwgdGhlIGRldmVsb3BlciB3b3VsZCBvbmx5IGhhdmUgdG8gdXBkYXRlIHRoZSBDU19OCj4gPiBt
YWNybyB0byB0aGUgbnVtYmVyIG9mIENTIElEcyB0aGF0IGFyZSBuZWVkZWQuICAKPiAKPiBCdXQg
aW4gdGhhdCBjYXNlLCBzaG91bGRuJ3QgeW91IGNoYW5nZSBpdCB0byAiaW50IGNzW0NTX05dIiBh
bmQgZ2V0Cj4gcmlkIG9mIHRoZSBzdHJ1Y3Rfc2l6ZSgpIHN0dWZmPwoKSSBkbyBhZ3JlZSB3aXRo
IEphbm4sIEkgdGhpbmsgaXQncyBiZXN0IHRvIGNvbnNpZGVyIHRoaXMgYSBmaXhlZC1zaXplCmFy
cmF5IGZvciBub3cuIElmIHdlIGV2ZXIgd2FudCB0byBleHRlbmQgdGhlIG51bWJlciBvZiBzdXBw
b3J0ZWQgQ1MsCnRoZXJlIGlzIG11Y2ggbW9yZSByZXdvcmsgaW52b2x2ZWQgYW55d2F5LgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
