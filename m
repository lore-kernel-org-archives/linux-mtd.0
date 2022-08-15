Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD9EC25B0D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Aug 2022 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1YafijQwWaa2WUohX5upVPgUGoFYMh/A35PuN6GQXc=; b=ikru/ztaKzMJyp
	nfn/jmBdi3mTaXk9L8Hfw0rnDav7RxVwSvcL2Y4GLqB6Z1tutr6ewstApMZ3RtGwNnQ7hc1XKkVCX
	pZVMUUvdYI/XU+FWOnfJr4g9BIc6BvAgj6cQ5lpRiTAUDEXJgI6Chl8cUkH476MWFlNmTUnLXK3No
	+h/0CU0ZIsGF7kPLq+OFpLSJy1svjFaz4uff4QW5gKpBS5U9tBoceCH+7AVQZUcF2jTUlRbXsYcPI
	gMJkgDopB9ZD4JGzZ3n6BJJ2COeifkczQkBJjlzDuHyUh7OPmJZYvSNZcHZkFDeu28JjJ6Gjr292m
	k5szgP/OXnrW3hXl1b/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNV7e-00CwVX-I6; Mon, 15 Aug 2022 08:06:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNV7U-00CwPX-BP
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2022 08:06:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E85B7B80C87;
	Mon, 15 Aug 2022 08:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72148C433C1;
	Mon, 15 Aug 2022 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660550801;
	bh=ZWdD4//qy21Fy+UM9otgzHjJebmsEssapMjiu0ARq+c=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=O3tlt3Ceekk+gJbrHR6jczJyrdpNDWIBKOTocSABCcsY29yr4yo+gCNXbGTppGlZA
	 ecOVymblGuaSalToVYFlp8hVZi3uWY0VHOHNBZfKZDi72UqAOCn09ZzD0g44SnbPdb
	 QnIe0+HM30X7OzNn/eugGdbo5k9YZYTVI/J3kBZnXsMlXc2DFc06XtDb6fEsB232km
	 v+ObJGBW00gKck1OdP57OC2oZIiuPzLj/iXkUtJVmoRPNngUmAc9QNrOWjml7+njaK
	 lDgvxKtEsrshTzvkU7yIQUUNKUdk1Y6wMfdMaL5LaQExoreZqD/t7pN62fvNWRoDb/
	 aPcZpZSqJ9Lcg==
Received: by pali.im (Postfix)
	id A1326BE0; Mon, 15 Aug 2022 10:06:38 +0200 (CEST)
Date: Mon, 15 Aug 2022 10:06:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Scott Wood <oss@buserror.net>, u-boot@lists.denx.de,
	linux-mtd@lists.infradead.org
Subject: Re: Have fsl_elbc_nand controllers subpage write support?
Message-ID: <20220815080638.p7623xyjf6kccdtc@pali>
References: <20220807120027.2zz43afbqtqljhul@pali>
 <20220807141300.tatzjlsjyhcxgegs@pali>
 <20220813103637.2qiikhitegxctlak@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813103637.2qiikhitegxctlak@pali>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_010644_587059_4980C82E 
X-CRM114-Status: GOOD (  23.13  )
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

