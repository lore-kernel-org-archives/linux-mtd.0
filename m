Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5F5C3DA45
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2024 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gr0GKygKr7V8h78841rSGlWEXLN24wdTrhysysBZKYs=; b=GR38k8oeVkEj1QywufSh5wu3eY
	lCZlmvoNnmt3dCL3zuKiDPKIUwt19kdk+yBgqe0xa8CTu4w/uQ8Hh7r4nt8ZhuQnZZta78ws++ZEh
	MvOa2nIwTZQ94FmbeBtQqaCcCaY8kV13i6W/A2ZaHUWzIfl+zaiv10UTwchp2lQp/oH6QcLJqH5IT
	fpoGWiidr0Y4wSzlkuS5iFR1K+L8/3AnngSsCgjrXtFlGExQM9/cYhPpVWAl/j2uJJxfGEuu+VXz2
	NCVxb3oX3aQz8Ab6C02L1/2Sx2lmwQzEez67agpKwici9dl0OFC0mN/F2jqNbVfNtk9vUB2GE0QQ/
	rGRO/Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSYOr-00000002CWe-2xcH;
	Sat, 13 Jul 2024 08:46:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSYOo-00000002CVv-3eJ5
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jul 2024 08:46:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C22E86196A56;
	Sat, 13 Jul 2024 10:46:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id KRQdpSGc2R3V; Sat, 13 Jul 2024 10:46:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E28046196A71;
	Sat, 13 Jul 2024 10:46:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SLU5LTIjVIPa; Sat, 13 Jul 2024 10:46:30 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C6CB06196A56;
	Sat, 13 Jul 2024 10:46:30 +0200 (CEST)
Date: Sat, 13 Jul 2024 10:46:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Ben Hutchings <bwh@kernel.org>, kernel test robot <lkp@intel.com>
Message-ID: <1422580650.65606.1720860390692.JavaMail.zimbra@nod.at>
In-Reply-To: <3c624cf1-b5a3-f89c-ac6a-0875fcabaf25@huawei.com>
References: <20240713073519.25325-1-richard@nod.at> <3c624cf1-b5a3-f89c-ac6a-0875fcabaf25@huawei.com>
Subject: Re: [PATCH] ubi: Fix ubi_init() ubiblock_exit() section mismatch
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix ubi_init() ubiblock_exit() section mismatch
Thread-Index: JLuc69wdLoWYy8hheIEtVbp4M8FslQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_014635_068248_9B0E8E5E 
X-CRM114-Status: UNSURE (   7.78  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
ImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAibGludXgt
a2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJCZW4gSHV0Y2hpbmdzIiA8
YndoQGtlcm5lbC5vcmc+LCAia2VybmVsIHRlc3Qgcm9ib3QiIDxsa3BAaW50ZWwuY29tPgo+IEdl
c2VuZGV0OiBTYW1zdGFnLCAxMy4gSnVsaSAyMDI0IDEwOjE2OjE1Cj4gQmV0cmVmZjogUmU6IFtQ
QVRDSF0gdWJpOiBGaXggdWJpX2luaXQoKSB1YmlibG9ja19leGl0KCkgc2VjdGlvbiBtaXNtYXRj
aAoKPiDlnKggMjAyNC83LzEzIDE1OjM1LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+PiBT
aW5jZSB1YmlibG9ja19leGl0KCkgaXMgbm93IGNhbGxlZCBmcm9tIGFuIGluaXQgZnVuY3Rpb24s
Cj4+IHRoZSBfX2V4aXQgc2VjdGlvbiBubyBsb25nZXIgbWFrZXMgc2Vuc2UuCj4+IAo+PiBDYzog
QmVuIEh1dGNoaW5ncyA8YndoQGtlcm5lbC5vcmc+Cj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4gQ2xvc2VzOgo+PiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwNzEzMTQwMy53WkpwZDhuMi1sa3BAaW50ZWwuY29tLwo+
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+PiAt
LS0KPj4gICBkcml2ZXJzL210ZC91YmkvYmxvY2suYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBMb29rcyBsaWtlIHRoYXQgeW91
IHByZWZlciBhIHNpbXBsZXIgZml4LiBGZWVsIGZpbmUgdG8gYWRkCgpZZXMsIGFuZCBCZW4gc2Vu
dCB0aGUgcGF0Y2ggZmlyc3QuIDopCiAKPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKQW5kIGVzcGVjaWFs
bHkgdGhhbmtzIGZvciByZXZpZXdpbmcgc28gbWFueSBVQkkvVUJJRlMgcGF0Y2hlcywKSSBhcHBy
ZWNpYXRlIHlvdXIgaGVscC4KClRoYW5rcywKLy9yaWNoYXJkCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
