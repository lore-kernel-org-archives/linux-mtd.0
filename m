Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D40C5DF85
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 18:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wqjcC9fuIwtVTZVc8dt92nHKt+rdbf3xpVU5X19Aa8s=; b=CHuO5e5lUTeGyRCViXb9OIb1UY
	SpjDzlRLD4ZTDCoRuvpXzerEO1tuETvsewacK8BXdhgDnlrrzibobI+uhG30rAgy8Zrd65k+ScLl8
	YYbbV3T5DhaRQszOo2BTDXMdcHcb01MYZGd046GIC8SWH4D0TCugvPgdreiQM7DACLi2eg1HceOKx
	ewnCvnpSpviggLkieAwys9LMVzA5itr/eBaHmfgknYXgahiX4bWHvbfwHY2Laz60xnhFpwHKhTrEh
	w3zTgFDayvI5zeK1Xsu6mbF8YlppBBuGlFbVB2mk4S0s3Cl9Y0OxQ5izyNdCIsuqCvw83IXVL3tY7
	HUB0Xa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7yI-0000000C55Z-30Lk;
	Thu, 20 Aug 2026 18:58:38 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7yE-0000000C54z-2dc2
	for linux-mtd@lists.infradead.org;
	Thu, 20 Aug 2026 18:58:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 512771012D4;
	Thu, 20 Aug 2026 20:58:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZsNHtjgMfNLy; Thu, 20 Aug 2026 20:58:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 507CA2A3C71;
	Thu, 20 Aug 2026 20:58:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K3J0EV3ouScX; Thu, 20 Aug 2026 20:58:22 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id F345F1012D4;
	Thu, 20 Aug 2026 20:58:21 +0200 (CEST)
