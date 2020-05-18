Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8058AC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 19:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5172020756
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 19:24:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlcP2NyB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5172020756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/f81evybf9g5ZnzShe86f1mk4HQLllE0ije6IExssM=; b=TlcP2NyB2pIYCy
	caR99pZI9EIq2wWb84d2EA/+9NmmJhfgM8SHBnPzWBtCCbZkpg6oaXy8LYoQ2Cc7xrz05LTTIwLhq
	5G9Vj6Yzv6BPvJNLsKo36hxPNOYrvWBxd3ny6hjAjFCh5seywi1VDqcaWv247vI+/3Xsl+sxJXsEb
	4g0OPeceNxsZvXNYhVTznKjB5EG5bNo9CFQHYQFT77JWahsXCfEbrexxI9ElmgI7JFhQUe4qtiKBK
	3IjZtN7QbrjCXEzZ1Kn96+koqaZ94UERfgqVIZS4U9UB8xcuYWXeVjOOOBakl+6PeuncID2PlCyOp
	/S8nOLN/xJdL1t0Zkv+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jalNJ-0004De-TB; Mon, 18 May 2020 19:24:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jalNG-0004BQ-UX
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 19:24:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1CCB72A022C;
 Mon, 18 May 2020 20:24:26 +0100 (BST)
Date: Mon, 18 May 2020 21:24:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
Message-ID: <20200518212422.23316760@collabora.com>
In-Reply-To: <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
References: <20200518165640.312220-1-boris.brezillon@collabora.com>
 <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_122431_112081_CA38551B 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxOCBNYXkgMjAyMCAxOTo1MDowNCArMDIwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IExlIGx1bi4gMTggbWFpIDIw
MjAgw6AgMTg6NTYsIEJvcmlzIEJyZXppbGxvbiAKPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+IGEgw6ljcml0IDoKPiA+IExldCdzIGNvbnZlcnQgdGhlIGRyaXZlciB0byBleGVjX29w
KCkgdG8gaGF2ZSBvbmUgbGVzcyBkcml2ZXIgcmVseWluZwo+ID4gb24gdGhlIGxlZ2FjeSBpbnRl
cmZhY2UuICAKPiAKPiBHcmVhdCB3b3JrLCB0aGFua3MgZm9yIHRoYXQuCj4gCj4gSG93ZXZlciBp
dCBkb2VzIG5vdCB3b3JrIDooIG5hbmRfc2NhbigpIHJldHVybnMgZXJyb3IgLTE0NS4KCkxvb2tz
IGxpa2UgdGhlIFIvQiBzaWduYWwgaXMgaW52ZXJ0ZWQuIENhbiB5b3UgdHJ5IHdpdGggdGhlCmZv
bGxvd2luZyBkaWZmIGFwcGxpZWQ/CgotLS0+OC0tLQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwppbmRleCBkY2VjZDU0YWYyMGIuLjkyMDY3OTI2
MjlhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25h
bmRfZHJ2LmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRf
ZHJ2LmMKQEAgLTI0OSw2ICsyNDksMjYgQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfYXR0YWNo
X2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKICAgICAgICByZXR1cm4gMDsKIH0KIAorc3Rh
dGljIGludCBpbmdlbmljX25hbmRfZ3Bpb193YWl0cmR5KHN0cnVjdCBncGlvX2Rlc2MgKmdwaW9k
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0aW1l
b3V0X21zKQoreworICAgICAgIC8qCisgICAgICAgICogV2FpdCB1bnRpbCBSL0IgcGluIGluZGlj
YXRlcyBjaGlwIGlzIHJlYWR5IG9yIHRpbWVvdXQgb2NjdXJzLgorICAgICAgICAqICsxIGJlbG93
IGlzIG5lY2Vzc2FyeSBiZWNhdXNlIGlmIHdlIGFyZSBub3cgaW4gdGhlIGxhc3QgZnJhY3Rpb24K
KyAgICAgICAgKiBvZiBqaWZmeSBhbmQgbXNlY3NfdG9famlmZmllcyBpcyAxIHRoZW4gd2Ugd2ls
bCB3YWl0IG9ubHkgdGhhdAorICAgICAgICAqIHNtYWxsIGppZmZ5IGZyYWN0aW9uIC0gcG9zc2li
bHkgbGVhZGluZyB0byBmYWxzZSB0aW1lb3V0LgorICAgICAgICovCisgICAgICAgdGltZW91dF9t
cyA9IGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXRfbXMpICsgMTsKKyAgICAgICBk
byB7CisgICAgICAgICAgICAgICBpZiAoIWdwaW9kX2dldF92YWx1ZV9jYW5zbGVlcChncGlvZCkp
CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOworCisgICAgICAgICAgICAgICBjb25k
X3Jlc2NoZWQoKTsKKyAgICAgICB9IHdoaWxlICh0aW1lX2JlZm9yZShqaWZmaWVzLCB0aW1lb3V0
X21zKSk7CisKKyAgICAgICByZXR1cm4gIWdwaW9kX2dldF92YWx1ZV9jYW5zbGVlcChncGlvZCkg
PyAwIDogLUVUSU1FRE9VVDsKK307CisKIHN0YXRpYyBpbnQgaW5nZW5pY19uYW5kX2V4ZWNfaW5z
dHIoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgaW5nZW5pY19uYW5kX2NzICpjcywKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIpCkBAIC0yOTQsOCAr
MzE0LDggQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfZXhlY19pbnN0cihzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLAogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbmFuZF9zb2Z0X3dhaXRy
ZHkoY2hpcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21zKTsKIAotICAgICAgICAgICAgICAgcmV0dXJu
IG5hbmRfZ3Bpb193YWl0cmR5KGNoaXAsIG5hbmQtPmJ1c3lfZ3BpbywKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0ci0+Y3R4LndhaXRyZHkudGltZW91dF9tcyk7
CisgICAgICAgICAgICAgICByZXR1cm4gaW5nZW5pY19uYW5kX2dwaW9fd2FpdHJkeShuYW5kLT5i
dXN5X2dwaW8sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnN0ci0+Y3R4LndhaXRyZHkudGltZW91dF9tcyk7CiAgICAgICAgZGVmYXVsdDoKICAgICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgIH0KQEAgLTMyMiw2ICszNDIsOSBAQCBzdGF0aWMgaW50
IGluZ2VuaWNfbmFuZF9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAgICAgICAgICAg
ICAgICByZXQgPSBpbmdlbmljX25hbmRfZXhlY19pbnN0cihjaGlwLCBjcywgJm9wLT5pbnN0cnNb
aV0pOwogICAgICAgICAgICAgICAgaWYgKHJldCkKICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7CisKKyAgICAgICAgICAgICAgIGlmIChvcC0+aW5zdHJzW2ldLmRlbGF5X25zKQorICAgICAg
ICAgICAgICAgICAgICAgICBuZGVsYXkob3AtPmluc3Ryc1tpXS5kZWxheV9ucyk7CiAgICAgICAg
fQogICAgICAgIGp6NDc4MF9uZW1jX2Fzc2VydChuZmMtPmRldiwgY3MtPmJhbmssIGZhbHNlKTsK
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
