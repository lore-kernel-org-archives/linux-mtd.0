Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C67CCA468
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmSnKgad/hBmeJMpWtTE4ezGjwFZC2rhXyr01ygUoeo=; b=dwgOgDLle9iRQT
	QKBXBhe+TcQNTHaui9EIO7mvIMKjKjdPWvT1aoccFmufS6QLl/eAFNqTMBc2ZzpZXhBampmNqQiW7
	jXaDbKLK6nKJnahdRYnFJIXDYd+2t5wzBpSvDhXUwd17s6p/rz+gCRN17d2KUES/FBmkhEMbaXD78
	Kkn044O1XpBEX9n16gIKe2s/DrGqB9xOufr26WPSWj6WmqjUSXhTfSe3oc5IBU/XjfgsMFbfPkoXj
	SLYKU6Pl9RDhuy6EnGNXpCiQdsWDG6/QusP+lpvhIi1/qwcqYgGtRwQG223ayNQgpEapw5lC+YdVp
	wqaTEEJYz30imZS/Ct/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZvQ-00000005KhH-3Bko;
	Tue, 30 Sep 2025 12:57:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZvN-00000005Kgq-0SOO
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 12:57:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 568414E40E50;
	Tue, 30 Sep 2025 12:57:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 100E1606E4;
	Tue, 30 Sep 2025 12:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EABD4102F17DB;
	Tue, 30 Sep 2025 14:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759237061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nVa13gnqEbh0OZfVTb62Mape7gGdjtHA5pEICJOEZkQ=;
	b=kK0lApBsvgRTKrjnu2IL+FRxEyR7mnsh3RP0I7hz5/8rfbhRiS/M1SmGvCx98qkRn50S40
	DUuy6VU71VExjQDcGAojP8+opuH+Ak3vE7hk+5v7Ua5MzDtTQ9Y+P1E82gPRCP2QFiJWiv
	D23lVXQomE6b7XxqCYXDQT1snVJVZ6UpdrOS8YDH0D5kCPM6RMt21PyqGlpbt38Qm78oN2
	vKLpRgvc2AEBNZxk7Y7ls2cI3pLo0ue9PBGwgs1z3xAdPxKvAohA+FyomgAYUoi/YQrrts
	8qK0EOOPxIrYpGj3rjSXo9pFMyKBm4ndIRpT49dhsMT8Bn7Q0rgikBt90Dt3pg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,  Richard
 Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 resend] mtdchar: fix integer overflow in read/write
 ioctls
In-Reply-To: <aNvN4kfJ2ROB353Q@stanley.mountain> (Dan Carpenter's message of
	"Tue, 30 Sep 2025 15:32:34 +0300")
References: <aNvN4kfJ2ROB353Q@stanley.mountain>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 30 Sep 2025 14:57:19 +0200
Message-ID: <87qzvogksw.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_055745_280715_BD2F9076 
X-CRM114-Status: GOOD (  10.37  )
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

SGkgRGFuLAoKT24gMzAvMDkvMjAyNSBhdCAxNTozMjozNCArMDMsIERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoZSAicmVxLnN0YXJ0IiBhbmQgInJl
cS5sZW4iIHZhcmlhYmxlcyBhcmUgdTY0IHZhbHVlcyB0aGF0IGNvbWUgZnJvbSB0aGUKPiB1c2Vy
IGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24uICBXZSBtYXNrIGF3YXkgdGhlIGhpZ2ggMzIg
Yml0cyBvZgo+ICJyZXEubGVuIiBzbyB0aGF0J3MgY2FwcGVkIGF0IFUzMl9NQVggYnV0IHRoZSAi
cmVxLnN0YXJ0IiB2YXJpYWJsZSBjYW4gZ28KPiB1cCB0byBVNjRfTUFYIHdoaWNoIG1lYW5zIHRo
YXQgdGhlIGFkZGl0aW9uIGNhbiBzdGlsbCBpbnRlZ2VyIG92ZXJmbG93Lgo+Cj4gVXNlIGNoZWNr
X2FkZF9vdmVyZmxvdygpIHRvIGZpeCB0aGlzIGJ1Zy4KPgo+IEZpeGVzOiAwOTViYjZlNDRlYjEg
KCJtdGRjaGFyOiBhZGQgTUVNUkVBRCBpb2N0bCIpCj4gRml4ZXM6IDY0MjBhYzBhZjk1ZCAoIm10
ZGNoYXI6IHByZXZlbnQgdW5ib3VuZGVkIGFsbG9jYXRpb24gaW4gTUVNV1JJVEUgaW9jdGwiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRl
ciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+IC0tLQo+IHYyOiBmaXggdGhlIHRhZ3MuCj4g
UkVTRU5EOiBJIHNlbnQgdGhpcyBsYXN0IHllYXIgYnV0IGl0IHdhc24ndCBhcHBsaWVkLgo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9aMWF4M0szLXpTSkV4UE5WQHN0YW5sZXkubW91bnRh
aW4vCgpJIGRvbid0IGtub3cgd2h5LCBwZXJoYXBzIGl0IGdvdCBmaWx0ZXJlZCBhcyBTUEFNLCBJ
IGRvbid0IGtub3csIGJ1dCBJJ20Kc29ycnkgYWJvdXQgdGhhdC4KCkkndmUganVzdCAiY2xvc2Vk
IiBuZXh0LCBzbyBJJ2xsIHF1ZXVlIHRoaXMgaW4gYSBmaXhlcyBQUiBvbiB0b3Agb2YKdjUuMTgt
cmMxLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
