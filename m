Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44A3C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxZ6+A8k5kRHGyO+ldRdvVdl+jJ5AnwzUuTZX8lCmgM=; b=wm6M8/Y+L3Vy5+
	4a7Xjcy+bpo0LTfmVyaDDDy1JU9uKJYvtzk9QddJazInBWhQH9qEqRHAsH6LYo1AE2ainZeL9JEL3
	jc4Amg0eKSPrldy+rpZ8lf288uIKdvSy5wiNxxKGwcQc7bQfXvYtlCjLDAes/xJ0HoJicscNgnSmR
	ChqbQRc8GxQml9z0OMRfsXcXSNfkctCI7mkYAfocwwzylVsvYx+9zbv+6ti+zOj6kREO68dcsXulZ
	mTEBwRrDIT6OSqEW0eFI1XvQpHzGfcFiFwyCrLNz0z0OVPLA5xkYyUZ7rW48aunu6OuskRcsb9QyO
	Zam3H9sD/MbQcSap5KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNcH-0000000A3Lq-2x2v;
	Wed, 13 Mar 2024 12:21:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNcE-0000000A3LQ-3aVU
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 12:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D612B61469;
	Wed, 13 Mar 2024 12:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C38C43394;
	Wed, 13 Mar 2024 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710332509;
	bh=Fb3rj7gE/RiwbNWbqCnRjzqmXxJGi3L4HQ8qGvyMCAo=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=hD8VgH5hMQ7/x4I6LAIU9kcCxVCEBraQaJ6oGFmQNOrmZ93bZA6oKiuBIEyHpxF9C
	 RikZUvAFDewKqTSbcbI+roz3eaOtaXJzLY6mSoGVCf8IGOZd/gffJotW/s4lxMjOkD
	 6mb9LkwB3gM01LZSd/lMSIIcNEL2OuWgySZCYni1Mx2bo2SJyDEaiW1oYj6ytVm7yZ
	 d/4e5WUQpvkZBlTLGe1neAgziHpZDJz+pA82qzK2xhNL+ZqO01AOUIai0o2r4T+6WA
	 OogJWVYL0DclxMfdCfwO2y+rsb17hl3xfgCDvyA20rmN8Pi/XuFzcCxm4jGBpZaf4H
	 JqutKLV+yt05g==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 0267F1200043;
	Wed, 13 Mar 2024 08:21:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Mar 2024 08:21:48 -0400
X-ME-Sender: <xms:W5rxZYdujilJopBxo_U8erkStv9MsW3mBsNFC6cc9FPZe0sQzDqg2Q>
    <xme:W5rxZaN1XOeeoHx9wn_hkaOEcrK9s6xmB6rIV7kxUVigByL_tYGytoNs_SQRN2wiL
    AwyRGPcg1qPlvQkro8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvddttdffjeefgeeggfelfefggefhheeffefftefggfelgeduveevtefh
    feejveeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:W5rxZZjgsledSFp4BWJ8srG6hxxLuHiLW-AKCtSUyu3DmRV_CRb7Zg>
    <xmx:W5rxZd-c9S1sVOQDQy4iT307G8W3XW1iYR6PIkc7QHq64uXijy4wrw>
    <xmx:W5rxZUvpW3gwBKXlDVPb5Id8EeybqGaTHc136jR9XjsGjh7rI1GBUg>
    <xmx:W5rxZUFTxm47qKkFa0pWWd_fae_1qcn0IlQ41vhxgvYe8yC5UqnwMA>
    <xmx:W5rxZZ-uqtdG6Ek-hCcOdw157QXAheX2sp8NK39kuMIEqXrEgqI1G6avpy0>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5260EB6008D; Wed, 13 Mar 2024 08:21:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <b08aaae4-8c69-47eb-9658-5f3f5c8e4056@app.fastmail.com>
In-Reply-To: <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
 <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
 <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
Date: Wed, 13 Mar 2024 13:21:26 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Zhihao Cheng" <chengzhihao1@huawei.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Richard Weinberger" <richard@nod.at>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Daniel Golle" <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_052151_024550_0F149184 
X-CRM114-Status: UNSURE (   7.56  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0IDEzOjEwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5Zyo
IDIwMjQvMy8xMyAxOTo1MywgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4+IE9uIFdlZCwgTWFyIDEz
LCAyMDI0LCBhdCAxMjoyOSwgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiAKPj4gVGhlIHdheSBpdCB1
c3VhbGx5IGdvZXMgaXMgdGhhdCBzb21lb25lIGFkZHMgYW4gb3Blbi1jb2RlZAo+PiA2NC1iaXQg
ZGl2aXNpb24gdGhhdCBjYXVzZXMgYSBsaW5rIGZhaWx1cmUsIHdoaWNoIHByb21wdHMKPiBJJ20g
YSBsaXR0bGUgY29uZnVzZWQsIHdoYXQga2luZCBvZiBsaW5rIGZhaWx1cmU/IENvdWxkIHlvdSBz
aG93IGFuIGV4YW1wbGU/CgpUaGUgb3Blbi1jb2RlZCA2NC1iaXQgZGl2aXNpb24gd2l0aG91dCB1
c2luZyBkb19kaXYoKSBzaG93cyB1cCBhcwoKeDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL210ZC91
YmkvbnZtZW0ubzogaW4gZnVuY3Rpb24gYHViaV9udm1lbV9yZWdfcmVhZCc6Cm52bWVtLmM6KC50
ZXh0KzB4MTBhKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191bW9kZGkzJwp4ODZfNjQtbGlu
dXgtbGQ6IG52bWVtLmM6KC50ZXh0KzB4MTFmKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191
ZGl2ZGkzJwp4ODZfNjQtbGludXgtbGQ6IGRyaXZlcnMvbXRkL3ViaS9udm1lbS5vOiBpbiBmdW5j
dGlvbiBgdWJpX252bWVtX3JlZ19yZWFkLmNvbGQnOgpudm1lbS5jOigudGV4dC51bmxpa2VseSsw
eDJkKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191bW9kZGkzJwoKVGhlIGlkZWEgaXMgdGhh
dCBnY2MgZXhwZWN0cyBfX3Vtb2RkaTMgdG8gYmUgcHJvdmlkZWQgYnkgbGliZ2NjLApidXQgTGlu
dXggaW50ZW50aW9uYWxseSBsZWF2ZXMgaXQgb3V0IGluIG9yZGVyIHRvIGNhdGNoIGFjY2lkZW50
YWwKNjQtYml0IGRpdmlzaW9ucy4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
