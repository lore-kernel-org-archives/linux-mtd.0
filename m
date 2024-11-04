Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC5D132DF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KO27iYTC82GsbowU99wc81VzDlrymLTIPjk6oBt9YfU=; b=Q24iasy06vuLgf
	UD5MrfgB+d5irwSz1nFx/eeV8rH4bFyZNecnk6dxLEONH5EzYFaQS6Fqi4BqbeD5DD1iw/WdrkpjX
	WqmC7HpknYLqQRF28tRoqOn8w3NeCFWUvC7C7Lcftxrr/TVH6tJJizwa/mQGUlU8u+ehmbTxl54xy
	H61VlKTuDcMMSSgiHHt/NRTPyv99arH2uSTHYJ3jbzhiFPGX8aE8x4aPZDHaA4skpFoNCbYAMwdoJ
	jmZccw3QZ+QuFcGDMZxMncRokBT2HnG8jsyOKHsgeS2AZYdYD1AY0sruIHpfZ0ForsTi2ByswYJgR
	MF8ZCQUqx5HFHEppeBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ysj-0000000EBOd-2NJb;
	Mon, 04 Nov 2024 15:20:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yrK-0000000EBBq-4ARD
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 15:19:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99f646ff1bso582283066b.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2024 07:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730733553; x=1731338353; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0aro9OUStezfsQZPeIj/Ne7cRaEIjiTc3bwg4jYU0Gw=;
        b=kbZG8CtC9c3IQKBM/K5H/Q4HXKel/i8qrDTdOZ3y7yrmcY8w2qDBel0/0zp74NqxV2
         vceLcwFiUUjbQYdsWYLeiE0rc9HY4EMicovVZLPNAlEPiKD/4PMk0pL3aRi0gYCSotGb
         uo+B5WS9euH7O4QT+FoHBts30qvaJZH6wNnRfrGHsTuIaUwd5C5AiuobVExFxE9iCArw
         W/3J5uAuAQIkCVGqN5z8m8UVuzMd3NxkZTXmd7zCS37JP9GhGbFkyxkAIxjGO0aFKo5E
         Q+7LSV220lH3LtKxjAwUyena0pzWjzS4JFsnovvY5oMiCnHKwCROfP5GDIuInhbpKuvg
         JGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733553; x=1731338353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0aro9OUStezfsQZPeIj/Ne7cRaEIjiTc3bwg4jYU0Gw=;
        b=izAFeCXYeJWSvu7oUHfc65K0z09+KwGKGTTHELM3JKTz+nXYCYn4h7m0MnuMJyzBT8
         JyWsxIEae7bhXn6EAzMz8hw2VppqRmpyfpXWYcCXAchDfqHre949/EX4ZA/vhDGr0KBI
         CaOruNCuIq2N/O5mHNZimjQ0eot8lvwzoz++Buk/Hf9awMQDgbPCWgFfMKrg3DHZa+mU
         Z+WteDO/U/IrQMgyOYZ7PCOgBYOxJ+9wy//y8A9RA+nAm9/0eKcMGHQOeVb8FY+VDWay
         5gVuXmFMQfEYeJyo9X6vsP7WcJuzOwc0/EENOwaupaCMFRf0C3/NR7Ab+kz7lr7USvug
         uSwA==
X-Forwarded-Encrypted: i=1; AJvYcCXu1cgByoUJjsIpO/+uuyjMXnx4TklqfxKD4ECwO6m9GGTJ98zV6EGWhAMzpQl6KsCqsUmB2vmH96E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTGLAvT2CkmBZ1iQN9Pew1zYFCNs0Jeb8twEi5bYqKgNIjx8hQ
	3uzpmlfmLY7kQTVyGBJo2AORZ/wrOerZULwyhptPholqOC9yx+g2
X-Google-Smtp-Source: AGHT+IGoCjugzBNZ9blMebQOdJ4kj1DH6U3z9PdFMFa2Ijhiel4nNGrTQle/9BJ/FDmPSMcK/veztA==
X-Received: by 2002:a17:907:1c1d:b0:a9a:f53:a5c6 with SMTP id a640c23a62f3a-a9e3a7f468fmr1963722466b.65.1730733552584;
        Mon, 04 Nov 2024 07:19:12 -0800 (PST)
