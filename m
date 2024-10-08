Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B00CED25F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 03:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95RSXCqbYJuGz+UvOO+cgcICSAuc0Q4yMHNQhS++vIM=; b=Z5Webcwqkp5Zbl
	DnhYyTXzefTkuwRMQW3fljBHLCsNyaNtSkZiJ6J/1epSSOgxhp/IKUnSNZvxj3UChByvWbYo8jGVK
	pCtRZSQCDHNnQdqk7cN9Ex+ncD2xBW+hV2h+Rl8/b3ZNMgyxULrod71vd8/BF1ZcaaYqicVQ5o8yL
	xAa8cyGJ2hqXwe7DgP5fRMhG4Ur4WdYbl5lbPVH0fwmAf1NHYaXO4nOTiRxuASTb4cCwXsJafXP0s
	RscLKtXPRNtsszPVDHJFiYYIfNeEKYNXFFFGtEksIreQwaVQVdTgjQ6FlnDhcJP50LbNHrNTNoQLm
	Oa9SgpDyJM87+7NfSPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy14d-00000004PeW-32PY;
	Tue, 08 Oct 2024 03:39:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy14a-00000004Pe0-2O0h
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 03:39:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c87c7d6ad4so6973478a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2024 20:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728358782; x=1728963582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/PPjhQbwoqSXUMaC+vsNn6zKjcC3s3xpaP+vVQl7Rw=;
        b=NNFv8zdy+zdHMzcZlTTRZFKa5EbzFKUygQPAwl3Qsn5JEhJlXNMBYEo73fk84KFTVY
         bVVjeXcS6g+bx9LH1F3IrPlpI6rFngqW7Nu5omxT9ue0MCsqM0O7diuBWYGl0m5AbzQV
         llf+SNJKKLmOmm7dkWvOGp2dEAXNfuvNZ6FWfBTabg6KDjdFGnXFMfesOr3qTBmY/WL+
         pRbOHXEKqhQeRjbzOo1P0uk0UD4jnmHun5h50ZiHGZ59g9LwCd78a2O4T/3rjsC888Jk
         6I011Pe+87492GYbru/Bi9c5Mu+066Eok8cfuvI4ZdcyANg1aoei7bbXjqkuqGK1vXny
         Wiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728358782; x=1728963582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/PPjhQbwoqSXUMaC+vsNn6zKjcC3s3xpaP+vVQl7Rw=;
        b=CzmMBTpsU9GI9jQvpDEguZ95bkE/9rDiR+Yu2XW3T6r7pehitLdI/IBsDddHZoR5ng
         WT6WlKrI4Rwn0CS0+5pEm0ABOwX2VGJ8iOGgjKLOzHOGGsBc5HJRsLff73xxq4HBBPqO
         PfGVybD9KKcJJOy2tDu2hY5L8VHNWfBE2hbWyC14L1asMadYNu6StVTsl2JRhlWTsf/p
         AVDMQK5bhi5KcgSPTfI4jnxt9UaJOX+Evk9W8XKT6xdbkr+/pDGRNzYtzIke3JZNFqyS
         juTncbl36zLQFJfei3hVDv05m8AJdRhzdpUWrTrViR3sUYssSHeurgiWqEZpB3l9dgub
         EPCg==
X-Gm-Message-State: AOJu0Yxv1b4czCBcoGK6bVScz5ncHO5TLZWuQpPtSVHRNIUYJQn1fTe5
	YDya0NPcBJm6PZ7XtGuccjENGqy+jpc51jLtu4+qyLaWmOPzLJLR5QQADiXuclYGGU64mS0xyOq
	GljAKzdo/syX5fR0w4AZt8/9b/IQ=
X-Google-Smtp-Source: AGHT+IGpwqBAmBnDkvWHxGABLWSZkf6HafdAPt/3FROqNjBraqMwP5nOnM4cihhM7pjwt4x5auADwUPhiR/jnxbsjFs=
X-Received: by 2002:a17:907:70d:b0:a77:c30c:341 with SMTP id
 a640c23a62f3a-a991bac3142mr1354878266b.0.1728358782135; Mon, 07 Oct 2024
 20:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-7-alvinzhou.tw@gmail.com> <5e7e0aa4-74b0-4262-8e8b-de86be54f0bc@linaro.org>
In-Reply-To: <5e7e0aa4-74b0-4262-8e8b-de86be54f0bc@linaro.org>
From: Alvin Zhou <alvinzhou.tw@gmail.com>
Date: Tue, 8 Oct 2024 11:38:27 +0800
Message-ID: <CAPhrvRR6mkF1L2dBhsfwF7UmWG_0rHtf2Ry9+LiAt8xZbfsLZw@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw, 
	AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_203944_629868_987B9EA1 
