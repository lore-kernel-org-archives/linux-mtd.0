Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D68DC282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:02:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB4E20855
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JT1HThKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB4E20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O0ydA2dVBUBggPJcSNEMbhudVqVfQmnlkUoDB967VpA=; b=JT1HThKDYcaWGt
	v3sLUGRrJnSN1MAThdbFKZPs6eRK9zK6JJWZ+bt0s/y1gr4c4DzgEgWktnzsMqZ1lfpZIxOj8rQTc
	qKBIkAOeb3uq3N1ZhpxUqbX635fcybtuPasZS4BPPqvmkWV/Mfr1YPL3oWy/Lq4gBXtqLlIWW1ved
	bLbxu6LLCjygLliGmn3ki+9ICc4puFmovCySfupc86YGoBqy/dx+jbEGnOROKOY6L7XGyKQXdg/sI
	FvRaiwj+VXo9jqA8UEOMZAuAlZCSrUeQRtsQ1ZBImw5NusDXkb4gOzzY8QZCPmMZmQr0+uEZ4wX9p
	JqoFZrgIXdA94wZ9fTxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsATZ-0001lA-9o; Fri, 08 Feb 2019 18:02:09 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsATW-0001kt-Mq
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:02:08 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id B03E227DCA
 for <linux-mtd@lists.infradead.org>; Fri,  8 Feb 2019 12:02:05 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sATVgz2iM4FKpsATVgKWHl; Fri, 08 Feb 2019 12:02:05 -0600
X-Authority-Reason: nr=8
Received: from [189.250.49.191] (port=57518 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gsATU-0048is-Kx; Fri, 08 Feb 2019 12:02:04 -0600
Date: Fri, 8 Feb 2019 12:02:02 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Message-ID: <20190208180202.GA16603@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.49.191
X-Source-L: No
X-Exim-ID: 1gsATU-0048is-Kx
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.49.191]:57518
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_100206_834493_C583B3C5 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cgpkcml2ZXJzL210ZC9jaGlwcy9j
ZmlfdXRpbC5jOiBJbiBmdW5jdGlvbiDigJhjZmlfYnVpbGRfY21k4oCZOgpkcml2ZXJzL210ZC9j
aGlwcy9jZmlfdXRpbC5jOjExMDoxMDogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwg
dGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIG9uZWNtZCB8PSAob25lY21kIDw8
IChjaGlwX21vZGUgKiAzMikpOwogICB+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgpkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjExMjoyOiBub3RlOiBoZXJlCiAgY2Fz
ZSA0OgogIF5+fn4KZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzoxMTM6MTA6IHdhcm5pbmc6
IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9
XQogICBvbmVjbWQgfD0gKG9uZWNtZCA8PCAoY2hpcF9tb2RlICogMTYpKTsKICAgfn5+fn5+fl5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwu
YzoxMTQ6Mjogbm90ZTogaGVyZQogIGNhc2UgMjoKICBefn5+CmRyaXZlcnMvbXRkL2NoaXBzL2Nm
aV91dGlsLmM6IEluIGZ1bmN0aW9uIOKAmGNmaV9tZXJnZV9zdGF0dXPigJk6CmRyaXZlcnMvbXRk
L2NoaXBzL2NmaV91dGlsLmM6MTYzOjc6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxs
IHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICByZXMgfD0gKG9uZXN0YXQgPj4g
KGNoaXBfbW9kZSAqIDMyKSk7CiAgIH5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgpkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjE2NToyOiBub3RlOiBoZXJlCiAgY2FzZSA0
OgogIF5+fn4KZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzoxNjY6Nzogd2FybmluZzogdGhp
cyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAg
IHJlcyB8PSAob25lc3RhdCA+PiAoY2hpcF9tb2RlICogMTYpKTsKICAgfn5+fl5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6MTY3OjI6
IG5vdGU6IGhlcmUKICBjYXNlIDI6CiAgXn5+fgoKV2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAt
V2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKClRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2lu
ZyBlZmZvcnRzIHRvIGVuYWJsaW5nCi1XaW1wbGljaXQtZmFsbHRocm91Z2guCgpTaWduZWQtb2Zm
LWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRy
aXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMg
Yi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jCmluZGV4IDZmMTY1NTJjZDU5Zi4uZTNiMjY2
ZWUwNmFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jCisrKyBiL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMKQEAgLTEwOSwxMCArMTA5LDEzIEBAIG1hcF93b3Jk
IGNmaV9idWlsZF9jbWQodV9sb25nIGNtZCwgc3RydWN0IG1hcF9pbmZvICptYXAsIHN0cnVjdCBj
ZmlfcHJpdmF0ZSAqY2ZpCiAJY2FzZSA4OgogCQlvbmVjbWQgfD0gKG9uZWNtZCA8PCAoY2hpcF9t
b2RlICogMzIpKTsKICNlbmRpZgorCQkvKiBmYWxsIHRocm91Z2ggKi8KIAljYXNlIDQ6CiAJCW9u
ZWNtZCB8PSAob25lY21kIDw8IChjaGlwX21vZGUgKiAxNikpOworCQkvKiBmYWxsIHRocm91Z2gg
Ki8KIAljYXNlIDI6CiAJCW9uZWNtZCB8PSAob25lY21kIDw8IChjaGlwX21vZGUgKiA4KSk7CisJ
CS8qIGZhbGwgdGhyb3VnaCAqLwogCWNhc2UgMToKIAkJOwogCX0KQEAgLTE2MiwxMCArMTY1LDEz
IEBAIHVuc2lnbmVkIGxvbmcgY2ZpX21lcmdlX3N0YXR1cyhtYXBfd29yZCB2YWwsIHN0cnVjdCBt
YXBfaW5mbyAqbWFwLAogCWNhc2UgODoKIAkJcmVzIHw9IChvbmVzdGF0ID4+IChjaGlwX21vZGUg
KiAzMikpOwogI2VuZGlmCisJCS8qIGZhbGwgdGhyb3VnaCAqLwogCWNhc2UgNDoKIAkJcmVzIHw9
IChvbmVzdGF0ID4+IChjaGlwX21vZGUgKiAxNikpOworCQkvKiBmYWxsIHRocm91Z2ggKi8KIAlj
YXNlIDI6CiAJCXJlcyB8PSAob25lc3RhdCA+PiAoY2hpcF9tb2RlICogOCkpOworCQkvKiBmYWxs
IHRocm91Z2ggKi8KIAljYXNlIDE6CiAJCTsKIAl9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
