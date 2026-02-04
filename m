Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7643FE8B387
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC+zAJnyeHxK0h4Y0Huu+HoI0Nj5WY8F455Q0WtVaB0=; b=JNsTCLxsb0tjAZ
	mBVYSd1D9eO9Ls4klvcYV8eFu+YVTVDO19ylFJKKLimZruFN5F5ZqvCkY8hqLaiBFh0msM4TociNA
	ilu9D0vNZkF3VkCwV32TK0wYevn3nuh2iSW9rRbg31rzQavWlzKgGqIhZreIYyV40gRNDgGQsBZXt
	giS2YbdIW9kU/LfBFtWnPkipjaQbCwz0gqpMm9mUrWd/+RCCmiPdOdMMnd6oiNRxakA5jufhWLB5f
	eWiP2UUQFwlgSa3N7ljjWCjA/BEt8ua9nKJ6AWfrvY665uItTgntiTH5zejX11ivAwu26DI5IVQEX
	3X5MFQP1kjhUe4oh8cUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS0g-00000007ihm-07D7;
	Wed, 04 Feb 2026 01:48:50 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS0a-00000007ih5-3QsA
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 01:48:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so4851800a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 03 Feb 2026 17:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770169724; cv=none;
        d=google.com; s=arc-20240605;
        b=N71hLaKtwEFdqE8KyKxlJccUguu+6oq9td2KbmXjIRtVMzxoYK6VckVIvPhtck5izU
         i8tacusdMQFqE9To47ie4u/+bzvaXyWkYa8k8lwvNkQSZsE3do5ey9QaShoUyJ0mLeQM
         pQ7gGt200CGbYOi0oIMklEO9Fd2Q08EfNsqkRCQoqaagTRrWACkgSJ4l/rnEMivFALZN
         dj9OuIEvgyXzjzNyZl+dDKV0aqQ6CM1dsKWtCxV+0KjboH8Q9gZxAeBhzKXGK/ygJgmM
         yhtwEbFL4yBlJ9ETjl7HEHl0s1ZPxtq+VhxBmeh1NEgaDb8y6TyB6jL5BeDcDXVi1env
         sd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xpdZgaRrbOzzQujOMXcIQcgsg1I6UMPk8lgui/ZfmGE=;
        fh=zmBmyKCntbheBkQlPJb9Eu58BwQ7lTR7/ThZKuyBNKc=;
        b=KwnEt3KMut9bqnbFprAniFzCYpX9KL5yHMoKX1Hr7sNnYPWdIQ5a8hCAEEXEwmnBGE
         B8uxXl4UjLEKT2JVJ0hNVVcb4UqI5ZLPVb0pLm8542BGYZBbYKV6UcENJD52ij/DCMWS
         c2jBiUk4E3gEohmPujY36eOmtpMAuHvYG7I/gwJuooGhfFvw6hoBPE8dNDUyw767ckeV
         pzwlxXh9DGLLPznZbgfiz3EnoQEeoTZ2vaKNcisH7xTcy9Og7rRKb3e7x7aW0YhqF5P4
         23gYtUbs9zcui/l8qBz+S+RGQSAg/aBtX2s4SUX+SleZst3FSplSlfkkp7AdHAhc19gj
         nSyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770169724; x=1770774524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpdZgaRrbOzzQujOMXcIQcgsg1I6UMPk8lgui/ZfmGE=;
        b=iJ7gbDgvHb6oVKqubHS7QZVo/zbsHLdwYpFAsHpQjBGCTZk1ooMfJXzAin0tlV8qDD
         NdeUuFT9sgmmww7w9KdVFM4rjQjd977Azg8DmnL5sOgb2DwB/gecezMrbjomUEfV15Oz
         gtT1XC/q1yu+zpuERopose0q+z5ymCtM54NnWSZ4JpvAj0kh6dMLxli4FzFjWaIz43hC
         F5qykzL0zvZT6/H4Tije8agTfolDNQRt5aKrfHxiImUY1JqHkRnOEYIp5DkEOnFx+NRM
         oDnsc5/HLMU0TTN1UdTP/yG1dOXRu//+p/6CvMWB+qBF0GQPrUz9wzElfwiVGPWhGneI
         jexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770169724; x=1770774524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpdZgaRrbOzzQujOMXcIQcgsg1I6UMPk8lgui/ZfmGE=;
        b=Pj8uUd4fwaufrxLaa8mvArO6G4Ht91rFzXgc8tfU9uEdBQDfKqnREyH809RDbBzi4I
         zpnzBaG0DR+bgCN7G9d2dMeEEEPpWDuhSXCpPXy1mKWpr55MfAnjMZV7kXg16h4vmOjC
         Ssw4SMAr3Gkq4IfmapSvitWyq17ENiJ3ie+MOZ69EhudKpyu2+y5wSGCJLYOVQYnLa4y
         rAaY3h1syQpnU+8v3aI96Zz4M4tWJAamQFcM4SK4pqqvX+IvRTzfkHBhxbuxD7EoXhHJ
         hnUvNLe1XTZN02x6mpyQOCx2k/I4bsWAL/clNCvwp/vFceml7ZYKWbJ/sOz3Uwqy/ItU
         pzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6LodE415i9Pk0T99ec8/3ZyFmnykz9jrHltElbEXSiGaCEhkfUjhQ3pJLMMTZufuksVW79X71yhA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyS+Nl/9I6TgosAxZ+KF4N67UZ796JPhAd7Z/e4ftt3Rnk1wc06
	FMluy5yZgXYI5V/3hk6oRbhU9zOogdeGg/CICwIFisPQl1Lm05qm62GXav2kXfNz8mRBklbwZGw
	B7ThIiMZNQ0Zj825Bwfr3wGyiQyJQkZo=
