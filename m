Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634DAC77B7E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 May 2023 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ps4780CVIHm8nMr0N5RV354LdL5SHlaEedpZb4rPiRw=; b=1Y64lVkGM9UKjo
	Mpq3Uch79b9nioipOfFl3eYJXU7C7Dh/zmsnfzEOypC7p4I1d3mB8KUp2za9dtjfOmWqEKEmag8Cq
	tRWTSou2+btEjC0DdPIT5FtYxcKhkPo4sBmYT1OdFpHUWVfeGE6Wp8xX1Hfb+TMMlZukAGrCwGlcw
	NVxeLDyWxuGayqJbCFZO4ugxlqBKgQcoEsLRLopyUWRlM0lL9l1MhHbyAmjYWWMgk3QmFIoYiT9Dg
	YyfX4NhWKKlDBQQXvh3dScFekuWYfbJw31oq2Ir1su610Orm2a6Qk8KOERid9qfCnuIwW0biNNmlm
	IcY0izKXBMBbXPDUJuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bKY-00AJEM-25;
	Mon, 29 May 2023 11:46:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bKV-00AJDY-11
	for linux-mtd@lists.infradead.org;
	Mon, 29 May 2023 11:46:29 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685360780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/cXLt7f6xNZppHkA9/e5nXinup8hzp5ZLt6Rcyljdo=;
	b=lfGI7H+O7y6z4hMgEJ+R39Wz+Nw81md2SGaSXK+uQUfR7phvmSyjKdYHU1vJTj1l9+HbBg
	0Js7DTMV0WW9NcqtU85ACPcZVXDJvFlqqsjHswB/5s06i1ETvn3oOnazMok+SK+otm/lRA
	GxLN9GkIjIcenkexrO4T1RvKycxhDL9XwiSqHGVNrD4EkzxiCUYxN1LWlwQHoAp38kFvIC
	29c2MPDWlD8E8OxmgJszjpSvCR37TYzF0/ApNHD1ITq355j5ca/HE/4JWMPXykghTnUTNf
	gUCfNkNAmSvS7xWEZz0hpzuY/yZtc1/BNYWNqcFgjYSEtpn2ZywY9tGiu39HoA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFAAD40007;
	Mon, 29 May 2023 11:46:19 +0000 (UTC)
Date: Mon, 29 May 2023 13:46:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: JaimeLiao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org, "Bean
 Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: Boot failed after patch "mtd: rawnand: Support for sequential
 cache reads"
Message-ID: <20230529134619.255d0b07@xps-13>
In-Reply-To: <CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
	<20230526201420.231092a0@xps-13>
	<CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
	<20230529101240.53065e04@xps-13>
	<CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_044627_658323_9B6D789B 
X-CRM114-Status: GOOD (  27.73  )
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