T24gU2F0dXJkYXkgMTMgQXVndXN0IDIwMjIgMTI6MzY6MzcgUGFsaSBSb2jDoXIgd3JvdGU6Cj4g
SGVsbG8hCj4gCj4gT24gU3VuZGF5IDA3IEF1Z3VzdCAyMDIyIDE2OjEzOjAwIFBhbGkgUm9ow6Fy
IHdyb3RlOgo+ID4gT24gU3VuZGF5IDA3IEF1Z3VzdCAyMDIyIDE0OjAwOjI3IFBhbGkgUm9ow6Fy
IHdyb3RlOgo+ID4gPiBIZWxsbyBTY290dCEKPiA+ID4gCj4gPiA+IEluIHBhc3QgeW91IGRpc2Fi
bGVkIG5hbmQgc3VicGFnZSB3cml0ZSBzdXBwb3J0IGZvciBmcmVlc2NhbGUgZUxCQyBhbmQKPiA+
ID4gSUZDIFUtQm9vdCBuYW5kIGRyaXZlcnMgaW4gZm9sbG93aW5nIHBhdGNoOgo+ID4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAxMjExMDIyMzQ0MzIuR0ExODEyOUBidXNlcnJv
ci5uZXQvCj4gPiA+IAo+ID4gPiBCdXQgaW4gTGludXgga2VybmVsIHlvdSBkaXNhYmxlZCBpdCBv
bmx5IGluIGZyZWVzY2FsZSBJRkMgbmFuZCBkcml2ZXI6Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8yMDEzMDQxMDIyMzQzNy5HQTI2OTAwQGhvbWUuYnVzZXJyb3IubmV0
Lwo+ID4gPiAKPiA+ID4gbGV0dGluZyBrZXJuZWwncyBmcmVlc2NhbGUgZUxCQyBkcml2ZXIgdG8g
aGF2ZSBlbmFibGVkIHN1YnBhZ2Ugd3JpdGUKPiA+ID4gc3VwcG9ydC4KPiA+ID4gCj4gPiA+IEkg
d291bGQgbGlrZSB0byBhc2ssIGhhcyBmcmVlc2NhbGUgZUxCQyBuYW5kIGNvbnRyb2xsZXIgc3Vw
cG9ydCBmb3IKPiA+ID4gc3VicGFnZSB3cml0ZXM/IE9yIG5vdCBhbmQgaXQgc2hvdWxkIGJlIGRp
c2FibGVkIGFsc28gaW4ga2VybmVsPwo+ID4gPiAKPiA+ID4gT3IgaGFzIHNvbWVib2R5IGVsc2Ug
dGhlc2UgZGV0YWlscz8KPiA+IAo+ID4gTm93IEkgZm91bmQgZm9sbG93aW5nIGNvbW1pdCBodHRw
Oi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9mMDM0ZDg3ZGVmNTEKPiA+IHdoaWNoIHNlZW1z
IHRvIGJlIGZpeGluZy9lbXVsYXRpbmcgc3VicGFnZSB3cml0ZSBzdXBwb3J0Lgo+IAo+IElmIHRo
ZXJlIGlzIG5vdCBhbnkgb2JqZWN0aW9ucyBJIHdvdWxkIHNlbmQgcGF0Y2ggdG8gVS1ib290IGVM
QkMgbmFuZAo+IGNvbnRyb2xsZXIgZHJpdmVyIHdoaWNoIHdvdWxkIHJlbW92ZSB0aGF0IE5BTkRf
Tk9fU1VCUEFHRV9XUklURSB0b28uIEFzCj4gdGhvc2Ugc3VicGFnZSB3cml0ZSBmdW5jdGlvbnMg
YXJlIHByZXNlbnQgYWxzbyBpbiBVLUJvb3QgZHJpdmVyLgo+IAo+IEFueSBjb21tZW50cz8KCk5v
IG9iamVjdGlvbnMsIHNvIFUtQm9vdCBwYXRjaCBpcyBoZXJlOgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy91LWJvb3QvMjAyMjA4MTUwODAxNDAuNDA0OC0xLXBhbGlAa2VybmVsLm9yZy9ULyN1Cgo+
ID4gPiBUaGUgbWFpbiBpc3N1ZSBpcyB0aGF0IFUtQm9vdCBuYW5kIGFuZCBVQkkgc3VwcG9ydCBm
b3IgYm9hcmRzIHdpdGggZUxCQwo+ID4gPiBjb250cm9sbGVycyBpcyBjb21wYXRpYmxlIHdpdGgg
TGludXgga2VybmVsIG5hbmQgYW5kIFVCSSBzdXBwb3J0IGJlY2F1c2UKPiA+ID4gdGhlc2UgdHdv
IGRyaXZlcnMgY2FsY3VsYXRlIFVCSSBnZW9tZXRyeSBkaWZmZXJlbnRseS4gVUJJIGhlYWRlciBv
ZmZzZXQKPiA+ID4gaXMgY2FsY3VsYXRlZCBmcm9tIG5hbmQgc3VicGFnZSBzaXplIGFuZCBuYW5k
IHN1YnBhZ2Ugc2l6ZSBvYnZpb3VzbHkKPiA+ID4gZGVwZW5kcyBvbiB0aGUgZmFjdCBpZiBzdWJw
YWdlIHdyaXRlIGlzIHN1cHBvcnRlZCBvciBub3QuCj4gPiA+IAo+ID4gPiBJIHdvdWxkIGxpa2Ug
dG8gZml4IHRoaXMgaXNzdWUsIGJ1dCBJIGRvIG5vdCBrbm93IGlmIHdyb25nIGluZm9ybWF0aW9u
Cj4gPiA+IGlzIGluIFUtQm9vdCBkcml2ZXIgb3IgaW4gTGludXgga2VybmVsIGRyaXZlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
