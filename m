Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592C8C432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 19:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E69A222DE
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 19:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVln/YZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E69A222DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cudbOg0QobqvM/rX62A+fCZWGVXMHD7+/SMqXPPedS4=; b=mVln/YZVZHQKIV
	3Xleafv5qGDmmmQu5yh2vGSBsJY9nliUqevQ/tGanSm1Haqg2/NUCMKNEt5IiCPXyQ3DwQnEem3h/
	km+S9xg+Ba0Qe4LOqVGdptssqfs59wdQCFhDvo7zJDhz0nsR7QhQOknP7rGMsGa8B8Hs26MnID/us
	2fu4zrA6VWdkVgxxGf+7d/BpjnOKYD4ZescHjfcBERpmjBBAm5cnxmstmQmrVJh9djnOIHTxneJ6o
	BO7U+xowewpuUc4/g12AeTU0x2ozar5SCTI938pBHcLrUgC7xFj/Zir1pMALpGrOV/J5Smse74we9
	Jp2uiFUlM4qVG0AtL92Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWmkc-0007h7-NH; Mon, 18 Nov 2019 19:31:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWmkZ-0007fc-10
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 19:31:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 36751608325B;
 Mon, 18 Nov 2019 20:31:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id niBS_obFIVVT; Mon, 18 Nov 2019 20:31:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BB3D86083279;
 Mon, 18 Nov 2019 20:31:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 55IZcHZgzvVo; Mon, 18 Nov 2019 20:31:44 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 94045608325B;
 Mon, 18 Nov 2019 20:31:44 +0100 (CET)
Date: Mon, 18 Nov 2019 20:31:44 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <884028732.91086.1574105504462.JavaMail.zimbra@nod.at>
In-Reply-To: <20191118202257.6cfd1a7e@xps13>
References: <20191117202435.28127-1-sudipm.mukherjee@gmail.com>
 <20191118114657.GA228826@kroah.com>
 <1505628642.90849.1574081270290.JavaMail.zimbra@nod.at>
 <20191118202257.6cfd1a7e@xps13>
Subject: Re: [PATCH v2] {tty: serial, nand: onenand}: samsung: rename to fix
 build warning
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: {tty: serial,
 nand: onenand}: samsung: rename to fix build warning
Thread-Index: sktL5Ddmg4OIdetI4bmxUiXBom0npg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_113151_363384_564F4110 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENDOiAiR3JlZyBLcm9haC1IYXJ0bWFuIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
LCAiU3VkaXAgTXVraGVyamVlIiA8c3VkaXBtLm11a2hlcmplZUBnbWFpbC5jb20+LCAiS3l1bmdt
aW4gUGFyayIKPiA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4sICJWaWduZXNoIFJhZ2hhdmVu
ZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgIkppcmkgU2xhYnkiIDxqc2xhYnlAc3VzZS5jb20+LCAi
bGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgImxpbnV4LW10
ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LXNlcmlhbCIKPiA8bGlu
dXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTW9udGFnLCAxOC4gTm92ZW1i
ZXIgMjAxOSAyMDoyMjo1Nwo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjJdIHt0dHk6IHNlcmlhbCwg
bmFuZDogb25lbmFuZH06IHNhbXN1bmc6IHJlbmFtZSB0byBmaXggYnVpbGQgd2FybmluZwoKPiBI
aSBhbGwsCj4gCj4gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGUgb24g
TW9uLCAxOCBOb3YgMjAxOSAxMzo0Nzo1MAo+ICswMTAwIChDRVQpOgo+IAo+PiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+ID4+IEkgd2FzIG5vdCBzdXJlIGlmIHRoaXMgc2hvdWxk
IGhhdmUgYmVlbiB0d28gZGlmZmVyZW50IHBhdGNoLCBidXQgc2luY2UKPj4gPj4gdGhpcyB3aWxs
IGJlIGZpeGluZyB0aGUgc2FtZSBwcm9ibGVtIHNvIGl0IHNlZW1zIGl0cyBiZXR0ZXIgdG8gaGF2
ZSB0aGVtCj4+ID4+IGluIGEgc2luZ2xlIHBhdGNoLgo+PiA+PiAKPj4gPj4gIGRyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+PiA+PiAg
ZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3tzYW1zdW5nLmMgPT4gc2Ftc3VuZ19tdGQuY30gfCAw
Cj4+ID4+ICBkcml2ZXJzL3R0eS9zZXJpYWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KPj4gPj4gIGRyaXZlcnMvdHR5L3NlcmlhbC97c2Ftc3VuZy5jID0+IHNhbXN1
bmdfdHR5LmN9ICAgICAgIHwgMAo+PiA+PiAgNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+ID4+ICByZW5hbWUgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L3tzYW1zdW5nLmMgPT4gc2Ftc3VuZ19tdGQuY30gKDEwMCUpCj4+ID4+ICByZW5hbWUgZHJpdmVy
cy90dHkvc2VyaWFsL3tzYW1zdW5nLmMgPT4gc2Ftc3VuZ190dHkuY30gKDEwMCUpCj4+ID4gCj4+
ID4gSSBjYW4gdGFrZSB0aGlzIGluIHRoZSB0dHkgdHJlZSBpZiB0aGUgbXRkIG1haW50YWluZXIg
Z2l2ZXMgYW4gYWNrIGZvcgo+PiA+IGl0Li4uCj4+IAo+PiBBY2tlZC1ieTogUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiAKPiBJZiBpdCBpcyBub3QgdG9vIGxhdGUsIEkgYW0g
bm90IGEgYmlnIGZhbiBvZiB0aGUgbmV3IG5hbWluZyB3aGljaCBpcwo+IHJhdGhlciBub3QgZGVz
Y3JpcHRpdmUuIEZpbGVzIGluIHRoZSBvbmVuYW5kIHN1YmRpcmVjdG9yeSBhcmU6Cj4gKiBvbmVu
YW5kXzxzb21ldGhpbmc+LmMgZm9yIHRoZSBiYXNlIGZpbGVzCj4gKiA8dmVuZG9yPi5jIGZvciB0
aGUgdmVuZG9ycyBmaWxlcyAoY3VycmVudGx5OiBvbWFwMi5jIGFuZCBzYW1zdW5nLmMpLgoKV2Vs
bCwgSSdtIGZpbmUgd2l0aCB0aGUgbmFtaW5nIGVpdGhlciB3YXkuIDotKQoKVGhhbmtzLAovL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
