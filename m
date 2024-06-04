Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1082CC25B74
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 04:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOoL16nTiI9ao9VD+YzLFxMiFYr+YIm+TrRHYmnjHmc=; b=lkFaUQPgU8aath
	mEb4l+p2AlIXCH9PjKuPxylvIq0rSmVd21ASswqD/JDTwvjCsY+gFoZtvyagrpWjAHs9WybCEGXYh
	/DN2juDsuBX+Yy5kwRpfy3kjK0QgsJCyP16bsAdSQU+aJDIvVmFyD6UAMHTO1049mXQXCps3xe7k0
	qS89Uh3oWwf5okPsT/pVbywsU6dSNqFEj8Cap7r75EQnvhRwWrXoI/WsAehN1HQlYN+wb5THb5MsT
	DdUaTH1luM025H/VjbVm5e92CPnJoKWUTn7yYXHkrqTXNzmhiC2FyVm/3dzJAtItuLel5ePn8UJyC
	a887453Y3zT77/fDHeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELiA-00000001AJy-3yVv;
	Tue, 04 Jun 2024 04:23:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELi8-00000001AIe-0F4T
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 04:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DD7360B2D;
	Tue,  4 Jun 2024 04:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F7DC2BBFC;
	Tue,  4 Jun 2024 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717475027;
	bh=iLd7cgx6ibP4YKhoLDBW15p2SVG5OuLq+YKnI07DV78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9LSPfnCMdsSYt7uoLThiDEV81/e/D02UG8zzLIDlesFcCyq0kiwd3cyKoue9VUoP
	 BEoXtBixtULz5017/tOoRocc+/2HJeohPgg0lcGDYqsm9CG0AGzhLQfnCmSPfT9tCR
	 n4/Wv95gxkim5YHAoi5L9SUyqKIJX6W6lnzrjhAo=
Date: Tue, 4 Jun 2024 06:23:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
	computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] Documentation: mtd: spinand: macronix: Add support for
 serial NAND flash
Message-ID: <2024060430-expire-geography-64dc@gregkh>
References: <20240603073953.16399-1-linchengming884@gmail.com>
 <2024060337-relatable-ozone-510e@gregkh>
 <CAAyq3SYg3Qr08DguhPbC8Bb89_KS_AAG-Z8SNG_A7H_v4YNrDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAyq3SYg3Qr08DguhPbC8Bb89_KS_AAG-Z8SNG_A7H_v4YNrDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_212348_624858_596FFF13 
X-CRM114-Status: GOOD (  20.82  )
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

T24gVHVlLCBKdW4gMDQsIDIwMjQgYXQgMDk6NDQ6MDFBTSArMDgwMCwgQ2hlbmcgTWluZyBMaW4g
d3JvdGU6Cj4gSGVsbG8sCj4gCj4gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IOaWvCAyMDI05bm0NuaciDPml6Ug6YCx5LiAIOS4i+WNiDM6NTjlr6vpgZPvvJoKPiA+Cj4gPiBP
biBNb24sIEp1biAwMywgMjAyNCBhdCAwMzozOTo1M1BNICswODAwLCBDaGVuZyBNaW5nIExpbiB3
cm90ZToKPiA+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50
dz4KPiA+ID4KPiA+ID4gTVgzNVVGezEsMiw0fUdFNEFEIGFuZCBNWDM1VUZ7MSwyfUdFNEFDIGhh
dmUgYmVlbiBtZXJnZSBpbnRvCj4gPiA+IExpbnV4IGtlcm5lbCBtYWlubGluZS4KPiA+Cj4gPiBU
cmFpbGluZyB3aGl0ZXNwYWNlIDooCj4gCj4gU29ycnksIHdlIHdpbGwgZml4IGl0IGluIHRoZSBu
ZXh0IHZlcnNpb24uCj4gCj4gPgo+ID4gPiBDb21taXQgSUQ6ICJjMzc0ODM5ZjliNDQ3NTE3M2U1
MzZkMWVhZGRmZjQ1Y2I0ODFkYmRmIi4KPiA+Cj4gPiBTZWUgdGhlIGtlcm5lbCBkb2N1bWVudGF0
aW9uIGZvciBob3cgdG8gcHJvcGVybHkgcmVmZXJlbmNlIGNvbW1pdHMgaW4KPiA+IGNoYW5nZWxv
ZyBtZXNzYWdlcy4KPiAKPiBTdXJlLCB0aGlzIHdpbGwgYWxzbyBiZSBmaXhlZCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgo+IAo+ID4KPiA+ID4gRm9yIFNQSS1OQU5EIGZsYXNoIHN1cHBvcnQgb24gTGlu
dXgga2VybmVsIExUUyB2NS40LnksCj4gPiA+IGFkZCBTUEktTkFORCBmbGFzaCBNWDM1VUZ7MSwy
LDR9R0U0QUQgYW5kIE1YMzVVRnsxLDJ9R0U0QUMgaW4gaWQgdGFibGVzLgo+ID4gPgo+ID4gPiBU
aG9zZSBmaXZlIGZsYXNoZXMgaGF2ZSBiZWVuIHZhbGlkYXRlIG9uIFhpbGlueCB6eW5xLXBpY296
ZWQgYm9hcmQgYW5kCj4gPiA+IExpbnV4IGtlcm5lbCBMVFMgdjUuNC55Lgo+ID4KPiA+IFdoYXQg
ZG9lcyA1LjQueSBoYXZlIHRvIGRvIHdpdGggdGhlIGxhdGVzdCBtYWlubGluZSB0cmVlPyAgSXMg
dGhpcwo+ID4gdGVzdGVkIG9uIG91ciBsYXRlc3QgdHJlZT8KPiAKPiBXZSBoYXZlIHJlcXVpcmVt
ZW50cyBzcGVjaWZpYyB0byB0aGUgNS40LnksIGFuZCB0aGVzZSBmaXZlIGZsYXNoZXMKPiBoYXZl
IGJlZW4gYWRhcHRlZCBmb3IgdGhlIGxhdGVzdCBtYWlubGluZSB0cmVlLgo+IEFkZGl0aW9uYWxs
eSwgdGhleSBoYXZlIGJlZW4gcGF0Y2hlZCBvbiBMVFMgNS4xNC55LCBhbmQgd2UgaGF2ZQo+IHRl
c3RlZCB0aGVtIG9uIExUUyA1LjQueS4KPiBHaXZlbiB0aGVzZSBjaXJjdW1zdGFuY2VzLCB3ZSBh
cmUgaG9wZWZ1bCBmb3IgYXBwcm92YWwgdG8gYmFja3BvcnQKPiB0aGVzZSBmaXZlIGZsYXNoIElE
cyBvbiA1LjQueS4KCklmIHRoaXMgaXMgYSBiYWNrcG9ydCwgcGxlYXNlIGp1c3QgZm9sbG93IHRo
ZSBkb2N1bWVudGF0aW9uIGZvciB0aGUKc3RhYmxlIGtlcm5lbCBmb3IgaG93IHRvIHByb3Blcmx5
IGdldCBhIHBhdGNoIGJhY2twb3J0ZWQuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