Received: from partp-nb (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e8e6esm569618766b.94.2024.11.04.07.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:19:12 -0800 (PST)
Date: Mon, 4 Nov 2024 16:19:10 +0100
From: Parth Pancholi <parth105105@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: macronix: enable dual and quad read for
 MX25U25635F
Message-ID: <Zyjl7k3brYYcLD5H@partp-nb>
References: <20241024114021.17567-1-parth105105@gmail.com>
 <f4a5e5a4-9a0d-4b3c-8fe3-80e684fff758@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4a5e5a4-9a0d-4b3c-8fe3-80e684fff758@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_071915_057898_2577FF15 
X-CRM114-Status: GOOD (  31.94  )
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

T24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMDc6MzM6MDFBTSArMDAwMCwgVHVkb3IgQW1iYXJ1cyB3
cm90ZToKPiAKPiAKPiBPbiAxMC8yNC8yNCAxMjo0MCBQTSwgUGFydGggUGFuY2hvbGkgd3JvdGU6
Cj4gPiBGcm9tOiBQYXJ0aCBQYW5jaG9saSA8cGFydGgucGFuY2hvbGlAdG9yYWRleC5jb20+Cj4g
PiAKPiA+IFRoZSBNWDI1VTI1NjM1RiBzdXBwb3J0cyBkdWFsIGFuZCBxdWFkIHJlYWQgb3BlcmF0
aW9ucy4gU2V0IHRoZQo+ID4gY29ycmVzcG9uZGluZyBmbGFncyB0byBlbmFibGUgdGhlc2UgZmVh
dHVyZXMgaW4gYWNjb3JkYW5jZSB3aXRoCj4gPiB0aGUgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLiBU
aGlzIGNoYW5nZSBhbHNvIGVuYWJsZXMgZHVhbCBhbmQgcXVhZAo+ID4gcmVhZCBvcGVyYXRpb25z
IG9uIHRoZSBNWDI1VTI1NjQ1Rywgd2hpY2ggc2hhcmVzIHRoZSBzYW1lIElEIGFuZAo+ID4gaGFz
IGEgc3VwZXJzZXQgb2YgdGhlIGZ1bmN0aW9uYWxpdHkgcHJvdmlkZWQgYnkgdGhlIE1YMjVVMjU2
MzVGLgo+ID4gCj4gPiBMaW5rOiBodHRwczovL3d3dy5tYWNyb25peC5jb20vTGlzdHMvRGF0YXNo
ZWV0L0F0dGFjaG1lbnRzLzg2NjMvTVgyNVUyNTYzNUYsJTIwMS44ViwlMjAyNTZNYiwlMjB2MS41
LnBkZgo+IAo+IExvb2tzIGxpa2UgdGhlIGZsYXNoIGRlZmluZXMgU0ZEUCB0YWJsZXMgIlRhYmxl
IDEzLiBQYXJhbWV0ZXIgVGFibGUgKDApOgo+IEpFREVDIEZsYXNoIFBhcmFtZXRlciBUYWJsZXMi
Lgo+IAo+IFdlIGhhdmUgc29tZSBtaW5pbXVtIHRlc3RpbmcgcmVxdWlyZW1lbnRzLCBwbGVhc2Ug
c2VlIHRoZW0gb24KPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL210ZC9zcGkt
bm9yLmh0bWwKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhcnRoIFBhbmNob2xpIDxwYXJ0aC5wYW5j
aG9saUB0b3JhZGV4LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9u
aXguYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXgu
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gaW5kZXggZWE2YmU5NWU3NWE1
Li5iZTU1NTU4YzhhZDAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jv
bml4LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gQEAgLTEy
OSw3ICsxMjksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gbWFjcm9uaXhfbm9y
X3BhcnRzW10gPSB7Cj4gPiAgCQkuaWQgPSBTTk9SX0lEKDB4YzIsIDB4MjUsIDB4MzkpLAo+ID4g
IAkJLm5hbWUgPSAibXgyNXUyNTYzNWYiLAo+ID4gIAkJLnNpemUgPSBTWl8zMk0sCj4gCj4gaWYg
d2Ugd2FudCB0byBzd2l0Y2ggdG8gU0ZEUCBpbml0aWFsaXplZCBwYXJhbXMgdGhlbiB3ZSBjYW4g
cmVtb3ZlIHRoZSBzaXplCj4gCj4gPiAtCQkubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEssCj4gPiAr
CQkubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1Jf
UVVBRF9SRUFELAo+IAo+IGFuZCB0aGlzIGxpbmUgYXMgd2VsbC4KPiAKPiA+ICAJCS5maXh1cF9m
bGFncyA9IFNQSV9OT1JfNEJfT1BDT0RFUywKPiAKPiBJZiB0aGUgZmxhc2ggZGVmaW5lcyB0aGUg
NGJhaXQgdGFibGUgKEkgZG9uJ3Qgc2VlIGl0IGluIGRhdGFzaGVldAo+IHRob3VnaCksIHRoZW4g
dGhpcyBsaW5lIGFzIHdlbGwuIFdlIG1heSByZW1vdmUgdGhlIGVudGlyZSBlbnRyeSBhbmQgcmVs
eQo+IHNvbGVseSBvbiB0aGUgZ2VuZXJpYyBmbGFzaCBkcml2ZXIuCj4gCj4gPiAgCX0sIHsKPiA+
ICAJCS5pZCA9IFNOT1JfSUQoMHhjMiwgMHgyNSwgMHgzYSksCgpUaGFuayB5b3UgZm9yIHRoZSBy
ZXZpZXcsIFR1ZG9yLgpJIHBlcmZvcm1lZCBhIHF1aWNrIHRlc3Qgb24gdGhlIG14MjV1MjU2NDVn
IChzaGFyaW5nIHRoZSBzYW1lIElEIGFzCm14MjV1MjU2MzVmKSBjb25uZWN0ZWQgYXQgVEkgQU02
OSBkZXZpY2XigJlzIFFTUEksIHJlbW92aW5nIHRoZQpteDI1dTI1NjM1ZiBlbnRyeSB0byByZWx5
IGV4Y2x1c2l2ZWx5IG9uIHRoZSBnZW5lcmljIGZsYXNoIGRyaXZlcgphcyBzdWdnZXN0ZWQuIFNv
IGZhciwgSSBkaWQgbm90IHNlZSBpc3N1ZS4gSeKAmWxsIHBlcmZvcm0gYWRkaXRpb25hbAp0ZXN0
cyBhbmQgc3VibWl0IHYyIHdpdGggdGhlIG14MjV1MjU2MzVmIGVudHJ5IHJlbW92ZWQsIGFsb25n
IHdpdGgKbWluaW1hbCB0ZXN0IGxvZ3MuCgpQYXJ0aCBQCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
