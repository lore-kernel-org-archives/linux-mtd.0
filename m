Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF88C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xr4oVRAnfkBvm9mqfwH7jBpmduvSpSlkb63mOyyLi0g=; b=3CL9t1g8w5qfky3NobudAGueTA
	VVe3JKEzYYM8WhmS6TcepoVLNgjE7acUR0HTlxRGwrTuf+oFXd+NB4vc98MC5VyQpcESNDIaOcpFn
	FmhKFcW7GK7xMhLGLAXmaGkTSzmlQPtASdrUDSIvj2SwO6h4pk9V9GW7NwrF1IuqPXv7nIya+Loxi
	01scgFsnsPRKjKGZvbFISN0hiRtvihhY6X7PlshwY331avYWYku31F0BlBARP+7PdfelaMDnofRR+
	bzzWYgT8tNUbQsjDTmKflFs3VhxkdqXVC62nbkjx4kZeDMcTqoXxQxs//oYfwBA6NYy4wycP8XVjQ
	g/sJNYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzty-00GA6q-5k; Tue, 01 Mar 2022 10:38:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOztj-00GA2F-BO; Tue, 01 Mar 2022 10:38:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5E2C822247;
 Tue,  1 Mar 2022 11:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646131103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX0HqEO5tXRMHDX6EjO/ePWN/WNuw0vJbcVA8u6lJ8I=;
 b=HHP9VK9Y9Cx6a5rxaDiACr7MIMfhZFY1mu+sZNBnutXv8kE3QfYBgyfhHFZOHQHT0tdBV8
 hXn3LMGeu0gwOxgEyGiOmxJ2CsiJw0hyZB+7Ft0YCaTX9mL9MT+y8P7txohUy+rBeIsVXn
 NelSwLUim4v7PwkO6uDN5eZWzLNYWfk=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 11:38:23 +0100
From: Michael Walle <michael@walle.cc>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, p.yadav@ti.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
In-Reply-To: <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <ba3a7bd546934ee0174480a01c505663@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_023827_564477_266E5271 
X-CRM114-Status: GOOD (  10.25  )
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

QW0gMjAyMi0wMy0wMSAxMToyOSwgc2NocmllYiBIZWlrbyBUaGllcnk6Cj4gSGkgVHVkb3IsCj4g
Cj4gQW0gRGkuLCAxLiBNw6RyeiAyMDIyIHVtIDEwOjU2IFVociBzY2hyaWViIFR1ZG9yIEFtYmFy
dXMKPiA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPjoKPj4gCj4+IEhpLCBIZWlrbywKPj4g
Cj4+IFdvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBzZXQgb24gdG9wIG9mOgo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMjAyMjgxMzQ1MDUuMjAzMjcwLTEt
dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tLwo+IAo+IFdoZW4gYXBwbHlpbmcgdGhhdCBzZXJp
ZXMgdGhlIGZsYXNoIHdpbGwgYmUgcHJvcGVybHkgZGV0ZWN0ZWQuCj4gCj4gWyAgICAxLjMyMjY1
NV0gc3BpLW5vciBzcGkwLjA6IG14MjVsMTI4MzVmICgxNjM4NCBLYnl0ZXMpCj4gCj4gVGhhbmtz
CgpCdXQgZG9lc24ndCB0aGF0IG1lYW4gdGhhdCB0aGUgcHJldmlvdXMgc2VyaWVzIGludHJvZHVj
ZXMKcG9zc2libGUgcmVncmVzc2lvbnMgZm9yIG90aGVyIGZsYXNoZXMsIHRvbz8KCi1taWNoYWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
