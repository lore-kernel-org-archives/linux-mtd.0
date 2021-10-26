Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE03C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 19:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD6B60E09
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 19:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBD6B60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x2WMjrp0fnVETpKfIomzBqDh2BNWTj7CFxs+P38wl1A=; b=V18OnxNr4XNPFMDn+qetRALkXb
	i7Av9Qr5sng165NG9fCN3XhJS2gJF8zgoPyCvsxI04ok2TTkoIDFxYlXH7rZnfhf3sYdcX4+kk+nz
	gMoswARMtvSzd4sGFhFENo7A9xM82kLed9rVdFibhCf1O9dc/5Om7pGdVWuq7udrsuKK4XUL/iQdR
	OjdUHbUYD32tSGQGPgKFbdQKvM+0ZI60L1/iopoFWY4LVgT3paT3fVYs+ATqFuohU3Di7kHDHHe2g
	YZ+JDTlBGAO7dD11+YDLrP9ErdnQDfOhnB7L4V0g1uLVmH+RF+Rqzn7zTwBeFz957Temuk1LeKSm8
	HvBfhQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfRhk-002q1e-Ce; Tue, 26 Oct 2021 19:01:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfRhg-002pyX-3D
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 19:01:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3046361EAE61;
 Tue, 26 Oct 2021 21:01:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0Uej2VSHJAXt; Tue, 26 Oct 2021 21:01:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5634F61EAE6D;
 Tue, 26 Oct 2021 21:01:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RJhtugjmg9J7; Tue, 26 Oct 2021 21:01:32 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 351E461EAE61;
 Tue, 26 Oct 2021 21:01:32 +0200 (CEST)
Date: Tue, 26 Oct 2021 21:01:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <876982414.38679.1635274892099.JavaMail.zimbra@nod.at>
In-Reply-To: <20211026150350.GA5136@localhost>
References: <20210801234509.18774-1-ezequiel@collabora.com>
 <20211026150350.GA5136@localhost>
Subject: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdblock: Advertise about UBI and UBI block
Thread-Index: ygsGgewhiNEi2q8Y/RdrIOGb8OTitg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_120144_486643_75C7F6FF 
X-CRM114-Status: GOOD (  14.99  )
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

