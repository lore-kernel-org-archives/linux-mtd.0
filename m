Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD40C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 04:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAbkHQzhyr7zlqghjImxw6nZT82HMfC+vT49mkWIuuw=; b=LcukSPS1ViIt5b
	qZniycy7xlh0ns227WhDl3UDx99uGrva9pJvHRQsv6hrfpElsikLqgRLwmlaut2GJXzCHpy8sOsje
	L+AIrE11ZobGmcenwvvwHlsNHe001gA6Xx9ZM58peHBvBFMwg/i9+zFt66lf02ftkyyesX3DZoGpV
	Jai1CUIotkiVlgQSP8tDMWs1Gsae6u3eF8JMBtW4SU48AMVs375ufuOX6J2BKyRYdgf6rT3CaD48F
	/Q7zOEsNUd/MbrGXUkSrSHODFu5H+cWcOX/O8ac9kFEh7dYjqSlnSGoKChB40SHXU/9A4nrdDWADw
	f3xwm8YaivNZo8yefOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfDj0-008N0k-69; Fri, 15 Apr 2022 04:38:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDiw-008Mzh-Kz
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 04:38:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id g18so13536850ejc.10
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 21:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+UOQk5PL0W5nk2yT9AX03d9aQZ1GjAatc7hRG+yFSt4=;
 b=bnTfHl/2xQcrSqd0Xcaqjk8F7HQE2aZITN8QsrJZj9cAwCVyqvka11t+TrWePavSsl
 FQLV9WvDfnE5h8Wb33vbosfBwcM+3Pt9BAh7keD9/W8cyjKYwXQPQTC9CEQIHXUxGkS9
 pzUyTGjVaSNv4nJCDv0bZQxZgUODK3o412OTaDSKMK8ErVEc0dXWP6Q4psl4298AtFSC
 TGdFz2ql0FY6Arw6nTW44SusxccFeAkMwZewsGTzLC7EVU3mvBLB2fryVJJMCC+p4h3O
 ddy56PakMjQKMkbHKSkpfeDNHlMO2Nh6eDgoQAuSmKJhF/44D2WXkEIieniieMbWgWO/
 2Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+UOQk5PL0W5nk2yT9AX03d9aQZ1GjAatc7hRG+yFSt4=;
 b=LBsSqnnn42a9UVCSJnoKmdEQYvHaoIdP9RKLmEi9al8p8Q7FK7yAcbIzFeY+Z9Dy+/
 x+Wwgh4lGWbi0bSbIKkwT8E+t2BNVeGbKL8l8kLxD7HbKQrZOyXmUZ7gV1boq2gfdA8V
 V3r2wPPeeoqfr/GR+jro5rR9Locj2kAHunRrTaWAQdYiaZRFuJazHZsJxPo56dN3iwaq
 EcQGbNKC50FkCIGPJl99Hv9gatrTGyE91ITxnrNhICSl7csXWGSapSBZPvBUx6NzPVFZ
 0xAnYRwulLQRaHAMtCLbnN9u/swKszMCp8fcrWSP3s2nGdbAjOkPUssMFLQJXsmUvRuT
 a9yg==
X-Gm-Message-State: AOAM533x81t/2D2lg1pDrvhxxtvlZA56GwzqnRjExQnjPVasFGgoOipT
 I87Oi5X7s7/FB7a/dcmtcBS6QowQB1d6E/tXn8llM2EKMPbmuQ==
X-Google-Smtp-Source: ABdhPJy/n54z1D58qHddiXs6kw3uTJr3PsUVN5vPBHNxCJ7HETiGb5D4FaPdBEjpwIUuLJ6WdcPmX0cDxwAqfgZG99g=
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr4908670ejc.285.1649997500631; Thu, 14
 Apr 2022 21:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
 <20220414192413.0db7ef46@xps13>
In-Reply-To: <20220414192413.0db7ef46@xps13>
From: Scott Zhang <macromarship@gmail.com>
Date: Fri, 15 Apr 2022 12:38:09 +0800
Message-ID: <CABy3iKzERYHD8Kj+NNnPdAxTxO6ANwrUJGcJO77385RtY1ddGg@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_213822_748993_4B961D92 
X-CRM114-Status: GOOD (  22.28  )
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

