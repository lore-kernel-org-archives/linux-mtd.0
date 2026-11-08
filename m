Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69F606A326
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 00:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjD+Zezq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Drdve9qe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JEqubC0PX8BaXlmTjId660KXZEI9FymOG6LG57O+JMo=; b=qjD+ZezqyYlgbh1S/98zQr/MI/
	XCMvFojrfPjZbPOaU9C+6SUv7rku066rbYGpjqcsPTAIwV+EygG311H5lWfNKuyreG++bJUheTq9M
	5/yWH5n8fnPJybbXOhFMYWvnHpjdH4lXrOZ+bucQmyMTNadbVdG7fNXrw9msvQtemfGlaQT00TPPH
	IKHl8T6zXdNsX8lwtEFRMsyAFZf0MgH44RWAea/Y9WB0wxEQm/2HzU3XPesYEBQP49R3CyVFB7Pu2
	J/G+hMEJLKpIjtr+vzk68/FHW0A2hTOTWc23xu8KlVWxfwEHcIhyflp4CZTqEA6OJFExM/BJCnoyn
	xuH68vbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPrA7-0000000FYv8-3npS;
	Sun, 08 Nov 2026 00:53:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPrA6-0000000FYv1-2YZm
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 00:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 030BA404A8;
	Sun,  8 Nov 2026 00:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1F81F0089F;
	Sun,  8 Nov 2026 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794099213;
	bh=Fdn2S799l9trXpJn3igScTLux+MfZY2g7ELUlMeYWeg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Drdve9qeceJiRgQpIX83TVO0Sl33ZxHhxnYdksWN1V6fT4ka7tYfJL3CzP/XBmV64
	 sjwCzKHglYF3ONZHJVYSouxn9H3q8PxlFyek3jrWTziCu1yolRc2E3MoxQ2XiX0pGP
	 8bGUbJk9bJ3khnwhJH8AGYsUKdvoU3MsBRT3c6Ua1PVKl9/upyE2oGnMDl3USttxw0
	 zZ+FcG8LBZvHwioK6/m/dzn7Nz9dkeocVkwGHZ2kO7/ut6PlAudHVJl0sJYg8DyNwu
	 KdX2q9L5Tg+uHe29gD9AeKwIILCxFhKnhdtcDULwvB+KFvHvq4RgvsTA3Eo8rIIARI
	 bUY8aUzcmXBMA==
Message-ID: <sashiko-outbox-203508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for ISSI IS25LP512MG
To: "Matthew Parker" <mparker@arista.com>, pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, "Adam Calabrigo" <adamc@arista.com>
In-Reply-To: <20261108004516.896887-1-mparker@arista.com>
References: <20261108004516.896887-1-mparker@arista.com>
Date: Sun, 08 Nov 2026 00:53:33 +0000
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
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBtdGQ6IHNwaS1ub3I6IGlz
c2k6IGJ1aWxkIGZhaWx1cmUgZnJvbSByZW1vdmVkIHBhcnNlX3NmZHAKICBpbml0aWFsaXplcgot
IFtNZWRpdW1dIG10ZDogc3BpLW5vcjogaXNzaTogc2V0dGluZyAuc2l6ZSBhbmQgLm5hbWUgYnJl
YWtzCiAgc3BpX25vcl9uZWVkc19zZmRwKCkKLS0KCmNvbW1pdCBiODFkYTI2N2Q5OTQ2YjI3OTBi
MWRhMjMyZDUwMjdmN2E4MTg1MzFjCkF1dGhvcjogTWF0dGhldyBQYXJrZXIgPG1wYXJrZXJAYXJp
c3RhLmNvbT4KCm10ZDogc3BpLW5vcjogaXNzaTogQWRkIHN1cHBvcnQgZm9yIElTU0kgSVMyNUxQ
NTEyTUcKClRoaXMgY29tbWl0IGFkZHMgYSBmbGFzaF9pbmZvIGVudHJ5IGZvciB0aGUgSVNTSSBJ
UzI1TFA1MTJNRyA2NCBNaUIgU1BJIE5PUgpmbGFzaCBpbiBpc3NpX25vcl9wYXJ0c1tdLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL2lzc2kuYwo+IGluZGV4IDJmMDU3ZDczMWRmMmEuLjk3N2RjNWJhODAyODkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL2lzc2kuYwo+IEBAIC0xMDEsNiArMTAxLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxh
c2hfaW5mbyBpc3NpX25vcl9wYXJ0c1tdID0gewo+ICAJfSwgewo+ICAJCS5pZCA9IFNOT1JfSUQo
MHg5ZCwgMHg2MCwgMHgxOSksCj4gIAkJLm5hbWUgPSAiaXMyNWxwMjU2IiwKPiArCX0sIHsKPiAr
CQkuaWQgPSBTTk9SX0lEKDB4OWQsIDB4NjAsIDB4MjApLAo+ICsJCS5uYW1lID0gImlzMjVscDUx
Mm1nIiwKPiArCQkuc2l6ZSA9IFNaXzY0TSwKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHNldHRp
bmcgLnNpemUgPSBTWl82NE0gYnJlYWsgc3BpX25vcl9uZWVkc19zZmRwKCkgZm9yIHRoaXMgZmxh
c2g/CgpzcGlfbm9yX25lZWRzX3NmZHAoKSByZXR1cm5zICFub3ItPmluZm8tPnNpemUsIHNvIHNl
dHRpbmcgLnNpemUgY2F1c2VzCnNwaV9ub3JfaW5pdF9wYXJhbXMoKSB0byBpZ25vcmUgc3BpX25v
cl9wYXJzZV9zZmRwKCkgZmFpbHVyZXMgYW5kIGZhbGwgYmFjawp0byBpbmNvbXBsZXRlIHBhcmFt
ZXRlcnMgd2l0aG91dCA0IEtpQiBlcmFzZSBvciBmYXN0LXJlYWQgbW9kZXMuICBJbgphZGRpdGlv
biwgc3RydWN0IGZsYXNoX2luZm8gZG9jdW1lbnRzIC5uYW1lIGFzIG9ic29sZXRlIGZvciBuZXcg
U0ZEUC1iYXNlZAplbnRyaWVzOyBib3RoIC5zaXplIGFuZCAubmFtZSBzaG91bGQgYmUgb21pdHRl
ZCBoZXJlLgoKPiArCQkuZmxhZ3MgPSBTUElfTk9SX1FVQURfUFAsCj4gKwkJLnBhcnNlX3NmZHAg
PSB0cnVlLAoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgZmFpbCB0byBidWlsZCB3aGVuIENP
TkZJR19NVERfU1BJX05PUiBpcyBlbmFibGVkPyAgc3RydWN0CmZsYXNoX2luZm8gaGFzIG5vIC5w
YXJzZV9zZmRwIG1lbWJlciBzaW5jZSAzZWEzZjBhYzI0MmMgKCJtdGQ6IHNwaS1ub3I6CmRyb3Ag
LnBhcnNlX3NmZHAiKS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgwMDQ1MTYuODk2ODg3LTEtbXBhcmtlckBhcmlzdGEuY29t
P3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
