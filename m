Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49DC606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJzYTiHb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVHfMsw2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QClLWSWXzs9gawoH3x+IUq4Uiawjk+IxOYawAqsekl0=; b=RJzYTiHbge1RaL
	lxk9bZLkHGbfJ5j3qeJvctg8X44qkNcDWsJzgXeYq4anT4eZuIUkY1dG+afVunwIn6an1pnHQ5ZQc
	togXzwax0nnRQ0+bcGPXaCx7wrQbgX5Z61+32NTSP/ph88aaHVHlDnQWeynQK24rPJDcYsizxtQ65
	YL2fKUqAWGc82YGiVe1oUKmkepl4Au8BDc5J7HD+Y7iO5KSJwz6O7L0mgLyTuPA+WSmPHQrAe7cOU
	pMg0rytvK02qy12wt0yvS9s2NuVo8Twy8URtINxsrS3sls/M61gci5JDrTeIEhmU5gpBXjhYcwR6T
	GUevzGVSzxzaLoEwCklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJo2S-0000000DduE-2mgY;
	Thu, 22 Oct 2026 08:20:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJo2Q-0000000Ddu4-3OIp
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 08:20:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A3A6416EF;
	Thu, 22 Oct 2026 08:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B0B1F000C1;
	Thu, 22 Oct 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657238;
	bh=bDtM4VCT9qH75VAmwcVPKU1j/ARJ88VLmfiMwC7/QV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YVHfMsw2oDk5siAc1CUpNiUqXAWAvQNzWLNvu/OZ5A6CQ616vYmhZuE6vYlBy6HzV
	 Oqo2neXnVj3gkF2DWlCFBsYBI+k9EZVmGaxBV9gxAtP0tJRjkQ7+aVWYA9rUr+16RT
	 8SQaM+Ls6jWnJhh6T9wNMSLJr/G56oAmt3TDIq9Pgr/i2Sxriuz0L8LvNC9JfOu7v+
	 x/hqUoGvbbEUwrGpfNsaszdGceSinRcGoxT08RvWc/I1+QJxk7vunjDfU2KSia9SU/
	 7EzVO3tbWXnFseVgbwx8C31pV3MYXKSEGazJuEj2JjHFReYYuvMl08YDXdQGf+KjuZ
	 AEGF4i6G43JVA==
Message-ID: <sashiko-outbox-181158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
To: haibo.chen@oss.nxp.com, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, imx@lists.linux.dev, michael@walle.cc, "Haibo
 Chen" <haibo.chen@nxp.com>, Frank.Li@kernel.org
