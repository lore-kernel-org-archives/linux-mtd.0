Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E435CA0EDA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hVosj/x5HwAq2ulWaLD0/u43gpe0ICWCRc5nmguqF8c=; b=3rUoEXGopTlutP7wWsxGADCBhx
	SWXzO4MkxB3Bgefmjshtszo6aE+XTR53Fu7TsX/lw24KuC86Sj4MNwXxcqMz5CbIdSb5XzVAUWy+S
	QrSlbhfrGLjRzKJBeoJnPWNuQQ2r4x8/2Ymbl1DMjr0CNwoCWmWTMfX95dKP2fbIc0IM5LxpXsh6A
	mu/3A23FIemtdEKPoMsE/whjc0jZQE+HQ4yRX2LftItDWLRQUTFGoHOr4k5tHPBaXNIXc4FsiRh/C
	eosj1EySt5OHt4fIIS/yTS+Av/p5wQLEi0T5OQoiWZBzRqK2mR03czHchMIPkD6hBkIgOSOivqF0K
	GCQ/F1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulixW-0000000A4oT-47QX;
	Tue, 12 Aug 2025 06:58:10 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliwb-0000000A4lZ-1Yf5
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 06:57:15 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 71B812CFC9E;
	Tue, 12 Aug 2025 08:57:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DZXKfu6zHe_N; Tue, 12 Aug 2025 08:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2FC222CFCA2;
	Tue, 12 Aug 2025 08:57:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UyyYftYaZDx0; Tue, 12 Aug 2025 08:57:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E9B322CFC9E;
	Tue, 12 Aug 2025 08:57:08 +0200 (CEST)
Date: Tue, 12 Aug 2025 08:57:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Message-ID: <152133202.103367.1754981828821.JavaMail.zimbra@nod.at>
In-Reply-To: <20250812051949.983040-1-linchengming884@gmail.com>
References: <20250812051949.983040-1-linchengming884@gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: skip programming unused bits in ubi headers
Thread-Index: VhBWjQYhkWEhcaAAxAB74s5JC7o1Cw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_235713_640986_751C4617 
X-CRM114-Status: UNSURE (   8.78  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNoZW5nIE1pbmcgTGluIiA8
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5h
dD4sICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJNaXF1ZWwgUmF5
bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sCj4gIlZpZ25lc2ggUmFnaGF2ZW5kcmEi
IDx2aWduZXNockB0aS5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+
IENDOiAiQWx2aW4gWmhvdSIgPGFsdmluemhvdUBteGljLmNvbS50dz4sIGxlb3l1QG14aWMuY29t
LnR3LCAiQ2hlbmcgTWluZyBMaW4iIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gR2VzZW5k
ZXQ6IERpZW5zdGFnLCAxMi4gQXVndXN0IDIwMjUgMDc6MTk6NDkKPiBCZXRyZWZmOiBbUkZDXSBt
dGQ6IHViaTogc2tpcCBwcm9ncmFtbWluZyB1bnVzZWQgYml0cyBpbiB1YmkgaGVhZGVycwoKPiBG
cm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+IAo+IFRoaXMg
cGF0Y2ggcHJldmVudHMgdW5uZWNlc3NhcnkgcHJvZ3JhbW1pbmcgb2YgYml0cyBpbiBlY19oZHIg
YW5kCj4gdmlkX2hkciB0aGF0IGFyZSBub3QgdXNlZCBvciByZWFkIGR1cmluZyBub3JtYWwgVUJJ
IG9wZXJhdGlvbi4gVGhlc2UKPiB1bnVzZWQgYml0cyBhcmUgdHlwaWNhbGx5IGFscmVhZHkgc2V0
IHRvIDEgaW4gZXJhc2VkIGZsYXNoIGFuZCBkbyBub3QKPiBuZWVkIHRvIGJlIGV4cGxpY2l0bHkg
cHJvZ3JhbW1lZCB0byAwIGlmIHRoZXkgYXJlIG5vdCB1c2VkLgo+IAo+IFByb2dyYW1taW5nIHN1
Y2ggdW51c2VkIGFyZWFzIG9mZmVycyBubyBmdW5jdGlvbmFsIGJlbmVmaXQgYW5kIG1heQo+IHJl
c3VsdCBpbiB1bm5lY2Vzc2FyeSBmbGFzaCB3ZWFyLCByZWR1Y2luZyB0aGUgb3ZlcmFsbCBsaWZl
dGltZSBvZiB0aGUKPiBkZXZpY2UuIEJ5IHNraXBwaW5nIHRoZXNlIHdyaXRlcywgd2UgcHJlc2Vy
dmUgdGhlIGZsYXNoIHN0YXRlIGFzIG11Y2gKPiBhcyBwb3NzaWJsZSBhbmQgbWluaW1pemUgd2Vh
ciBjYXVzZWQgYnkgcmVkdW5kYW50IG9wZXJhdGlvbnMuCgpXZSB0YWxrIGFib3V0IHByb2dyYW1t
aW5nIGEgc2luZ2xlIChzdWIpcGFnZSwgcmlnaHQ/Cgo+IFRoaXMgY2hhbmdlIGVuc3VyZXMgdGhh
dCBvbmx5IG5lY2Vzc2FyeSBmaWVsZHMgYXJlIHdyaXR0ZW4gd2hlbgo+IHByZXBhcmluZyBVQkkg
aGVhZGVycywgaW1wcm92aW5nIGZsYXNoIGVmZmljaWVuY3kgd2l0aG91dCBhZmZlY3RpbmcKPiBm
dW5jdGlvbmFsaXR5LgoKSSBoYXZlIGJlZW4gdG9sZCB0aGF0IHdyaXRpbmcgMHhGRiBieXRlcyB0
byBOQU5EIHNob3VsZCBiZSBhdm9pZGVkLgpUaGlzIGlzIGFsc28gd2h5IFVCSSBpbml0aWFsaXpl
cyB0aGVtIHRvIDB4MDAuCgpEbyB5b3UgaGF2ZSBkYXRhIHdoaWNoIHByb3ZlcyB0aGUgb3Bwb3Np
dGU/CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
