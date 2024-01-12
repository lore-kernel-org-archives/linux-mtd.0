Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8ECC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIeXLp6PiWOgIkfx2Bx10rj3n/UUTdy3ka4/xpaSEiE=; b=T+0rd5KxHREUYx1uUOK/BZiCWa
	0K6F4L0/yetTlMCK2FlZwqpI5VZQTakZYvGlHbq/CA9a+UItng0EmHoFiOOfJMZuCHM956HlEo2K4
	bnJTfiT6HYN+TdtwAWLv0lFb2FNccXy75zPxyrDvgSLCYNEJamEoz6kdIIPwxQYXVng+ta2OWg3b6
	s2jeIaUheudG5wUjuwcBDL70oyX2smhTNf8oP3VdTfcNP0S9pks8LX5QkMGUELo2fUHP4QNI9goRQ
	NuMtzejNEZACw0rZH03EBFwZg88HVMY0opBq0X1Hd5Uolhiw+4urPpsEgjn3NE11wFuDNZX/v+CoN
	QVQuu25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGeC-002pE3-0W;
	Fri, 12 Jan 2024 12:28:28 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGe9-002pDN-0h
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 12:28:26 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4CAA8D4B;
	Fri, 12 Jan 2024 13:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1705062503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ve0vRN8l3M2Vh3m+Lif357gnc5lDmIk2AuJl2tdn4FM=;
	b=zcRcegEo+T5WSbP01EoC9zZnKPBo8TVSyOWsl+dxf5IrGT0cDjWULq7ydMDDNDCMa141rY
	R046xrgfW2Bl/1gkaJAvs0KeEFoRf7FNxEbQISG3qfqWTc0n3B2JykMCK1k4llQ+mz9rmo
	lrQlB5DuJOAwhdXHHyRk9rNnWImfXHtAuvQVWw3YdkTPBIe4g8QRyfKCVYs+AkuqrcJluC
	PjTF6WGNHfsDt2OYF5U3XR+aVrp3ksDH1eJXKHOreIBORQxI0yq0PpSbdlgOZKfa/TsCnb
	BNLabG/ZrSu0gXpzewMC/V+6kDq0xPNWgTCSwgj0tGxJMnPUTKJs6nHGgaXdVw==
MIME-Version: 1.0
Date: Fri, 12 Jan 2024 13:28:22 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
In-Reply-To: <97c11a15-210b-4dff-a046-bb2873062282@linaro.org>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <bb98a601-5c76-4273-820e-2b1c9b449820@linaro.org>
 <2e781c2efd663fea6d4a75fac36f144a@walle.cc>
 <97c11a15-210b-4dff-a046-bb2873062282@linaro.org>
Message-ID: <864f70a951a7b7505c79f6a7b84d8b03@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_042825_411046_157378AF 
X-CRM114-Status: GOOD (  14.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4+PiArwqDCoMKgIHN0cnVjdCBtdGRfZXJhc2VfcmVnaW9uX2luZm8gKm10ZF9yZWdpb247Cj4+
Pj4gK8KgwqDCoCB1MzIgZXJhc2Vfc2l6ZTsKPj4+PiArwqDCoMKgIHU4IGVyYXNlX21hc2s7Cj4+
PiAKPj4+IHB1dCB0aGUgdTggbGFzdCB0byBhdm9pZCBzdGFjayBwYWRkaW5nCj4+IAo+PiBJIGRv
bid0IHRoaW5rIHRoYXQgaXMgYSB0aGluZy4gRXZlbiBpZiBpdCB3ZXJlLCBpdCBtaWdodCBjbGFz
aAo+PiB3aXRoIHRoZSBSQ1QuCj4gCj4gUkNUIGFzIGluIHJldmVyc2UgQ2hyaXN0bWFzIHRyZWU/
Cgp5ZXMKCj4gaWYgd2UgcHV0IHU4IGF0IHRoZSBlbmQgd2UnbGwgcmVzcGVjdCBSQ1QgYW5kIHdp
dGhvdXQgcGFkZGluZyBob2xlcwo+IGluIHRoZSBzdGFjay4KCkl0IG1pZ2h0IGNsYXNoLCBub3Qg
aW4gdGhpcyBwYXJ0aWN1bGFyIGV4YW1wbGUuCgo+PiBJIGNvdWxkbid0IGZpbmQgYW55dGhpbmcg
YWJvdXQgaG93IGF1dG9tYXRpYyB2YXJpYWJsZXMgYXJlIHBsYWNlZAo+PiBpbiBtZW1vcnkuIEkn
ZCBzYXkgaXRzIG5vdCBzcGVjaWZpZWQgaW4gdGhlIHN0YW5kYXJkIGFuZCB0aGUgY29tcGlsZXIK
Pj4gaXMgZnJlZSB0byBkbyBvcHRpbWl6YXRpb25zIGhlcmUgb3IganVzdCBrZWVwIHRoZSBjb250
ZW50cyBpbgo+PiByZWdpc3RlcnMgKD8hKS4KPj4gCj4gCj4gSSBjYW4ndCB0ZWxsLgo+IAo+PiBB
bnkgc3R5dGxlIHJlY29tbWVuZGF0aW9ucyBmb3Igc3BpLW5vcj8gSSBwcmVmZXIgUkNULCBidXQg
aWYgd2Ugd2FudAo+PiB0byBzYXkgZGVjbGFyYXRpb24gb3JkZXIgZG9lc24ndCBtYXR0ZXIsIEkn
bSBmaW5lIHdpdGggdGhhdCB0b28uCj4gCj4gUkNUIG9yIENUIHdpdGggc3RhY2sgcGFkZGluZyBp
biBtaW5kIDopLiBCdXQgdGhhdCdzIGp1c3QgY29tbW9uIHNlbnNlLCAKPiBJCj4gZ3Vlc3MuCgpB
Z2FpbiwgdGhhdCdzIG5vdCBhIHRoaW5nLiBTbyBJTUhPIG9yZGVyIGRvZXNuJ3QgbWF0dGVyIHNv
IHdlIHNob3VsZCAKanVzdApzYXkgUkNULCBpLmUuIHRoZSBzYW1lIGFzIG5ldGRldi4KCi1taWNo
YWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