In-Reply-To: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
References: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
Date: Thu, 22 Oct 2026 08:20:36 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGktbm9y
OiByZWFkX3NyMiBsZWZ0IHNldCBmb3IgOEQtOEQtOEQgZmxhc2hlcyB3aXRob3V0IFByb2ZpbGUg
MS4wCi0tCgpjb21taXQgZWY0MDc5ZTNhZWEyMDE0ODkwZTA4ZGYzMWVhNGQ4Nzc1YTM5MmY4MQpB
dXRob3I6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4KCm10ZDogc3BpLW5vcjogY2xl
YXIgdGhlIGRlZmF1bHQgcmVhZF9zcjIgb3Bjb2RlIGZvciB4U1BJIFByb2ZpbGUgMS4wIGZsYXNo
ZXMKClRoaXMgY29tbWl0IGNsZWFycyBwYXJhbXMtPm9wY29kZXMucmVhZF9zcjIgaW4gc3BpX25v
cl9wYXJzZV9wcm9maWxlMSgpIHNvCnRoYXQgZmxhc2hlcyB3aXRoIGFuIHhzcGkgcHJvZmlsZSAx
LjAgdGFibGUgZG8gbm90IGlzc3VlIGFuIHVuc3VwcG9ydGVkCjB4MzUgcmVnaXN0ZXIgcmVhZCB3
aGVuIHJ1bm5pbmcgaW4gb2N0YWwgZHRyIG1vZGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gaW5kZXggNGEz
ZjgyZTk3Y2VmOC4uNzIyZWVmZjcxZDBkZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL3NmZHAuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gQEAgLTEzNDQs
NiArMTM0NCwxNyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfcHJvZmlsZTEoc3RydWN0IHNw
aV9ub3IgKm5vciwKPiAgCSAqLwo+ICAJbm9yLT5wYXJhbXMtPmh3Y2Fwcy5tYXNrIHw9IFNOT1Jf
SFdDQVBTX1BQXzhfOF84X0RUUjsKPiAgCj4gKwkvKgo+ICsJICogVGhlIHhTUEkgUHJvZmlsZSAx
LjAgdGFibGUgZG9lcyBub3QgZGVzY3JpYmUgYSBSZWFkIENvbmZpZ3VyYXRpb24KPiArCSAqIFJl
Z2lzdGVyIChSRENSLCAzNWgpIGluc3RydWN0aW9uLCBhbmQgdGhlIHNpbmdsZS1ieXRlIFJEQ1Ig
ZGVmYXVsdAo+ICsJICogaXMgbm90IHVzYWJsZSBpbiA4RC04RC04RCBtb2RlLiBEcm9wIHRoZSBT
UjIgcmVhZCBvcGNvZGUgZm9yIHRoZXNlCj4gKwkgKiBvY3RhbC1jYXBhYmxlIGZsYXNoZXMgc28g
c3BpX25vcl9yZWFkX3NyMV9hbmRfc3IyKCkgZGVncmFkZXMgdG8gYW4KPiArCSAqIFNSMS1vbmx5
IHJlYWQgYW5kIHNwaV9ub3JfaW5pdCgpIGRvZXMgbm90IGlzc3VlIGFuIHVuc3VwcG9ydGVkCj4g
KwkgKiBjb21tYW5kIHRoYXQgdGhlIGZsYXNoIG5ldmVyIGFuc3dlcnMuIEEgbWFudWZhY3R1cmVy
IGRyaXZlciB0aGF0Cj4gKwkgKiBhY3R1YWxseSBuZWVkcyBTUjIgY2FuIGluc3RhbGwgaXRzIG93
biBvcGNvZGUgaW4gYSBsYXRlciBmaXh1cC4KPiArCSAqLwo+ICsJbm9yLT5wYXJhbXMtPm9wY29k
ZXMucmVhZF9zcjIgPSAwOwoKW1NldmVyaXR5OiBNZWRpdW1dCldoYXQgaGFwcGVucyBvbiBvY3Rh
bCBkdHIgZmxhc2hlcyB0aGF0IGRvIG5vdCBwdWJsaXNoIGFuIHhzcGkgcHJvZmlsZSAxLjAKdGFi
bGUsIHNvIHNwaV9ub3JfcGFyc2VfcHJvZmlsZTEoKSBpcyBuZXZlciBjYWxsZWQ/CgpTcGVjaWZp
Y2FsbHksIHNvbWUgYmF0Y2hlcyBvZiB0aGUgTWljcm9uIG10MzV4dTUxMmFiYSBsYWNrIHRoZSBw
cm9maWxlIDEuMAp0YWJsZSBhbmQgaW5zdGVhZCBjb25maWd1cmUgU05PUl9QUk9UT184XzhfOF9E
VFIgaW4KZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYzptdDM1eHU1MTJhYmFfcG9zdF9z
ZmRwX2ZpeHVwKCk6CgoJbm9yLT5wYXJhbXMtPmh3Y2Fwcy5tYXNrIHw9IFNOT1JfSFdDQVBTX1JF
QURfOF84XzhfRFRSOwoJc3BpX25vcl9zZXRfcmVhZF9zZXR0aW5ncygmbm9yLT5wYXJhbXMtPnJl
YWRzW1NOT1JfQ01EX1JFQURfOF84XzhfRFRSXSwKCQkJCSAgMCwgMjAsIFNQSU5PUl9PUF9NVF9E
VFJfUkQsCgkJCQkgIFNOT1JfUFJPVE9fOF84XzhfRFRSKTsKCS4uLgoJbm9yLT5wYXJhbXMtPmh3
Y2Fwcy5tYXNrIHw9IFNOT1JfSFdDQVBTX1BQXzhfOF84X0RUUjsKCXNwaV9ub3Jfc2V0X3BwX3Nl
dHRpbmdzKCZub3ItPnBhcmFtcy0+cGFnZV9wcm9ncmFtc1tTTk9SX0NNRF9QUF84XzhfOF9EVFJd
LAoJCQkJU1BJTk9SX09QX1BQXzRCLCBTTk9SX1BST1RPXzhfOF84X0RUUik7CgpJbiBkcml2ZXJz
L210ZC9zcGktbm9yL3NmZHAuYzpzcGlfbm9yX3BhcnNlX2JmcHQoKSwgcGFyYW1zLT5vcGNvZGVz
LnJlYWRfc3IyCmlzIGluaXRpYWxpemVkIHRvIFNQSU5PUl9PUF9SRENSICgweDM1KSBhbmQgcmVt
YWlucyBzZXQgd2hlbiB0aGUgcXVhZCBlbmFibGUKcmVxdWlyZW1lbnRzIGZpZWxkIGNvbnRhaW5z
IGEgcmVzZXJ2ZWQgdmFsdWUgKHdoaWNoCm10MzV4dTUxMmFiYV9wb3N0X3NmZHBfZml4dXAoKSBu
b3RlcyBpcyB0aGUgY2FzZSBvbiB0aGlzIHBhcnQpIG9yCkJGUFRfRFdPUkQxNV9RRVJfTk9ORToK
CglwYXJhbXMtPm9wY29kZXMucmVhZF9zcjEgPSBTUElOT1JfT1BfUkRTUjsKCXBhcmFtcy0+b3Bj
b2Rlcy5yZWFkX3NyMiA9IFNQSU5PUl9PUF9SRENSOwoJLi4uCglkZWZhdWx0OgoJCWRldl9kYmco
bm9yLT5kZXYsICJCRlBUIFFFUiByZXNlcnZlZCB2YWx1ZSB1c2VkXG4iKTsKCQlicmVhazsKClNp
bWlsYXJseSwgbm9uLXNmZHAgZmxhc2hlcyBpbml0aWFsaXplZCB3aXRoIFNQSV9OT1JfT0NUQUxf
RFRSX1JFQUQgaW4KZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM6c3BpX25vcl9ub19zZmRwX2lu
aXRfcGFyYW1zKCkgZW5hYmxlClNOT1JfSFdDQVBTX1JFQURfOF84XzhfRFRSIHdoaWxlIGxlYXZp
bmcgcGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyIHNldCB0bwpTUElOT1JfT1BfUkRDUiBmcm9tIHNw
aV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcygpLgoKV2hlbiBzcGlfbm9yX2luaXQoKSBzd2l0Y2hl
cyB0aGVzZSBmbGFzaGVzIHRvIFNOT1JfUFJPVE9fOF84XzhfRFRSIHZpYQpzcGlfbm9yX3NldF9v
Y3RhbF9kdHIoKSBhbmQgdGhlbiBydW5zOgoKICBzcGlfbm9yX2luaXQoKQogICAgLT4gc3BpX25v
cl9jYWNoZV9zcl9sb2NrX2JpdHMoKQogICAgICAtPiBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjJf
Y2FyZWZ1bCgpCiAgICAgICAgLT4gc3BpX25vcl9yZWFkX3NyMl9jYXJlZnVsKCkKICAgICAgICAg
IC0+IHNwaV9ub3JfcmVhZF9zcl9sbCgpCgp3b3VsZG4ndCB0aGlzIHN0aWxsIGlzc3VlIHRoZSB1
bnN1cHBvcnRlZCAweDM1MzUgcmVnaXN0ZXIgcmVhZCBpbgpTTk9SX1BST1RPXzhfOF84X0RUUiBt
b2RlIGFuZCBmYWlsIHByb2JlIG9yIHJlc3VtZSB3aXRoIGEgY29udHJvbGxlcgp0aW1lb3V0PwoK
PiArCj4gIG91dDoKPiAgCWtmcmVlKGR3b3Jkcyk7Cj4gIAlyZXR1cm4gcmV0OwoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAyMi1z
cGktbm9yLWZpeC12My0xLWJmZmEwMGI3NWMyN0BueHAuY29tP3BhcnQ9MQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
