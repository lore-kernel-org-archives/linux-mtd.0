Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1F8C1B0F7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 21:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7552087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 21:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1H4CfMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7552087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KH3298SDPiGF4mvDnqe/KmjbrtQYZYBjfrl9rEYaAYg=; b=I1H4CfMxMhLeN9
	XP5Po8716J2VZY+UUmcXsgtAVbCUeAUYM74VjgkJrCLO29yqnSp0+H++QlxdSHOs8Ug7vKwaCqbCB
	LY2+eQ77m+N4IjfAQ5cmHC+bHVrl5ebLotCP69QPg4d2AvZ/B6Q9BgHU4v9DLIQCxRGEkpE2+VONy
	KzfwTEcASzYxDV5jnouEsq9fdUcWUFqI7HbBVxSYl+XPRnDYfZ3NLs8IlN0ekGpXPxaRBIJfhNqhQ
	ihggucsFgW8rbbrICp/Ohu4zLAedQJTBhVXxmrFjrBnr1pldd/N/Rbsc7HEzP8RKtmkjGY1hObLA0
	u0VhFRC1uEoiAbonhYtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkbe7-00044p-3c; Fri, 18 Jan 2019 21:25:47 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkbe3-000446-3E
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 21:25:45 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0E6BC6075EB2;
 Fri, 18 Jan 2019 22:25:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FQH74oeD2Ekh; Fri, 18 Jan 2019 22:25:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9EDFB612DCA2;
 Fri, 18 Jan 2019 22:25:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ac5OXIidZAtx; Fri, 18 Jan 2019 22:25:38 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 536AE608A383;
 Fri, 18 Jan 2019 22:25:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: VIRTIO iface in mtd
Date: Fri, 18 Jan 2019 22:25:37 +0100
Message-ID: <2945987.RD84OsBdxl@blindfold>
In-Reply-To: <20190118214455.18345232@bbrezillon>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
 <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
 <20190118214455.18345232@bbrezillon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_132543_433058_514CEDCD 
