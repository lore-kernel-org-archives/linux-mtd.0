Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1716CC6B1A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E624J2KptjEsBxXpuorKr1cJS6t5qJLlRsmwBQbwC+g=; b=ZKljXVJs1STENa
	6ByBLp0Nz9uZAZ5CKKJg+Lwag5z/FkEHBIo31s07sFyz5Yv0QL3buA8P1l4S6z0Rm7pKJLqX9zkNV
	c/FekyYx3MNH2phFD3zHD0k0eKudJavcuYxb6p0UWSYyFm4Sbq8BAJDG1MdqeZTZ7FSYLEM4dcyNF
	+mTW121q9COTJ57mfTJSnioEFzuE/4dFQ6neSgU7JFh8q4Kji+qYJJawj9bdkE1JxYgh/2ZC5/don
	oJ+k6bGm/tTj4q3Hvh7kbx9yGQloe8VvzU3U3Aumf7hFjK9p/L+w7JHhj/6gRjXcrKppA4ggUeeVA
	HPYRv6Ihalmt4QcstVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeO-0000000Dl4z-1qf9;
	Tue, 13 Oct 2026 17:50:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeM-0000000Dl3j-1pRI
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 17:50:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E87C24E41214
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:50:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B725860362
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:50:52 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 6173511D7188E; Tue, 13 Oct 2026 19:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=;
	b=px8yhYifK6pY2vL4VeF+1ofJmpVxgjz2ILezcaB3j/bjLoMmLN4PHhyMB9qd3bPoAwwTX5
	o7GmstmZuVCm8cqdGcKZrgfhkCQdjfOQ26NoNGGZWVowxjQsR4+yVIomh/+z6XYIGn1vv6
	P9FpSOTfRh1E/gBfQR1NNUBnCRJrabhmF1Nkui9JUDPspPxwDlnxmICkf/54c4aGwLx4fN
	son4gPsr5ycQvOGb2dH9VCo9JqY7lHXq28y5N1PtU33AB+zg12zq24M58ZkK2FDdOqpdlq
	Y/BKuX7BLl5i1zw3ywaQxBHk7lwVWVGv9vWDb9PuQDnWXPEivXOgAAv2FYuzeQ==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	(James Hilliard's message of "Mon, 14 Sep 2026 15:09:46 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 10:06:50 +0200
Message-ID: <871p9v4a1x.fsf@bootlin.com>
MIME-Version: 1.0
X-TUID: hUm30DN6Lpz6
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 6173511D7188E
X-Spamd-Result: default: False [0.58 / 30.00];
	BAYES_HAM(-1.82)[87.08%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[33];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	BCC(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid];
	FREEMAIL_CC(0.00)[nod.at,ti.com,kernel.org,gmail.com,sholland.org,bootlin.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105054_634563_79902D2F 
X-CRM114-Status: GOOD (  14.29  )
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

SGkgSmFtZXMsCgpPbiAxNC8wOS8yMDI2IGF0IDE1OjA5OjQ2IC0wNiwgSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBbGx3aW5uZXIgTkFORCBmaXJt
d2FyZSBsZWF2ZXMgdGhlIGJhZC1ibG9jayBtYXJrZXIgaW4gdGhlIHJhbmRvbWl6ZXIKPiBkYXRh
IHN0cmVhbS4gT24gSDYvSDYxNiBpdCBhbHNvIHBsYWNlcyBhbGwgcHJvdGVjdGVkIHVzZXIgZGF0
YSBiZWZvcmUgdGhlCj4gZmlyc3QgRUNDIHN0ZXAuIFRoZXNlIGNob2ljZXMgZGlmZmVyIGZyb20g
dGhlIG1haW5saW5lIGZvcm1hdCwgd2hpY2gKPiBrZWVwcyB0aGUgcGh5c2ljYWwgbWFya2VyIHBs
YWluIGFuZCBtYXhpbWl6ZXMgdGhlIEg2L0g2MTYgdXNlci1kYXRhIGFyZWEuCgpbLi4uXQoKPiBB
c3Npc3RlZC1ieTogQ29kZXg6Z3B0LTYtYXN0cmEKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KCkkgYW0gc29ycnkgYnV0IEkg
ZG8gbm90IHdhbnQgdG8gcHJvY2VlZCBmdXJ0aGVyIHdpdGggdGhpcyBzZXJpZXMuCgpFdmVuIHRo
b3VnaCBJIGFtIG5vdCBjYXBhYmxlIG9mIGZpbmdlciBwb2ludGluZyB3aGF0IGlzIHdyb25nIGlu
IHRoZQpkaWZmcyBub3IgaW4gdGhlIGNvbW1pdCBsb2dzLCBJIGRvIG5vdCB1bmRlcnN0YW5kIG1v
c3Qgb2YgaXQuIEkgY2Fubm90CmNsZWFybHkgZXhwbGFpbiB3aHksIGJ1dCBJIGhhdmUgaGFkIGEg
aGFyZCB0aW1lIHRyeWluZyB0byB1bmRlcnN0YW5kCndoYXQgdGhlIGNvbW1pdHMgd2VyZSBkb2lu
Zy4gVGhlIHJpc2sgaXMgdGhhdCBub2JvZHkgd291bGQgdGhlbiBiZSBhYmxlCnRvIGZ1cnRoZXIg
bWFpbnRhaW4gdGhpcyBkcml2ZXIgYW5kIEkgYW0gbm90IHdpbGxpbmcgdG8gdGFrZSB0aGF0Cm9w
dGlvbi4gVGhlIGtlcm5lbCBwb2xpY3kgc28gZmFyIGhhcyBiZWVuIHRvIGVuc3VyZSByZWFkYWJp
bGl0eSBhbmQKbWFpbnRhaW5hYmlsaXR5LCBhbmQgbXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCB0aGlz
IHNlcmllcyBpcyBnb2luZwpzaWRld2F5cyB3cnQgdGhpcyBtYWpvciBjb25zdHJhaW50LgoKQWxz
bywgZnJvbSBhIExpbnV4IGtlcm5lbCBwb2ludCBvZiB2aWV3LCB3ZSBnZW5lcmFsbHkganVzdCBk
byBub3QKc3VwcG9ydCB2ZW5kb3Igc3BlY2lmaWMgbGF5b3V0cy4gSSBhbHJlYWR5IHRvbGQgc28g
UmljaGFyZCBHZW5vdWQgYmFjawp3aGVuIGhlIHdhcyB3b3JraW5nIG9uIEg2MTYuCgpXaXRoIHRo
aXMgYWRkZWQgdG8gdGhlIHBpbGUsIEkgcHJlZmVyIG5vdCB0byBtZXJnZSB0aGUgZW50aXJlIHNl
cmllcy4gSQpjYW4gc3RpbGwgdGFrZSBzb21lIG9mIHRoZSBmaXhlcyBpZiB5b3UgZmVlbCBsaWtl
IHRoZXkgd291bGQgYmUgcmVsZXZhbnQKYW55d2F5LiBJbiB3aGljaCBjYXNlIEkgaW52aXRlIHlv
dSB0byBzZW5kIGEgdjcgd2l0aCBqdXN0IHRoZSBmZXcgZml4ZXMKeW91IHRoaW5rIGFyZSBhY3R1
YWxseSByZWxldmFudCBvdXRzaWRlIG9mIHRoZSByYW5kb21pemVkIGxheW91dApzdXBwb3J0LgoK
VGhhbmsgeW91IGZvciB5b3VyIHVuZGVyc3RhbmRpbmcsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
