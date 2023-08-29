Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C45C71153
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Bj/fyEyEY5G0RN+rf/hUHDxdxdsc8YDIwZjQ7ckq/is=; b=NLFo13mCJb/4Hcx+0Uhl+gdSVG
	osSL7YmOUAsifTJVgvcvmyIXhNdhNWxZfDOxVMtkpVYET2ehg9l+l1Ub/0MGs108c6szHf2J4DZDz
	bAOZXGXF6dQgbdeWAl0fIgCREmOrqnuqcXUGWFSY7vObWuIYdLQUhAma/q5O4Xv/lXxsyA5I4kCNy
	Np5ylwlJSyrL93E7wHVOEBn8bQGmaOPuX2NCEnPxYL36RygEJGAkKT9/yxZ7iZo3kqJ8awdjvoB2j
	eyc1KkycGFQT6w+C5y22WndC+NxeBU5+kMvk595GFJR4sey/Nu14e9QHwCsebKG3+hvUYWLXuWN/F
	XQkEyMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb1zl-00Bt4q-0S;
	Tue, 29 Aug 2023 16:55:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb1zh-00Bt4O-2O
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 16:55:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CFF946418DB6;
	Tue, 29 Aug 2023 18:55:05 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xl3Y17g1MkGD; Tue, 29 Aug 2023 18:55:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id ECF7C623488D;
	Tue, 29 Aug 2023 18:55:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VtTHEh75vM-F; Tue, 29 Aug 2023 18:55:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A93256418DB6;
	Tue, 29 Aug 2023 18:55:04 +0200 (CEST)
Date: Tue, 29 Aug 2023 18:55:04 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christian Brauner <brauner@kernel.org>
Cc: hch <hch@lst.de>, Jan Kara <jack@suse.cz>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Message-ID: <340229452.1869458.1693328104443.JavaMail.zimbra@nod.at>
In-Reply-To: <20230829-alpinsport-abwerben-4c19ebb9a437@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org> <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org> <20230829-alpinsport-abwerben-4c19ebb9a437@brauner>
Subject: Re: [PATCH 1/2] fs: export sget_dev()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: export sget_dev()
Thread-Index: jt9CTlwGHjN4GwA7liSltu9eaRFM8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_095510_080871_F2DB1A70 
X-CRM114-Status: UNSURE (   7.93  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdGlhbiBCcmF1bmVy
IiA8YnJhdW5lckBrZXJuZWwub3JnPgo+IEFuOiAiaGNoIiA8aGNoQGxzdC5kZT4sICJKYW4gS2Fy
YSIgPGphY2tAc3VzZS5jej4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJNaXF1
ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJhZ2hhdmVu
ZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgImxpbnV4LW10ZCIKPiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAibGludXgtZnNkZXZlbCIgPGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwu
b3JnPgo+IEdlc2VuZGV0OiBEaWVuc3RhZywgMjkuIEF1Z3VzdCAyMDIzIDE4OjI5OjE2Cj4gQmV0
cmVmZjogUmU6IFtQQVRDSCAxLzJdIGZzOiBleHBvcnQgc2dldF9kZXYoKQoKPj4gKwlyZXR1cm4g
c2dldF9mYyhmYywgc3VwZXJfc19kZXZfc2V0LCBzdXBlcl9zX2Rldl90ZXN0KTsKPiAKPiByZXR1
cm4gc2dldF9mYyhmYywgc3VwZXJfc19kZXZfdGVzdCwgc3VwZXJfc19kZXZfc2V0KTsKPiAKPiBT
b3JyeSwgZHVtYiB0eXBvIHRoYXQgSSBoYWQgYWxyZWFkeSBmaXhlZCBpbiB0cmVlLi4uCgpXaGF0
IHRyZWUgZG9lcyB0aGlzIHBhdGNoIGFwcGx5IHRvPyBsaW51eC1uZXh0PwpJIGdhdmUgaXQgYSBx
dWljayB0cnkgb24gTGludXMnIHRyZWUgYnV0IGl0IGZhaWxlZCB0b286Cgpmcy9zdXBlci5jOiBJ
biBmdW5jdGlvbiDigJhnZXRfdHJlZV9iZGV24oCZOgpmcy9zdXBlci5jOjEyOTM6MTk6IGVycm9y
OiDigJhkZXbigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQg
eW91IG1lYW4g4oCYYmRlduKAmT8KICBzID0gc2dldF9kZXYoZmMsIGRldik7CiAgICAgICAgICAg
ICAgICAgICBefn4KICAgICAgICAgICAgICAgICAgIGJkZXYKZnMvc3VwZXIuYzoxMjkzOjE5OiBu
b3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9y
IGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