X-CRM114-Status: GOOD (  25.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org,
 Marcin =?utf-8?B?S3J6ZW1pxYRza2k=?= <mar.krzeminski@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkhCgpTb3JyeSBmb3Igam9pbmluZyB0aGlzIGRpc2N1c3Npb24gc28gbGF0ZS4KSSBkaWRuJ3Qg
bm90aWNlIHRoZSBwcml2YXRlIG1haWxzLiA7LVwKCkFtIEZyZWl0YWcsIDE4LiBKYW51YXIgMjAx
OSwgMjE6NDQ6NTUgQ0VUIHNjaHJpZWIgQm9yaXMgQnJlemlsbG9uOgo+IE9uIEZyaSwgMTggSmFu
IDIwMTkgMjE6MDM6MTcgKzAxMDAKPiBNYXJjaW4gS3J6ZW1pxYRza2kgPG1hci5rcnplbWluc2tp
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gPiA+ICAKPiA+ID4+IE15IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCB0aGlzIGRyaXZlciB3aWxsIHVzZSBWSVJUSU8gdG8gY29tbXVuaWNhdGUKPiA+ID4+IHdp
dGggUWVtdS4gRnJvbSBRZW11IHNpZGUgYXQgdGhlIGVuZCB0aGVyZSB3aWxsIGJlIGEgZmlsZSB0
aGF0IHdpbGwKPiA+ID4+IHNpbXVsYXRlIE5BTkQvTk9SLiBJcyBpdCBjb3JyZWN0PyAgCj4gPiA+
IFRoYXQncyBteSB1bmRlcnN0YW5kaW5nLCBidXQgSSdtIG5vdCByZWFsbHkgYSB2aXJ0aW8gb3Ig
cWVtdSBleHBlcnQgc28KPiA+ID4gSSBtaWdodCBiZSB3cm9uZy4KPiA+ID4gIAo+ID4gPj4gV2hh
dCB1c2UgY2FzZXMgZG8geW91IGhhdmUgaW4gbWluZCBmb3IgdGhpcz8gIAo+ID4gPiBJIGhhdmUg
b25lIGluIG1pbmQ6IHNpbXVsYXRlIE5BTkQgKGluIHBhcnRpY3VsYXIgTUxDIE5BTkQpIGJlaGF2
aW9yIGluCj4gPiA+IGEgcHNldWRvLXJlYWxpc3RpYyB3YXkgdG8gdmFsaWRhdGUgVUJJL1VCSUZT
IGNvZGUgKG9yIGFueSBvdGhlcgo+ID4gPiBGUy93ZWFyLWxldmVsaW5nL0ZUTCBjb2RlKSB3ZSBt
aWdodCB3YW50IHRvIHVzZSBvbiB0b3Agb2Ygc3VjaCBkZXZpY2VzICAKPiA+IEluIHRoaXMgcGxh
Y2UgbXkgcXVlc3Rpb24gaXMgd2hhdCB3ZSByZW1vdmUgZnJvbSBlbXVsYXRpb24/Cj4gPiBJIHVu
ZGVyc3RhbmQgdGhhdCBjb21tdW5pY2F0aW9uIGxheWVyIGlzIHJlbW92ZWQsIGhvd2V2ZXIgY29t
bXVuaWNhdGlvbiAKPiA+IHByb3RvY29sCj4gPiBuZWVkIHQgbyBzdGF5PyBFZy4gYmVjYXVzZSBO
QU5EIGFuZCBPT0IuCj4gCj4gSWYgYnkgcHJvdG9jb2wgeW91IG1lYW4gdGhlIGZhY3QgdGhhdCBh
IE5BTkQgaGFzIGFuIG91dC1vZi1iYW5kIGFuZCBhbgo+IGluLWJhbmQgYXJlYSwgdGhlbiB5ZXMs
IHdlIHdhbnQgdG8gZW11bGF0ZSB0aGF0LiBXaGF0IEkgbWVhbnQgYnkKPiAicHJvdG9jb2wiIHdh
cyB0aGUgaG93IHlvdSBpbnRlcmFjdCB3aXRoIGEgcGFyYWxsZWwgb3IgU1BJIE5BTkQgKCJzZW5k
Cj4gdGhpcyBvcGNvZGUgdG8gZG8gdGhpcyBvciB0aGF0IiksIGFuZCB3ZSBkZWZpbml0ZWx5IGRv
bid0IHdhbnQgdG8KPiBlbXVsYXRlIHRoYXQgcGFydC4KPiAKPiA+IAo+ID4gPgo+ID4gPiBJJ2Qg
YWxzbyBsaWtlIHRvIHJlcGxhY2UgbmFuZHNpbSBieSB0aGlzIGVtdWxhdGlvbiBhcHByb2FjaC4g
SW5kZWVkLAo+ID4gPiBuYW5kc2ltIGlzIGVtdWxhdGluZyB0aGUgcGFyYWxsZWwgTkFORCBwcm90
b2NvbCBtb3JlIHRoYW4gYW55dGhpbmcKPiA+ID4gZWxzZSwgd2hpY2ggd2UgZG9uJ3QgcmVhbGx5
IGNhcmUgYWJvdXQgdW5sZXNzIHdlIG5lZWQgdG8gdGVzdCB0aGUgcmF3Cj4gPiA+IE5BTkQgZnJh
bWV3b3JrIChhbmQgSSB0aGluayB0aGVyZSBhcmUgYmV0dGVyIHNvbHV0aW9ucyB0byBkbyB0aGF0
KS4gT24KPiA+ID4gdGhlIG90aGVyIGhhbmQsIGJlY2F1c2UgbmFuZHNpbSB0cmllcyB0byB1c2Ug
dGhlIGZ1bGwgcmF3IE5BTkQgc3RhY2ssCj4gPiA+IGl0J3Mgb2Z0ZW4gaGFyZCB0byBlbXVsYXRl
IHJlYWwgZGV2aWNlcyAoSUQtYmFzZWQgZGV0ZWN0aW9uIGRvZXMgbm90Cj4gPiA+IHdvcmsgZm9y
IE9ORkkvSkVERUMgY29tcGF0aWJsZSBkZXZpY2VzKS4gQWxsIG9mIHRoaXMgbWFrZXMgbmFuZHNp
bSBhCj4gPiA+IHBvb3IgY2hvaWNlIHdoZW4gdGhlIHVzZXIgd2FudHMgdG8gZW11bGF0ZSBhIE5B
TkQgZGV2aWNlIHRvIGRvCj4gPiA+IHBvc3QtbW9ydGVtIGFuYWx5c2lzIHVzaW5nIGEgTkFORCBk
dW1wLiAgCj4gPiBUaGlzIEkgbmVlZCB0byB1bmRlcnN0YW5kIGJldHRlci4gSWYgd2UgZWcuIGhh
dmUgTkFORCBkdW1wLCBkbyB3ZSBjYXJlIAo+ID4gd2l0aCBPT0Igb3IgRUNDLAo+ID4gb3Igbm90
Pwo+IAo+IFllcyB3ZSBzaG91bGQuIEZvciB0aGUgRUNDIHBhcnQsIGl0IHdpbGwgYmUgaGFyZCB0
byBlbXVsYXRlIEhXIEVDQwo+IGVuZ2luZSwgYnV0IHdlIGNhbiBhdCBsZWFzdCBzcGVjaWZ5IHRo
ZSBsYXlvdXQgaW4gdXNlIG9uIHRoZSBib2FyZAo+ICh3aGljaCBPT0IgcG9ydGlvbnMgYXJlIHVz
ZWQgdG8gc3RvcmUgRUNDIGJ5dGVzIGFuZCB3aGljaCBvbmVzIGFyZQo+IGNvbnRhaW5pbmcgdXNl
ciBkYXRhIG9yIGJhZCBibG9jayBtYXJrZXJzKS4KPiAKPiA+IAo+ID4gQXQgdGhlIGVuZCBJIGFs
c28gbmVlZCB0byBhZGQsIHRoYXQgSSB1bmRlcnN0YW5kIE5PUiBkZXZpY2VzLCBidXQgCj4gPiB1
bmZvcnR1bmF0ZWx5Cj4gPiBJIGhhdmUgbG93IGV4cGVyaWVuY2Ugd2l0aCBOQU5Ecy4gVGhpcyBj
b3VsZCBsZWFkIHRvIHNvbWUgbWlzdW5kZXJzdGFuZHMgOigKPiAKPiBXZSBjYW4gaGVscCB3aXRo
IHRoYXQuCgpZZXMsIEknbGwgaGFwcGlseSBoZWxwLgoKSSdtIHVuaGFwcHkgd2l0aCBuYW5kc2lt
IG1vc3RseSBiZWNhdXNlIGl0IGVtdWxhdGVzIHRoZSBjaGlwIGl0c2VsZiwgd2hpY2ggaXMKdGhl
c2UgZGF5cyBhbG1vc3QgdXNlbGVzcyBhbmQgaW5lZmZpY2llbnQuClRvIGZpbmQgYnVncyBpbiBu
YW5kX2Jhc2UuYyBpdCBoZWxwcyBvbmx5IGluIHRoZW9yeSwgaW4gcmVhbGl0eSB3ZSB0cmlnZ2Vy
CmJ1Z3MgaW4gbmFuZHNpbSdzIE5BTkQgZW11bGF0aW9uLgoKSSB0cmllZCB0byBvdmVyaGF1bCBu
YW5kc2ltIHNvbWUgdGltZSBhZ286Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE2LzgvMzEvNjcK
QnV0IEJvcmlzIGNvbnZpbmNlZCBtZSB0aGF0IEkgc2hvdWxkIG5vdCByaWRlIGEgZGVhZCBob3Jz
ZS4gOy0pCgpTbywgdGhlIGJhc2ljIGlkZWEgaXMgaGF2aW5nIGEgc2ltcGxlIGFuZCBzdHVwaWQg
a2VybmVsLWRyaXZlciB3aGljaCBpbXBsZW1lbnRzCnRoZSBNVEQgaW50ZXJmYWNlIGFuZCBjYW4g
YWN0IGxpa2Ugd2hhdGV2ZXIgd2Ugd2FudC4KVGhlIGxvZ2ljIHNoYWxsIGhhcHBlbiBpbiBhbiBl
bXVsYXRvciBsaWtlIHFlbXUuClRoaW5rIG9mIHZpcnRpby1ibGsgb3IgdmlydGlvLXNjc2kuCgpC
ZXNpZGUgb2YgZW11bGF0aW5nIHZhcmlvdXMgZmxhc2hlcywgSSBoYXZlIG1vc3RseSB0ZXN0aW5n
IGluIG1pbmQuClRlc3RpbmcgbGlrZSBwb3dlci1jdXQgZW11bGF0aW9uLCBpbyBsb2dnaW5nIGFu
ZCByZXBsYXksIHNpbXVsYXRpb24gb2YKTUxDIGlzc3VlcyAocGFpcmVkLXBhZ2VzKSwgLi4uCgpU
aGFua3MsCi8vcmljaGFyZAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