SGkuIE1pcXXDqGwuClllcy4gSSB0cmllZCBuYW5kYml0ZXJycywgdGhlIHJlc3VsdCBpcyBiZWxv
dy4gTG9va3MgZWNjIGlzIG5vdCB3b3JraW5nIC4KCltyb290QGpnY3g6IH5dIy4vbmFuZGJpdGVy
cnMgL2Rldi9tdGQyIC1pCmluY3JlbWVudGFsIGJpdGVycm9ycyB0ZXN0ClN1Y2Nlc3NmdWxseSBj
b3JyZWN0ZWQgMCBiaXQgZXJyb3JzIHBlciBzdWJwYWdlCkluc2VydGVkIGJpdGVycm9yIEAgMC81
CkZhaWxlZCB0byByZWNvdmVyIDEgYml0ZmxpcHMKUmVhZCBlcnJvciBhZnRlciAxIGJpdCBlcnJv
cnMgcGVyIHBhZ2UKCkJ5IGNoZWNraW5nIHRoZSBuYW5kIGRyaXZlciB3aGljaGkgaXMgbnVjOTgw
X25hbmQuYwoKaHR0cHM6Ly9naXRodWIuY29tL09wZW5OdXZvdG9uL05VQzk4MC1saW51eC00LjQu
eS9ibG9iL21hc3Rlci9kcml2ZXJzL210ZC9uYW5kL251Yzk4MF9uYW5kLmMKCgoqIEVuYWJsZSBI
VyBFQ0MgOiB1bnVzZWQgb24gbW9zdCBjaGlwcwoqLwp2b2lkIG51Yzk4MF9uYW5kX2VuYWJsZV9o
d2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IG1vZGUpCnsKRU5URVIoKTsKI2lmZGVmIE5V
Qzk4MF9OQU5EX0RFQlVHCnsKY2hhciAqIHB0cj1SRUdfU01SQTA7CmludCBpPTA7CmlmKCBtb2Rl
ID09IE5BTkRfRUNDX1JFQUQgKQpwcmludGsoIltSXT1cbiIpOwplbHNlCnByaW50aygiW1ddPVxu
Iik7Cgpmb3IoaT0wOyBpPG10ZC0+b29ic2l6ZTsgaSsrKQp7CnByaW50aygiJVggIiwgKihwdHIr
aSkgKTsKaWYgKCBpICUgMzIgPT0gMzEpCnByaW50aygiXG4iKTsKfQpwcmludGsoIlxuIik7Cn0K
I2VuZGlmCkxFQVZFKCk7Cn0KCgpJIGd1ZXNzIHRoZSBudWM5ODAgZHJpdmVyIGRvZXNuJ3Qgc3Vw
cG9ydCBlY2MgY29ycmVjdGlvbi4KCgoKT24gRnJpLCBBcHIgMTUsIDIwMjIgYXQgMToyNCBBTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFNj
b3R0LAo+Cj4gbWFjcm9tYXJzaGlwQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDE1IEFwciAyMDIy
IDAwOjQ1OjIzICswODAwOgo+Cj4gPiBIZWxsby4gRXZlcnlvbmUuCj4gPiAgICAgIEkgZW5jb3Vu
dGVyZWQgYSBzdHJhbmdlIHByb2JsZW0gYWJvdXQgdWJpZnMuIE15IGVtYmVkIGxpbnV4IHJ1bnMK
PiA+IHdlbGwgbm9ybWFsbHkuIEJ1dCBhZnRlciBhYm91dCAzLTQgZGF5cywgZGV2ZWxvcGluZyBw
aHAgYXBwbGljYXRpb24sCj4gPiBjb3B5aW5nIGZpbGVzIGV0Yy4uIHRoZSAvb3B0IHBhcnRpdGlv
biB3aGVuIHJlYWQsIHRoZSBzeXN0ZW0gYmVjb21lCj4gPiB2ZXJ5IHNsb3cuIEFmdGVyIGNoZWNr
IGRtZXNnCj4gPiB0aGUgb3V0cHV0IGNvbnRhaW5zIGZ1bGwgb2YgZGVidWcgbG9ncyBhcyBiZWxv
dy4KPiA+Cj4gPiBbMTc1ODguMDQwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTY5MSk6
IGRvX3JlYWRwYWdlOiBjYW5ub3QKPiA+IHJlYWQgcGFnZSAxNSBvZiBpbm9kZSAzOTYsIGVycm9y
IC0yMgo+ID4gWzE3NTkwLjA4MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTU2OTUpOiB1
Ymlmc19kZWNvbXByZXNzOgo+ID4gY2Fubm90IGRlY29tcHJlc3MgMjI5MyBieXRlcywgY29tcHJl
c3NvciBsem8sIGVycm9yIC0yMgo+ID4gWzE3NTkwLjA5MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6
MCBwaWQgMTU2OTUpOiBkb19yZWFkcGFnZTogYmFkIGRhdGEKPiA+IG5vZGUgKGJsb2NrIDE1LCBp
bm9kZSAzOTYpCj4gPiBsb3RzIG9mIGhleCBkdW1wLCBzZWVtcyBub3JtYWwgZGF0YQo+ID4KPiA+
IEJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcgb2YgdWJpIGFuZCB1YmkgZnMuIFRoZSBib3R0b21l
c3QgbmFuZCBkcml2ZXIKPiA+IGhhcyB0aGUgZWNjIGNvcnJlY3Rpb24sIHRoZW4gdWJpIGhhcyBj
cmMzMiB0byB2ZXJpZnkgZGF0YSB3cml0ZSBhbmQKPiA+IHJlYWQuIFRoZW4gd2hlbiBkYXRhIGNv
bWUgdG8gdWJpZnMsIHRoZSBkYXRhIHNob3VsZCBiZSBhbHdheXMgY29ycmVjdC4KPiA+IEFueXRo
aW5nIHdyb25nIHdpbGwgYmUgcmVwb3J0ZWQgZmlyc3RseSBieSB1YmkgYmVsb3cgb3IgbXRkIG5h
bmQKPiA+IGRyaXZlciBiZWxvdy4KPiA+IFNvIHRoZSBtc2cgc2hvd3MgYWJvdmUgY29uZnVzZSBt
ZS4gV2h5IGRpZCBkZWNvbXByZXNzIGZhaWwgZm9yIHBhc3NlZAo+ID4gY3JjMzIgZGF0Ye+8nwo+
ID4gSXMgdGhlcmUgYW55d2F5IHRvIHNpbXBsZSBkcm9wIHRoZSBibG9jayAxNSwgaW5vZGUgMzk2
IHNvIG5vIHdhcm5pbmcKPiA+IGFueW1vcmUuIEV2ZW4gc28gbWFueSBsb2dzIGR1bXBlZCAsdGhl
IHN5c3RlbSBjb250aW51ZXMgcnVucyAsIGJ1dAo+ID4gcmFtZG9tbHkgaGFuZ3MuIE1heWJlIG5v
IGhhbmcsIHRoZSBsaW51eCBydW4gbGVkIGNvbnRpbnVlcyBibGluaywKPiA+IG5ldHdvcmsgbGVk
IGJsaW5rLCB0aGUgcGluZyBpcCBpcyBub3QgcmVhY3QuCj4gPiBCZWNhdXNlIEkgcG9ydCB0aGUg
bmFuZCBkcml2ZXIgbXlzZWxmLCBhbmQgcG9ydCBldmVyeXRoaW5nIHRvIG1ha2UKPiA+IG5hbmQg
d29ya2luZy4gU28gSXMgdGhlcmUgYSBwb3NzaWJpbGl0eSBJIG1ha2UgZWNjIGNoZWNrc3VtIHdy
b25nLAo+ID4gdGhlbiBnZXQgdGhpcyB3aWVyZCBwcm9ibGVtPwo+ID4KPiA+IEkgZ29vZ2xlZCBm
aXJzdCwgYW5kIG9ubHkgc2VlIHJlbGF0ZWQgZGlzY3VzcyBvbiAyMDExIGJ1dCBjYW4ndCBzZWUg
aXQgaGVscC4KPiA+IGh0dHBzOi8vbGludXgtbXRkLmluZnJhZGVhZC5uYXJraXZlLmNvbS9jNjVT
ZWRZcC91Ymlmcy1kZWNvbXByZXNzLWNhbm5vdC1kZWNvbXByZXNzCj4KPiBIZWxsbyBTY290dCwg
aWYgeW91IGFyZSB1bnN1cmUgYWJvdXQgeW91ciBOQU5EIGltcGxlbWVudGF0aW9uIHlvdSBjYW4K
PiBydW4gYWxsIHRoZSBuYW5kL3ViaSB0ZXN0cyBhdmFpbGFibGUgaW4gdGhlIG10ZC11dGlscyB0
ZXN0IHN1aXRlIChhbHNvCj4gYXZhaWxhYmxlIGFzIGEgQnVpbGRyb290IHBhY2thZ2UpOgo+IGh0
dHBzOi8vZ2l0LmluZnJhZGVhZC5vcmcvbXRkLXV0aWxzLmdpdAo+Cj4gVGhhbmtzLAo+IE1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
