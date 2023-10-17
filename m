Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5A6CDB482
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmM954F0ZtPuRRol1/Wx4+LQFLQILKOrzkUhHxnFkL8=; b=x8pCX27Nv/NpC/
	lti6bWETgg/nCEs/MCUoQZBoEUPH4ICkIb91nnd4FQRVKy3NxOYQo34x2yrXTDAvQXKJDXQP/1Cai
	nKk/gg+3A/RmmdDYPnrFLu03wMxL3hGsjPuYR42zZfeZAjWW4d0AxFpsLqXAlP+65e+6Uq+5u30TX
	ba/1zz88Kj6CXAM2ZXTL2UvYV/iTo0jDFBgIvPF6Sl0/jDXB8Ixw1gNZ9P1AGg0ywh7vKiumpZ3eP
	Ezj2NXMleYCzA/WmdCteF/sAdMck1Vlyya89treyqXywirrpe8ikHR3SeMEDKejO/ABvFgpNQjN+C
	mOn2dilI84lZEjenu84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdQZ-00BOkj-37;
	Tue, 17 Oct 2023 06:19:39 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdQW-00BOib-2C
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 06:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697523547; x=1698128347; i=dregan@mail.com;
 bh=OCzpcPJYWTm55NILWrEHdxx2mUzUdjNTSSAX856IqR0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GaB5boq4mY3l5Cdb9Qo8aLHUlVZ8R0qaroBh5137derrePGo0MWhf+9Ya06AKq8J3iGYrl3Aprt
 be+M4n6WqTP1SxQrRrNTT/pjIiUD9LgVJMIkWfcK0IIo7fLwcuswB9k+oAKIs79irmYonZYo0P0EN
 8Bhv8hfGH1pBH2wOvbs/43/HFxy2xXYqcVXmdmNm29rhiW/2aQfrdYO/f9nAfZJa8LO7l9EWfTHfb
 56YqcEXEry3DILQkAENQRxRWONgllbZbozcD3kCi9oqPCSECOb0DRFgBcYYRu2ufbmZzDq4oeuyO7
 Xs1ws98GA3LvALHQsoSOi+8Nl1h0FN7XmcWg==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa03.server.lan [10.76.45.4]) (via HTTP); Tue, 17 Oct 2023
 08:19:07 +0200
MIME-Version: 1.0
Message-ID: <trinity-cbcf4faa-c0bd-4cac-a435-2ada79887cda-1697523547686@3c-app-mailcom-lxa03>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add destructive operation
Date: Tue, 17 Oct 2023 08:19:07 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20231013104809.15821b9f@xps-13>
References: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
 <20231012090638.1e093fe6@xps-13>
 <trinity-902f8ae6-26e3-484b-ba2d-00946a63333a-1697132171458@3c-app-mailcom-lxa13>
 <20231013104809.15821b9f@xps-13>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:8wryIvEopZld7KhhsexkYsQbnweX30+lyy26TvFnS46GcdZuEKHWMRfXxuGzg1OPR8zj9
 1JimZwq4bYdrRvR9zFFFQAIqoNO6cOz87Qg6yDMtTZEzDbvvPl5LYxWdAKtOSyBR6X49CGs/yXtl
 8mQSZTbVWo4QR7Cucrd9M3/LmX5tJPzphpVDRdB0IkTeKmY5W+5Bjq5EJnBtbBEmU2w8VPPOC4me
 wUjzip11j+YJ/qQpmiGBDM+LNSsiRqq9QXICGU68toRiGWi7EjJbaFiqARLsC54VFqoAqxx/ym76
 rE=
