Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB23C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dn/2UbTInzwlagQxEbOneAGVAm1VKMYqcnzU/W0A62I=; b=vMlSJy6C2LCXyQCtptk5QP8LX7
	azYc5KClCrR9AthIDi2pmEAXoE857AYSz0iYr4dwKxmPjRWpQbbr9eMO54qQ42vwnTP23w5Y8u40L
	lcKjtyVuaC2lTe75RTL1CgKZeuOjTYch2tRDtLM13gkTzEtjZHpGXvzgnf8UapP87rlWrwIUkzQyS
	f9LjdRXvevhuLNVAtbHTgwkEDlcGinLn114vewuiBHoNUhHTqw8CnBpYAGYomQegw/MEDqx0iMMtt
	eEi2dChgO+xtUdzsV70ULryO9TmC/PyNrUq385KwRsW4aXxn+dB8i7s7+25+CE00xwZlC2/RIE+/x
	lYO5e8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGn7-0000000C69e-3RVB;
	Mon, 17 Jun 2024 18:09:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGmz-0000000C66S-49CB
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 18:09:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5F02A61966C1;
	Mon, 17 Jun 2024 20:09:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xtigWcKdybrJ; Mon, 17 Jun 2024 20:09:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E73B361966CE;
	Mon, 17 Jun 2024 20:09:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tipReWDeoSdk; Mon, 17 Jun 2024 20:09:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C3B9A61966C1;
	Mon, 17 Jun 2024 20:09:06 +0200 (CEST)
