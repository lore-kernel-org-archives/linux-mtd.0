Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A77C34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 10:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8451D22527
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 10:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PM/vSY2U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NKq95ygc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8451D22527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGMuWvDCWiouaisbg0JmkbsAY1Fi2gVBLAlUaf2zRyQ=; b=PM/vSY2UdVRdSX
	15nXmngXcOPj9uIRyzp2uqTqNCr0AHMTs3OldLSZyjIp5IrjXwAJ4B11kdhPUBkpGA6igI2Iq/dq9
	Fjh75BmyaNy9lB44YaSl1VxdTnsBXYbl3iTbk5EKt3B6RFJJwCG4aTryqIAjeCoyXejOBuITRTDYK
	41dwZ/q6TdImMhB+5iA93gsIwFlD9w89f0RnElUlw1GK8L6l1oUrkNGf12Ay2Xplp2BOHp/zzugLB
	vVrSGx6RvBwYiAIQwsBiqFsPnEiIqzaDOlcsdvY5dDQ47LfqZvUaPcKWBf/4rCdldk9hwz4etR4dM
	sv/v443xouOAZ9ffCE6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j40Dz-0000ph-BK; Tue, 18 Feb 2020 10:35:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j40Dy-0000pC-5V
 for linux-mtd@bombadil.infradead.org; Tue, 18 Feb 2020 10:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=yN4bu25optbVTqAcJADnOh0QZkbU+69wZIjiN8/cDsk=; b=NKq95ygckp3ByfqJXctsgIwWJp
 or88l9gVTR3umnUuo/oeD+tx2yLJFbG8dFOXoB23ZuS4rdaKLa4F09BCTARPQp3PLsrDii2J28n/G
 aL3iTDLttj2XcIAxfbUxu0PKssJZurqd/MVh/4/LesK/1dLNjYa0oUVz6i1MPLJwK+ax5Aolh077p
 4jsaKzZ1kvfA1Wu9ziTrhEXg47FAyII4gtz21GsdrBTq7QyzegeGqi6pRvp+ijIitBHXfeq7D3Fp9
 dSOjdvONCPYW8FL2Q7uNFFeutBGwiKIw7DAjCOSu+GUhf3gYt0UZGib7jjFuxENCBq3GIFat3sVuG
 q6WxLO5w==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j40Dt-0003TS-U3
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 10:35:28 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2377840009;
 Tue, 18 Feb 2020 10:34:49 +0000 (UTC)
