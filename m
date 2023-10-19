Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8E8CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vI2eufaqhC3AgbynkJbzk2z0rQDU97ljCbZ4mrStvkY=; b=qYUzDjTv+pKxVt1vwUkHMffJ9l
	xMkHzkx3nwonMK/P4kPGgRUSsO1jlt3wWbngyzF7wro2DI7UmBgkW7lwsibz3xM3nkRSW26IPYwf5
	9LGauQeEhBnRxTmrZyTZNxD9bww5d4OCla/mQ/6cLgkApFLxYsOHB0Eg+tPExpQGiNX8PPsHvgwxK
	Y+S6tWwU+5avT0tnwWV/j8NrZCCaT+IU6m86JQBedJHhfH6SjW1q4a9x2HsSw2BP56+OHsWySt1k/
	7s916wRZptlHy9zmlt/t4GxHnTQreK/7yh5NH28h4I54Vd9cWYdK0xD9Qjvd8/Rju85gZSJwBzA+5
	X7qmdRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtZcJ-000fw8-1e;
	Thu, 19 Oct 2023 20:27:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtZcF-000fuI-0y
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 20:27:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 24C7F63DCAAA;
	Thu, 19 Oct 2023 22:27:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id PZCW94g8D12l; Thu, 19 Oct 2023 22:27:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EA22063DCABE;
	Thu, 19 Oct 2023 22:27:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PUJHuXQVN78Y; Thu, 19 Oct 2023 22:27:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C1E3063DCAAA;
	Thu, 19 Oct 2023 22:27:28 +0200 (CEST)
