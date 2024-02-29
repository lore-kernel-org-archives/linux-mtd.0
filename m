Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD67C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nRlweZwfY95KPXP9cQvJ/CTC98y/zzhGH4JDs7goUo=; b=sABCnYdI+ICJsM
	1LGFhg7PqJi/CFMHtf5ewNoUv4Dy3iZMGf75zzx6LcoIL8im+1VdfLvPbr19/LTI1cBkRMFoqzjNi
	506pGPgMdq5tSnOsLfwEXo0jAylVvHyeg45chXGtVtk+ofcfLtKXNc5yaFHtX9KyPYi/h18wqngUY
	wgR7ul8qzfQ54dUOKDqjTNpBfXgPjtLXKdAduNzHtKuaDeK0AUihafy4CdKrr5iZNHLwSh7poUu8g
	AikCTGlUQTnQf601pWXd6GGx28B35r2m/AIYvt4PvJP7ngJmH6n38eOB879Sn6tHlRi0lb2cQb6KQ
	2vP65OY7+MgkWgqAOoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdhH-0000000DAno-3JLA;
	Thu, 29 Feb 2024 10:31:27 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdhD-0000000DAmJ-3BHv;
	Thu, 29 Feb 2024 10:31:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12CF7E0008;
	Thu, 29 Feb 2024 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709202681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xB/mH2t7HucMvUeJIJZB7RytH2L7kmSd4lRMo452s7Q=;
	b=QU0VLTe5qBP5PiMq57AosE7CFqBFOBXnPt5TwOODUBfDS3l8/e/Tj4B7hh+x34uzlZmPPw
	pKfLh3ILuGLD4Lfvgm84/9sbL/BkupVZes47Yz598J+Pug6lLYjHqbN3Vy0vJeWZ9h2WmB
	1WLaySXulLngWCHOW64VKR8LS2bLJn91gPYZhsuPF4NIiPjYORzX18ZyDzuIVE1SFZfbIv
	wTD8UtHmvCK8K4T8UusSmytLGagbr5oezKNJHjbYaICQlSIeQIB2fjcoKjYj9KveHPYxVl
	slKXGYK+StUOcpqaoN9pENEGE6UFLjHJILKrmEcwrylplnI8G8ozEEfK30DXWw==
Date: Thu, 29 Feb 2024 11:31:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 12/13] mtd: rawnand: brcmnand: Add support for
 getting ecc setting from strap
Message-ID: <20240229113119.30f7cee6@xps-13>
In-Reply-To: <be75db7d-a698-43ab-b29e-dea3a0f60ba2@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
	<20240223034758.13753-13-william.zhang@broadcom.com>
	<20240223101852.005da3ad@xps-13>
	<db1c1e68-40e2-4c6c-afb2-2fb591883a46@broadcom.com>
	<20240226093632.089d594c@xps-13>
	<be75db7d-a698-43ab-b29e-dea3a0f60ba2@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_023124_089160_DF45E3E8 
