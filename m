Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B646C87FCE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mum/inuCSG2uiv56IpD9HYms0GaMzPpcyG2V5duP+KA=; b=r3SKMzq+WKuyd+
	fh3wcKFd77cUKR0oQF3PtKJ9RKJ2m20FLLZBTTKPfdAG72fouapLsZjmINOXURbijLRhlvlWubqze
	jU8Oq4r/slMuXKurptZqV7VdqyQ4qphlDUzpISCvDNS44w5fKJjOqdTJD9vCqWqU3TTkFRI0bzaiM
	YYQgKqaQ67lNlbbVq9IjcCNauXQLGrlxFhl4jx92tNqPTtIwc0o0ovloQEaayLw8vlLbFrCIB11BW
	VbXBr2B+CTqSCxC5Ei1i3SNc+iyqzABzJ+cXamW3JlmfKi/E4s1kCzgtfD1qt+ffY2ipsaI5IP1UB
	ibC6QSjKYjr5Q9sJYC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFNw-00000002vuz-0a4x;
	Tue, 22 Jul 2025 15:58:32 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDyj-00000002hi9-0uJj
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 14:28:26 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bmfkt5gPlz9sqs;
	Tue, 22 Jul 2025 16:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753194502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoZeSq3Ft9zf022HB19vAIpK1dHjyTYwqBtZvyRFCXI=;
	b=eZtIqqwp/7w6FnBDYMq9ulsCseyYSJI6D81LFNCvmmCN+Eh4peo1IvAV1sDxLtyVYQXsra
	lKfqeZ92TJqSGet9uB1onzjqbe5WzYx6VAf/SM8crVDKIpItL/SbSb7GaDK2UghkLyj9YQ
	HI2JWfx0nV6zIoF6bZe3ndqBZcTTPQ2dJvuqJYHJh6O1bg+z5Icqr8aDwGT9EC3FO7Z3gb
	q8rxT9XdTsQ0TZc2SJR0dPKgE7tkvBmEzl2WsVKovlFmYye9KboGwLOPHSWjqUN8s2FoFl
	xKFUuNGRNu2+cKK8r/YgG6t68xb77pnA36R6LTtLSbXhP/TEj1wr92WDk5IHDg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QWzlBzep;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753194500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoZeSq3Ft9zf022HB19vAIpK1dHjyTYwqBtZvyRFCXI=;
	b=QWzlBzepyhq2y1E5mc3THppQod1M4AOspjRIxVn/hXKoPsFj0opxOLv2xncbqHqdDKgiZ1
	rEF1juluq6IUvCPSfESIWmA+xZm87wPSdIPEpx1Cuo47u+yn8hoCT0Avwx/VxZoWqHIDiU
	HrnJKGuJjA8S6KG5xpL1oRXDiKzVuB/LFqxbRA+w4xsZAWGYukQlWVZZMwCfECjHXcjoHi
	TnaU/e6BHnkazTUm4PVmkqGG4vctDbqPbmTs4j8PJIge6RJ1dAHCN1LT7J53EkIwsPqACP
	p6kgupxN4nPLayYLh8kySqki7J1CuOfyu07NWNB1BWImY1elWE7KWDnz9fhLIQ==
Date: Tue, 22 Jul 2025 16:28:17 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Michael Walle <mwalle@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <9eabfe619554cbdd493086dcffef8f44@kernel.org>
X-MBO-RS-META: 9hjry69xq8ezz76u599fti8f57agswgn
X-MBO-RS-ID: 39ef04fce8a48af26b9
X-Rspamd-Queue-Id: 4bmfkt5gPlz9sqs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_072825_459500_6165F4D7 
X-CRM114-Status: GOOD (  14.32  )
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

T24gNy8yMi8yNSAxMDo0MyBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSBNYXJlaywKCkhp
LAoKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPj4gKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci93aW5ib25kLmMKPj4gQEAgLTM0Myw2ICszNDMsMTAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBmbGFzaF9pbmZvIAo+PiB3aW5ib25kX25vcl9wYXJ0c1tdID0gewo+PiDCoMKg
wqDCoMKgwqDCoMKgIC5pZCA9IFNOT1JfSUQoMHhlZiwgMHg4MCwgMHgyMCksCj4+IMKgwqDCoMKg
wqDCoMKgwqAgLm5hbWUgPSAidzI1cTUxMm53bSIsCj4+IMKgwqDCoMKgwqDCoMKgwqAgLm90cCA9
IFNOT1JfT1RQKDI1NiwgMywgMHgxMDAwLCAweDEwMDApLAo+PiArwqDCoMKgIH0sIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIFc3N1E1MU5XICovCj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9S
X0lEKDB4ZWYsIDB4OGEsIDB4MWEpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm90cCA9IFNOT1JfT1RQ
KDI1NiwgMywgMHgxMDAwLCAweDEwMDApLAo+IAo+IERpZCB5b3UgYWxzbyB0ZXN0IHRoZSBPVFAg
cmVhZCBhbmQgd3JpdGU/IEknZCBndWVzcyBzbywgYmVjYXVzZSBvdGhlcndpc2UKPiB5b3Ugd291
bGRuJ3QgbmVlZCB0aGF0IGVudHJ5IGF0IGFsbCwgcmlnaHQ/IE9yIGlzIGl0IGJlY2F1c2Ugb2Yg
dGhlCj4gd2luYm9uZF9ub3JfbGF0ZV9pbml0KCkgd2hpY2ggd2lsbCBiZSBjYWxsZWQgYXMgYSBt
YW51ZmFjdHVyZXIgZml4dXA/Cj4gSW4gdGhhdCBjYXNlIHdlIGNvdWxkIGRvIHRoZSBzYW1lIGFz
IGluIGNvbW1pdCBhZmUxZWExMzQ0YmIgKCJtdGQ6IHNwaS1ub3I6Cj4gYWRkIHN1cHBvcnQgZm9y
IE1hY3Jvbml4IE9jdGFsIGZsYXNoIikuCgpJIGhhdmUgbGltaXRlZCBzdXBwbHkgb2YgdGhlc2Ug
ZGV2aWNlcywgc28gT1RQIGlzIHVudGVzdGVkLiBUaGUgZmxhc2ggCmRvZXMgaGF2ZSBPVFAgcmVn
aXN0ZXJzLCB0aGF0J3Mgd2h5IHRoZSAub3RwIGVudHJ5IGlzIHRoZXJlLiBXaHkgc2hvdWxkIApJ
IHJlbW92ZSBpdCBpZiB0aGUgT1RQIHJlZ2lzdGVycyBhcmUgaW4gdGhlIGNoaXAgPwoKLS0gCkJl
c3QgcmVnYXJkcywKTWFyZWsgVmFzdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