UI-OutboundReport: notjunk:1;M01:P0:SCDLEANuhQI=;ljXFcf3oCGCUdetU11nQPxJhL3T
 kqftne2BMBJafjvK4k4A5YPB2ivo3VWc6bKOiJZ8yBMAATAzrgNG1g6SYWCtqv2DsWtIaFkax
 llXYxBsC+UWTTobVrJxC9efe1pHYwYvjqHcK30BrttbUUdyGuJD0Lmsdv2YJB6/3t7eW/lWmU
 FlUeuPYVVPXQfZPaxV6nXQDHZS/MHbnzpoRCATeFLJbvkFyBdVo2R2kcRboUZZ43vkUqF2WQt
 bppqxvHm/IdSCX8RDnFg6WE9+pvxBRVXEW9aGh32coSh1iTTHzErgQdSPyMDU+WVJRA2aWABK
 0DU/8H5DeDpaYsn0gSxHqEpJr+VCrR/+eZhjU9nilTJLRiXHgz+rEQ047uj7Iv5XKZkwSoG7j
 uUbfAkNsgLV+JLM+BpFhFCYnvm9Q3nyGW/iwV8TCtEVc2zX5OLgbzByriGpN1b9G9ldi8zmKI
 4nPedGJTBbsaJqJrb7bR8j12VVOC3KiC3GU7eZkkNEgXMqVi4SFMQYg3rSiiLQK9a1w/7p4/1
 z+NKUhlBPnCR6S4AAAC7ABZVEr1G2ArdDXnuXUsXMSxnmIqBaQzzbUm7Zl2IBHqomgIYUMKVo
 OU0yVnwYELmeRFK/KAS5lJ7qxQIRy02VJE7ZugCH6OCvJWMTiwJzjw0ch+6LWmjr9fTXzN33c
 NLtbGByPy9naOy7m4cJq9470/kKDQBuVxdgZ2eKN6gKdR4lMY22JUxzBPbXuUcx8UuUUyRjYG
 qN0H/XOUhCQHIe2DK/dmy99sYmWObb6RZISDbG640sEklWSEX633IWN/+K+PKC6vF/TVCIVLl
 e5pUJcyO5F+xM3zqp7OkzPA+3uETnnWMz8E+7fVVerbQk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_231936_979808_052942D1 
X-CRM114-Status: GOOD (  12.25  )
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

SGkgTWlxdcOobCwKCi4uLgoKPiA+ID4gUGxlYXNlIHVzZSBCb3Jpcycga2VybmVsLm9yZyBlLW1h
aWwgZm9yIHRoZSBhdXRob3JzaGlwIGFuZCBTb0IgIAo+ID4gCgouLi4KCj4gCj4gSXQncyBpbiAu
bWFpbG1hcDogYmJyZXppbGxvbkBrZXJuZWwub3JnCj4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgUmVnYW4gPGRyZWdhbkBtYWlsLmNvbT4gIAo+ID4gCj4gPiBEbyBJIHN0aWxsIGtlZXAg
dGhpcyBTT0Igb3Igc2hvdWxkIEkgY2hhbmdlIGl0IHRvIHNvbWV0aGluZyBlbHNlPwo+IAo+IFlv
dSBuZWVkIGJvdGggU29COiBoaXMgdGhlbiB5b3Vycy4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+
IAoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIGluZm9ybWF0aW9uIQoKSSBiZWxpZXZlIEkg
aGF2ZSB0aGUgZ2l0IHNlbmRtYWlsIGlzc3VlcyByZXNvbHZlZCwgYW5kIEkgbWF5IGJlIHNlbmRp
bmcKdGhlIG5leHQgcGF0Y2ggc2VyaWVzIHZpYSBhIEJyb2FkY29tIGVtYWlsLiBJbiB0aGlzIGNh
c2Ugc2hvdWxkIEkgc2VuZAp0aGUgc2VyaWVzIGFzIHYzIGV2ZW4gdGhvdWdoIGl0IG1heSBub3Qg
bGluayB0byBteSBwcmV2aW91cyBtZXNzYWdlcz8KKEFsdGhvdWdoIGhvcGVmdWxseSB0aGUgbWVz
c2FnZXMgd2lsbCBzdGF5IHRvZ2V0aGVyIGFzIGEgZ3JvdXAuKQoKVGhhbmtzIQoKLURhdmUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
