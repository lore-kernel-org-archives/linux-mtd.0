Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B66CD98F2
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jun 2026 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nov9IcE+o5t1Y5iaQxc79zCNOCVQyGjLuGA/kAnQG8U=; b=aBGu6KFg+O8ix6
	vxbKl0KP/lta4VFvU78PU5HsYoT01JkjVBZ/a0Pe/Y9e38W3fWC+uzBJbB7dWMWLK2hDM449PRPLq
	0yDwUUrhIAFICUFqDqUib9M1DzNmzjZQ7J+WurWElGje2zlc2jSoSVgcWNOgkOmv3OWrjXotc5gm8
	w95AL+HoDuO1ngM4vMoI/2ZcAMkDXHpVAQ8KGOnXi7OdMKB7wc+0Dt/CiP+B1xsmTIiNsvIAZK63E
	GMtoWdb6SxdbV9HkCo0352nA5UsFHI2zd6J4/kuqcFp8A4W036XompdlQ1qR+BrmKo36sPF617yxc
	PBoLY/0u/uqOUgUQD6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJoi-000000041jP-0WFj;
	Sun, 21 Jun 2026 15:10:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJoe-000000041j1-2QFp
	for linux-mtd@lists.infradead.org;
	Sun, 21 Jun 2026 15:10:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E787C6344F;
	Sun, 21 Jun 2026 15:10:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43F1D601BB;
	Sun, 21 Jun 2026 15:10:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86A61106C8173;
	Sun, 21 Jun 2026 17:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782054626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=adzFVtlReHaX85QDKibX5bGJHmQG6/x7d146QHjof7Q=;
	b=X0q5Om8pPEHkr25+e6PItXbdPeA/V/RJ5BMSUe0AR9UiJZF0LB1gQXvTNVPZmj3dBPI1Mi
	Go1GRItHlf8QdJFYgk1ii6WKFck3MAeUo2/qV//6t9xvN+DiwUNG2sPQ79g+xYIGQm18X9
	jxSqyOft1CW+z2ksaTGXN6usCpq2J9duDjH0Hrcq88hC79Y/MZP9OM800gbD/ATjH46qVQ
	Mg1isYHdM+4mRMsTOC7fJ9ZyvnHN5CW1stEBWXj7oI61Sw7iwc14lOn9Iy2j7nTLw3LMEJ
	XgDUh5SuyAWLTklWurGMx7wti+RUVLnS2MpqWXvvJ4X9xzuaOLl15VpsNWRecw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] SPI NOR changes for 7.2
In-Reply-To: <2vxz33ylpea4.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	17 Jun 2026 14:00:51 +0200")
References: <2vxz33ylpea4.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Sun, 21 Jun 2026 17:10:23 +0200
Message-ID: <87ldc83p5s.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_081033_165960_880CE34E 
X-CRM114-Status: GOOD (  20.41  )
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