Date: Tue, 18 Feb 2020 11:34:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 11/11] mtd: new support oops logger based on pstore/blk
Message-ID: <20200218113449.5ac44955@xps13>
In-Reply-To: <1581078355-19647-12-git-send-email-liaoweixiong@allwinnertech.com>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-12-git-send-email-liaoweixiong@allwinnertech.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_103526_118544_41712760 
X-CRM114-Status: GOOD (  21.79  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV2VpWGlvbmcsCgpXZWlYaW9uZyBMaWFvIDxsaWFvd2VpeGlvbmdAYWxsd2lubmVydGVjaC5j
b20+IHdyb3RlIG9uIEZyaSwgIDcgRmViCjIwMjAgMjA6MjU6NTUgKzA4MDA6Cgo+IEl0J3MgdGhl
IGxhc3Qgb25lIG9mIGEgc2VyaWVzIG9mIHBhdGNoZXMgZm9yIGFkYXB0aXZlIHRvIE1URCBkZXZp
Y2UuCj4gCj4gVGhlIG10ZHBzdG9yZSBpcyBzaW1pbGFyIHRvIG10ZG9vcHMgYnV0IG1vcmUgcG93
ZXJmdWwuIEl0IGJhc2VzIG9uCj4gcHN0b3JlL2JsaywgYWltcyB0byBzdG9yZSBwYW5pYyBhbmQg
b29wcyBsb2dzIHRvIGEgZmxhc2ggcGFydGl0aW9uLAo+IHdoZXJlIGl0IGNhbiBiZSByZWFkIGJh
Y2sgYXMgZmlsZXMgYWZ0ZXIgbW91bnRpbmcgcHN0b3JlIGZpbGVzeXN0ZW0uCj4gCj4gVGhlIHBz
dG9yZS9ibGsgYW5kIGJsa29vcHMsIGEgd3JhcHBlciBmb3IgcHN0b3JlL2JsaywgYXJlIGRlc2ln
bmVkIGZvcgo+IGJsb2NrIGRldmljZSBhdCB0aGUgdmVyeSBiZWdpbm5pbmcsIGJ1dCBub3csIGNv
bXBhdGlibGUgdG8gbm90IG9ubHkKPiBibG9jayBkZXZpY2UuIEFmdGVyIHRoaXMgc2VyaWVzIG9m
IHBhdGNoZXMsIHBzdG9yZS9ibGsgY2FuIGFsc28gd29yawo+IGZvciBNVEQgZGV2aWNlLiBUbyBt
YWtlIGl0IHdvcmssICdibGtkZXYnIG9uIGtjb25maWcgb3IgbW9kdWxlCj4gcGFyYW1ldGVyIG9m
IGJsa29vcHMgc2hvdWxkIGJlIHNldCBhcyBtdGQgZGV2aWNlIG5hbWUgb3IgbXRkIG51bWJlci4K
PiBTZWUgbW9yZSBhYm91dCBwc3RvcmUvYmxrIGFuZCBibGtvb3BzIG9uOgo+ICAgICBEb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL3BzdG9yZS1ibG9jay5yc3QKPiAKPiBXaHkgZG8gd2UgbmVlZCBt
dGRwc3RvcmU/Cj4gMS4gcmVwZXRpdGl2ZSBqb2JzIGJldHdlZW4gcHN0b3JlIGFuZCBtdGRvb3Bz
Cj4gICAgQm90aCBvZiBwc3RvcmUgYW5kIG10ZG9vcHMgZG8gdGhlIHNhbWUgam9icyB0aGF0IHN0
b3JlIHBhbmljL29vcHMgbG9nLgo+ICAgIFRoZXkgaGF2ZSBtdWNoIHNpbWlsYXIgbG9naWMgdGhh
dCByZWdpc3RlciB0byBrbXNnIGR1bXBlciBhbmQgc3RvcmUKPiAgICBsb2cgdG8gc2V2ZXJhbCBj
aHVua3Mgb25lIGJ5IG9uZS4KPiAyLiBkbyB3aGF0IGEgZHJpdmVyIHNob3VsZCBkbwo+ICAgIFRv
IG1lLCBhIGRyaXZlciBzaG91bGQgcHJvdmlkZSBtZXRob2RzIGluc3RlYWQgb2YgcG9saWNpZXMu
IFdoYXQgTVRECj4gICAgc2hvdWxkIGRvIGlzIHRvIHByb3ZpZGUgcmVhZC93cml0ZS9lcmFzZSBv
cGVyYXRpb25zLCBnZXRpbmcgcmlkIG9mIGNvZGVzCj4gICAgYWJvdXQgY2h1bmsgbWFuYWdlbWVu
dCwga21zZyBkdW1wZXIgYW5kIGNvbmZpZ3VyYXRpb24uCj4gMy4gZW5oYW5jZWQgZmVhdHVyZQo+
ICAgIE5vdCBvbmx5IHN0b3JlIGxvZywgYnV0IGFsc28gc2hvdyBpdCBhcyBmaWxlcy4KPiAgICBO
b3Qgb25seSBsb2csIGJ1dCBhbHNvIHRyaWdnZXIgdGltZSBhbmQgdHJpZ2dlciBjb3VudC4KPiAg
ICBOb3Qgb25seSBwYW5pYy9vb3BzIGxvZywgYnV0IGFsc28gbG9nIHJlY29yZGVyIGZvciBwbXNn
LCBjb25zb2xlIGFuZAo+ICAgIGZ0cmFjZSBpbiB0aGUgZnV0dXJlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFdlaVhpb25nIExpYW8gPGxpYW93ZWl4aW9uZ0BhbGx3aW5uZXJ0ZWNoLmNvbT4KCkFja2Vk
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKUmljaGFyZCwg
eW91ciBQb1Ygb24gdGhpcyBpcyB3ZWxjb21lLgoKSSBzdXBwb3NlIHRoaXMgcGF0Y2ggZGVwZW5k
cyBvbiB0aGUgb3RoZXJzIHRvIHdvcmsgY29ycmVjdGx5IHNvIG1heWJlCndlIHNob3VsZCB3YWl0
IHRoZSBuZXh0IHJlbGVhc2UgYmVmb3JlIGFwcGx5aW5nIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
