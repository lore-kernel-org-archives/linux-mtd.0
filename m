Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F2AC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVJX56gx0JVHcO6bao9O8hb21gbqDFRypGFUFxlbd2w=; b=efj/nlRXHA3vdG
	QZdxPpHDGaxW9f0HKPWeZ+9gFFifbmLNTRRk1c/xbRqMDF9k7sD2+DTCtupN2PqcvUPmHP2gkgusa
	sbJVY2Db5+/gcQ9OUoqXWfeL9ZjNZH/KBDYcUb2lF6tLZ6jKvkvXWh+zOob05IkZWQbAVCYvMBI6E
	j0legwN4vaLeJ5OPfy4MVoqIRU4v+XHLiC9+0BUTJIKREpnscYvR1qOqtzP+9wJzQ8MQazCOywlg1
	WgO5zQAkkwvIy5pAm/c3MHUCApkyZPiBWgCa1NrvWydOnlRa80SnUAZAtn4AMWFlk1cCTiCKQPEb0
	vFatb8VzEzN3R6ZgwR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypHh-00Ax7M-2x;
	Fri, 03 Nov 2023 08:12:05 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypHc-00Ax4A-1Q;
	Fri, 03 Nov 2023 08:12:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E9A260004;
	Fri,  3 Nov 2023 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698999115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhCb9xfMGnGelO1oTs5p4gDzov4wiM4t4UGVabygkgg=;
	b=O5jMg+LqqyOo+Yc3QBn/+2HlSjAjhg2nMv1Xy7Au5Bra9pS7juqaYkBhZjojaugncBpr2w
	mUzK5LKKWOgpjblQ6hQUXsScxCxIVTpLE1kOY6qZQy4Lg2N6jsLO5IMbimihk7zLNsGCS4
	8vyeg6jWddZgB6QSyAwqtTD14htuoPZKs3BKIQg/XcXqSY6jfCjNx6SZQB3hIHXfE3tuNE
	024TrxW5dHhRxXEDOn3RrtiS6jaaehKk/+uLbT1Ou8zWEsHaFy07/nY+Ic/UQ8HEr3w3M8
	7Qb1C6NvE62L4kSjy1EYh/1ILuwKgzhqxz7lpm3CnKbyLLFrC+nfuvKNEJkEXA==
Date: Fri, 3 Nov 2023 09:11:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Richard Weinberger
 <richard@nod.at>, William Zhang <william.zhang@broadcom.com>, Anand Gore
 <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 0/4] mtd: Convert to platform remove callback returning
 (part II)
Message-ID: <20231103091131.206e1eaf@xps-13>
In-Reply-To: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
References: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_011200_655928_5819D593 
X-CRM114-Status: GOOD (  13.82  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFRodSwgIDIg
Tm92IDIwMjMgMjM6MDI6NDcgKzAxMDA6Cgo+IEhlbGxvLAo+IAo+IHRoaXMgc2VyaWVzIGlzIHRo
ZSBzdWNjZXNzb3IgdG8gdGhlIHNlcmllcyAibXRkOiBDb252ZXJ0IHRvIHBsYXRmb3JtCj4gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyIgc2VudCBlYXJsaWVyIHN0YXJ0aW5nIHdpdGggTWVzc2Fn
ZS1JZDoKPiAyMDIzMTAwODIwMDE0My4xOTYzNjktMS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGUuCj4gCj4gVGhlIGJyY21uYW5kIHBhdGNoIGlzIG5ldywgbXkgY29jY2luZWxsZSBzY3Jp
cHQgZGlkbid0IGZpbmQgdGhhdCBvbmUKPiBiYWNrIHRoZW4gYmVjYXVzZSB0aGUgcmVtb3ZlIGZ1
bmN0aW9uIGlzIGluIGEgZGlmZmVyZW50IGNvbXBpbGF0aW9uCj4gdW5pdCB0aGFuIHRoZSBkcml2
ZXJzLgo+IAo+IFRoZSB0eHg5bmRmbWMgZHJpdmVyIG5vdyB3YXMgY29udmVydGVkIHRvIGEgbm9y
bWFsIHBsYXRmb3JtX2RyaXZlciBmaXJzdAo+IChpLmUuIG9uZSB0aGF0IGRvZXNuJ3QgdXNlIHBs
YXRmb3JtX2RyaXZlcl9wcm9iZSgpKSBhcwo+IHN1Z2dlc3RlZC9yZXF1ZXN0ZWQgYnkgTWlxdWVs
Lgo+IAo+IFdpdGggdGhpcyBzZXJpZXMgYWxsIG9mIGRyaXZlcnMvbXRkIGRvZXNuJ3QgbWFrZSB1
c2Ugb2YKPiBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSBhbnkgbW9yZSBhbmQgc28gd2UncmUgcmVh
ZHkgdG8gY2hhbmdlIHRoaXMKPiBmdW5jdGlvbiBhY2NvcmRpbmcgdG8gdGhlIHBsYW4gZGVzY3Jp
YmVkIGluIGNvbW1pdCA1YzVhNzY4MGU2N2IKPiAoInBsYXRmb3JtOiBQcm92aWRlIGEgcmVtb3Zl
IGNhbGxiYWNrIHRoYXQgcmV0dXJucyBubyB2YWx1ZSIpCj4gCgpMR1RNLCBJJ2xsIGFwcGx5IGF0
IC1yYzEuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