UHVsbGVkIGludG8gbXRkL25leHQsIHRoYW5rcyEKCk1pcXXDqGwKCk9uIDE3LzA2LzIwMjYgYXQg
MTQ6MDA6NTEgKzAyLCBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4gd3JvdGU6
Cgo+IEhpIE1pcXVlbCwKPgo+IEhlcmUgYXJlIHRoZSBTUEkgTk9SIGNoYW5nZXMgZm9yIDcuMi4K
Pgo+IFJlZ2FyZHMsCj4gUHJhdHl1c2ggWWFkYXYKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFlMzRiYzUwYmQ1ZjQ1ZTczMToKPgo+
ICAgTGludXggNy4xLXJjMSAoMjAyNi0wNC0yNiAxNDoxOTowMCAtMDcwMCkKPgo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBzcGktbm9yL2Zvci03LjIK
Pgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkZjQxNWM1ZTFkZTBmMWFlZWZhY2I0
ZTYyNTJmZjk4ZDM4YzA0NDM3Ogo+Cj4gICBtdGQ6IHNwaS1ub3I6IHNwYW5zaW9uOiBhZGQgZGll
IGVyYXNlIHN1cHBvcnQgaW4gczI4aHgtdCAoMjAyNi0wNS0yOCAxNTo1NzoyNCArMDIwMCkKPgo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBTUEkgTk9SIGNoYW5nZXMgZm9yIDcuMgo+Cj4gTm90YWJsZSBjaGFuZ2VzOgo+
Cj4gLSBCaWcgc2V0IG9mIGNsZWFudXBzIGFuZCBpbXByb3ZlbWVudHMgdG8gdGhlIGxvY2tpbmcg
c3VwcG9ydC4gVGhpcwo+ICAgc2VyaWVzIGNvbnRhaW5zIHNvbWUgY2xlYW51cHMgYW5kIGJ1ZyBm
aXhlcyBmb3IgY29kZSBhbmQgZG9jdW1lbnRhdGlvbgo+ICAgYXJvdW5kIHdyaXRlIHByb3RlY3Rp
b24uIFRoZW4gc3VwcG9ydCBpcyBhZGRlZCBmb3IgY29tcGxlbWVudCBsb2NraW5nLAo+ICAgd2hp
Y2ggYWxsb3dzIGZpbmVyIGdyYWluZWQgY29uZmlndXJhdGlvbiBvZiB3aGF0IGlzIGNvbnNpZGVy
ZWQgbG9ja2VkCj4gICBhbmQgdW5sb2NrZWQuIFRoZW4gY29tcGxlbWVudCBsb2NraW5nIGlzIGVu
YWJsZWQgb24gYSBidW5jaCBvZiBXaW5ib25kCj4gICBXMjUgZmxhc2hlcy4KPgo+IC0gRml4IGRp
ZSBlcmFzZSBzdXBwb3J0IG9uIFNwYW5zaW9uIGZsYXNoZXMuIERpZSBlcmFzZSBpcyBvbmx5IHN1
cHBvcnRlZAo+ICAgb24gbXVsdGktZGllIGZsYXNoZXMsIGJ1dCB0aGUgZGllIGVyYXNlIG9wY29k
ZSB3YXMgc2V0IGZvciBhbGwuIFdoZW4KPiAgIHRoZSBvcGNvZGUgaXMgc2V0LCBpdCBvdmVycmlk
ZXMgdGhlIGRlZmF1bHQgY2hpcCBlcmFzZSBvcGNvZGUgd2hpY2gKPiAgIHNob3VsZCBiZSB1c2Vk
IGZvciBzaW5nbGUtZGllIGZsYXNoZXMuIE9ubHkgc2V0IHRoZSBvcGNvZGUgb24KPiAgIG11bHRp
LWRpZSBmbGFzaGVzLiBBbHNvLCB0aGUgb3Bjb2RlIHdhcyBub3Qgc2V0IG9uIG11bHRpLWRpZSBz
MjhoeC10Cj4gICBmbGFzaGVzLiBTZXQgaXQgc28gdGhleSBjYW4gdXNlIGRpZS1lcmFzZSBjb3Jy
ZWN0bHkuCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gTWlxdWVsIFJheW5hbCAoMjgpOgo+ICAgICAgIG10ZDogc3Bp
LW5vcjogZGVidWdmczogRml4IHRoZSBmbGFncyBsaXN0Cj4gICAgICAgbXRkOiBzcGktbm9yOiBz
d3A6IEltcHJvdmUgbG9ja2luZyB1c2VyIGV4cGVyaWVuY2UKPiAgICAgICBtdGQ6IHNwaS1ub3I6
IERyb3AgZHVwbGljYXRlIEtjb25maWcgZGVwZW5kZW5jeQo+ICAgICAgIG10ZDogc3BpLW5vcjog
TWFrZSBzdXJlIHRoZSBRRSBiaXQgaXMga2VwdCBlbmFibGVkIGlmIHVzZWZ1bAo+ICAgICAgIG10
ZDogc3BpLW5vcjogSW1wcm92ZSBvcGNvZGVzIGRvY3VtZW50YXRpb24KPiAgICAgICBtdGQ6IHNw
aS1ub3I6IGRlYnVnZnM6IEFsaWduIHZhcmlhYmxlIGFjY2VzcyB3aXRoIHRoZSByZXN0IG9mIHRo
ZSBmaWxlCj4gICAgICAgbXRkOiBzcGktbm9yOiBkZWJ1Z2ZzOiBFbmhhbmNlIG91dHB1dAo+ICAg
ICAgIG10ZDogc3BpLW5vcjogc3dwOiBFeHBsYWluIHRoZSBNRU1MT0NLIGlvY3RsIGltcGxlbWVu
dGF0aW9uIGJlaGF2aW91cgo+ICAgICAgIG10ZDogc3BpLW5vcjogc3dwOiBDbGFyaWZ5IGEgY29t
bWVudAo+ICAgICAgIG10ZDogc3BpLW5vcjogc3dwOiBVc2UgYSBwb2ludGVyIGZvciBTUiBpbnN0
ZWFkIG9mIGEgc2luZ2xlIGJ5dGUKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHN3cDogQ3JlYXRlIGEg
aGVscGVyIHRoYXQgd3JpdGVzIFNSLCBDUiBhbmQgY2hlY2tzCj4gICAgICAgbXRkOiBzcGktbm9y
OiBzd3A6IFJlbmFtZSBhIG1hc2sKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHN3cDogQ3JlYXRlIGEg
VEIgaW50ZXJtZWRpYXRlIHZhcmlhYmxlCj4gICAgICAgbXRkOiBzcGktbm9yOiBzd3A6IENyZWF0
ZSBoZWxwZXJzIGZvciBidWlsZGluZyB0aGUgU1IgcmVnaXN0ZXIKPiAgICAgICBtdGQ6IHNwaS1u
b3I6IHN3cDogU2ltcGxpZnkgY2hlY2tpbmcgdGhlIGxvY2tlZC91bmxvY2tlZCByYW5nZQo+ICAg
ICAgIG10ZDogc3BpLW5vcjogc3dwOiBDb3NtZXRpYyBjaGFuZ2VzCj4gICAgICAgbXRkOiBzcGkt
bm9yOiBDcmVhdGUgYSBsb2NhbCBTUiBjYWNoZQo+ICAgICAgIG10ZDogc3BpLW5vcjogZGVidWdm
czogQWRkIGxvY2tpbmcgc3VwcG9ydAo+ICAgICAgIG10ZDogc3BpLW5vcjogZGVidWdmczogQWRk
IGEgbG9ja2VkIHNlY3RvcnMgbWFwCj4gICAgICAgbXRkOiBzcGktbm9yOiBBZGQgc3RlcHMgZm9y
IHRlc3RpbmcgbG9ja2luZyBzdXBwb3J0Cj4gICAgICAgbXRkOiBzcGktbm9yOiBzd3A6IEFkZCBz
dXBwb3J0IGZvciB0aGUgY29tcGxlbWVudCBmZWF0dXJlCj4gICAgICAgbXRkOiBzcGktbm9yOiBB
ZGQgc3RlcHMgZm9yIHRlc3RpbmcgbG9ja2luZyB3aXRoIENNUAo+ICAgICAgIG10ZDogc3BpLW5v
cjogd2luYm9uZDogQWRkIFcyNUg1MTJOV3h4QU0gQ01QIGxvY2tpbmcgc3VwcG9ydAo+ICAgICAg
IG10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIFcyNUgwMU5XeHhBTSBDTVAgbG9ja2luZyBzdXBw
b3J0Cj4gICAgICAgbXRkOiBzcGktbm9yOiB3aW5ib25kOiBBZGQgVzI1SDAyTld4eEFNIENNUCBs
b2NraW5nIHN1cHBvcnQKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBXMjVRMDFO
V3h4SVEgQ01QIGxvY2tpbmcgc3VwcG9ydAo+ICAgICAgIG10ZDogc3BpLW5vcjogd2luYm9uZDog
QWRkIFcyNVEwMU5XeHhJTSBDTVAgbG9ja2luZyBzdXBwb3J0Cj4gICAgICAgbXRkOiBzcGktbm9y
OiB3aW5ib25kOiBBZGQgVzI1UTAyTld4eElNIENNUCBsb2NraW5nIHN1cHBvcnQKPgo+IFRha2Fo
aXJvIEt1d2FubyAoMik6Cj4gICAgICAgbXRkOiBzcGktbm9yOiBzcGFuc2lvbjogdXNlIGRpZSBl
cmFzZSBmb3IgbXVsdGktZGllIGRldmljZXMgb25seQo+ICAgICAgIG10ZDogc3BpLW5vcjogc3Bh
bnNpb246IGFkZCBkaWUgZXJhc2Ugc3VwcG9ydCBpbiBzMjhoeC10Cj4KPiAgRG9jdW1lbnRhdGlv
bi9kcml2ZXItYXBpL210ZC9zcGktbm9yLnJzdCB8IDE3MCArKysrKysrKysrKysrKysKPiAgZHJp
dmVycy9tdGQvc3BpLW5vci9LY29uZmlnICAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jICAgICAgICAgICAgICAgfCAgNzYgKysrKysrLQo+ICBkcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuaCAgICAgICAgICAgICAgIHwgIDI1ICsrLQo+ICBkcml2ZXJzL210
ZC9zcGktbm9yL2RlYnVnZnMuYyAgICAgICAgICAgIHwgIDcyICsrKysrLQo+ICBkcml2ZXJzL210
ZC9zcGktbm9yL3NwYW5zaW9uLmMgICAgICAgICAgIHwgICA3ICstCj4gIGRyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3dwLmMgICAgICAgICAgICAgICAgfCAzNjMgKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyAgICAgICAgICAgIHwgIDQx
ICsrKy0KPiAgaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oICAgICAgICAgICAgICB8ICAgNyAr
LQo+ICA5IGZpbGVzIGNoYW5nZWQsIDY3MSBpbnNlcnRpb25zKCspLCA5MSBkZWxldGlvbnMoLSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
