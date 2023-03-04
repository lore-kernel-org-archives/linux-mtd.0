Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8219DC678D5
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Mar 2023 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5i5UNvM9GvjRzc2nDnPqRlfg7twbEZ66JLl/xGX2SM8=; b=SUic+viqTWQWH00+sYwTjCk2ym
	x9eCjfw22ku7G7nZTb6LgiF9KUGKI15S0fJ+NSSR0jANDO7jMIt/rMtjEktnN0e0hdA78W4s96EKa
	PvBgA9SypOl1uorXs5BkHASyIe21WF/rwLwrCHIQOeZXe/UmedYSkELqD2dkobChT+Bx0CDesEWGT
	gQIVXXhYWhebn/JB1uD0mcefOdNBdK+Ok+PhZ5493KDKYNfR8GC4qfTMfQzux3cJ+EkXmPQrg9mXZ
	M1257gqumxr4GoRf7zCXc2VsWfdymLrZk+3emp19SvJepl/nH1uf6NUWSgy7FElI1tlMdj8W2pZhZ
	qIk7SLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYVEd-009HIZ-0P; Sat, 04 Mar 2023 16:59:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYVEZ-009HG2-9x
	for linux-mtd@lists.infradead.org; Sat, 04 Mar 2023 16:59:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 12B716382EFB;
	Sat,  4 Mar 2023 17:59:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id VJ8KBk6rlIxq; Sat,  4 Mar 2023 17:59:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8477A61418B6;
	Sat,  4 Mar 2023 17:59:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2ZH0VCMlkC3U; Sat,  4 Mar 2023 17:59:41 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6554A6382EFB;
	Sat,  4 Mar 2023 17:59:41 +0100 (CET)
Date: Sat, 4 Mar 2023 17:59:41 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <1472678614.203878.1677949181290.JavaMail.zimbra@nod.at>
In-Reply-To: <2d3b033a-5329-be95-fe38-2cceb17b9014@huawei.com>
References: <20230304014141.2099204-1-wangzhaolong1@huawei.com> <2d3b033a-5329-be95-fe38-2cceb17b9014@huawei.com>
Subject: Re: [PATCH] ubi: Fix deadlock caused by recursively holding
 work_sem
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix deadlock caused by recursively holding work_sem
Thread-Index: QdXMMi4X/w+/jvDCBA4SuSPx9dKZyQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_085947_542043_A38290EE 
X-CRM114-Status: UNSURE (   7.99  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiBEdXJpbmcgdGhlIHByb2Nlc3Npbmcgb2YgdGhlIGJn
dCwgaWYgdGhlIHN5bmNfZXJhc2UoKSByZXR1cm4gLUVCVVNZCj4+IG9yIHNvbWUgb3RoZXIgZXJy
b3IgY29kZSBpbiBfX2VyYXNlX3dvcmtlcigpLHNjaGVkdWxlX2VyYXNlKCkgY2FsbGVkCj4+IGFn
YWluIGxlYWQgdG8gdGhlIGRvd25fcmVhZCh1YmktPndvcmtfc2VtKSBob2xkIHR3aWNlIGFuZCBt
YXkgZ2V0Cj4+IGJsb2NrIGJ5IGRvd25fd3JpdGUodWJpLT53b3JrX3NlbSkgaW4gdWJpX3VwZGF0
ZV9mYXN0bWFwKCksCj4+IHdoaWNoIGNhdXNlIGRlYWRsb2NrLgo+PiAKPj4gICAgICAgICAgICB1
YmkgYmd0ICAgICAgICAgICAgICAgICAgICAgICAgb3RoZXIgdGFzawo+PiAgIGRvX3dvcmsKPj4g
ICAgZG93bl9yZWFkKCZ1YmktPndvcmtfc2VtKSAgICAgICAgICB1YmlfdXBkYXRlX2Zhc3RtYXAK
Pj4gICAgZXJhc2Vfd29ya2VyICAgICAgICAgICAgICAgICAgICAgICAgICMgQmxvY2tlZCBieSBk
b3duX3JlYWQKPj4gICAgIF9fZXJhc2Vfd29ya2VyICAgICAgICAgICAgICAgICAgICAgIGRvd25f
d3JpdGUoJnViaS0+d29ya19zZW0pCj4+ICAgICAgc2NoZWR1bGVfZXJhc2UKPj4gICAgICAgc2No
ZWR1bGVfdWJpX3dvcmsKPj4gICAgICAgIGRvd25fcmVhZCgmdWJpLT53b3JrX3NlbSkKPj4gCj4+
IEZpeCB0aGlzIGJ5IGNoYW5naW5nIGlucHV0IHBhcmFtZXRlciBAbmVzdGVkIG9mIHRoZSBzY2hl
ZHVsZV9lcmFzZSgpIHRvCj4+ICd0cnVlJyB0byBhdm9pZCByZWN1cnNpdmVseSBhY3F1aXJpbmcg
dGhlIGRvd25fcmVhZCgmdWJpLT53b3JrX3NlbSkuCj4+IAo+PiBBbHNvLCBmaXggdGhlIGluY29y
cmVjdCBjb21tZW50IGFib3V0IEBuZXN0ZWQgcGFyYW1ldGVyIG9mIHRoZQo+PiBzY2hlZHVsZV9l
cmFzZSgpIGJlY2F1c2Ugd2hlbiBkb3duX3dyaXRlKHViaS0+d29ya19zZW0pIGlzIGhlbGQsIHRo
ZQo+PiBAbmVzdGVkIGlzIGFsc28gbmVlZCBiZSB0cnVlLgo+PiAKPj4gTGluazogaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTcwOTMKPj4gRml4ZXM6IDJlOGYw
OGRlYWJiYyAoInViaTogRml4IHJhY2VzIGFyb3VuZCB1YmlfcmVmaWxsX3Bvb2xzKCkiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBaaGFvTG9uZyBXYW5nIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvbXRkL3ViaS93bC5jIHwgNCArKy0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBSZXZpZXdlZC1ieTogWmhp
aGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCkFwcGxpZWQgdG8gLW5leHQuIFRo
YW5rcyBldmVyeW9uZSEKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
