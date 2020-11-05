Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE8CC00A89
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 09:14:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8CB206FB
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 09:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yT9YgNCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8CB206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jYTLhdE/BRwWBoGtFZsqL05gHpQEfDSRecK/Ve+F+tE=; b=yT9YgNCVfiovBnrTjdV5QbEYK
	3lMEcjwGP4yaJIaPsn2sRmunL3u4bbsGEbFDUy6rH0I5EKu9SdfKF1qM9goWvbMFe4L7Kt2wcbnpE
	iRHTO5oF0RmGyilTe2zRL9dLMrzv4odiSy5rDcM+cYOpC7XUkaRZOYMS0zyb6h9UobWX6+MNV9+p6
	9ZrnsFfWo9myfrQqYo4fih8RXqzQs231J+/iq5rXgUQnd1GT+v7pJ4q6BF4oQ3vSN1RxmAfH1aRqV
	vFDjeXdpzcWWlMUpzMmF8ereIwxYvdzLGQvLpaiMV5gLy0skTJag/om3kGfReTFJ+JOkL4c8h8+Gb
	L4/PFW7nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kabKi-0000Nk-4c; Thu, 05 Nov 2020 09:13:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabKe-0000Mo-W6
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 09:13:26 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3954B1BF221;
 Thu,  5 Nov 2020 09:13:21 +0000 (UTC)
Date: Thu, 5 Nov 2020 10:13:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to
 d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing
 bits"))
Message-ID: <20201105101319.644782a6@xps13>
In-Reply-To: <20201105100651.Horde.jOAklfLApjH2WjmauwW9Gg1@messagerie.c-s.fr>
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
 <20201104183859.590f0806@xps13>
 <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
 <20201105084939.72ea6bfd@xps13>
 <20201105100651.Horde.jOAklfLApjH2WjmauwW9Gg1@messagerie.c-s.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_041325_252282_167618E3 
