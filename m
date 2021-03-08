Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B7DC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:10:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AD1651CC
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AD1651CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAc7duIZKIKaCTq4QzOBUiCGm0vSw9W5a9l07CiMCGE=; b=DCBjbVK3Lr43i+
	QaiHUq27GifiV4ZuamQ0w/ucNkFVBCr35GF8NsawzuZgmGTRfpXKb0I+FS+t6xHolSDBfZ0TXxzF/
	GoAuzfOBeAUueKOiu5KNeKLnzj4dJ8nG8bWkBbbhDsl6IkZqV46ml28eFt1EH1v6Gf2ExnvKpCSFK
	o5qHOgWpJVpOjpDAcZQOGbGDwkO9DPmJ5b5atgR29pfVtoRKga/8CalDJR6+PCKxixvbKQoVDOqRW
	nS5gSZTmbchRo4/v9P1uE2WZwMt6f/L6zwPpmB4YggKSaqz2/dCmOQnJ8KZEKktK1bAMRfEH2Qcgc
	NaRuaaMhQvEjg5nmMh4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJFdW-00HLwi-5X; Mon, 08 Mar 2021 13:09:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJFdO-00HLsD-BV
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 13:09:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D8F8D60A3587;
 Mon,  8 Mar 2021 14:09:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id r4619IxvDlTL; Mon,  8 Mar 2021 14:09:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1BF9560A3593;
 Mon,  8 Mar 2021 14:09:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WeQfJpAYRMhs; Mon,  8 Mar 2021 14:09:15 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id F151E60A3587;
 Mon,  8 Mar 2021 14:09:14 +0100 (CET)
Date: Mon, 8 Mar 2021 14:09:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Henri Roosen <henriroosen@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Henri Roosen <henri.roosen@ginzinger.com>
Message-ID: <358533793.61694.1615208954869.JavaMail.zimbra@nod.at>
In-Reply-To: <20210308125918.18496-1-henri.roosen@ginzinger.com>
References: <20210308125918.18496-1-henri.roosen@ginzinger.com>
Subject: Re: [PATCH] mkfs.ubifs: Fix runtime assertions when running without
 crypto
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: mkfs.ubifs: Fix runtime assertions when running without crypto
Thread-Index: RC2KumleNJIogQEJmx/hp5qcKqvYZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_130918_701737_A8952A35 
X-CRM114-Status: UNSURE (   8.10  )
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

SGVucmksCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiSGVucmkgUm9v
c2VuIiA8aGVucmlyb29zZW5AZ21haWwuY29tPgo+IEFuOiAibGludXgtbXRkIiA8bGludXgtbXRk
QGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gQ0M6ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAi
SGVucmkgUm9vc2VuIiA8aGVucmkucm9vc2VuQGdpbnppbmdlci5jb20+Cj4gR2VzZW5kZXQ6IE1v
bnRhZywgOC4gTcOkcnogMjAyMSAxMzo1OToxOAo+IEJldHJlZmY6IFtQQVRDSF0gbWtmcy51Ymlm
czogRml4IHJ1bnRpbWUgYXNzZXJ0aW9ucyB3aGVuIHJ1bm5pbmcgd2l0aG91dCBjcnlwdG8KCj4g
UnVubmluZyBta2ZzLnViaWZzIHdoaWNoIHdhcyBidWlsZCB3aXRob3V0IGNyeXB0byB0cmlnZ2Vy
ZWQgdGhlCj4gZm9sbG93aW5nIGFzc2VydGlvbjoKPiAKPiBta2ZzLnViaWZzOiB1Ymlmcy11dGls
cy9ta2ZzLnViaWZzL2ZzY3J5cHQuaDoxNjY6Cj4gaW5oZXJpdF9mc2NyeXB0X2NvbnRleHQ6IEFz
c2VydGlvbiBgMCcgZmFpbGVkLgo+IAo+IEEgcHJldmlvdXMgY29tbWl0LWNjNGM1ZTI5NWY1NCAo
Im1rZnMudWJpZnM6IEVuYWJsZSBzdXBwb3J0IGZvciBidWlsZGluZwo+IHdpdGhvdXQgY3J5cHRv
IikgYWRkZWQgYSBjaGVjayBmb3IgYW4gZXhpc3RpbmcgZnNjcnlwdCBjb250ZXh0IGJlZm9yZSBj
YWxsaW5nCj4gZnVuY3Rpb25zIGluaGVyaXRfZnNjcnlwdF9jb250ZXh0KCkgYW5kIGZyZWVfZnNj
cnlwdF9jb250ZXh0KCksCj4gaG93ZXZlciBkaWQgbm90IHByb3Blcmx5IGRvIHRoaXMgZm9yIGVh
Y2ggY2FsbCB0byB0aGVzZSBmdW5jdGlvbnMuCj4gCj4gRml4ZXM6IGNjNGM1ZTI5NWY1NCAoIm1r
ZnMudWJpZnM6IEVuYWJsZSBzdXBwb3J0IGZvciBidWlsZGluZyB3aXRob3V0IGNyeXB0byIpCj4g
U2lnbmVkLW9mZi1ieTogSGVucmkgUm9vc2VuIDxoZW5yaS5yb29zZW5AZ2luemluZ2VyLmNvbT4K
PiAtLS0KPiB1Ymlmcy11dGlscy9ta2ZzLnViaWZzL21rZnMudWJpZnMuYyB8IDI3ICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKSW5zdGVhZCBvZiBwYXRjaGluZyBldmVyeSBjYWxsIHNpdGUgcGxlYXNl
IGZpeCB0aGUgaW5saW5lIGZ1bmN0aW9uIGl0c2VsZi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