VHJldm9yLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRyZXZvciBX
b2VybmVyIiA8dHdvZXJuZXJAZ21haWwuY29tPgo+IEFuOiAiRXplcXVpZWwgR2FyY2lhIiA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+LCAicmljaGFyZCIKPiA8cmljaGFyZEBub2QuYXQ+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRp
LmNvbT4KPiBHZXNlbmRldDogRGllbnN0YWcsIDI2LiBPa3RvYmVyIDIwMjEgMTc6MDM6NTAKPiBC
ZXRyZWZmOiBSZTogW1BBVENIIDAvM10gbXRkYmxvY2s6IEFkdmVydGlzZSBhYm91dCBVQkkgYW5k
IFVCSSBibG9jawoKPiBPbiBTdW4gMjAyMS0wOC0wMSBAIDA4OjQ1OjAyIFBNLCBFemVxdWllbCBH
YXJjaWEgd3JvdGU6Cj4+IEhpIFJpY2hhcmQsIGFuZCBldmVyeW9uZSBlbHNlOgo+PiAKPj4gQnJv
d3NpbmcgdGhlIGludGVybmV0IGZvciAiSkZGUzIgbXRkIiByZXN1bHRzIGluIHR1dG9yaWFscywg
YXJ0aWNsZXMKPj4gYW5kIGdpdGh1Yi5naXN0czAgdGhhdCBwb2ludCB0byBtdGRibG9jay4KPj4g
Cj4+IEluIGZhY3QsIGV2ZW4gdGhlIE1URCB3aWtpIG1lbnRpb25zIHRoYXQgSkZGUzIKPj4gbmVl
ZHMgbXRkYmxvY2sgdG8gbW91bnQgYSByb290ZnM6Cj4+IAo+PiAgIGh0dHA6Ly93d3cubGludXgt
bXRkLmluZnJhZGVhZC5vcmcvZmFxL2pmZnMyLmh0bWwKPj4gCj4+IE1vcmVvdmVyLCBJIHN1c3Bl
Y3QgdGhlcmUgbWF5IGJlIGxvdHMgb2YgdXNlcnMKPj4gdGhhdCBzdGlsbCBiZWxpZXZlIG10ZGJs
b2NrIGlzIHNvbWVob3cgbmVlZGVkIHRvCj4+IG1vdW50IFNxdWFzaEZTLgo+PiAKPj4gSSd2ZSB0
YWtlbiBhIHZlcmJvc2Ugcm91dGUgYW5kIGFkZGVkIGEgcHJfd2Fybgo+PiB3YXJuaW5nIGlmIHRo
ZSBkZXZpY2VzIGFyZSBOQU5ELiBJIGRvbid0IHRoaW5rIHVzaW5nCj4+IE5BTkQgd2l0aG91dCBV
QkkgaXMgdG9vIHdpc2UsIGFuZCBnaXZlbiB0aGUgYW1vdW50Cj4+IG9mIG91dGRhdGVkIHR1dG9y
aWFscyBJIGJlbGlldmUgc29tZSBhZHZlcnRpc2luZwo+PiB3aWxsIGhlbHAuCj4gCj4gTm90IGFs
bCBOQU5EIHBhcnRpdGlvbnMgb24gYSBkZXZpY2Ugd2lsbCBjb250YWluIGxpbnV4IHJvb3QgZmls
ZXN5c3RlbXMuIEZvciBhCj4gbGludXggcm9vdCBmaWxlc3lzdGVtIHBlcmhhcHMgdXNpbmcgVUJJ
L1VCSUZTIGlzIHByZWZlcnJlZCwgeWV0IHRoZXNlIG1lc3NhZ2VzCj4gcHJpbnQgb3V0IGZvciBl
YWNoIGFuZCBldmVyeSBOQU5EIHBhcnRpdGlvbjoKPiAKPglbICAgIDAuOTAwODI3XSBDcmVhdGlu
ZyA4IE1URCBwYXJ0aXRpb25zIG9uICJueHBfbHBjMzIyMF9zbGMiOgo+CVsgICAgMC45MDY0MzFd
IDB4MDAwMDAwMDAwMDAwLTB4MDAwMDAwMDIwMDAwIDogImJvb3Ryb20iCj4JWyAgICAwLjkxMzUy
M10gbXRkYmxvY2s6IE1URCBkZXZpY2UgJ2Jvb3Ryb20nIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRl
ciB1c2luZyBVQkkKPglibG9jayBkZXZpY2VzIGluc3RlYWQuCj4JWyAgICAwLjkzMzMzNF0gMHgw
MDAwMDAwMjAwMDAtMHgwMDAwMDAwODAwMDAgOiAidWJvb3QiCj4JWyAgICAwLjk0MDQzOV0gbXRk
YmxvY2s6IE1URCBkZXZpY2UgJ3Vib290JyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcg
VUJJCj4JYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgo+CVsgICAgMC45NjMzMjJdIDB4MDAwMDAwMDgw
MDAwLTB4MDAwMDAwNDQwMDAwIDogImZia2VybmVsIgo+CVsgICAgMC45NzA2NTVdIG10ZGJsb2Nr
OiBNVEQgZGV2aWNlICdmYmtlcm5lbCcgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nCj4J
VUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4KPglbICAgIDAuOTkzMzYxXSAweDAwMDAwMDQ0MDAw
MC0weDAwMDAwMDkyMDAwMCA6ICJmYnJvb3RmcyIKPglbICAgIDEuMDAwNzI1XSBtdGRibG9jazog
TVREIGRldmljZSAnZmJyb290ZnMnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZwo+CVVC
SSBibG9jayBkZXZpY2VzIGluc3RlYWQuCj4JWyAgICAxLjAyMzMxNV0gMHgwMDAwMDA5MjAwMDAt
MHgwMDAwMDBjZTAwMDAgOiAiY19rZXJuZWwiCj4JWyAgICAxLjAzMDcyMl0gbXRkYmxvY2s6IE1U
RCBkZXZpY2UgJ2Nfa2VybmVsJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcKPglVQkkg
YmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgo+CVsgICAgMS4wNTM0NDRdIDB4MDAwMDAwY2UwMDAwLTB4
MDAwMDAwZDAwMDAwIDogImNfX2F0YWdzIgo+CVsgICAgMS4wNjA3NDJdIG10ZGJsb2NrOiBNVEQg
ZGV2aWNlICdjX19hdGFncycgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nCj4JVUJJIGJs
b2NrIGRldmljZXMgaW5zdGVhZC4KPglbICAgIDEuMDgzMzQ5XSAweDAwMDAwMGQwMDAwMC0weDAw
MDAwMTAwMDAwMCA6ICJjX3Jvb3RmcyIKPglbICAgIDEuMDkwNzAyXSBtdGRibG9jazogTVREIGRl
dmljZSAnY19yb290ZnMnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZwo+CVVCSSBibG9j
ayBkZXZpY2VzIGluc3RlYWQuCj4JWyAgICAxLjExMzMzNV0gMHgwMDAwMDEwMDAwMDAtMHgwMDAw
MjAwMDAwMDAgOiAibWVuZGVyIgo+CVsgICAgMS4xMzE2MjddIG10ZGJsb2NrOiBNVEQgZGV2aWNl
ICdtZW5kZXInIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkKPglibG9jayBkZXZp
Y2VzIGluc3RlYWQuCj4gCj4gTkFORCB0ZW5kcyB0byBiZSBzb21ldGhpbmcgZm91bmQgb24gb2xk
ZXIgZGV2aWNlcywgdGhlIGZpcm13YXJlL2Jvb3Rsb2FkZXJzCj4gb2Ygb2xkZXIgZGV2aWNlcyBj
b3VsZG4ndCBwb3NzaWJseSB1bmRlcnN0YW5kIFVCSS9VQklGUyBzbyBtYW55IG9mIHRoZXNlCj4g
cGFydGl0aW9ucyBuZWVkIGJlICJyYXciIHBhcnRpdGlvbnMsIG9yIHVzZSBzb21ldGhpbmcgdGhh
dCBwcmVkYXRlcyBVQkkuCj4gCj4gSXJvbmljYWxseSBteSAibWVuZGVyIiBwYXJ0aXRpb24gY29u
dGFpbnMgYSBVQkkgKHdpdGggbXVsdGlwbGUgVUJJRlNlcyBpbnNpZGUpCj4geWV0IEkgZ290IHRo
ZSBzYW1lICJwbGVhc2UgdXNlIFVCSSIgbWVzc2FnZSBhcyBhbGwgdGhlIG90aGVycyAobG9sKQo+
IAo+IEknbSBzcGVjaWZ5aW5nIG15IHBhcnRpdGlvbnMgaW4gRFQgd2l0aDoKPiAKPiBwYXJ0aXRp
b25zIHsKPiAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+IAo+ICAg
ICAgICBtdGQwQDAgICAgICAgeyBsYWJlbCA9ICJib290cm9tIjsgICByZWcgPSA8MHgwMDAwMDAw
MCAweDAwMDIwMDAwPjsgfTsKPiAgICAgICAgbXRkMUAyMDAwMCAgIHsgbGFiZWwgPSAidWJvb3Qi
OyAgICAgcmVnID0gPDB4MDAwMjAwMDAgMHgwMDA2MDAwMD47IH07Cj4gICAgICAgIG10ZDJAODAw
MDAgICB7IGxhYmVsID0gImZia2VybmVsIjsgIHJlZyA9IDwweDAwMDgwMDAwIDB4MDAzYzAwMDA+
OyB9Owo+ICAgICAgICBtdGQzQDQ0MDAwMCAgeyBsYWJlbCA9ICJmYnJvb3RmcyI7ICByZWcgPSA8
MHgwMDQ0MDAwMCAweDAwNGUwMDAwPjsgfTsKPiAgICAgICAgbXRkNEA5MjAwMDAgIHsgbGFiZWwg
PSAiY19rZXJuZWwiOyAgcmVnID0gPDB4MDA5MjAwMDAgMHgwMDNjMDAwMD47IH07Cj4gICAgICAg
IG10ZDVAY2UwMDAwICB7IGxhYmVsID0gImNfX2F0YWdzIjsgIHJlZyA9IDwweDAwY2UwMDAwIDB4
MDAwMjAwMDA+OyB9Owo+ICAgICAgICBtdGQ2QGQwMDAwMCAgeyBsYWJlbCA9ICJjX3Jvb3RmcyI7
ICByZWcgPSA8MHgwMGQwMDAwMCAweDAwMzAwMDAwPjsgfTsKPiAgICAgICAgbXRkN0AxMDAwMDAw
IHsgbGFiZWwgPSAibWVuZGVyIjsgICAgcmVnID0gPDB4MDEwMDAwMDAgMHgxZjAwMDAwMD47IH07
Cj4gfTsKPiAKPiB3aGljaCBpcyB3aHksIEkgYXNzdW1lLCBJJ20gZ2V0dGluZyB0aGVzZSBtZXNz
YWdlcy4gSXMgdGhlcmUgYSBVQkktZnJpZW5kbHkKPiB3YXkgdG8gZGVmaW5lIHRoZW0gdG8gYXZv
aWQgdGhlc2UgbWVzc2FnZXM/CgpIbW0sIG1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIGFkdmVydGlz
ZSBpdCBvbmx5IG9uY2UgYW5kIG5vdCBmb3IgZWFjaCBtdGRibG9jayBkZXZpY2UuCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
