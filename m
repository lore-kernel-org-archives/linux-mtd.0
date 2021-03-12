Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD81C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 13:28:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498EF64F70
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 13:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498EF64F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=43l7SAOBJwcMaNHo3iQ0HNyio7VhlihKmoGzAarzQoE=; b=pI2wd1/+QNBNaE+EFXfe4CtvF
	oMb31Jad8tRMj8q3FlbblfHx+MQdEiZY9Oo6TfVoTtNFXX5HLiq0wbkp+qUjcK2U6GirdD2GjtVVh
	Xj56NJkhvC5TzeqUSM9YGWTChst4JGzol2NQheMJhtKk04UAHqXAF4+T759kVWjZFMMz3JvLBiRbc
	A53a+F4v8nJ+740bjMEY1gIbirMQEBkrlCxSuXE6ge4TnhMpEYRQK71Mc3lrxsggmiPB3FMBpSTVS
	UbPOVZ8gfrYEyBKtB+OGjXMzhIME4ZX+7fqOEQ7dsgFevGekovcq8sv9505gpvqlsDYKs4ZTJZcUI
	1wkt1PNtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhop-00BWjy-Sj; Fri, 12 Mar 2021 13:27:07 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhoc-00BWiG-W9; Fri, 12 Mar 2021 13:26:57 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3839422238;
 Fri, 12 Mar 2021 14:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615555611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcBTD7nfiYyHNct1X3UL2VExLlEbLzhpNivSjn0I+wk=;
 b=svmemSWB+o+nVNl6REajtsf58ho2PMVwfIR7ipvPG5EzVj2hB2RF8EgQZ78GvhI1nqBuio
 1hYjbb30eYza3JohGRszrmYEeG6vNO5Mn1sjlitt10HFidP4nvEOZA6P/tbY3WjEio45LF
 O07ww65cJKaDHdnj/w4DBwtjYJPhmsA=
MIME-Version: 1.0
Date: Fri, 12 Mar 2021 14:26:50 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, nm@ti.com, kristo@kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, lokeshvutla@ti.com
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
In-Reply-To: <20210312110707.lrabch4ketqyyepn@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <9c551f56-4c00-b41a-f051-8b7e197fbcdc@microchip.com>
 <20210312101036.jfz2733ssv4nhfey@ti.com>
 <676386736df5e5b22e34b0b5af91c894@walle.cc>
 <20210312110707.lrabch4ketqyyepn@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <278f4417bad780ee610d86299e613990@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_132655_142306_EB7E1D0A 
X-CRM114-Status: GOOD (  11.20  )
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

QW0gMjAyMS0wMy0xMiAxMjowNywgc2NocmllYiBQcmF0eXVzaCBZYWRhdjoKPiBPbiAxMi8wMy8y
MSAxMToyMEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBBbSAyMDIxLTAzLTEyIDExOjEwLCBz
Y2hyaWViIFByYXR5dXNoIFlhZGF2Ogo+PiA+IFRoZXJlIGlzIHVzdWFsbHkgYSBkZWxheSBmcm9t
IHdoZW4gdGhlIGZsYXNoIGRyaXZlcyB0aGUgZGF0YSBsaW5lIChJT1csCj4+ID4gcHV0cyBhIGRh
dGEgYml0IG9uIGl0KSBhbmQgd2hlbiB0aGUgc2lnbmFsIHJlYWNoZXMgdGhlIGNvbnRyb2xsZXIu
IFRoaXMKPj4gPiBkZWxheSBjYW4gdmFyeSBieSB0aGUgZmxhc2gsIGJvYXJkLCBzaWxpY29uIGNo
YXJhY3RlcmlzdGljcywKPj4gPiB0ZW1wZXJhdHVyZSwgZXRjLgo+PiAKPj4gVGVtcGVyYXR1cmUg
bWlnaHQgY2hhbmdlIG92ZXIgdGltZSwgYnV0IHRoZSBjYWxpYnJhdGlvbiBpcyBvbmx5IGRvbmUK
Pj4gb25jZS4gSSBkb24ndCBrbm93IGhvdyBtdWNoIGluZmx1ZW5jZSB0aGUgdGVtcGVyYXR1cmUg
YWN0dWFsbHkgaGFzLCAKPj4gYnV0Cj4+IG91ciBib2FyZHMgYXJlIHVzdWFsbHkgb3BlcmF0aW5n
IGZyb20gLTQwwrBDIHRvICs4NcKwQy4gU28gdGhlcmUgbWlnaHQgCj4+IGJlCj4+IGEgcG9zc2li
bGUgdGVtcGVyYXR1cmUgZGlmZmVyZW5jZSBvZiAxMjVLIGJldHdlZW4gYWN0dWFsIGNhbGlicmF0
aW9uIAo+PiBhbmQKPj4gd2hlbiB0aGUgZmxhc2ggaXMgYWNjZXNzZWQuCj4gCj4gVGhlIGFsZ29y
aXRobSBzdXBwb3J0cyBhIHRlbXBlcmF0dXJlIHJhbmdlIG9mIC00NSBDIHRvICsxMzAgQy4gVGhl
Cj4gdGVtcGVyYXR1cmUgaXMgY2hlY2tlZCBhdCBjYWxpYnJhdGlvbiB0aW1lIGFuZCBhZGp1c3Rt
ZW50cyBhcmUgbWFkZSB0bwo+IG1ha2Ugc3VyZSB0aGUgcmVhZHMgd29yayBvdmVyIHRoZSBlbnRp
cmUgdGVtcGVyYXR1cmUgcmFuZ2UgWzBdLgoKQWgsIG5pY2UuIEFuZCB5b3UgbmVlZCB0aGUgY3Vy
cmVudCB0ZW1wZXJhdHVyZSB0byBjb3JyZWxhdGUgaXQgdG8gdGhlCm1lYXNzdXJlZCB0aW1pbmdz
LCByaWdodD8KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