Date: Mon, 17 Jun 2024 20:09:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Gagan Sidhu <broly@mac.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <303502000.252057.1718647746641.JavaMail.zimbra@nod.at>
In-Reply-To: <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com> <14779870-BA54-4ABF-8ABF-FF1D23D172A7@mac.com> <1641029267.251608.1718640023954.JavaMail.zimbra@nod.at> <65E62DA3-EF16-44BD-8E51-E751BD2C496F@mac.com> <1802911356.251780.1718643160760.JavaMail.zimbra@nod.at> <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com> <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com> <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: Cdy4KBaQSTQSx5jOia8rup/ThWcV7A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_110910_434671_DF1E6563 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdhZ2FuIFNpZGh1IiA8YnJv
bHlAbWFjLmNvbT4KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0
ZXIvZHJpdmVycy9tdGQvdWJpL2dsdWViaS5jI0wyOTcKPiAKPiBpdCBzZWVtcyB0aGUgR0xVRUJJ
IGlzIHNldHRpbmcgdGhlIG10ZCB0byBNVERfVUJJVk9MVU1FCj4gCj4gaHR0cHM6Ly9naXRodWIu
Y29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4g
Cj4gd2hlcmUgdGhpcyBkb2VzbuKAmXQgZXZlbiBoYXZlIHRoZSB0ZXh0IOKAnG10ZOKAnSBhbnl3
aGVyZS4KPiAKPiBidXQgdGhlIGJvb3QgcGFydGl0aW9uIGlzIGFsd2F5cyB0aGUgdWJpYmxvY2sg
ZGV2aWNlLgo+IAo+IHNvIGlzIGdsdWViaSB0YWtpbmcgdGhlIHNhbWUgdm9sdW1lIGFuZCBhZGRp
bmcgdGhlIE1URF9VQklWT0xVTUUgbGFiZWwgb3IKPiBzb21ldGhpbmc/CgpZZXMsIEdMVUVCSSBl
bXVsYXRlcyBhIE1URCBvbiB0b3Agb2YgYW4gVUJJIHZvbHVtZS4KSXQgc2V0cyB0aGUgTVREIGRl
dmljZSB0eXBlIHRvIE1URF9VQklWT0xVTUUuCgo+PiAKPj4gWyAgICA1LjQ2MjUwNF0gYXV0by1h
dHRhY2ggbXRkNwo+PiBbICAgIDUuNDYyNTI1XSB1YmkwOiBkZWZhdWx0IGZhc3RtYXAgcG9vbCBz
aXplOiAxNQo+PiBbICAgIDUuNDc3MzA5XSB1YmkwOiBkZWZhdWx0IGZhc3RtYXAgV0wgcG9vbCBz
aXplOiA3Cj4+IFsgICAgNS40ODY2ODNdIHViaTA6IGF0dGFjaGluZyBtdGQ3Cj4+IFsgICAgNS44
MTEyNDBdIFVCSTogRU9GIG1hcmtlciBmb3VuZCwgUEVCcyBmcm9tIDI3MyB3aWxsIGJlIGVyYXNl
ZAo+PiBbICAgIDUuODExMjk5XSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hlZAo+PiBbICAgIDUu
ODc0NTQ2XSBnbHVlYmkgKHBpZCAxKTogZ2x1ZWJpX3Jlc2l6ZWQ6IGdvdCB1cGRhdGUgbm90aWZp
Y2F0aW9uIGZvcgo+PiB1bmtub3duIFVCSSBkZXZpY2UgMCB2b2x1bWUgMQo+PiBbICAgIDUuODky
OTI3XSB1YmkwOiB2b2x1bWUgMSAoInJvb3Rmc19kYXRhIikgcmUtc2l6ZWQgZnJvbSA5IHRvIDI4
IExFQnMKPj4gWyAgICA1LjkwNjY4M10gdWJpMDogYXR0YWNoZWQgbXRkNyAobmFtZSAidWJpIiwg
c2l6ZSA0MCBNaUIpCj4+IFsgICAgNS45MTc0NDZdIHViaTA6IFBFQiBzaXplOiAxMzEwNzIgYnl0
ZXMgKDEyOCBLaUIpLCBMRUIgc2l6ZTogMTI2OTc2IGJ5dGVzCj4+IFsgICAgNS45MzExMzJdIHVi
aTA6IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogMjA0OC8yMDQ4LCBzdWItcGFnZSBzaXplIDIw
NDgKPj4gWyAgICA1Ljk0NDY1NF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDIwNDggKGFsaWdu
ZWQgMjA0OCksIGRhdGEgb2Zmc2V0OiA0MDk2Cj4+IFsgICAgNS45NTg1MTNdIHViaTA6IGdvb2Qg
UEVCczogMzIwLCBiYWQgUEVCczogMCwgY29ycnVwdGVkIFBFQnM6IDAKPj4gWyAgICA1Ljk3MDQ3
Ml0gdWJpMDogdXNlciB2b2x1bWU6IDIsIGludGVybmFsIHZvbHVtZXM6IDEsIG1heC4gdm9sdW1l
cyBjb3VudDoKPj4gMTI4Cj4+IFsgICAgNS45ODQ4NTldIHViaTA6IG1heC9tZWFuIGVyYXNlIGNv
dW50ZXI6IDEvMCwgV0wgdGhyZXNob2xkOiA0MDk2LCBpbWFnZQo+PiBzZXF1ZW5jZSBudW1iZXI6
IDE2MTM0NzU5NTUKPj4gWyAgICA2LjAwMzA0NV0gdWJpMDogYXZhaWxhYmxlIFBFQnM6IDAsIHRv
dGFsIHJlc2VydmVkIFBFQnM6IDMyMCwgUEVCcyByZXNlcnZlZAo+PiBmb3IgYmFkIFBFQiBoYW5k
bGluZzogMTUKPj4gWyAgICA2LjAyMTQyNl0gcm9vdGZzOiBwYXJzaW5nIHBhcnRpdGlvbnMgY21k
bGluZXBhcnQKPj4gWyAgICA2LjAyMTQ0NF0gdWJpMDogYmFja2dyb3VuZCB0aHJlYWQgInViaV9i
Z3QwZCIgc3RhcnRlZCwgUElEIDk3Cj4+IFsgICAgNi4wNDM2OTRdIHJvb3RmczogZ290IHBhcnNl
ciAobnVsbCkKPj4gWyAgICA2LjA1MTQyNl0gbXRkOiBkZXZpY2UgMTIgKHJvb3Rmcykgc2V0IHRv
IGJlIHJvb3QgZmlsZXN5c3RlbQoKQUZBSUNULCB0aGlzIGxvZyBsaW5lIGlzIG5vdCBwYXJ0IG9m
IHRoZSBtYWlubGluZSBrZXJuZWwuCgo+PiBbICAgIDYuMDYyODkxXSByb290ZnNfZGF0YTogcGFy
c2luZyBwYXJ0aXRpb25zIGNtZGxpbmVwYXJ0Cj4+IFsgICAgNi4wNzM2NjldIHJvb3Rmc19kYXRh
OiBnb3QgcGFyc2VyIChudWxsKQo+PiBbICAgIDYuMjExMjQwXSBibG9jayB1YmlibG9jazBfMDog
Y3JlYXRlZCBmcm9tIHViaTA6MChyb290ZnMpCj4+IFsgICAgNi4yNTk1NDVdIHJ0Yy1wY2Y4NTYz
IDAtMDA1MTogaGN0b3N5czogdW5hYmxlIHRvIHJlYWQgdGhlIGhhcmR3YXJlIGNsb2NrCj4+IFsg
ICAgNi4yODIxMjVdIFZGUzogQ2Fubm90IG9wZW4gcm9vdCBkZXZpY2UgIihudWxsKSIgb3IgdW5r
bm93bi1ibG9jaygzMSwxMik6Cj4+IGVycm9yIC02Cj4+IFsgICAgNi4yOTc0MDZdIFBsZWFzZSBh
cHBlbmQgYSBjb3JyZWN0ICJyb290PSIgYm9vdCBvcHRpb247IGhlcmUgYXJlIHRoZQo+PiBhdmFp
bGFibGUgcGFydGl0aW9uczoKPj4gWyAgICA2LjMxNDA1NF0gMWYwMCAgICAgICAgICAgICA1MTIg
bXRkYmxvY2swCj4+IFsgICAgNi4zMTQwNjBdICAoZHJpdmVyPykKPj4gWyAgICA2LjMyNzA3N10g
MWYwMSAgICAgICAgICAgICAyNTYgbXRkYmxvY2sxCj4+IFsgICAgNi4zMjcwODFdICAoZHJpdmVy
PykKPj4gWyAgICA2LjM0MDEwMV0gMWYwMiAgICAgICAgICAgICAyNTYgbXRkYmxvY2syCj4+IFsg
ICAgNi4zNDAxMDVdICAoZHJpdmVyPykKPj4gWyAgICA2LjM1MzEyNF0gMWYwMyAgICAgICAgICAg
ICAyNTYgbXRkYmxvY2szCj4+IFsgICAgNi4zNTMxMjldICAoZHJpdmVyPykKPj4gWyAgICA2LjM2
NjE1M10gMWYwNCAgICAgICAgICAgNDUwNTYgbXRkYmxvY2s0Cj4+IFsgICAgNi4zNjYxNThdICAo
ZHJpdmVyPykKPj4gWyAgICA2LjM3OTE3NV0gMWYwNSAgICAgICAgICAgNDA1NzIgbXRkYmxvY2s1
Cj4+IFsgICAgNi4zNzkxNzldICAoZHJpdmVyPykKPj4gWyAgICA2LjM5MjIxN10gMWYwNiAgICAg
ICAgICAgIDQwOTYgbXRkYmxvY2s2Cj4+IFsgICAgNi4zOTIyMjJdICAoZHJpdmVyPykKPj4gWyAg
ICA2LjQwNTI0MF0gMWYwNyAgICAgICAgICAgNDA5NjAgbXRkYmxvY2s3Cj4+IFsgICAgNi40MDUy
NDRdICAoZHJpdmVyPykKPj4gWyAgICA2LjQxODI3Ml0gMWYwOCAgICAgICAgICAgMzI3NjggbXRk
YmxvY2s4Cj4+IFsgICAgNi40MTgyNzddICAoZHJpdmVyPykKPj4gWyAgICA2LjQzMTI5Nl0gMWYw
OSAgICAgICAgICAgNDA5NjAgbXRkYmxvY2s5Cj4+IFsgICAgNi40MzEzMDBdICAoZHJpdmVyPykK
Pj4gWyAgICA2LjQ0NDMyNF0gMWYwYSAgICAgICAgICAgIDYxNDQgbXRkYmxvY2sxMAo+PiBbICAg
IDYuNDQ0MzI4XSAgKGRyaXZlcj8pCj4+IFsgICAgNi40NTc1MThdIDFmMGIgICAgICAgICAgICA0
NjA4IG10ZGJsb2NrMTEKPj4gWyAgICA2LjQ1NzUyM10gIChkcml2ZXI/KQo+PiBbICAgIDYuNDcw
NzIwXSBmZTAwICAgICAgICAgICAzMzYwNCB1YmlibG9jazBfMAo+PiBbICAgIDYuNDcwNzI0XSAg
KGRyaXZlcj8pCj4+IFsgICAgNi40ODQwOTBdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBW
RlM6IFVuYWJsZSB0byBtb3VudCByb290IGZzIG9uCj4+IHVua25vd24tYmxvY2soMzEsMTIpCgoo
MzEsIDEyKSB3b3VsZCBiZSBtdGRibG9jazEyLgpIb3cgZG9lcyB5b3VyIGtlcm5lbCBrbm93IHRo
YXQgbXRkYmxvY2sxMiBzaGFsbCBiZSB0aGUgcm9vdGZzPwoKSSBoYXZlIGEgaGFyZCB0aW1lIHVu
ZGVyc3RhbmRpbmcgeW91ciBjdXJyZW50IHNldHVwLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