SGkgQmVhbiwKCkknbSBhZGRpbmcgeW91IHRvIHRoaXMgdGhyZWFkIGJlY2F1c2UgSSdtIGNsdWVs
ZXNzIHJlZ2FyZGluZyB3aGF0J3MKaGFwcGVuaW5nIHRvIEFsZXhhbmRlci4KClNob3J0IHJlY2Fw
OiBzZXF1ZW50aWFsIHBhZ2UgcmVhZHMgc2VlbSB0byBmYWlsIHdpdGggYW4gTVQyOUYgTWljcm9u
CmNoaXAuIEFsZXhhbmRlciBpcyB1c2luZyBhIGdwbWMgY29udHJvbGxlciB3aXRob3V0IG9uLWRp
ZSBFQ0MsIEkgZG91YnQKdGhlIGVycm9yIGNvbWVzIGZyb20gdGhlIGNvbnRyb2xsZXIsIHNvIEkg
d291bGQgbGlrZSB0byBrbm93IGlmIHRoZXJlCmlzIGFueXRoaW5nIGtub3duIHRvIGZhaWwgd2l0
aCB0aGVzZSBjaGlwcyByZWdhcmRpbmcgdGhlIHVzZSBvZgpzZXF1ZW50aWFsIHJlYWRzLiBXZSBj
YW4gZWFzaWx5IHdvcmsgYXJvdW5kIHRoYXQgc2l0dWF0aW9uIGlmIHdlCmlkZW50aWZ5IHRoZSBw
cm9ibGVtLgoKVGhhbmtzIGEgbG90LApNaXF1w6hsCgplYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwu
Y29tIHdyb3RlIG9uIE1vbiwgMjkgTWF5IDIwMjMKMTM6MzM6MDQgKzAzMDA6Cgo+INC/0L0sIDI5
INC80LDRjyAyMDIz4oCv0LMuINCyIDExOjEyLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPjoKPiAuLi4KPiBBY2NvcmRpbmcgdG8gdGhlIE1UMjlGMkcwOEFCQUVBV1Ag
ZGF0YXNoZWV0LCB0aGUgY2hpcCBzdXBwb3J0cwo+ID4gPiB0aGUgUkVBRCBQQUdFIENBQ0hFIFNF
UVVFTlRJQUwgb3Bjb2RlLCBidXQgd2l0aCB0d28gY2F2ZWF0czoKPiA+ID4gIDQuIFRoZXNlIGNv
bW1hbmRzIHN1cHBvcnRlZCBvbmx5IHdpdGggRUNDIGRpc2FibGVkLgo+ID4gPiAgNS4gSXNzdWlu
ZyBhIFJFQUQgUEFHRSBDQUNIRSBzZXJpZXMgKDMxaCwgMDBoLTMxaCwgM0ZoKSBjb21tYW5kCj4g
PiA+ICAgd2hlbiB0aGUgYXJyYXkgaXMgYnVzeSAoUkRZID0gMSwgQVJEWSA9IDApIGlzIHN1cHBv
cnRlZCBpZiB0aGUgcHJldmlvdXMKPiA+ID4gICBjb21tYW5kIHdhcyBhIFJFQUQgUEFHRSAoMDBo
LTMwaCkgb3IgUkVBRCBQQUdFIENBQ0hFIHNlcmllcwo+ID4gPiAgIGNvbW1hbmQ7IG90aGVyd2lz
ZSwgaXQgaXMgcHJvaGliaXRlZC4KPiA+ID4KPiA+ID4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwg
dGhlIHNlY29uZCByZW1hcmsgc3VpdHMgdXMsIHNpbmNlIHdlIGNyZWF0ZQo+ID4gPiB0aGUgY29y
cmVjdCBzZXF1ZW5jZS4gIAo+ID4KPiA+IEV4YWN0bHksIHdlIGRvOgo+ID4KPiA+ICAgICAgICAg
UkVBRDAgKDApLCBSRUFEU1RBUlQgKDMwKSwKPiA+ICAgICAgICAgUkVBRENBQ0hFU0VRICgzMSks
IGRhdGEsCj4gPiAgICAgICAgIFJFQURDQUNIRVNFUSAoMzEpLCBkYXRhLAo+ID4gICAgICAgICAu
Li4KPiA+ICAgICAgICAgUkVBRENBQ0hFRU5EICgzZiksIGRhdGEuCj4gPgo+ID4gd2hpY2ggaXMg
d2hhdCB0aGUgZGF0YXNoZWV0IHRlbGxzIHVzIEkgYmVsaWV2ZS4KPiA+ICAKPiA+ID4gQnV0IHRo
ZSBmaXJzdCByZW1hcmsgY2FuIGJlIGEgcHJvYmxlbSBpbiB0aGlzIGNhc2UuICAKPiA+Cj4gPiBJ
IHdhcyBub3QgYXdhcmUgb2YgdGhpcyBsaW1pdGF0aW9uLCBpdCdzIG9ubHkgd3JpdHRlbiBpbiB0
aGUgc3VtbWFyeSwKPiA+IG5vdCBpbiB0aGUgZGV0YWlscyBhYm91dCB0aGUgY29tbWFuZHMsIG5p
Y2UgZmluZGluZy4gV2UgbmVlZCB0byBwcmV2ZW50Cj4gPiBvbi1kaWUgRUNDIHVzZXJzIGZyb20g
ZW5hYmxpbmcgdGhpcyBmZWF0dXJlLgo+ID4KPiA+IEJ1dCBnaXZlbiB0aGUgYmVsb3cgdHJhY2Us
IHlvdSdyZSBub3QgdXNpbmcgdGhlIG9uLWRpZSBFQ0MgZW5naW5lLAo+ID4gcmlnaHQ/IEl0IGxv
b2tzIGxpa2UgeW91J3JlIHVzaW5nIHRoZSBjb250cm9sbGVyJ3MgRUxNIGVuZ2luZSB0bwo+ID4g
cGVyZm9ybSBFQ0MgY29ycmVjdGlvbiwgc28gSSBkb24ndCBzZWUgd2h5IHRoaXMgc3BlY2lmaWMg
bGltaXRhdGlvbgo+ID4gd291bGQgaGl0IHVzLiBDYW4geW91IGNvbmZpcm0gdGhlIEVDQyBlbmdp
bmUgb2YgdGhlIGNoaXAgaXMgZGlzYWJsZWQ/ICAKPiAKPiBZZXMsIG9uLWRpZSBFQ0MgaXMgZGlz
YWJsZWQuCj4gUGxlYXNlIGFkdmlzZSB3aGVyZSBJIGNhbiBpbnNlcnQgc29tZSBkZWJ1ZyBtZXNz
YWdlcyB0byBjbGVhciB0aGluZ3MgdXAuCj4gCj4gPiA+ID4gPiBvbWFwLWdwbWMgNTAwMDAwMDAu
Z3BtYzogR1BNQyByZXZpc2lvbiA2LjAKPiA+ID4gPiA+IC4uLgo+ID4gPiA+ID4gbmFuZDogZGV2
aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6IDB4ZGEKPiA+ID4gPiA+
IG5hbmQ6IE1pY3JvbiBNVDI5RjJHMDhBQkFFQVdQCj4gPiA+ID4gPiBuYW5kOiAyNTYgTWlCLCBT
TEMsIGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0Cj4g
PiA+ID4gPiBuYW5kOiB1c2luZyBPTUFQX0VDQ19CQ0g4X0NPREVfSFcgRUNDIHNjaGVtZQo+ID4g
PiA+ID4gLi4uCj4gPiA+ID4gPiBWRlM6IE1vdW50ZWQgcm9vdCAoc3F1YXNoZnMgZmlsZXN5c3Rl
bSkgcmVhZG9ubHkgb24gZGV2aWNlIDI1NDowLgo+ID4gPiA+ID4gZGV2dG1wZnM6IG1vdW50ZWQK
PiA+ID4gPiA+IEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5OiAx
MDI0Swo+ID4gPiA+ID4gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gPiA+ID4gPiBT
UVVBU0hGUyBlcnJvcjogbHpvIGRlY29tcHJlc3Npb24gZmFpbGVkLCBkYXRhIHByb2JhYmx5IGNv
cnJ1cHQKPiA+ID4gPiA+IFNRVUFTSEZTIGVycm9yOiBGYWlsZWQgdG8gcmVhZCBibG9jayAweGQy
OTFjMjogLTUKPiA+ID4gPiA+IFNRVUFTSEZTIGVycm9yOiBsem8gZGVjb21wcmVzc2lvbiBmYWls
ZWQsIGRhdGEgcHJvYmFibHkgY29ycnVwdAo+ID4gPiA+ID4gU1FVQVNIRlMgZXJyb3I6IEZhaWxl
ZCB0byByZWFkIGJsb2NrIDB4ZDI5MWMyOiAtNQo+ID4gPiA+ID4gU1FVQVNIRlMgZXJyb3I6IFVu
YWJsZSB0byByZWFkIGRhdGEgY2FjaGUgZW50cnkgW2QyOTFjMl0KPiA+ID4gPiA+IFNRVUFTSEZT
IGVycm9yOiBVbmFibGUgdG8gcmVhZCBwYWdlLCBibG9jayBkMjkxYzIsIHNpemUgMTQzMDcKPiA+
ID4gPiA+IFNRVUFTSEZTIGVycm9yOiBVbmFibGUgdG8gcmVhZCBkYXRhIGNhY2hlIGVudHJ5IFtk
MjkxYzJdCj4gPiA+ID4gPiBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgcGFnZSwgYmxv
Y2sgZDI5MWMyLCBzaXplIDE0MzA3Cj4gPiA+ID4gPiBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2lu
ZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEKPiA+ID4gPiA+IGV4aXRjb2RlPTB4MDAwMDAwMDcg
Q1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkIDYuMy4wKyAjMTA1Cj4gPiA+ID4g
PiBIYXJkd2FyZSBuYW1lOiBHZW5lcmljIEFNMzNYWCAoRmxhdHRlbmVkIERldmljZSBUcmVlKQo+
ID4gPiA+ID4gIHVud2luZF9iYWNrdHJhY2UgZnJvbSBzaG93X3N0YWNrKzB4Yi8weGMKPiA+ID4g
PiA+ICBzaG93X3N0YWNrIGZyb20gZHVtcF9zdGFja19sdmwrMHgyYi8weDM0Cj4gPiA+ID4gPiAg
ZHVtcF9zdGFja19sdmwgZnJvbSBwYW5pYysweGJkLzB4MjMwCj4gPiA+ID4gPiAgcGFuaWMgZnJv
bSBtYWtlX3Rhc2tfZGVhZCsweDEvMHgxMjAKPiA+ID4gPiA+ICBtYWtlX3Rhc2tfZGVhZCBmcm9t
IDB4YzEwMmNhODAKPiA+ID4gPiA+IC0tLVsgZW5kIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0IQo+ID4gPiA+ID4gZXhpdGNvZGU9MHgwMDAwMDAwNyBd
LS0tICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