X-CRM114-Status: GOOD (  29.35  )
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JvdGUgb24gVGh1LCAwNSBOb3YKMjAyMCAxMDowNjo1MSArMDEwMDoKCj4gUXVvdGlu
ZyBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPiAKPiA+IEhpIENo
cmlzdG9waGUsCj4gPgo+ID4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1PiB3cm90ZSBvbiBXZWQsIDQgTm92IDIwMjAKPiA+IDE5OjM3OjU3ICswMTAwOgo+ID4g
IAo+ID4+IEhpIE1pcXVlbCwKPiA+Pgo+ID4+IExlIDA0LzExLzIwMjAgw6AgMTg6MzgsIE1pcXVl
bCBSYXluYWwgYSDDqWNyaXTCoDogIAo+ID4+ID4gSGkgQ2hyaXN0b3BoZSwKPiA+PiA+Cj4gPj4g
PiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlIG9u
IFdlZCwgMDQgTm92Cj4gPj4gPiAyMDIwIDE4OjMzOjUzICswMTAwOgo+ID4+ID4gIAo+ID4+ID4+
IEhpIE1pcXVlbCwKPiA+PiA+Pgo+ID4+ID4+IEknbSB1bmFibGUgdG8gYm9vdCA1LjEwLXJjMSBv
biBteSBib2FyZHMuIEkgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gPj4gPj4KPiA+PiA+PiBb
ICAgIDQuMTI1ODExXSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhhZCwg
Q2hpcCBJRDogMHggIAo+IDc2Cj4gPj4gPj4gWyAgICA0LjEzMTk5Ml0gbmFuZDogSHluaXggTkFO
RCA2NE1pQiAzLDNWIDgtYml0Cj4gPj4gPj4gWyAgICA0LjEzNjE3M10gbmFuZDogNjQgTWlCLCBT
TEMsIGVyYXNlIHNpemU6IDE2IEtpQiwgcGFnZSBzaXplOj4+IDUxMiwgT09CIHNpemU6IDE2Cj4g
Pj4gPj4gWyAgICA0LjE0MzUzNF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
Cj4gPj4gPj4gWyAgICA0LjE0NzkzNF0gVW5zdXBwb3J0ZWQgRUNDIGFsZ29yaXRobSEKPiA+PiA+
PiBbICAgIDQuMTUyMTQyXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0ID4+IGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jOjUyNDQgPj4gbmFuZF9zY2FuX3dpdGhfaWRzKzB4MTI2MC8w
eDE2NDAKPiA+PiA+PiAuLi4KPiA+PiA+PiBbICAgIDQuMzMyMDUyXSAtLS1bIGVuZCB0cmFjZSBl
M2EzNmY2MmNhZTRhYzU2IF0tLS0KPiA+PiA+PiBbICAgIDQuMzM2ODgyXSBncGlvLW5hbmQ6IHBy
b2JlIG9mIGMwMDAwMDAwLm5hbmQgZmFpbGVkIHdpdGggZXJyb3IgLTIgIAo+IDIKPiA+PiA+Pgo+
ID4+ID4+IEJpc2VjdGVkIHRvIGNvbW1pdCBkNzE1N2ZmNDlhNWIgKCJtdGQ6IHJhd25hbmQ6IFVz
ZSB0aGUgRUNDID4+IGZyYW1ld29yayB1c2VyIGlucHV0IHBhcnNpbmcgYml0cyIpCj4gPj4gPj4K
PiA+PiA+PiBNeSBmaXJzdCBpbXByZXNzaW9uIGlzIHRoYXQgd2l0aCB0aGF0IGNoYW5nZSwgdGhl
IHZhbHVlIHNldCBpbiA+PiBjaGlwLT5lY2MuYWxnbwo+ID4+ID4+IGJ5IGdwaW9fbmFuZF9wcm9i
ZSgpIGluIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYyBnZXRzID4+IG92ZXJ3cml0dGVuIGlu
IHJhd25hbmRfZHRfaW5pdCgpCj4gPj4gPj4KPiA+PiA+PiBUaGUgZm9sbG93aW5nIGNoYW5nZSBm
aXhlcyB0aGUgcHJvYmxlbSwgdGhvdWdoIEknbSBub3Qgc3VyZSBpdCA+PiBpcyB0aGUgcmlnaHQg
Zml4LiBDYW4geW91IGhhdmUgYSBsb29rID8KPiA+PiA+Pgo+ID4+ID4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyA+PiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfYmFzZS5jCj4gPj4gPj4gaW5kZXggMWYwZDU0MmQ1OTIzLi5hYTc0Nzk3Y2YyZGEgMTAw
NjQ0Cj4gPj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+PiA+
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4+ID4+IEBAIC01MDMy
LDcgKzUwMzIsOCBAQCBzdGF0aWMgaW50IHJhd25hbmRfZHRfaW5pdChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaCAgCj4gaXApCj4gPj4gPj4gICAgCQljaGlwLT5lY2MuZW5naW5lX3R5cGUgPSBuYW5kLT5l
Y2MuZGVmYXVsdHMuZW5naW5lX3R5cGU7Cj4gPj4gPj4KPiA+PiA+PiAgICAJY2hpcC0+ZWNjLnBs
YWNlbWVudCA9IG5hbmQtPmVjYy51c2VyX2NvbmYucGxhY2VtZW50Owo+ID4+ID4+IC0JY2hpcC0+
ZWNjLmFsZ28gPSBuYW5kLT5lY2MudXNlcl9jb25mLmFsZ287Cj4gPj4gPj4gKwlpZiAoY2hpcC0+
ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQo+ID4+ID4+ICsJCWNoaXAtPmVjYy5h
bGdvID0gbmFuZC0+ZWNjLnVzZXJfY29uZi5hbGdvOwo+ID4+ID4+ICAgIAljaGlwLT5lY2Muc3Ry
ZW5ndGggPSBuYW5kLT5lY2MudXNlcl9jb25mLnN0cmVuZ3RoOwo+ID4+ID4+ICAgIAljaGlwLT5l
Y2Muc2l6ZSA9IG5hbmQtPmVjYy51c2VyX2NvbmYuc3RlcF9zaXplOwo+ID4+ID4+Cj4gPj4gPj4g
LS0tCj4gPj4gPj4KPiA+PiA+PiBUaGFua3MKPiA+PiA+PiBDaHJpc3RvcGhlICAKPiA+PiA+Cj4g
Pj4gPiBTb3JyeSBmb3IgaW50cm9kdWNpbmcgdGhpcyBpc3N1ZSwgSSBkaWRuJ3QgaGFkIHRoZSB0
aW1lIHRvIHNlbmQgdGhlCj4gPj4gPiBGaXhlcyBQUiB5ZXQgYnV0IEkgdGhpbmsgdGhpcyBpc3N1
ZSBoYXMgYmVlbiBzb2x2ZWQgYWxyZWFkeS4gQ291bGQKPiA+PiA+IHlvdSBwbGVhc2UgdHJ5IHdp
dGggYSByZWNlbnQgbGludXgtbmV4dD8KPiA+PiA+ICAKPiA+Pgo+ID4+IFNvcnJ5LCBzYW1lIHBy
b2JsZW0gd2l0aCAiTGludXggdmVyc2lvbiA1LjEwLjAtcmMyLW5leHQtMjAyMDExMDQiICAKPiA+
Cj4gPiBDYW4geW91IHBsZWFzZSBnaXZlIHRoaXMgcGF0Y2ggYSB0cnksIHBsZWFzZT8KPiA+Cj4g
PiAtLS04PC0tLQo+ID4KPiA+IEF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiA+IERhdGU6ICAgVGh1IE5vdiA1IDA4OjQ0OjQ4IDIwMjAgKzAxMDAKPiA+
Cj4gPiAgICAgbXRkOiByYXduYW5kOiBncGlvOiBNb3ZlIHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24g
dG8gLT5hdHRhY2hfY2hpcCgpCj4gPgo+ID4gICAgIFdoaWxlIGZvcmNpbmcgYSBIYW1taW5nIHNv
ZnR3YXJlIEVDQyBsb29rcyBjbGVhcmx5IHdyb25nLCBsZXQncyBqdXN0Cj4gPiAgICAgZml4IHRo
ZSBzaXR1YXRpb24gZm9yIG5vdyBhbmQgbW92ZSB0aGVzZSBsaW5lcyB0byB0aGUgLT5hdHRhY2hf
Y2hpcCgpCj4gPiAgICAgaG9vayB3aGljaCBnZXRzIGV4ZWN1dGVkIGFmdGVyIHRoZSB1c2VyIGlu
cHV0IHBhcnNpbmcgYW5kIE5BTkQgY2hpcAo+ID4gICAgIGRpc2NvdmVyeS4KPiA+Cj4gPiAgICAg
Rml4ZXM6IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3Jr
IHVzZXIgPiBpbnB1dCBwYXJzaW5nIGJpdHMiKQo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8u
Ywo+ID4gaW5kZXggM2JkODQ3Y2NjM2YzLi42ZmVhYjg0N2Y1ZTAgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9ncGlvLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2dwaW8uYwo+ID4gQEAgLTE2MSw4ICsxNjEsMTUgQEAgc3RhdGljIGludCBncGlvX25hbmRfZXhl
Y19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4g
IH0KPiA+Cj4gPiArc3RhdGljIGludCBncGlvX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCkKPiA+ICt7Cj4gPiArICAgICAgIGNoaXAtPmVjYy5tb2RlID0gTkFORF9FQ0Nf
U09GVDsKPiA+ICsgICAgICAgY2hpcC0+ZWNjLmFsZ28gPSBOQU5EX0VDQ19IQU1NSU5HOwo+ID4g
K30KPiA+ICsKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfY29udHJvbGxlcl9vcHMgZ3Bp
b19uYW5kX29wcyA9IHsKPiA+ICAgICAgICAgLmV4ZWNfb3AgPSBncGlvX25hbmRfZXhlY19vcCwK
PiA+ICsgICAgICAgLmF0dGFjaF9jaGlwID0gZ3Bpb19uYW5kX2F0dGFjaF9jaGlwLAo+ID4gIH07
Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfT0YKPiA+IEBAIC0zNDIsOCArMzQ5LDYgQEAgc3RhdGlj
IGludCBncGlvX25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGQgIAo+IGV2KQo+
ID4gICAgICAgICBncGlvbXRkLT5iYXNlLm9wcyA9ICZncGlvX25hbmRfb3BzOwo+ID4KPiA+ICAg
ICAgICAgbmFuZF9zZXRfZmxhc2hfbm9kZShjaGlwLCBwZGV2LT5kZXYub2Zfbm9kZSk7Cj4gPiAt
ICAgICAgIGNoaXAtPmVjYy5tb2RlICAgICAgICAgID0gTkFORF9FQ0NfU09GVDsKPiA+IC0gICAg
ICAgY2hpcC0+ZWNjLmFsZ28gICAgICAgICAgPSBOQU5EX0VDQ19IQU1NSU5HOwo+ID4gICAgICAg
ICBjaGlwLT5vcHRpb25zICAgICAgICAgICA9IGdwaW9tdGQtPnBsYXQub3B0aW9uczsKPiA+ICAg
ICAgICAgY2hpcC0+Y29udHJvbGxlciAgICAgICAgPSAmZ3Bpb210ZC0+YmFzZTsgIAo+IAo+IAo+
IFdvcmtzIHdpdGggdGhlIGZvbGxvd2luZzoKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3Bpby5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jCj4gaW5kZXggNGVj
MGExZTEwODY3Li42NmQzZjFlYjc4OGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvZ3Bpby5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jCj4gQEAgLTE2MSw4
ICsxNjEsMTcgQEAgc3RhdGljIGludCBncGlvX25hbmRfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLAo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gCj4gK3N0YXRpYyBpbnQgZ3Bpb19uYW5k
X2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gK3sKPiArCWNoaXAtPmVjYy5l
bmdpbmVfdHlwZQk9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7Cj4gKwljaGlwLT5lY2MuYWxn
bwkJPSBOQU5EX0VDQ19BTEdPX0hBTU1JTkc7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KCgpZdXAg
aW5kZWVkIGl0IHdhcyBub3QgZXZlbiBjb21waWxlIHRlc3RlZC4gR29vZCB0byBrbm93LCBJJ2xs
IGNoZWNrCnRoZSBvdGhlciBkcml2ZXJzIGFuZCBzZW5kIHRoZSBwYXRjaCBzb29uLgoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
