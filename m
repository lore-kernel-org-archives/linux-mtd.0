Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34D2ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4S27RWFcY5ellbcqVL98O7hu/OUzMML51SGSZHzOW4=; b=vSjXREQAGknHcR
	ky/hJgj1+WzKMbxdr0KfNWZDjCJ3z+U9tY+2zJK/sFzDEFdCM1J0Kp+hHj2dROo6gijXR901+Rjgn
	/HBD+FuaCDI4oRLEQ8PEX0SlJZW2euUzk6csVG10jdpBadUwOglJq5ykY4MgQVTA7FD/lPOLgnFsD
	piSBjzYfwB0k9eVqJ9PtC/uAzUTPOVAe+PtOmB0NuEBP34eL7Vdko3Fk6YjrwjcnyTtUbDVIr5140
	4XEe8fRyvRFfH99czrqx/zAtHmD3eR5YhqRchN4OAMQl7voAEt3agTqOOb6/b74mmjn40LJFvVQnH
	jDdfbArugaqXsZaRTAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna9r-00000001C36-46zD;
	Mon, 09 Sep 2024 08:54:04 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna3x-00000001B2E-2hvq
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 08:48:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AE21FF809;
	Mon,  9 Sep 2024 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725871675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tt5NAasuaR7WtHvIUNDpIY6Ko//rXYjwz5p1j6j4dU8=;
	b=DZcqSQ0elPS7iA6ohxz2cijQiD1rky9EiPS8bk5jCJ+GDgyQ9tD1zoH9fg6E7QiF2ZKhfP
	/S+eQdq/rQec/fv82l2JMWkKPKaSJmK+aC7zSKFzvmy39/OGnkt/iQ+OqMY/jobF8QJ6Kz
	GZGkVNA4WPDyEx3Ag0rY2gDi0HGA9qSE3DiuytEaJHFbb6kBNQnLdWKQxrrsoJLfs/TM+O
	uRV1z8hwQNbreKnPBKEuN3op0qkIty3JUvrbAiUM0ajD32rie9f5wU5Qfir5zun7dJHMwi
	hXmaCQEMSzNqG0oRcCippD8tPXP+imNjxAmCWQ4SlFsNdHRrjirpG66Zj9xBYQ==
Date: Mon, 9 Sep 2024 10:47:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Jon Hunter
 <jonathanh@nvidia.com>
Subject: Re: [PATCH] mtd: spi-nor: fix flash probing
Message-ID: <20240909104753.0ce41fb8@xps-13>
In-Reply-To: <b2d0ce1d-fa46-43e9-bb29-c98d1161aae7@linaro.org>
References: <20240909072854.812206-1-mwalle@kernel.org>
	<ad9ee29c-b96a-4861-a7cd-b8649a3d1f3a@linaro.org>
	<20240909095247.48358afa@xps-13>
	<b2d0ce1d-fa46-43e9-bb29-c98d1161aae7@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_014758_388795_B50E72CC 
X-CRM114-Status: GOOD (  12.34  )
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

SGkgVHVkb3IsCgo+ID4+PiBGaXhlczogMjA5NWU3ZGE4MDQ5ICgibXRkOiBzcGktbm9yOiBzcGFu
c2lvbjogQWRkIHN1cHBvcnQgZm9yIFMyOEhTMjU2VCIpCj4gPj4+IFJlcG9ydGVkLWJ5OiBKb24g
SHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPiA+Pj4gQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzY2YzhlYmIwLTEzMjQtNGFkOS05OTI2LThkNGViN2UxZTYzYUBudmlkaWEu
Y29tLwo+ID4+PiBUZXN0ZWQtYnk6IEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgo+
ID4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4gICAg
Cj4gPj4KPiA+PiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5h
cm8ub3JnPiAgCj4gPiAKPiA+IFRoaXMgcGF0Y2ggd2lsbCBvbmx5IGFwcGx5IG9uIHRvcCBvZiBz
cGktbm9yL25leHQuIEl0IHdvdWxkIHNwZW5kIG1vcmUKPiA+IHRpbWUgaW4gLW5leHQgaWYgb25l
IG9mIHlvdSBhcHBsaWVkIGl0IHRvIHRoaXMgYnJhbmNoIGJlZm9yZSBzZW5kaW5nCj4gPiB0aGUg
TVI/Cj4gPiAgIAo+IAo+IFRoZSBwYXRjaCBpcyBpbnRlbmRlZCBmb3Igc3BpLW5vci9uZXh0IGlu
ZGVlZCwgYXMgdGhlIGJsYW1lZCBjb21taXQgd2FzCj4ganVzdCByZWNlbnRseSBxdWV1ZWQuIE5v
IG5lZWQgdG8gdGFrZSBpdCB0aHJvdWdoIG10ZC9maXhlcy4gUHJhdHl1c2gKPiB3aWxsIHRha2Ug
aXQgdmlhIHNwaS1ub3IvbmV4dC4KCk9rIHBlcmZlY3QsIHRoYW5rcyEKCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
