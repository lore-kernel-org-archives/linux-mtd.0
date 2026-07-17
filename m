Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E2C44516
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHVWWSFeaadyxagQwEEf3BEavwdK0hD4tWoNWI6bBh4=; b=YEPjDQvhxjVeud
	GR9jvoB+5G7dXuiSFzX3wOcz0G/ncmNaJyvM63WI/kQrKVZlfelf22PN26jyOnATEvmFy3q0uLJKE
	TH54z9V4zfXpva3Dn56o/K4uE+X5odlLy9gHBil4/upkuBB8h9Lua31m9PniJTdMWNSe6wE5smShU
	t1ywQnJsU3gRVew4HjEjbHxYS0GvuVHKmo5Nts0plLLx9MDi55wWwiWApNR7B1EEghgwFam5XwD83
	AXJIFpBVlpKLqjjhZcwBSWAsWXDYl4TamV5PvT1Du2uoxBoG6vmdGkKNCd6OEcd2O2Hbquzh1p83O
	OVcaNOp4XFwU+800kjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiKp-00000002NX2-1BI4;
	Fri, 17 Jul 2026 13:10:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiKk-00000002NWC-1mkV
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 13:10:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAF5A4E40E0E;
	Fri, 17 Jul 2026 13:10:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B815660361;
	Fri, 17 Jul 2026 13:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECD9911BD0158;
	Fri, 17 Jul 2026 15:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784293828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZA5A1RfyXw1NcBcIE6GQxTFOitqcRCcOtZAix7uUu8I=;
	b=T56X3ZEp6kjp8s5bdSWKrXi8BFivp/bxG232PAvB7Jzzi3xZSCN/PJPd9ppxuyRzTbuZvZ
	HG/jq9OqRhJFrWmgXvLTIKyDKQTd8WLq8nltp+zTdGTxtbut7V1em045SC4rCJqtMPjfJS
	RoYUPFlHGeJbposcOLoDUylHilVmrryWHkGJQycbLdTbxLXNfCV684NMvsQJjpj8Rs+bB+
	NABWLhlwqx3cDG4Vk663BLr0+2M1DqHNA2ZgKYDQxpDGJh9aUCyzSbSgd9WiKVJrogyuMY
	6aICRLbGUV9rx85r6IRkQBPoOmWsVUHEl+y/n6GeqyL93PILTlV5bUd0RDlDmg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aleksandr Mineev <sanderrrs@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: fmsh: fix FM25G01B/FM25G02B Quad I/O read
 dummy cycles
In-Reply-To: <20260715203602.1462-1-sanderrrs@gmail.com> (Aleksandr Mineev's
	message of "Wed, 15 Jul 2026 23:36:02 +0300")
References: <20260715203602.1462-1-sanderrrs@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 15:10:26 +0200
Message-ID: <87pl0liwxp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_061030_747055_A81603B9 
X-CRM114-Status: UNSURE (   6.69  )
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

SGkgQWxla3NhbmRyLAoKT24gMTUvMDcvMjAyNiBhdCAyMzozNjowMiArMDMsIEFsZWtzYW5kciBN
aW5lZXYgPHNhbmRlcnJyc0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgRk0yNUcwMUIvRk0yNUcw
MkIgZGF0YXNoZWV0cyBzcGVjaWZ5IGEgc2luZ2xlIGR1bW15IGJ5dGUgZm9yIHRoZQo+IDB4RUIg
UXVhZCBJL08gcmVhZC1mcm9tLWNhY2hlIG9wZXJhdGlvbiwgYnV0IHRoZSBnZW5lcmljCj4gcmVh
ZF9jYWNoZV92YXJpYW50cyBzZXQgdXNlcyB0d28gZHVtbXkgYnl0ZXMgZm9yIHRoZSAxUy00Uy00
UyB2YXJpYW50Lgo+IFRoZSBleHRyYSBkdW1teSBieXRlIHNoaWZ0cyB0aGUgZGF0YSBwaGFzZSBh
bmQgcmV0dXJucyBjb3JydXB0ZWQgZGF0YQo+IHdpdGggbm8gRUNDIGVycm9yLCBicmVha2luZyBi
b290IG9uIGJvYXJkcyB1c2luZyB0aGVzZSBjaGlwcy4KPgo+IFVzZSBhIGRlZGljYXRlZCByZWFk
LWZyb20tY2FjaGUgdmFyaWFudCBzZXQgd2l0aCBuZHVtbXk9MSBmb3IgdGhlCj4gMVMtNFMtNFMg
KDB4RUIpIG9wZXJhdGlvbi4KPgo+IEZNMjVHMDFCIGRhdGFzaGVldDogaHR0cHM6Ly93d3cuZm1z
aC5jb20vbnZtL0ZNMjVHMDFCX2RzX2VuZy5wZGYKPiBGTTI1RzAyQiBkYXRhc2hlZXQ6IGh0dHBz
Oi8vd3d3LmZtc2guY29tL252bS9GTTI1RzAyQl9kc19lbmcucGRmCj4KPiBGaXhlczogZDVhNWM5
ZWIyZWU5ICgibXRkOiBzcGluYW5kOiBmbXNoOiBhZGQgc3VwcG9ydCBmb3IgRk0yNUd7MDEsMDJ9
QiIpCgpNaXNzaW5nIENjOiBzdGFibGUgdGFnLgoKPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2FuZHIg
TWluZWV2IDxzYW5kZXJycnNAZ21haWwuY29tPgoKT3RoZXJ3aXNlIExHVE0uCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
