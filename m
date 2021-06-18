Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58707C48BE8
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 07:28:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0426112D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 07:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0426112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Qu30bh7Xh4ctIC1nVqTCtZRk5LLKFTRshamuBVuztQ=; b=p3LhRe8YJW8HG0
	IFQjU49Wdjz3Ku6wHZWjtakLd1tVnFvLr9I2A87sWdclB2wl+kOXWy0qZ3cCn8fL5yIcToZHMdcrB
	Lcy6/g9ZnGwdtN9yKfxtmR8m3grzG4iQMbNgJOxXyOzHB0cW/IXEu3hrQ1zajgG7AMEo3uYWXNC6Y
	N5QcTniohVSa0bV9pgY0OiUFWJXMH9sbdcdcA9uSbc4IrDDgqUcyfLV6pwkaTdIzWA3ZQhEIVvEUJ
	xyhWA6+8EXDZxzyaOnMd5dJbDiqTOoGwB3AZKKCQYotmk1kU7jsRjhJ0KONFx5fvwhPnLb8RUosC6
	FBnPb/QH2ruGOS5/vFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu8v3-00D3OT-Bg; Fri, 18 Jun 2021 07:28:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu8uz-00D3Ns-VY
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 07:27:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7A333200002;
 Fri, 18 Jun 2021 07:27:53 +0000 (UTC)
Date: Fri, 18 Jun 2021 09:27:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zou Wei <zou_wei@huawei.com>
Cc: <nagasure@xilinx.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] mtd: rawnand: arasan: Fix missing
 clk_disable_unprepare() on error in anfc_probe()
Message-ID: <20210618092752.5f117365@xps13>
In-Reply-To: <1623816404-66213-1-git-send-email-zou_wei@huawei.com>
References: <1623816404-66213-1-git-send-email-zou_wei@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_002758_191191_060197EB 
X-CRM114-Status: GOOD (  15.43  )
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

SGkgWm91LAoKWm91IFdlaSA8em91X3dlaUBodWF3ZWkuY29tPiB3cm90ZSBvbiBXZWQsIDE2IEp1
biAyMDIxIDEyOjA2OjQ0ICswODAwOgoKPiBGaXggdGhlIG1pc3NpbmcgY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKCkgYmVmb3JlIHJldHVybgo+IGZyb20gYW5mY19wcm9iZSgpIGluIHRoZSBlcnJvciBo
YW5kbGluZyBjYXNlLgo+IAo+IEZpeGVzOiA2MTYyMmY2NzkxYTEgKCJtdGQ6IHJhd25hbmQ6IGFy
YXNhbjogVXNlIHRoZSByaWdodCBETUEgbWFzayIpCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3Qg
PGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVh
d2VpLmNvbT4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLCA2MTYyMmY2NzkxYTEgYmVpbmcgcHJvYmxl
bWF0aWMgYmVjYXVzZSBvZiB0aGUKbWFzayBub3QgYmVpbmcgY29ycmVjdGx5IGRlY2xhcmVkIEkg
cHJlZmVyIHRvIGZpeCB0aGlzIHBhdGNoIGlubGluZSBhbmQKaWYgeW91IGRvbid0IG1pbmQgSSds
bCBpbmNsdWRlIHRoZSBnb3RvIGNoYW5nZSBhcyB3ZWxsLgoKPiAtLS0KPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCj4gaW5kZXggODMxN2Q5Ny4uOWNiY2M2OSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVy
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMK
PiBAQCAtMTQ1Miw3ICsxNDUyLDcgQEAgc3RhdGljIGludCBhbmZjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcmV0ID0gZG1hX3NldF9tYXNrKCZwZGV2LT5kZXYs
IERNQV9CSVRfTUFTSyg2NCkpOwo+ICAJaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdv
dG8gZGlzYWJsZV9idXNfY2xrOwo+ICAKPiAgCXJldCA9IGFuZmNfcGFyc2VfY3MobmZjKTsKPiAg
CWlmIChyZXQpCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