X-CRM114-Status: GOOD (  23.60  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI05bm0MTDmnIgy5pelIOmAseS4iSDkuIvljYgzOjQ15a+r6YGT77yaCj4KPgo+Cj4gT24gMjYu
MDkuMjAyNCAxNzoxOSwgQWx2aW5aaG91IHdyb3RlOgo+ID4gRnJvbTogQWx2aW5aaG91IDxhbHZp
bnpob3VAbXhpYy5jb20udHc+Cj4gPgo+ID4gQWRkaW5nIG1hbnVmYWN0dXJlciBJRCAweEMyIGF0
IHRoZSBlbmQgb2YgSUQgdGFibGUKPiA+IHRvIGFsbG93IG1hbnVmYWN0dXJlciBmaXh1cCB0byBi
ZSBhcHBsaWVkIGZvciBhbnkKPiA+IE1hY3Jvbml4IGZsYXNoZXMgaW5zdGVhZCBvZiBuZWVkaW5n
IHRvIGxpc3QgZWFjaAo+ID4gZmxhc2ggSUQgaW4gdGhlIElEIHRhYmxlLgo+ID4KPiA+IFN1Y2gg
YXMgbWFjcm9uaXhfbm9yX3NldF9vY3RhbF9kdHIgZnVuY3Rpb24gaW4gdGhlCj4gPiBtYW51ZmFj
dHVyZXIgZml4dXAgY2FuIGJlIGFwcGxpZWQgdG8gYW55IE1hY3Jvbml4Cj4gPiBPY3RhbCBGbGFz
aGVzIHdpdGhvdXQgdGhlIG5lZWQgdG8gYWRkIHRoZSBzcGVjaWZpYwo+ID4gSUQgaW4gdGhlIElE
IHRhYmxlLgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5l
bC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWltZUxpYW8gPGphaW1lbGlhb0BteGljLmNvbS50
dz4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsdmluWmhvdSA8YWx2aW56aG91QG14aWMuY29tLnR3Pgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jIHwgNCArKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL21hY3Jvbml4LmMKPiA+IGluZGV4IGYwMzk4MTlhNTI1Mi4uMWE4Y2NlYmRmZTBlIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+IEBAIC0yMDAsNyArMjAwLDkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9wYXJ0c1tdID0gewo+ID4g
ICAgICAgICAgICAgICAubmFtZSA9ICJteDI1bDMyNTVlIiwKPiA+ICAgICAgICAgICAgICAgLnNp
emUgPSBTWl80TSwKPiA+ICAgICAgICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLLAo+
ID4gLSAgICAgfQo+ID4gKyAgICAgfSwKPiA+ICsgICAgIC8qIE5lZWQgdGhlIG1hbnVmYWN0dXJl
ciBmaXh1cHMsIEtlZXAgdGhpcyBsYXN0ICovCj4KPiB5b3UgaGF2ZSBhIGNhcGl0YWwgbGV0dGVy
IGluIHRoZSBtaWRkbGUgb2YgdGhlIHNlbnRlbmNlLgo+Cj4gSSdsbCByZXBsYWNlIHRoZSBjb21t
ZW50IHdpdGg6Cj4KPiAvKgo+Cj4gICogVGhpcyBzcGFyZXMgdXMgb2YgYWRkaW5nIG5ldyBmbGFz
aCBlbnRyaWVzIGZvciBmbGFzaGVzIHRoYXQgY2FuIGJlCj4gICogaW5pdGlhbGl6ZWQgc29sZWx5
IGJhc2VkIG9uIHRoZSBTRkRQIGRhdGEsIGJ1dCBzdGlsbCBuZWVkIHRoZQo+ICAqIG1hbnVmYWN0
dXJlciBob29rcyB0byBzZXQgcGFyYW1ldGVycyB0aGF0IGNhbid0IGJlIGRpc2NvdmVyZWQgYXQg
U0ZEUAo+ICAqIHBhcnNpbmcgdGltZS4KPiAgKi8KPgo+IFdoaWNoIGJyaW5ncyBtZSB0byB3aHkg
eW91IHJlYWxseSBzZXQgdGhpcy4gSSByZW1lbWJlciBTRkRQIGNvbnRhaW5zCj4gdGFibGVzIHdp
dGggc2VxdWVuY2Ugb2YgY29tbWFuZHMgZm9yIGVuYWJsaW5nL2Rpc2FibGluZyBPY3RhbCBEVFIg
bW9kZS4KPiBXb3VsZCB5b3UgcGxlYXNlIHJlbWVtYmVyIG1lLCB3aHkgeW91IGRpZG4ndCB1c2Ug
dGhvc2UgU0ZEUCB0YWJsZXMgYW5kCj4gaW1wbGVtZW50ZWQgeW91ciBvd24gZW5hYmxlL2Rpc2Fi
bGUgbWV0aG9kcz8KCldoaWxlIHRoZSBTRkRQIGRvZXMgcHJvdmlkZSBhIHNlcXVlbmNlIG9mIGNv
bW1hbmRzIHRvIGVuYWJsZSBPY3RhbApERFIgbW9kZSwgZm9sbG93aW5nIHRoaXMgc2VxdWVuY2Ug
Zm9yY2VzIHRoZSBJL08gZHJpdmVyIHN0cmVuZ3RoIHRvIDUwIG9obXMsCndoaWNoIGNhdXNlcyBJ
L08gZHJpdmVyIHN0cmVuZ3RoIHRvIGJlIHdlYWsgYW5kIGFuZCBsZWFkcyB0byByZWFkL3dyaXRl
Cmlzc3Vlcywgc28gd2UgY2hvc2UgdG8gdXNlIGEgZml4dXAgYXBwcm9hY2ggdG8gZW5hYmxlL2Rp
c2FibGUgT2N0YWwgRERSCm1vZGUuCgpUaGFua3MsCkFsdmluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