Date: Thu, 19 Oct 2023 22:27:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, dpervushin@embeddedalley.com, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
In-Reply-To: <20231018121618.778385-1-wangzhaolong1@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: RXBccCZfZ5BmLv0YkPinrieu1FJ81Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_132735_645804_A24EA4BD 
X-CRM114-Status: GOOD (  12.10  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlpoYW9Mb25nIFdhbmciIDx3
YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+
LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVzaCBS
YWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sCj4gZHBlcnZ1c2hpbkBlbWJlZGRlZGFsbGV5
LmNvbSwgIkFydGVtIEJpdHl1dHNraXkiIDxBcnRlbS5CaXR5dXRza2l5QG5va2lhLmNvbT4KPiBD
QzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtl
cm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiY2hlbmd6aGloYW8xIgo+IDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJaaGFvTG9uZyBXYW5nIiA8d2FuZ3poYW9sb25nMUBo
dWF3ZWkuY29tPiwgInlpIHpoYW5nIiA8eWkuemhhbmdAaHVhd2VpLmNvbT4sICJ5YW5nZXJrdW4i
Cj4gPHlhbmdlcmt1bkBodWF3ZWkuY29tPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMTguIE9rdG9i
ZXIgMjAyMyAxNDoxNjoxOAo+IEJldHJlZmY6IFtQQVRDSCB2Ml0gdWJpOiBnbHVlYmk6IEZpeCBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgY2F1c2VkIGJ5IGZ0bCBub3RpZmllcgoKPiBJZiBib3Ro
IGZsdC5rbyBhbmQgZ2x1ZWJpLmtvIGFyZSBsb2FkZWQsIHRoZSBub3RpaWVyIG9mIGZ0bAo+IHRy
aWdnZXJzIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aGVuIHRyeWluZyB0byBhY2Nlc3MKPiDi
gJhnbHVlYmktPmRlc2PigJkgaW4gZ2x1ZWJpX3JlYWQoKS4KPiAKPiB1YmlfZ2x1ZWJpX2luaXQK
PiAgdWJpX3JlZ2lzdGVyX3ZvbHVtZV9ub3RpZmllcgo+ICAgIHViaV9lbnVtZXJhdGVfdm9sdW1l
cwo+ICAgICAgdWJpX25vdGlmeV9hbGwKPiAgICAgICAgZ2x1ZWJpX25vdGlmeSAgICBuYi0+bm90
aWZpZXJfY2FsbCgpCj4gICAgICAgICAgZ2x1ZWJpX2NyZWF0ZQo+ICAgICAgICAgICAgbXRkX2Rl
dmljZV9yZWdpc3Rlcgo+ICAgICAgICAgICAgICBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyCj4g
ICAgICAgICAgICAgICAgYWRkX210ZF9kZXZpY2UKPiAgICAgICAgICAgICAgICAgIGJsa3RyYW5z
X25vdGlmeV9hZGQgICBub3QtPmFkZCgpCj4gICAgICAgICAgICAgICAgICAgIGZ0bF9hZGRfbXRk
ICAgICAgICAgdHItPmFkZF9tdGQoKQo+ICAgICAgICAgICAgICAgICAgICAgIHNjYW5faGVhZGVy
Cj4gICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBtdGRfcmVhZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF9yZWFkX29vYgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2x1ZWJpX3JlYWQgICBtdGQtPnJlYWQoKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnbHVlYmktPmRlc2MgLSBOVUxMCj4gCj4g
RGV0YWlsZWQgcmVwcm9kdWN0aW9uIGluZm9ybWF0aW9uIGF2YWlsYWJsZSBhdCB0aGUgbGlua1sx
XSwKPiAKPiBJbiB0aGUgbm9ybWFsIGNhc2UsIG9idGFpbiBnbHVlYmktPmRlc2MgaW4gdGhlIGds
dWViaV9nZXRfZGV2aWNlKCksCj4gYW5kIGFjY2Vzc2VzIGdsdWViaS0+ZGVzYyBpbiB0aGUgZ2x1
ZWJpX3JlYWQoKS4gSG93ZXZlciwKPiBnbHVlYmlfZ2V0X2RldmljZSgpIGlzIG5vdCBleGVjdXRl
ZCBpbiBhZHZhbmNlIGluIHRoZQo+IGZ0bF9hZGRfbXRkKCkgcHJvY2Vzcywgd2hpY2ggbGVhZHMg
dG8gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgo+IAo+IFRoZSB2YWx1ZSBvZiBnbHVlYmktPmRl
c2MgbWF5IGFsc28gYmUgYSBuZWdhdGl2ZSBlcnJvciBjb2RlLCB3aGljaAo+IHRyaWdnZXJzIHRo
ZSBwYWdlIGZhdWx0IGVycm9yLgo+IAo+IFRoaXMgcGF0Y2ggaGFzIHRoZSBmb2xsb3dpbmcgbW9k
aWZpY2F0aW9uczoKPiAKPiAxLiBEbyBub3QgYXNzaWduIGdsdWViaS0+ZGVzYyB0byB0aGUgZXJy
b3IgY29kZS4gVXNlIHRoZSBOVUxMIGluc3RlYWQuCj4gCj4gMi4gQWx3YXlzIGNoZWNrIHRoZSB2
YWxpZGl0eSBvZiBnbHVlYmktPmRlc2MgaW4gZ2x1ZWJpX3JlYWQoKSBJZiB0aGUKPiAgIGdsdWVi
aS0+ZGVzYyBpcyBOVUxMLCB0cnkgdG8gZ2V0IE1URCBkZXZpY2UuCj4gCj4gU3VjaCBhIG1vZGlm
aWNhdGlvbiBjdXJyZW50bHkgd29ya3MgYmVjYXVzZSB0aGUgbXV0ZXggIm10ZF90YWJsZV9tdXRl
eCIKPiBpcyBoZWxkIG9uIGFsbCBuZWNlc3NhcnkgcGF0aHMsIGluY2x1ZGluZyB0aGUgZnRsX2Fk
ZF9tdGQoKSBjYWxsIHBhdGgsCj4gb3BlbiBhbmQgY2xvc2UgcGF0aHMuIFRoZXJlZm9yZSwgbWFu
eSByYWNlIGNvbmRpdGlvbiBjYW4gYmUgYXZvaWRlZC4KCkkgc2VlIHRoZSBwcm9ibGVtLCBidXQg
SSdtIG5vdCByZWFsbHkgc2F0aXNmaWVkIGJ5IHRoZSBzb2x1dGlvbi4KQWRkaW5nIHRoaXMgaGFj
ayB0byBnbHVlYmlfcmVhZCgpIGlzIG5vdCBuaWNlIGF0IGFsbC4KCklzIHRoZXJlIGEgc3Ryb25n
IHJlYXNvbiB3aHkgaGF2ZSB0byBkZWZlciB1Ymlfb3Blbl92b2x1bWUoKSB0bwpnbHVlYmlfZ2V0
X2RldmljZSgpPwoKTWlxdWVsLCB3aGF0IGRvIHlvdSB0aGluaz8KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
