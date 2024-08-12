Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9851C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Oc21MKF/oN6vTV3QEoy+TgSn3tWksP+MQdfLRM96aw=; b=GGDfx7crVhHsuz
	y6iyD10qrc9wi4oEWTpPSyrwQeG0+XM7u2Ku/rjmrVOWjCi4Tkj93o/XwVRWiXJ5RJ5kElri8Iaxb
	FztithOxlHzNSISrMGdjT1K7e9fM9rP/Y0hXX8jHFotBW37oXzneIHw9uHCbzjkzmAed1MBHPaDdg
	m2QE9Ne4hDz7vqMWCaAbu+fRX4AHylNNQVT/Fldm3z7zr7+ehZ4kQWmTyRkHQIEyNBxqQZkFqdSt2
	SGLj//iQowadbvxgkm7VGNWkHGVtDQ1QSSyaks5J4ClfoPd5GpPCpBnBRgstXU8L8xp9l/mwbvfZE
	5TQ6jpWVM29Nbr/gxk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQkg-0000000HK7h-3yBV;
	Mon, 12 Aug 2024 08:50:06 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQkd-0000000HK6t-20eU;
	Mon, 12 Aug 2024 08:50:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7AE420007;
	Mon, 12 Aug 2024 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723452599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73GvcgdSLrMZXGcYPjAJiYsspT+yFL38vgOcQSxgjFk=;
	b=hsUZH/C8PXrcNQJubX+GqA3kU3D3BCLoUqm0Nuwf/7zwdpBWAhom6I5lp+UeuskT4/kWmz
	ftrP1rxNG10SZ4ErGuXCdc33Wl9LPw6QSB++RRHH3gFDd/uYKExSJGihp9k5EO5DGpZRWS
	Vhug+ZdnbZCC7T/doh7pjomhBB0v6AthvjEYPTC1WEKTeV+zjEPFpeqqEOmZKcIVzCdP9N
	VckV7vn4nKMrx12x2qerZAXsz4COE8RZhfbTGbMmn5Dhhlo7SqFwIws17BKJcODEQDwM+P
	bJ4gepsVvcU/1x3lF6f4fU2YKzRk3W0mow+kBu19yQpGsDh6BtkWPN96iehkMw==
Date: Mon, 12 Aug 2024 10:49:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Joern Engel <joern@lazybastard.org>, Keith
 Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Saravana Kannan
 <saravanak@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Florian Fainelli
 <f.fainelli@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v4 0/7] mtd: improve block2mtd + airoha parser