X-Gm-Gg: AZuq6aIAp1t6XuQ3sH6XQNexWm7vcdvO607BfeQY4//opbEUIne5IPF39okUET8xx5Z
	0V42wPoMeqNCYVA47SWl4i6dIoYvnkzQjKLqJHHa5YoDxlbYwGHUU7+4rBXYxxN/AvXywzmR6bc
	ruaqMXG+sRBy2qu7lnXQdY9tjVVN/IutSr6FCyjNO41Ilwbsh2u2DsKQFtc9sqVkj/OdX0qX7wZ
	sgoP2y47dYLYl9JcFYApU41E/pTdeYGnFQkANtYSAWk9SAmEoXoYqwHwwmw5FEDD4bVi4g=
X-Received: by 2002:a17:90b:1fc4:b0:34a:4cc0:9e38 with SMTP id
 98e67ed59e1d1-354870dbcd1mr1229788a91.10.1770169723922; Tue, 03 Feb 2026
 17:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20260203021358.693291-1-linchengming884@gmail.com>
 <20260203021358.693291-2-linchengming884@gmail.com> <87ecn1hovq.fsf@bootlin.com>
In-Reply-To: <87ecn1hovq.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 4 Feb 2026 09:47:15 +0800
X-Gm-Features: AZwV_Qi7Js5j0XH4jPRUiTBVU-EOfrOpECkeJSLUJhHOpyYV-lb4Y8xzLUf9j-M
Message-ID: <CAAyq3SbZn5Hjx85xMS4cPYaoBccsiCj1obRbLO9eD9_RV=h7RQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: spi-nand: Add support for randomizer
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Martin Kurbanov <mmkurbanov@salutedevices.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_174844_859008_16B5319E 
X-CRM114-Status: GOOD (  35.68  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjblubQy5pyIM+aXpemAseS6jCDkuIvljYgxMDo0MOWvq+mBk++8mgo+Cj4gSGVsbG8gQ2hl
bmcgTWluZywKPgo+IE9uIDAzLzAyLzIwMjYgYXQgMTA6MTM6NTcgKzA4LCBDaGVuZyBNaW5nIExp
biA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEZyb206IENoZW5nIE1p
bmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRz
IHN1cHBvcnQgZm9yIHRoZSByYW5kb21pemVyIGZlYXR1cmUuCj4gPgo+ID4gSXQgaW50cm9kdWNl
cyBhICdzZXRfcmFuZG9taXplcicgY2FsbGJhY2sgaW4gJ3N0cnVjdCBzcGluYW5kX2luZm8nIGFu
ZAo+ID4gJ3N0cnVjdCBzcGluYW5kX2RldmljZScuCj4gPgo+ID4gSWYgYSBkcml2ZXIgaW1wbGVt
ZW50cyB0aGlzIGNhbGxiYWNrLCB0aGUgY29yZSB3aWxsIGNhbGwgaXQgZHVyaW5nCj4gPiBkZXZp
Y2UgaW5pdGlhbGl6YXRpb24gKHNwaW5hbmRfaW5pdCkgdG8gZW5hYmxlIHRoZSByYW5kb21pemVy
Lgo+Cj4gSSByZWNlbnRseSBoYWQgYSByZXF1ZXN0IHJlZ2FyZGluZyB0aGUgc3VueGkgY29udHJv
bGxlciBkcml2ZXIKPiByYW5kb21pemVyLiBJIHdvdWxkIGxpa2UgdG8gZ2V0IGJhY2sgdG8gaGF2
aW5nIGEgbmFuZCB3aWRlIHJhbmRvbWl6ZXIgRFQKPiBwcm9wZXJ0eSwgYmVjYXVzZSBhIE1hY3Jv
bml4IHNwZWNpZmljIHZhbHVlIGhvbmVzdGx5IG5vIGxvbmdlciBtYWtlcwo+IHNlbnNlLiBSYW5k
b21pemVycyBoYXZlIGJlZW4gdGhlcmUgZm9yIGFnZXMsIHRoZXkgYXJlIG5vdCBzbyBvZnRlbiB1
c2VkCj4gYmVjYXVzZSBzY3JhbWJsaW5nIGRhdGEgaXMgbm90IGNvbnZlbmllbnQgZm9yIGRldmVs
b3BlcnMgYnV0IHRoZXkgbWF5Cj4gaGF2ZSBhIHJlYWwgaW50ZXJlc3QgZGVwZW5kaW5nIG9uIHRo
ZSBOQU5EIGNoaXAgb3IgdGhlIGV4dGVybmFsCj4gY29uZGl0aW9ucy4KPgo+IFdlIHdpbGwgbmVl
ZCB0d28gbXV0dWFsbHkgZXhjbHVzaXZlIG9wdGlvbmFsIHByb3BlcnRpZXMgaW4KPiBuYW5kLWNo
aXAueWFtbDoKPiBuYW5kLWVuYWJsZS1yYW5kb21pemVyOwo+IG5hbmQtZGlzYWJsZS1yYW5kb21p
emVyOwoKQWdyZWVkLiBJdCBtYWtlcyBzZW5zZSB0byBzd2l0Y2ggdG8gZ2VuZXJpYyBkZXZpY2Ug
dHJlZSBwcm9wZXJ0aWVzIGFzCnlvdSBzdWdnZXN0ZWQuCgpJIHdpbGwgaW50cm9kdWNlIG5hbmQt
ZW5hYmxlLXJhbmRvbWl6ZXIgYW5kIG5hbmQtZGlzYWJsZS1yYW5kb21pemVyCmluIG5hbmQtY2hp
cC55YW1sLgoKSW4gYWRkaXRpb24sIEkgd2lsbCBhbHNvIHVwZGF0ZSB0aGUgTWFjcm9uaXggcmF3
IG5hbmQgZmxhc2ggZHJpdmVyIHRvIHVzZQp0aGVzZSBnZW5lcmljIHJhbmRvbWl6ZXIgcHJvcGVy
dGllcyBmb3IgY29uc2lzdGVuY3kuCgo+Cj4gQlRXLCB3aGVyZSBpcyB0aGUgcGF0Y2ggYWRkaW5n
IHRoZSBwcm9wZXJ0eSB0byB0aGUgYmluZGluZ3M/IERpZCB3ZQo+IGFscmVhZHkgbWVyZ2UgaXQ/
IEkgZG8gbm90IGZpbmQgaXQgYW55bW9yZS4KCkl0IGhhcyBub3QgYmVlbiBtZXJnZWQgeWV0LiBT
aW5jZSB0aGUgY3VycmVudCBwYXRjaCBzZXJpZXMgdXNlcyB0aGUKdmVuZG9yLXNwZWNpZmljIHBy
b3BlcnR5ICJteGljLHJhbmRvbWl6ZXItZW5hYmxlIiwgSSBkaWQgbm90IGluY2x1ZGUgYQpwYXRj
aCB0byB1cGRhdGUgdGhlIGdlbmVyaWMgYmluZGluZ3MuCgpJIHdpbGwgaW5jbHVkZSBhIG5ldyBw
YXRjaCBpbiB2NSB0byBhZGQgdGhlc2UgcHJvcGVydGllcyB0bwpuYW5kLWNoaXAueWFtbC4KCj4K
PiBMb29raW5nIGF0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBJIHJlYWxseSBkb24ndCBs
aWtlIHRoZSBjb3JlCj4gYWx3YXlzIGNhbGxpbmcgaW4gdGhlICJpbml0IiBhbmQgdGhlIG1hbnVm
YWN0dXJlciBkcml2ZXIgcmVhZGluZyB0aGUgRFQKPiBhbmQgZGVjaWRpbmcgd2hldGhlciBvciBu
b3QgaXQgZW5hYmxlcyBpdC4KCkkgYWdyZWUuIEkgd2lsbCByZWZhY3RvciB0aGUgbG9naWMgaW4g
djUgc28gdGhhdCB0aGUgY29yZSBwYXJzZXMgdGhlCmdlbmVyaWMgRFQgcHJvcGVydGllcyAobmFu
ZC1lbmFibGUtcmFuZG9taXplciBhbmQKbmFuZC1kaXNhYmxlLXJhbmRvbWl6ZXIpLgoKVGhlbiwg
c3BpbmFuZF9yYW5kb21pemVyX2luaXQgd2lsbCBkZXRlcm1pbmUgdGhlIHN0YXRlIGFuZCBwYXNz
IGEKYm9vbGVhbiBhcmd1bWVudCB0byB0aGUgc2V0X3JhbmRvbWl6ZXIgY2FsbGJhY2ssIGxlYXZp
bmcgdGhlIGRyaXZlcgp0byBzdHJpY3RseSBoYW5kbGUgdGhlIGhhcmR3YXJlIGNvbmZpZ3VyYXRp
b24uCgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14
aWMuY29tLnR3Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgMjMg
KysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgg
fCAgOSArKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gPiBpbmRleCBkMjA3Mjg2NTcyZDguLjRmOGZmOTRmNWNjYyAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPiBAQCAtMjA2LDYgKzIwNiwxMiBAQCBzdGF0aWMg
aW50IHNwaW5hbmRfY29udF9yZWFkX2VuYWJsZShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5h
bmQsCj4gPiAgICAgICByZXR1cm4gc3BpbmFuZC0+c2V0X2NvbnRfcmVhZChzcGluYW5kLCBlbmFi
bGUpOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIGludCBzcGluYW5kX3JhbmRvbWl6ZXJfZW5hYmxl
KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYm9vbCBlbmFibGUpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHNwaW5h
bmQtPnNldF9yYW5kb21pemVyKHNwaW5hbmQsIGVuYWJsZSk7Cj4KPiBUaGlzIGhlbHBlciBzZWVt
cyBtb3N0bHkgdXNlbGVzcy4KPgo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW50IHNwaW5hbmRf
Y2hlY2tfZWNjX3N0YXR1cyhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIHU4IHN0YXR1
cykKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBzcGluYW5kX3Rv
X25hbmQoc3BpbmFuZCk7Cj4gPiBAQCAtMTIxOCw2ICsxMjI0LDE5IEBAIHN0YXRpYyBpbnQgc3Bp
bmFuZF9jcmVhdGVfZGlybWFwcyhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gPiAg
ICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgc3BpbmFuZF9yYW5kb21p
emVyX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ID4gK3sKPiA+ICsgICAg
IGludCByZXQ7Cj4gPiArCj4gPiArICAgICBpZiAoc3BpbmFuZC0+c2V0X3JhbmRvbWl6ZXIpIHsK
PiA+ICsgICAgICAgICAgICAgcmV0ID0gc3BpbmFuZF9yYW5kb21pemVyX2VuYWJsZShzcGluYW5k
LCB0cnVlKTsKPgo+IFBsZWFzZSBkaXJlY3RseSBjYWxsIHRoZSBob29rLgo+Cj4gR2l2ZW4gdGhl
IHByZXZpb3VzIGZlZWRiYWNrLCB5b3Ugc2hvdWxkIGNoYW5nZSAidHJ1ZSIgdG8gYmUgYmFzZWQg
b24gdGhlCj4gcHJlc2VuY2Ugb2YgdGhlIERUIHByb3BlcnR5Lgo+Cj4gPiArICAgICAgICAgICAg
IGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAg
IH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPgo+IFJlc3QgTEdUTS4KPgo+IFRo
YW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