Date: Thu, 20 Aug 2026 20:58:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: zhouminqiang <zhouminqiang2@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <852434244.6574.1787252301788.JavaMail.zimbra@nod.at>
In-Reply-To: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
References: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
Subject: Re: [PATCH 0/6] jffs2: extend write verification to all write paths
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF153 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: extend write verification to all write paths
Thread-Index: ZdnguF3uAYb8KtTl3XluY4DRgs3IlQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_115834_974066_2E638619 
X-CRM114-Status: GOOD (  19.45  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInpob3VtaW5xaWFuZyIgPHpo
b3VtaW5xaWFuZzJAaHVhd2VpLmNvbT4KPiBBbjogIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGlu
ZnJhZGVhZC5vcmc+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+IENDOiAibGludXgtbXRk
IiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJjaGVuZ3poaWhhbzEiCj4gPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPiwgInlhbmdlcmt1biIgPHlhbmdlcmt1bkBodWF3ZWkuY29tPiwgInlpIHpoYW5n
IiA8eWkuemhhbmdAaHVhd2VpLmNvbT4KPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMjAuIEF1Z3Vz
dCAyMDI2IDEyOjQ5OjU2Cj4gQmV0cmVmZjogW1BBVENIIDAvNl0gamZmczI6IGV4dGVuZCB3cml0
ZSB2ZXJpZmljYXRpb24gdG8gYWxsIHdyaXRlIHBhdGhzCgo+IFdoZW4gSkZGUzIgd3JpdGVzIGRh
dGEgdG8gZmxhc2gsIGl0IGZpcnN0IGNhbGN1bGF0ZXMgYSBub2RlIENSQywgYW5kCj4gdGhlIE5B
TkQgY29udHJvbGxlciBjYWxjdWxhdGVzIEVDQyBhcyB0aGUgZGF0YSBpcyBwcm9ncmFtbWVkLiBJ
ZgoKV2h5IHdvdWxkIG9uZSB1c2UgSkZGUzIgaW4gMjAyNiBvbiBOQU5EIGZsYXNoPwoKPiBjb3Jy
dXB0aW9uIG9jY3VycyBiZXR3ZWVuIHRoZXNlIHR3byBwb2ludHMsIHRoZSBwb3NzaWJsZSBjYXVz
ZXMgYXJlCj4gUkFNIGZhaWx1cmVzIG9yIGJ1cyB0cmFuc2ZlciBlcnJvcnMgYmVmb3JlIHRoZSBk
YXRhIHJlYWNoZXMgdGhlIGZsYXNoLAo+IG9yIGJpdCBmbGlwcyBvbiB0aGUgZmxhc2ggbWVkaXVt
IGl0c2VsZi4gVG8gZGlzdGluZ3Vpc2ggd2hldGhlciB0aGUKPiBjb3JydXB0aW9uIGhhcHBlbmVk
IGR1cmluZyB0aGUgd3JpdGUgdHJhbnNmZXIgb3IgYWZ0ZXIgY29tbWl0IHRvIHRoZQo+IG1lZGl1
bSwgY29tbWl0IGE2YmM0MzJlMjk2ZCAoIltKRkZTMl0gQWRkIHN1cHBvcnQgZm9yIHdyaXRlLWJ1
ZmZlcgo+IHZlcmlmaWNhdGlvbiIpIGludHJvZHVjZWQgQ09ORklHX0pGRlMyX0ZTX1dCVUZfVkVS
SUZZOiByZWFkaW5nIHRoZQo+IGRhdGEgYmFjayBpbW1lZGlhdGVseSBhZnRlciBhIHN1Y2Nlc3Nm
dWwgd3JpdGUgYW5kIGNvbXBhcmluZyBpdCB3aXRoCj4gdGhlIGluLW1lbW9yeSBzb3VyY2UgYnVm
ZmVyIHByb3ZpZGVzIHRoZSBtaXNzaW5nIG9ic2VydmF0aW9uIHBvaW50Cj4gZm9yIHRoYXQgZGlh
Z25vc2lzLgo+IAo+IEhvd2V2ZXIsIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9ubHkgcGVy
Zm9ybXMgcmVhZC1iYWNrIHZlcmlmaWNhdGlvbgo+IG9uIHdyaXRlLWJ1ZmZlciBmbHVzaCBwYXRo
cy4gVHdvIHNjZW5hcmlvcyByZW1haW4gdW5jb3ZlcmVkOgo+IAo+ICAxLiBXaGVuIHRoZSB3cml0
ZSBkYXRhIGxlbmd0aCBleGNlZWRzIHdidWZfcGFnZXNpemUsIHRoZSBleGNlc3MgZGF0YQo+ICBi
eXBhc3NlcyB0aGUgd3JpdGUgYnVmZmVyIGFuZCBpcyB3cml0dGVuIGRpcmVjdGx5IHRvIGZsYXNo
IHZpYQo+ICBtdGRfd3JpdGUoKSBpbiBqZmZzMl9mbGFzaF93cml0ZXYoKSwgd2l0aCBubyB2ZXJp
ZmljYXRpb24uCj4gIDIuIE5PUiBGbGFzaCBhbmQgb3RoZXIgbm9uLXdyaXRlYnVmZmVyZWQgZGV2
aWNlcyB3cml0ZSBkaXJlY3RseSB0aHJvdWdoCj4gIGpmZnMyX2ZsYXNoX2RpcmVjdF93cml0ZSgp
IGFuZCBqZmZzMl9mbGFzaF9kaXJlY3Rfd3JpdGV2KCksIHdpdGggbm8KPiAgZXF1aXZhbGVudCBj
aGVjay4KPiAKPiBJbiBib3RoIGNhc2VzLCBpZiBNVEQgcmVwb3J0cyBhIHN1Y2Nlc3NmdWwgd3Jp
dGUgYnV0IHRoZSByZWFkYWJsZSBtZWRpdW0KPiBkaWZmZXJzIGZyb20gSkZGUzIncyBzb3VyY2Ug
YnVmZmVyLCBhIGxhdGVyIG5vZGUgQ1JDIGZhaWx1cmUgY2Fubm90Cj4gZGlzdGluZ3Vpc2ggdHJh
bnNwb3J0L3Byb2dyYW0tdGltZSBjb3JydXB0aW9uIGZyb20gcG9zdC1jb21taXQgbWVkaWEKPiBk
YW1hZ2UsIGRlZmVhdGluZyB0aGUgb3JpZ2luYWwgZGlhZ25vc3RpYyBpbnRlbnQuCj4gCj4gVGhp
cyBzZXJpZXMgY292ZXJzIGJvdGggc2NlbmFyaW9zIHdpdGggdGhlIGZvbGxvd2luZyBjaGFuZ2Vz
Lgo+IAo+IFJlcGxhY2UgdGhlIHByZS1hbGxvY2F0ZWQgcGVyLXN1cGVyYmxvY2sgd2J1Zl92ZXJp
ZnkgYnVmZmVyIHdpdGgKPiBvbi1kZW1hbmQgYWxsb2NhdGlvbiBpbnNpZGUgamZmczJfdmVyaWZ5
X3dyaXRlKCkuIFRoaXMgYWxsb3dzCj4gY29uY3VycmVudCB2ZXJpZmljYXRpb24gY2FsbHMgdG8g
cHJvY2VlZCBpbmRlcGVuZGVudGx5IHdpdGhvdXQKPiBjb250ZW5kaW5nIGZvciBhIHNoYXJlZCBi
dWZmZXIuIEFkZGl0aW9uYWxseSwgbWVtY21wKCkgaXMgcmVwbGFjZWQKPiB3aXRoIGEgYnl0ZS1i
eS1ieXRlIGNvbXBhcmlzb24gdGhhdCBwaW5wb2ludHMgdGhlIGV4YWN0IG1pc21hdGNoCj4gb2Zm
c2V0LCByYXRoZXIgdGhhbiBtZXJlbHkgcmVwb3J0aW5nIGVxdWFsIG9yIG5vdC1lcXVhbC4KPiAK
PiBBZGQgdmVyaWZpY2F0aW9uIGNhbGxzIGluIGpmZnMyX2ZsYXNoX3dyaXRldigpIGZvciBkaXJl
Y3QgcGFnZQo+IHdyaXRlcywgYW5kIGluIGpmZnMyX2ZsYXNoX2RpcmVjdF93cml0ZSgpIGFuZAo+
IGpmZnMyX2ZsYXNoX2RpcmVjdF93cml0ZXYoKSBmb3IgTk9SIGFuZCBvdGhlciBub24td3JpdGVi
dWZmZXJlZAo+IGRldmljZXMuCj4gCj4gU2luY2UgdmVyaWZpY2F0aW9uIG5vdyBjb3ZlcnMgYWxs
IHdyaXRlIHBhdGhzIHJhdGhlciB0aGFuIG9ubHkgdGhlCj4gd3JpdGUtYnVmZmVyIHBhdGgsIHJl
bmFtZSBDT05GSUdfSkZGUzJfRlNfV0JVRl9WRVJJRlkgdG8KPiBDT05GSUdfSkZGUzJfRlNfV1JJ
VEVfVkVSSUZZIGFuZCByZW1vdmUgdGhlIEtjb25maWcgZGVwZW5kZW5jeSBvbgo+IENPTkZJR19K
RkZTMl9GU19XUklURUJVRkZFUi4KPiAKPiBBZGQgYSBtb2R1bGUgcGFyYW1ldGVyIHdyaXRlX3Zl
cmlmeSAoZGVmYXVsdCBvZmYsIDA2NDQpIHRvIGFsbG93Cj4gZHluYW1pYyBlbmFibGUvZGlzYWJs
ZSBvZiB3cml0ZSB2ZXJpZmljYXRpb24gYXQgcnVudGltZSwgc28ga2VybmVscwo+IGNhbiBjYXJy
eSB0aGUgZGlhZ25vc3RpYyBmYWNpbGl0eSB3aXRob3V0IHJlYWQtYmFjayBvdmVyaGVhZCB1bnRp
bAo+IGZhdWx0IGlzb2xhdGlvbiBpcyByZXF1aXJlZC4gVGhlIHBhcmFtZXRlciBjYW4gYmUgYWNj
ZXNzZWQgdGhyb3VnaDoKPiAKPiAgICAvc3lzL21vZHVsZS9qZmZzMi9wYXJhbWV0ZXJzL3dyaXRl
X3ZlcmlmeQo+IAo+IFRoaXMgcmVtYWlucyBhbiBvcHRpb25hbCBkaWFnbm9zdGljIGFpZDsgbm9k
ZSBDUkNzIGNvbnRpbnVlIHRvIHByb3ZpZGUKPiBKRkZTMidzIG5vcm1hbCBvbi1tZWRpYSBpbnRl
Z3JpdHkgY2hlY2suCgpQbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyBpcyBuZWVkZWQuCkpGRlMyIGlz
IGluICJPZGQgZml4ZXMiIG1haW50ZW5hbmNlIG1vZGUuCkl0IG5ldmVyIHdvcmtlZCB3ZWxsIGZv
ciBOQU5EIGZsYXNoLCB0aGF0J3Mgd2h5IFVCSUZTIChKRkZTMykgd2FzIGJvcm4uCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