Message-ID: <20240812104954.1e8d55f7@xps-13>
In-Reply-To: <20240809172106.25892-1-ansuelsmth@gmail.com>
References: <20240809172106.25892-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_015003_689614_6009C28A 
X-CRM114-Status: GOOD (  22.84  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAgOSBBdWcg
MjAyNCAxOToyMDo1OCArMDIwMDoKCj4gVGhpcyBzbWFsbCBzZXJpZXMgaGFuZGxlIDIgcHJvYmxl
bXMuCj4gCj4gSXQgZG9lcyB0cnkgdG8gIiJzdGFuZGFyZGl6ZSIiIHRoZSB1c2FnZSBvZiBibG9j
azJtdGQgbW9kdWxlIHdpdGgKPiBNVEQgT0Ygbm9kZXMuCj4gCj4gSXQgaXMgdmVyeSBlYXN5IHRv
IGFkZCBzdXBwb3J0IGZvciBNVEQgcGFyc2VyIGJ5IGp1c3QgYWRkaW5nIGFuCj4gT0Ygbm9kZSB0
byB0aGUgbXRkIGNyZWF0ZWQgZm9yIGJsb2NrMm10ZC4KPiAKPiBUaGlzIGFwcGx5IG9ubHkgaWYg
dGhlIHJvb3QgYmxvY2sgaXMgdXNlZCBmb3IgYmxvY2sybXRkIHRvIGFsbG93Cj4gc2NlbmFyaW8g
d2hlcmUgdGhlIGZ1bGwgZU1NQyBvciBhbiBOVk1FIGlzIHVzZWQgZm9yIE1URCBhbmQgaXQgZG9l
c24ndAo+IGhhdmUgYW55IHBhcnRpdGlvbiB0YWJsZS4KPiAKPiBUbyBhbHNvIHN1cHBvcnQgTlZN
RSwgc2ltaWxhciB0byBob3cgaXQncyBkb25lIHdpdGggZU1NQywgd2UgaW50cm9kdWNlCj4gYSBz
dWJub2RlIHRvIHRoZSBOVk1FIGNvbnRyb2xsZXIgdGhhdCBuZWVkcyB0byBoYXZlIHRoZSAibnZt
ZS1jYXJkIgo+IGNvbXBhdGlibGUgd2hlcmUgYSBkZXYgY2FuIGRlZmluZSBmaXhlZC1wYXJpdGlv
bnMgZm9yIE1URCBwYXJzZXIgdXNhZ2UuCj4gCj4gVGhpcyBzZXJpZXMgYWxzbyBhZGQgc3VwcG9y
dCBmb3IgdGhlIEFpcm9oYSBwYXJ0aXRpb24gdGFibGUgd2hlcmUKPiB0aGUgbGFzdCBwYXJ0aXRp
b24gaXMgYWx3YXlzIEFSVCBhbmQgaXMgcGxhY2VkIGF0IHRoZSBlbmQgb2YgdGhlIGZsYXNoLgo+
IAo+IFRoaXMgcmVxdWlyZSBkeW5hbWljIGNhbGN1bGF0aW9uIG9mIHRoZSBvZmZzZXQgYXMgc29t
ZSBkZWRpY2F0ZWQKPiBkcml2ZXIgZm9yIGJhZCBibG9jayBtYW5hZ2VtZW50IG1pZ2h0IGJlIHVz
ZWQgdGhhdCByZXNlcnZlIHNvbWUgc3BhY2UKPiBhdCB0aGUgZW5kIG9mIHRoZSBmbGFzaCBmb3Ig
YmxvY2sgYWNjb3VudGluZy4KCldobyBpcyByZXNlcnZpbmcgdGhpcyBzcGFjZT8gQW5kIHRoaXMg
aXMgbm90IHJlZmxlY3RlZCBhbnl3aGVyZSBpbiB0aGUKcGFydGl0aW9uIHRhYmxlPwoKPiBOZXcg
YWFyY2g2NCBBaXJvaGEgU29DIG1ha2UgdXNlIG9mIHRoaXMgcGFydGl0aW9uIHRhYmxlIGFuZCB1
c2UgYmxvY2sybXRkCj4gZm9yIGVNTUMgdG8gdHJlYXQgdGhlbSBhcyBNVEQgd2l0aCBjdXN0b20g
YmFkIGJsb2NrIG1hbmFnZW1lbnQgYW5kIGJsb2NrCj4gdHJhY2tpbmcuCgpJIGFtIHNvcnJ5LCBJ
IGFtIG5vdCB1c2VkIHRvIHN1Y2ggdXNlIGNhc2VzLCBhbmQgSSByZWFsbHkgZmFpbCBnZXR0aW5n
CndoeSB5b3Ugd291bGQgbGlrZSB0byB1c2UgbXRkIHdpdGggYW4gZU1NQy4gQ2FuIHlvdSBleHBs
YWluIGEgbGl0dGxlCmJpdCBtb3JlIHdoYXQgaXMgbm90IGF2YWlsYWJsZSBpbiB0aGUgYmxvY2sg
d29ybGQgdGhhdCB5b3UgcmVhbGx5IG5lZWQKZnJvbSBtdGQ/CgpBbHNvLCBkaWQgeW91IGNvbnNp
ZGVyIG52bWVtIGxheW91dHMgaW5zdGVhZCB0byBkZXRlY3QgYW5kIGRlZmluZSB0aGUKQVJUIGFy
ZWE/IChqdXN0IGFza2luZykuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
