Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4BDC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 19:04:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102C961574
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 19:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102C961574
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BRv94foLSQb7GedkxPtwAKxTntVHiuG52+HJBemy+s=; b=Rg3TUy85+WALccZAAVP7qjFDy
	/1x4J/U77tz5UOVV4wTIh6wiXBYwarmInynm1EZsWZvH6RljHdqx8i6NG3ggnME6tQtwPVhEOftic
	yhkP2vJ6mHm4O5NrqtDQSJ4CS8YR9G2UAhoPhfJgl7MM0lMPyvSjVd+sWPT6yxrs5VAf6yjsaH8AQ
	QvzxjxrsfKtMcHZg3mbfXrnRuTTBDvvJ2Na9rgssnCivCPuKZwrxGDgkPp/xXZK8V3XNJQSFBfqI5
	tDv+bdyA7sHYydQ1tAvuIWFk46CE+YQ+69yJ57bpaBoJt/M2h8txXMUkmU2Yd5fKrVFChglGaCKRp
	s9Z5XchUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOmJV-00FZA2-Jo; Tue, 23 Mar 2021 19:03:37 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOmJQ-00FZ9S-Tx
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 19:03:35 +0000
Received: by mail-il1-x12f.google.com with SMTP id d2so19124731ilm.10
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YWYa+TcfGVaCwF0IqKQL2bqvSxPHonlkY8ibD7lEQyg=;
 b=duHVlhzccYoLjMr9b99zB0s377S814D7H1nZ1dbRhtnRuM+NAopcpLYfh6BDcGZHlJ
 fgwxiymAieVu5gN5Xthx70hY/rjBD5SsXMb9pLk82jp+bcPk0XAWjNY7Gk9kga9rXePH
 MZGNw9Cx2+oBU/foElcdbKPe+iIZssr/tLLZK70zNDZ4HVZViNe+DHkrBVNVE1vmWPUb
 /dmScktILUVe4tDDXBo4v78CeRMx/w8YkyBuwlXcpEYxMTinkmJbjYVG2gqfT9SWFHBR
 uNWVUAIG4R7wbmP49jCRNhpUGduYI7cg71tK1qGi6g3xa+7zafvS+zsi0oxbhFfDzFie
 lAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YWYa+TcfGVaCwF0IqKQL2bqvSxPHonlkY8ibD7lEQyg=;
 b=hNSlJ1+XH89xsIyMffX2YiNsf6FETLUZzl0+OIlsygXRQJnD8J4vVXKwD0TUwcvluE
 eVA3AUyk+w7ii9IVFEUYo7vKmQpKR6aTS725OJb6ps9wep2N8xWoGPbSl2a3bYcZhVvF
 cYO6pNhMrslyz9BUBSJKdnGZJTatpvAxFaSMqVUPxgVd/9bBeukpiHrCsUwMSq9j4hiQ
 yoMSM1GCa6eXPdg5R1GqbB2ludxg112bqq32cubIiwQgbKLSvmVwjxE/sxN2DIfrEWRo
 g3L0IE6jSHIW6ia1likEcDye662loKLpzJrLo98OAkgHujaehMg3mvvCdlVvA7r3PrtP
 ciLw==
X-Gm-Message-State: AOAM532wDvR6qBZT14JC5oSszdaYCnSGxo34wGwWIlTocn7IMjTr4PfA
 CMU5fUiaKmV//d+EHnKzYyYP7yn/QrufC7aMvsk=
X-Google-Smtp-Source: ABdhPJy+eqhOJWib5PnATu7JhGRPXkoyrDHjgz3a04JaXyZAipLcS5x46GFZ5K3QeBj+ILjyxwN+ezZMBqO6AfqzdGw=
X-Received: by 2002:a92:c5d4:: with SMTP id s20mr5673781ilt.225.1616526209395; 
 Tue, 23 Mar 2021 12:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210323143144.12730-1-michael@walle.cc>
 <20210323143144.12730-2-michael@walle.cc>
 <20210323173715.gyozhzbjyfv5osuc@ti.com>
 <C88FBBF6-4F5C-43A1-951E-332AEE9E3B3A@walle.cc>
In-Reply-To: <C88FBBF6-4F5C-43A1-951E-332AEE9E3B3A@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 23 Mar 2021 20:03:18 +0100
Message-ID: <CAEyMn7bt6iYVBUOoJGs1a2VA-AWf7AyCJ0MJXN9NzQsOuVaQqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
To: Michael Walle <michael@walle.cc>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_190333_284642_FE04DBDA 
X-CRM114-Status: GOOD (  11.41  )
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

SGkgTWljaGFlbCwKCkFtIERpLiwgMjMuIE3DpHJ6IDIwMjEgdW0gMTk6NDUgVWhyIHNjaHJpZWIg
TWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz46Cj4KPiBBbSAyMy4gTcOkcnogMjAyMSAx
ODozNzoxNyBNRVogc2NocmllYiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Ogo+ID5P
biAyMy8wMy8yMSAwMzozMVBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4+IER1ZSB0byBwb3Nz
aWJsZSBtb2RlIHN3aXRjaGluZyB0byA4RC04RC04RCwgaXQgbWlnaHQgbm90IGJlIHBvc3NpYmxl
Cj4gPnRvCj4gPj4gcmVhZCB0aGUgU0ZEUCBhZnRlciB0aGUgaW5pdGlhbCBwcm9iZS4gVG8gYmUg
YWJsZSB0byBkdW1wIHRoZSBTRkRQCj4gPnZpYQo+ID4+IHN5c2ZzIGFmdGVyd2FyZHMsIG1ha2Ug
YSBjb21wbGV0ZSBjb3B5IG9mIGl0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBX
YWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPiA+Cj4gPlJldmlld2VkLWJ5OiBQcmF0eXVzaCBZYWRh
diA8cC55YWRhdkB0aS5jb20+CgpUZXN0ZWQtYnk6IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5
QGdtYWlsLmNvbT4KCj4KPiB0aGFua3MgZm9yIHJldmlld2luZyEKPgo+IC1taWNoYWVsCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
