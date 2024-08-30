Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A10CA1009
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChfLxb2JAMcBkgIz1cyztBvj8twMpEm20o+HBmbovj8=; b=W/4jnD0yNUJprP
	vCtNeKZ5+vVoS8gFz965qSa2rx6k/VzVKz/nROwUUA+mHmcXsLVromIr5+ksiEJl+w/DamgyWBV1z
	Er1bpFMMae/Ds+sM1lrsCRUBwvelktLpt9fvlFx92uqAW2H10nyLKvI51qIgZs7wHnVGAMndjvxEQ
	VnDBOVgNGGADYMRjJL+JUAuvjzQ33/FJ+kB3Fjjl0FjCGxqhHGwH/WUhQ0DfpmvlnmXkSRlexzJp4
	diXxLrqhuuiUMDbTMTuwwILANngx58zRkg9v+oMzBp/xUeuN4EvSZVixxfaUnfgs1ETsFdIyM/zD8
	vx9HPWsYxS7VUNcWvuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk41j-00000006vIL-1NqR;
	Fri, 30 Aug 2024 15:59:07 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3xw-00000006tuC-2dyJ
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 15:55:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EA3624000A;
	Fri, 30 Aug 2024 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725033310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPA0rJ9OftpqjiI74jGLgXM3A95TCoAE5VsWnJzOCkA=;
	b=o2/ewgxaOezmTe7rnQANMV9VMz3u5epFA4/CpAiEictfcr2WPNl7+aUMpQbwN3cM6Aa4Lp
	fmB60ppV1ULOhACsLfrFWyS6mAdy8V1y+h2IVgu3jmWa2oZaFdFMeyXYfc7xfHOMjVBzo1
	xSeBPXw0iQUzUoJFAt5akxvkcdx3NOFdL2wKTXxqwpZIht2Os9okjf1CmulU+Vdi8zHUBE
	oOCJPp7xcddD5FkuuamGZmHDDF0RKblAOSgKGKNsZTLWQVKKI0SnbcJUXvyD7X+bdXidSw
	hZscBixg0+2d3ZQt3AbutTHZIkhLMPXaVzizcv4QcNidS7319XLxpis7NcIhLQ==
Date: Fri, 30 Aug 2024 17:55:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v5 1/2] mtd: spinand: Add support for setting plane
 select bits
Message-ID: <20240830175504.746fb2ec@xps-13>
In-Reply-To: <20240830100310.1553675-2-linchengming884@gmail.com>
References: <20240830100310.1553675-1-linchengming884@gmail.com>
	<20240830100310.1553675-2-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_085513_502671_80AAB5CB 
X-CRM114-Status: GOOD (  14.33  )
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

SGkgQ2hlbmdNaW5nLAoKbGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDMw
IEF1ZyAyMDI0IDE4OjAzOjA5ICswODAwOgoKPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdt
aW5nbGluQG14aWMuY29tLnR3Pgo+IAo+IEFkZCB0d28gZmxhZ3MgZm9yIGluc2VydGluZyB0aGUg
UGxhbmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4KPiBhZGRyZXNzIGR1cmluZyB0aGUgd3Jp
dGVfdG9fY2FjaGUgYW5kIHRoZSByZWFkX2Zyb21fY2FjaGUgb3BlcmF0aW9uLgo+IAo+IEFkZCB0
aGUgU1BJTkFORF9IQVNfUFBfUExBTkVfU0VMRUNUX0JJVCBmbGFnIGZvciBzZXJpYWwgTkFORCBm
bGFzaAoKVGhpcyBmbGFnIGhhcyBiZWVuIHJlbmFtZWQgOikKCj4gdGhhdCByZXF1aXJlIGluc2Vy
dGluZyB0aGUgUGxhbmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcwo+IGR1cmlu
ZyB0aGUgd3JpdGVfdG9fY2FjaGUgb3BlcmF0aW9uLgo+IAo+IEFkZCB0aGUgU1BJTkFORF9IQVNf
UkVBRF9QTEFORV9TRUxFQ1RfQklUIGZsYWcgZm9yIHNlcmlhbCBOQU5EIGZsYXNoCj4gdGhhdCBy
ZXF1aXJlIGluc2VydGluZyB0aGUgUGxhbmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRk
cmVzcwo+IGR1cmluZyB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA2ICsrKysrKwo+ICBpbmNsdWRlL2xpbnV4
L210ZC9zcGluYW5kLmggfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+IGluZGV4IGUwYjY3MTVlNWRmZS4uZTdiNTkyY2RiYjRjIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+IEBAIC0zODYsNiArMzg2LDkgQEAgc3RhdGljIGludCBzcGlu
YW5kX3JlYWRfZnJvbV9jYWNoZV9vcChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4g
IAllbHNlCj4gIAkJcmRlc2MgPSBzcGluYW5kLT5kaXJtYXBzW3JlcS0+cG9zLnBsYW5lXS5yZGVz
Y19lY2M7Cj4gIAo+ICsJaWYgKHNwaW5hbmQtPmZsYWdzICYgU1BJTkFORF9IQVNfUkVBRF9QTEFO
RV9TRUxFQ1RfQklUKQo+ICsJCWNvbHVtbiB8PSByZXEtPnBvcy5wbGFuZSA8PCBmbHMobmFuZGRl
dl9wYWdlX3NpemUobmFuZCkpOwoKSXNuJ3QgdGhlcmUgYW55IGJldHRlciB3YXkgdG8ga25vdyB3
aGF0IHRoZSBiaXQgcG9zaXRpb24gaXM/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
