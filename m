Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2285FF885A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8BlJsM5xLW4tiIDOA5K02RSbPgn4wynlhkOjlp6gu4=; b=t0cav4rH/VngcP
	l8LcmvzQr5zcioMGqwaoTJveSWQt1Jzfuob9jFohXV08fYQftdEgx9ripNtOSH7nUpo54pYIBJpm+
	N/BH4J4yynzcvhsh4BoBvy1UjKsGFC6b+enm0rLgVmI2yeEpjDnDmG6Yl5SOa/8YSNLN+DpMoV3Bw
	oTEjzH/9Rt/Ot0uzgo8ZiBuYZHaEE+chIPJM1Iag2SZqlu5zyGn6zg4LXOrP9nIZezd/pnedph7Ax
	DJDconwSm7WxmoKLU9Uu72wqmKlGlso3cc45vD3Xd2O4cAFKD/0qCKSouCs5tehppvdPRvVxOh08q
	O8r0hCe6gWI8SHC+xiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKB4V-0000000FWPn-3NLk;
	Tue, 05 May 2026 08:24:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKB4S-0000000FWOX-39vK
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 08:24:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 63D261A3524;
	Tue,  5 May 2026 08:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E80C5FD9D;
	Tue,  5 May 2026 08:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1973311AD2094;
	Tue,  5 May 2026 10:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777969437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBIr3CQX6FUQHhQLmkVk7BnOw9CB7okApwAMfGpkl2A=;
	b=h9TrZAKPLIIAQmfpZs5cIBeWKoooSOKlwJoBXj6hj+mP5m81f4+hlzxtENpfxzL6Dx2MAk
	eDSbxdHC6GkoKPnJnPgqZkZ6WV4c1bkoa2/GvraXNtAh/rg5uwhXcK55jdzXfV7bIYtu0D
	QNZ0Y+uyEXFv8LnxzGL3P6VRZnOarWQrYpPUsXJa7hYLul4RudQdIjwkheu2ooe2Q+hCWH
	QinEgOeNF6j81iaQQGjhHwn/GYXtY8jGZviTURjSEQpdPXhGw3mL3Fv8esmMjaeJtqPfNf
	UgAiLDEpmUK0atl6MmkTYfG8wECFJBrkrHbnZZ3Sit2AGgn+lwcAWg152AdEWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@rulkc.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  rulkc@linuxtesting.org,
  oxffffaa@gmail.com,  stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
In-Reply-To: <335fad03-6113-4508-b28d-b21c7efcffe6@rulkc.org> (Arseniy
	Krasnov's message of "Tue, 5 May 2026 11:14:25 +0300")
References: <20260504221012.1310605-1-avkrasnov@rulkc.org>
	<87mryeqoqs.fsf@bootlin.com>
	<57b0cc2a-6d62-405c-bfa5-68d1c46dbad9@rulkc.org>
	<87h5omqntt.fsf@bootlin.com>
	<335fad03-6113-4508-b28d-b21c7efcffe6@rulkc.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 05 May 2026 10:23:55 +0200
Message-ID: <87bjeuqn6s.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_012400_959331_961A3BCF 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDA1LzA1LzIwMjYgYXQgMTE6MTQ6MjUgKzAzLCBBcnNlbml5IEtyYXNub3YgPGF2a3Jhc25v
dkBydWxrYy5vcmc+IHdyb3RlOgoKPiAwNS4wNS4yMDI2IDExOjEwLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+PiBPbiAwNS8wNS8yMDI2IGF0IDEwOjU5OjE2ICswMywgQXJzZW5peSBLcmFzbm92IDxh
dmtyYXNub3ZAcnVsa2Mub3JnPiB3cm90ZToKPj4KPj4+IDA1LjA1LjIwMjYgMTA6NTAsIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAwNS8wNS8yMDI2IGF0IDAxOjEw
OjEyICswMywgQXJzZW5peSBLcmFzbm92IDxhdmtyYXNub3ZAcnVsa2Mub3JnPiB3cm90ZToKPj4+
Pgo+Pj4+IFR3byBpbXBvcnRhbnQgdHlwb3MgaW4gdGhlIGNvbW1pdCBsb2cgOi0pCj4+Pj4KPj4+
Pj4gJ2NzJyBoZXJlIG11c3QgaW4gcmFuZ2UgWzA6bmFuZGRldl9udGFyZ2V0cykuCj4+Pj4gICAg
ICAgICAgICAgICAgIGJlICAgICAgICAgICAgICAgICAgICAgICAgICAgWwo+Pj4KPj4+IEhpLCBz
b3JyeSwgWW91IG1lYW4/Cj4+Pgo+Pj4KPj4+ICdjcycgaGVyZSBtdXN0IGJlIGluIHJhbmdlIFsw
Om5hbmRkZXZfbnRhcmdldHNdLsKgCj4+IEkgbWVhbnQgWzA6bmFuZGRldl9udGFyZ2V0c1sgd2hp
Y2ggaXMgdGhlIG1hdGhlbWF0aWNhbCB3YXksIElJUkMsIHRvCj4+IGluZGljYXRlIHRoYXQgdGhl
IGxhc3QgdmFsdWUgaXMgb3V0IG9mIHNjb3BlL2V4Y2x1ZGVkLgo+Pgo+PiBbMDpuYW5kZGV2X250
YXJnZXRzXSBtZWFucyB0aGF0IG5hbmRkZXZfbnRhcmdldHMgaXMgaW5jbHVkZWQgaW4gdGhlCj4+
IHNjb3BlIG9mIHZhbHVlcyBhbmQgaGVyZSBzaW5jZSB5b3UgYXJlIGV4cGxpY2l0bHkgc2hvd2lu
ZyB0aGF0IGl0IGlzCj4+IG5vdCwgaXQgZmVlbHMgd3JvbmcgdG8gdXNlIHRoYXQgY29udmVudGlv
bi4KPgo+Cj4gQWhoLCBZZXMgSSBzZWUsIGp1c3Qgc21hbGwgbWlzdW5kZXJzdG9vZCBpbiBtYXRo
IHN5bWJvbHM6Cj4KPiBJIG1lYW46IFtBOkIpID09IFtBOkJbCj4KPiBodHRwczovL3dpa2ltZWRp
YS5vcmcvYXBpL3Jlc3RfdjEvbWVkaWEvbWF0aC9yZW5kZXIvc3ZnLzA3MTliMWIwOGNkZjY0OWU3
MzVlNmRhYjZkYzczNTVmYTM3YTliMjEKCkFoIG9rLCBkaWRuJ3Qga25vdyB0aGF0IG90aGVyIGNv
bnZlbnRpb24sIGZpbmUgdGhlbiwgdGFrZSB0aGUgb25lIHlvdSBwcmVmZXIgaWYKYm90aCBhcmUg
aWRlbnRpY2FsLiBKdXN0IGFkZCB0aGUgbWlzc2luZyAiYmUiIHBsZWFzZSEKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
