Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77138C9830E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPxIArrTs4VvkZiK36VDXnN/xTqa4bpF28kc038q4Bc=; b=ncuPxtwOAEDNhE
	dvSN2BqsnBzrLibf58ucVjwDq08Nd5P30FK57pUTJJkyp/9qaQVjqtdZ5YuVUFB5kB6CHEC0HNQbX
	Qu0dmFyx3OUsuHQ+6BkFII2Sh8gS+j2F06Uz2ksts7zou2Xp8BPwX6wntG1sK3wcRJShZ0O+776/0
	XDlE+NAxneknA5YmXpykaGRedOcivBuen1kuUkTgUCr7qHdZ2Y/RAEXXTeMklColKaJLB7FM1CpYV
	ydlaCHwypJ3AypG4rPu4jOzDf8umoaIZlgveKePyxribuHAy+J7amZ8nJFxWSQjejVwSTrGTlQswd
	cvNE3eoLOF8U/jq7lpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pkn-0000000C6tG-1re1;
	Thu, 24 Sep 2026 20:09:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pkm-0000000C6t9-0FdR
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:09:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35655600D4;
	Thu, 24 Sep 2026 20:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7521F000FF;
	Thu, 24 Sep 2026 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280550;
	bh=nh+8dKN55u4IeKtWn+XN0JFvbomxrPoy2GrpO2g5A2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X6dsdxBMD9iS+7QcBmIgEEL8VAjRzz4iiucA5ASH+/+AJq2o5BWE/JBzgevkkaJZr
	 gzwc04Jo+ixD/0bxfWPjnhIREf9T8UrfkekJououHHvTP6sVlS/f/siCZkV09fdGQ5
	 u90Gc6aZ2t3UrjlEZskpYqvTsUd4WxJ4Uw5GNd4n+pLiMs7IdyFWmZBK7kQ6T3ftN0
	 W8LT5t/R63v6e6mONkGSss+MiNwDM4nTXIigwH6GOCVS/8Q8//s44YS63uiBRVEcKC
	 TrdRaNWI3wzzd47FoecnYuC3GF1X76XJsHHxuAVrs7iYU+Mo8W6WtDBvGofY5opR2D
	 NltM/c1sKRLEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] mtd: rawnand: qcom: make config_nand_cw_write()
 more generic
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Gabor
 Juhos" <j4g8y7@gmail.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Md Sadre
 Alam" <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-4-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-4-f3012199b161@gmail.com>
Date: Thu, 24 Sep 2026 20:09:09 +0000
Message-Id: <20260924200910.6B7521F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBjb2RlIGFu
ZCBjb21taXQgbWVzc2FnZSBtaXNtYXRjaCBmb3IgY29uZmlnX25hbmRfY3dfd3JpdGUgcHJlZml4
Ci0tCgpjb21taXQgMGU2MzEwNjM2YWZiZmQ4NWVjMTQ4MjgxYTkzNDhjODI2ZDJiMDE2YQpBdXRo
b3I6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgoKbXRkOiByYXduYW5kOiBxY29tOiBt
YWtlIGNvbmZpZ19uYW5kX2N3X3dyaXRlKCkgbW9yZSBnZW5lcmljCiAgICAKVGhpcyBjb21taXQg
Y2hhbmdlcyB0aGUgZGVjbGFyYXRpb24gb2YgY29uZmlnX25hbmRfY3dfd3JpdGUoKSB0byByZWNl
aXZlCmEgcWNvbV9uYW5kX2NvbnRyb2xsZXIgcG9pbnRlciBkaXJlY3RseSBpbnN0ZWFkIG9mIGEg
bmFuZF9jaGlwIHBvaW50ZXIsCmFuZCByZW5hbWVzIHRoZSBmdW5jdGlvbi4KCj4gSW4gb3JkZXIg
dG8gbWFrZSB0aGUgZnVuY3Rpb24gbW9yZSBnZW5lcmljLCBjaGFuZ2UgdGhlIGRlY2xhcmF0aW9u
Cj4gdG8gZ2V0IGEgJ3Fjb21fbmFuZGNfY29udHJvbGxlcicgcG9pbnRlciBkaXJlY3RseSwgYW5k
IHVwZGF0ZSB0aGUKPiBjYWxsZXJzIGFjY29yZGluZ2x5LiBXaGlsZSBhdCBpdCwgYWxzbyBjaGFu
Z2UgdGhlIGZ1bmN0aW9uIG5hbWUgdG8KPiB1c2UgYSAncXBpY19uYW5kYycgcHJlZml4Lgo+Cj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIG9m
IG1vdmluZwo+IHRoZSBmdW5jdGlvbiBpbnRvIHRoZSAncXBpY19jb21tb24nIGNvZGUgdG8gYWxs
b3cgcmV1c2luZyBpdCBmcm9tCj4gdGhlICdzcGktcXBpYy1zbmFuZCcgZHJpdmVyLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggMWYzYzAwODIzMzA5Zi4uOTlmYmY1NDU4MDgz
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKWyAuLi4gXQo+IEBAIC0zNzgsMTAg
KzM3OCw4IEBAIHN0YXRpYyB2b2lkIHFjb21fbmFuZGNfY29uZmlnX3BhZ2Vfd3JpdGUoc3RydWN0
IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPiAgICogSGVscGVyIHRvIHByZXBhcmUgRE1B
IGRlc2NyaXB0b3JzIGZvciBjb25maWd1cmluZyByZWdpc3RlcnMKPiAgICogYmVmb3JlIHdyaXRp
bmcgZWFjaCBjb2Rld29yZCBpbiBOQU5EIHBhZ2UuCj4gICAqLwo+IC1zdGF0aWMgdm9pZCBjb25m
aWdfbmFuZF9jd193cml0ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICtzdGF0aWMgdm9pZCBx
Y29tX25hbmRjX2NvbmZpZ19jd193cml0ZShzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5h
bmRjKQoKW1NldmVyaXR5OiBNZWRpdW1dClRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhlIGZ1
bmN0aW9uIGlzIGJlaW5nIHJlbmFtZWQgdG8gdXNlIGEKJ3FwaWNfbmFuZGMnIHByZWZpeCwgYnV0
IGhlcmUgaXQgaXMgcmVuYW1lZCB0byB1c2UgYSAncWNvbV9uYW5kY18nCnByZWZpeCBpbnN0ZWFk
LgoKQ291bGQgdGhlIGNvbW1pdCBtZXNzYWdlIGJlIHVwZGF0ZWQgdG8gbWF0Y2ggdGhlIGFjdHVh
bCBjb2RlIGNoYW5nZSwgb3IKc2hvdWxkIHRoZSBjb2RlIGJlIHVzaW5nIHRoZSBxcGljIHByZWZp
eCBzaW5jZSB0aGUgcHJlcGFyYXRpb24gaXMgZm9yCm1vdmluZyBpdCBpbnRvIHFwaWNfY29tbW9u
PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDkyNC1xY29tX25hbmRjLXNoYXJlLW1vcmUtY29kZS12MS0wLWYzMDEyMTk5YjE2MUBn
bWFpbC5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
