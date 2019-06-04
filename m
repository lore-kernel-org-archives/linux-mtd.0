Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6BBC282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 07:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DB22084A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 07:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZI38IQRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DB22084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2yJKhD/sjPAwc3p3JeZEfQDkBONaq2A2Lu8LXBFRKM=; b=ZI38IQRhsYDoUh
	B/PsjdlEV7/g1wyf+H+oD2dZq1GlhR1C+TkiyCB0eh9mF7aDs32HpcyMBiAm+xxMrI56z/A6Rj2Db
	AJ0IXAvBSG6rYGHfHScj9BFT9dOuO2W/9jvabfwDgI5JnJ2BaSqtUDs/no5+5HicW7w8EWLIJwHOs
	TmGSuHA1wzl3osdTBsaAE5SSUqw/JBsE3Fha+ZhcezhV1sAZfYEb9tECdRoKYtuJEK/MRMctoYQEt
	Frzqp0fRC5nFlZFfPWYGdYoibArAFRF2dWO2pLjTFKejbLFQtuIzN7U4GzwoFoo2GQcGfa4uO3g/6
	JJZhAxlA0DOtS1MVho2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY46N-00017s-4G; Tue, 04 Jun 2019 07:43:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY46J-00013I-7M
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 07:43:21 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF01A260D64;
 Tue,  4 Jun 2019 08:43:15 +0100 (BST)
Date: Tue, 4 Jun 2019 09:43:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: atmel nand bindings vs. actual dts files
Message-ID: <20190604094312.355d3e1e@collabora.com>
In-Reply-To: <20190604015301.GK3558@piout.net>
References: <1823900.qPX5mxbl1h@ada> <4099561.5sHrvDXGx3@ada>
 <20190429115540.7d577a50@xps13> <1947914.CcHDgmXbBm@ada>
 <20190430113242.5cad2f16@xps13> <20190604015301.GK3558@piout.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_004319_527850_270530AA 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Alexander Dahl <ada@thorsis.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCA0IEp1biAyMDE5IDAzOjUzOjAxICswMjAwCkFsZXhhbmRyZSBCZWxsb25pIDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IE9uIDMwLzA0LzIwMTkgMTE6MzI6
NDIrMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEFsZXhhbmRlciwKPiA+IAo+ID4g
QWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4gd3JvdGUgb24gVHVlLCAzMCBBcHIgMjAx
OSAxMToyNDo0NAo+ID4gKzAyMDA6Cj4gPiAgIAo+ID4gPiBIZWxsbyBNaXF1w6hsLAo+ID4gPiAK
PiA+ID4gQW0gTW9udGFnLCAyOS4gQXByaWwgMjAxOSwgMTE6NTU6NDAgQ0VTVCBzY2hyaWViIE1p
cXVlbCBSYXluYWw6ICAKPiA+ID4gPiBBbGV4YW5kZXIgRGFobCA8YWRhQHRob3JzaXMuY29tPiB3
cm90ZSBvbiBUaHUsIDA3IE1hciAyMDE5IDE3OjI1OjE3ICAgIAo+ID4gPiA+ID4gQW0gTWl0dHdv
Y2gsIDYuIE3DpHJ6IDIwMTksIDE1OjA3OjUyIENFVCBzY2hyaWViIEFsZXhhbmRlciBEYWhsOiAg
ICAKPiA+ID4gPiA+ID4gU28gaW5zdGVhZCBvZiAiYWx3YXlzIDB4ODAwMDAwIiB0aGF0IG5vZGUg
aGFzIDB4MiBhcyB0aGlyZCBlbnRyeSBmb3IgdGhlCj4gPiA+ID4gPiA+ICdyZWcnIHByb3BlcnR5
LiBXaHkgaXMgdGhhdD8gICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgZGlkbid0IGludmVzdGln
YXRlIHRoYXQgZnVydGhlciB5ZXQsIGJ1dCBJJ20gY3VyaW91cywgc28gaWYgYW55b25lCj4gPiA+
ID4gPiBrbm93cz8gICAgCj4gPiA+ID4gCj4gPiA+ID4gSSBzdXBwb3NlIHRoZSBiaW5kaW5ncyBb
MV0gZXhwbGFpbiB0aGUgc2l0dWF0aW9uLgo+ID4gPiA+IAo+ID4gPiA+IFsxXQo+ID4gPiA+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjAvc291cmNlL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaQo+ID4gPiA+IG5ncy9tdGQvYXRtZWwtbmFuZC50eHQjTDMyICAgIAo+
ID4gPiAKPiA+ID4gTm8sIHRoYXQgd2FzIG5vdCB3aGF0IEkgd2FudGVkIHRvIGtub3cuIFRoZSBi
aW5kaW5ncyBzYXlzIGZvciB0aGF0IHJlZyAKPiA+ID4gcHJvcGVydHk6IOKAnDNyZCBlbnRyeTog
dGhlIG1lbW9yeSByZWdpb24gc2l6ZSAoYWx3YXlzIDB4ODAwMDAwKeKAnQo+ID4gPiAKPiA+ID4g
VGhpcyBpcyB0cnVlIGZvciBzb21lIGR0cyBmaWxlcyBpbmNsdWRpbmcgdGhpcyBuYW5kIG5vZGUs
IGJ1dCBub3QgZm9yIGFsbCwgCj4gPiA+IHNvbWUgaGF2ZSB0aGlzOgo+ID4gPiAKPiA+ID4gCW5h
bmRAMyB7Cj4gPiA+IAkJcmVnID0gPDB4MyAweDAgMHg4MDAwMDA+Owo+ID4gPiAKPiA+ID4gT3Ro
ZXJzIGhhdmUgdGhpczoKPiA+ID4gCj4gPiA+IAluYW5kQDMgewo+ID4gPiAJCXJlZyA9IDwweDMg
MHgwIDB4Mj47Cj4gPiA+IAo+ID4gPiBUaGUgc2Vjb25kIGNvbnRyYWRpY3RzIHRoZSBiaW5kaW5n
IGRvYy4gTW9zdCBvZiB0aGlzIHdhcyBjaGFuZ2VkIHdoZW4gCj4gPiA+IHN3aXRjaGluZyBmcm9t
IHRoZSBvbGQgYmluZGluZ3MgaW4gY2hhbmdlc2V0IHY0LjEyLXJjMS03LWcxMDA0YTI5NzdiZGMg
YnkgCj4gPiA+IEJvcmlzIEJyZXppbGxvbi4gSSB3YW50ZWQgdG8ga25vdyB3aHkgdGhlIGRpZmZl
cmVuY2U/ICAgCj4gPiAKPiA+IEluZGVlZC4gQWRkaW5nIEFsZXhhbmRyZSB3aG8gbWlnaHQgYWxz
byBoYXZlIGFuIGlkZWEgYW5kIFR1ZG9yIGZvcgo+ID4gcmVmZXJlbmNlLgo+ID4gICAKPiAKPiBJ
J2Qgc2F5IHRoYXQgPDB4MyAweDAgMHgyPiBvbmx5IHdvcmtzIGJlY2F1c2UgaW9yZW1hcCB3aWxs
IGFsd2F5cyBtYXAgYQo+IDRrIHBhZ2UgYW5kIERNQSBpcyB1c2VkIHNvIHdlIGFyZSBub3QgYWNj
ZXNzaW5nIGFueXRoaW5nIGJleW9uZCB0aGF0Cj4gcGFnZSB1c2luZyB0aGUgdmlydHVhbCBhZGRy
ZXNzLgoKQWN0dWFsbHksIHdlIHJlYWxseSBuZWVkIG9ubHkgMiBieXRlcyBub3QgdGhlIGZ1bGwg
YWRkcmVzcyByYW5nZQphc3NpZ25lZCB0byB0aGUgRUJJIHNsb3QsIGV2ZW4gaWYgeW91IGFjY2Vz
cyB0aGUgZGV2aWNlIGluIFBJTyBtb2RlLgpUaGF0J3MgYmVjYXVzZSBOQU5EcyBhcmUgbm90IGRp
cmVjdGx5IGFkZHJlc3NhYmxlLCBhbmQgeW91J2xsIGhhdmUgdG8KaXNzdWUgY29tbWFuZC9hZGRy
ZXNzIGN5Y2xlcyBiZWZvcmUgeW91IGNhbiBnZXQgcmVhbCBkYXRhIG9uIHRoZSBidXMuClRob3Nl
IGNvbW1hbmQgYW5kIGFkZHJlc3Mgd29yZHMvYnl0ZXMgZ28gdGhyb3VnaCB0aGUgc2FtZSBJTyBw
aW5zIGFzCmFjdHVhbCBkYXRhLCBhbmQgdGhlIG1heGltdW0gYnVzIHdpZHRoIGZvciBhIE5BTkQg
aXMgMTYtYml0cyAoaGVuY2UgdGhlCjIgYnl0ZXMgcmVzZXJ2ZWQgaGVyZSkuCgpUaGUgcmF0aW9u
YWxlIGZvciBub3QgaGF2aW5nIHRoZSBmdWxsIEVCSSBzbG90IHJhbmdlIG1hcHBlZCBpcyB0aGF0
CmlvbWFwIHJlZ2lvbnMgaGF2ZSBhIGNvc3QgKG1vcmUgZW50cmllcyBpbiB0aGUgTU1VIHBhZ2Ug
dGFibGUsIGFuZCBpdAphbHNvIHRha2VzIHNwYWNlIGluIHRoZSB2aXJ0dWFsIGFkZHJlc3MsIHdo
aWNoIGlzIGxpbWl0ZWQgb24gMzIgYml0cwpzeXN0ZW1zKS4gSUlSQywgd2hlbiBJIHJld29ya2Vk
IHRoZSBkcml2ZXIsIE5pY29sYXMgd2FzIHRyeWluZyB0byBsaW1pdAp0aGUgc2l6ZSBvZiBhbGwg
aW8tbWFwcGVkIHJlZ2lvbnMsIHdoaWNoIGlzIHByb2JhYmx5IHdoeSB3ZSB3ZW50IGZvcgp0aGlz
ICJyZXNlcnZlIG9ubHkgMiBieXRlcyIgYXBwcm9hY2guCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