X-CRM114-Status: GOOD (  27.70  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIE1vbiwgMjYg
RmViIDIwMjQgMTI6MDU6MTggLTA4MDA6Cgo+IE9uIDIvMjYvMjQgMDA6MzYsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBXaWxsaWFtLAo+ID4gCj4gPiB3aWxsaWFtLnpoYW5nQGJyb2FkY29t
LmNvbSB3cm90ZSBvbiBGcmksIDIzIEZlYiAyMDI0IDA5OjI1OjA5IC0wODAwOgo+ID4gICAKPiA+
PiBIaSBNaXF1ZWwsCj4gPj4KPiA+PiBPbiAyLzIzLzI0IDAxOjE4LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOiAgCj4gPj4+IEhpIFdpbGxpYW0sCj4gPj4+Cj4gPj4+IHdpbGxpYW0uemhhbmdAYnJvYWRj
b20uY29tIHdyb3RlIG9uIFRodSwgMjIgRmViIDIwMjQgMTk6NDc6NTcgLTA4MDA6ICAKPiA+Pj4g
ICAgPj4+PiBCQ01CQ0EgYnJvYWRiYW5kIFNvQyBiYXNlZCBib2FyZCBkZXNpZ24gZG9lcyBub3Qg
c3BlY2lmeSBlY2Mgc2V0dGluZyBpbiAgCj4gPj4+PiBkdHMgYnV0IHJhdGhlciB1c2UgdGhlIFNv
QyBOQU5EIHN0cmFwIGluZm8gdG8gb2J0YWluIHRoZSBlY2Mgc3RyZW5ndGgKPiA+Pj4+IGFuZCBz
cGFyZSBhcmVhIHNpemUgc2V0dGluZy4gQWRkIGJyY20sbmFuZC1lY2MtdXNlLXN0cmFwIGR0cyBw
cm9wZXR5IGZvcgo+ID4+Pj4gdGhpcyBwdXJwb3NlIGFuZCB1cGRhdGUgZHJpdmVyIHRvIHN1cHBv
cnQgdGhpcyBvcHRpb24uIEhvd2V2ZXIgdGhlc2UgdHdvCj4gPj4+PiBvcHRpb25zIGNhbiBub3Qg
YmUgdXNlZCBhdCB0aGUgc2FtZSB0aW1lLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFdp
bGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+ID4+Pj4gUmV2aWV3ZWQt
Ynk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPiAgCj4gPj4+PiAgID4+PiAgCj4g
Pj4+IEZZSSBJIGRpZCBub3QgcmVjZWl2ZSBwYXRjaGVzIDcsIDgsIDksIHdoaWNoIG1ha2VzIHRo
ZSBzZXJpZXMgbnVtYmVyaW5nCj4gPj4+IHZlcnkgb2RkLiAgCj4gPj4+ICAgID4+IEkgd2FzIHVz
aW5nIHRoZSBnZXQgbWFpbnRhaW5lciBzY3JpcHQgbWFpbmx5IGFuZCBpdCBzZW5kcyB0byB0aGUg
bGludXggTVREIGxpc3QuICBJIHdpbGwgYWRkIHlvdXIgZW1haWwgZGlyZWN0bHkgbmV4dCB0aW1l
LiAgCj4gPiAKPiA+IFllcywgSSBwcmVmZXIgdG8gYmUgaW4gQ2Mgb2YgdGhlIHdob2xlIHNlcmll
cywgcGxlYXNlLgo+ID4gICAKPiBTdXJlLiAgQW5kIHRoYW5rcyBmb3IgYXBwbHlpbmcgb3RoZXIg
cGF0Y2hlcy4gIERvIHlvdSB3YW50IG1lIHRvIGp1c3Qgc2VuZCBhIG5ldyBzaW5nbGUgcGF0Y2gg
Zm9yIHRoZSB1cGRhdGU/CgpZZXMganVzdCB0aGUgbWlzc2luZyBwYXRjaC4KCj4gPj4+PiAgICA+
PiArc3RhdGljIGludCBicmNtbmFuZF9nZXRfc2VjdG9yX3NpemVfMWsoc3RydWN0IGJyY21uYW5k
X2hvc3QgKmhvc3QpICAKPiA+Pj4+ICt7Cj4gPj4+PiArCXN0cnVjdCBicmNtbmFuZF9jb250cm9s
bGVyICpjdHJsID0gaG9zdC0+Y3RybDsKPiA+Pj4+ICsJaW50IHNlY3Rvcl9zaXplX2JpdCA9IGJy
Y21uYW5kX3NlY3Rvcl8xa19zaGlmdChjdHJsKTsKPiA+Pj4+ICsJdTE2IGFjY19jb250cm9sX29m
ZnMgPSBicmNtbmFuZF9jc19vZmZzZXQoY3RybCwgaG9zdC0+Y3MsCj4gPj4+PiArCQkJCQkJICBC
UkNNTkFORF9DU19BQ0NfQ09OVFJPTCk7Cj4gPj4+PiArCXUzMiBhY2NfY29udHJvbDsKPiA+Pj4+
ICsKPiA+Pj4+ICsJaWYgKHNlY3Rvcl9zaXplX2JpdCA8IDApCj4gPj4+PiArCQlyZXR1cm4gMDsK
PiA+Pj4+ICsKPiA+Pj4+ICsJYWNjX2NvbnRyb2wgPSBuYW5kX3JlYWRyZWcoY3RybCwgYWNjX2Nv
bnRyb2xfb2Zmcyk7Cj4gPj4+PiArCj4gPj4+PiArCXJldHVybiAoYWNjX2NvbnRyb2wgJiBCSVQo
c2VjdG9yX3NpemVfYml0KSkgPj4gc2VjdG9yX3NpemVfYml0OyAgCj4gPj4+Cj4gPj4+IEZJRUxE
X1BSRVAsIEZJRUxEX0dFVCwgKnBsZWFzZSouICAKPiA+PiBZb3UgcHJvYmFibHkgbWlzc2VkIG15
IHJlcGx5IHRvIHlvdXIgY29tbWVudHMgb24gdGhlIHNhbWUgcGF0Y2ggaW4gdjUuIEhlcmUgaXMg
dGhlIGxpbmsgZm9yIHRoZSBwb3N0IGluIGNhc2UgaXQgbG9zdCBpbiB5b3VyIGVtYWlsOgo+ID4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYzE0NWI5MGMtZTlmMC00ZDgyLTk0Y2MtYmFm
N2JmZGE1OTU0QGdtYWlsLmNvbS9ULyNtMWQ5MTFkMmYxMTlmM2JkMzQ1YzU3NWE4MWI2MGJjMmJk
OGM0NjFlYiAgCj4gPiAKPiA+IEkgZGlkbid0IG1pc3MgaXQsIGJ1dCB0aGUgcmVhc29uIGRvZXMg
bm90IHNvdW5kIGxlZ2l0aW1hdGUgdG8gbWUuCj4gPiBQbGVhc2Ugd29yayBvbiBpdCwgaXQgd2ls
bCBiZSBzbyBtdWNoIGNsZWFuZXIuCj4gPiAgIAo+IEkgdW5kZXJzdGFuZCBGSUVMRF9QUkVQL0dF
VCBpcyB0aGUgcHJlZmVycmVkIHdheSBvZiBsaW51eCBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVyIGZp
ZWxkcyBidXQgaXQgcmVxdWlyZXMgYSBjb25zdGFudCBNQVNLIHZhbHVlIGFuZCBkb2VzIG5vdCBh
cHBseSB0byBvdXIgY2FzZSBhcyB3ZSBoYXZlIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiB0aGUgcmVn
aXN0ZXIgYW5kIGhhdmUgZGlmZmVyZW50IG1hc2suICBUaGVyZSBpcyB3YXkgdG8gd29ya2Fyb3Vu
ZCBpdC4gaS5lIGRlZmluaW5nIHRoZSBtdWx0aXBsZSBjb25zdGFudHMgZGlyZWN0bHkgYW5kIHVz
aW5nIHRoZXNlIG1hY3JvcyB3aXRoIGlmL2Vsc2UgYmFzZWQgb24gcmVnIHZlcnNpb24uIEJ1dCBp
dCBpcyBub3QgY2xlYW4gYW5kIHNpbmNlIHdlIGFscmVhZHkgaGF2ZSBoZWxwZXIgZnVuY3Rpb25z
IHRoYXQgaGFuZGxlIGFuZCByZXR1cm4gZGlmZmVyZW50IHNoaWZ0L21hc2sgdmFsdWUsIEkgc2Vl
IHRoaXMgaXMgYSBwZXJmZWN0IHdheSBmb3Igb3VyIHNpdHVhdGlvbiBhbmQgY2FuIGFkYXB0IHRv
IGZ1dHVyZSByZWcgdmVyc2lvbiBjaGFuZ2UgZWFzaWx5IGFuZCBjbGVhbmx5Lgo+IAo+ID4+IFRo
ZSBtYXNrIGlzIG5vdCBjb25zdGFudCBoZXJlIGFuZCBjYXVzZSBidWlsZCBlcnJvcnMuICAKCldo
aWNoIGVycm9ycz8KCisgICAgICAgYWNjX2NvbnRyb2wgPSBuYW5kX3JlYWRyZWcoY3RybCwgYWNj
X2NvbnRyb2xfb2Zmcyk7CisgICAgICAgcmV0dXJuIEZJRUxEX0dFVChCSVQoc2VjdG9yX3NpemVf
Yml0KSwgYWNjX2NvbnRyb2wpOwoKRG9lcyBub3QgcmV0dXJuIGFueSBlcnJvciBoZXJlLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
