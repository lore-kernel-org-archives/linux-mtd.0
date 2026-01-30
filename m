Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5868FE6BF2A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zLADoNgiXpYhT9BoQPUrFDgDQfwIAJBiX2Awvo3eoo=; b=kjnuYoktEgu1cr
	V/lS5qqLjcpqu2qqRQGbrjX0SGqp8r/cRsQlm3CHPyElXmMHMmZn271NIa7x1G8Vmz0+s3/atq6zp
	9su+aoA11yA1VpiCeuiERlYK+z0NAmRb8aPqF2TcaRC7oa9fAidNJSt5ivzbTUQspzopZlkdcAq9s
	GLseqIW3QSxnj7Kxazewzlj3s5yZjGqhmtqsvZrscATqdWK7gTgaYIv3h+8VBxFUMkFEtnTIok14T
	JffFt1Einy3ZEngapLQJGEg0IS/pUbMpzSFQilzC/pK9JAHOii810jLrYrZ7eU0ALDtV5BoR5ouGR
	DTzKvHgeRns0R5lp8RSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrai-00000001jDD-1De5;
	Fri, 30 Jan 2026 16:43:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrag-00000001jCj-1JZJ
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 16:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BB276013A;
	Fri, 30 Jan 2026 16:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1E3C4CEF7;
	Fri, 30 Jan 2026 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769791405;
	bh=tXAL+Qg+AltobkuOnMSRrqShGxkMMFxiMYL7xv6KSWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RqRl1P/KlB+bF+MSGSpgrkei4edZCuisiiC4yDV7cSABYaMgH9JgDFoSBSs3/koLt
	 wUGvzDKRWIinYD5LHPGfTLaru1iLEXcS2jMkmPiXCLgjH2rmq9BOkl6e41TS0v09IN
	 fSimbrypbVOCsWoehgbhn7zQFj5oMmtL1j4o4gYYaw1cWbwcK89XK7NCGrs29DXg5F
	 w2FFaGUyIF+5tRSbiR6wBrrJDAux0SZUxPEx/IsYd2mOcSYJmIiZImK7rQ4MpUSzq2
	 6siDU7zkx79TnXJeqvUoDOlySx7nP3ndGdOLIq2G6PGRnmSgcR1XuH8FiII4ygnPcP
	 7K2nJONis0J7w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Bough Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
In-Reply-To: <DU0PR04MB9496760AE1881329E33F0B7F909EA@DU0PR04MB9496.eurprd04.prod.outlook.com>
	(Bough Chen's message of "Thu, 29 Jan 2026 01:56:40 +0000")
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
	<DU0PR04MB9496760AE1881329E33F0B7F909EA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Date: Fri, 30 Jan 2026 17:43:21 +0100
Message-ID: <2vxz1pj79hli.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

SGksCgpPbiBUaHUsIEphbiAyOSAyMDI2LCBCb3VnaCBDaGVuIHdyb3RlOgoKPiBHZW50bGUgcGlu
Zy4uLgoKU29ycnksIHRoaXMgY3ljbGUgSSB3YXMgcmVhbGx5IGJ1c3kgd2l0aCBzb21lIG90aGVy
IHRoaW5ncywgc28gSSBkaWRuJ3QKZ2V0IGEgY2hhbmNlIHRvIHF1ZXVlIGFueSBjb250ZW50IGZv
ciB0aGlzIGN5Y2xlLiBJIHdpbGwgc3RhcnQgcXVldWVpbmcKcGF0Y2hlcyBvbmNlIHRoZSBtZXJn
ZSB3aW5kb3cgZm9yIHRoZSBuZXh0IGtlcm5lbCBjbG9zZXMuCgo+Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IEJvdWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4KPj4g
U2VudDogMjAyNeW5tDEy5pyIOOaXpSAxNzoxNAo+PiBUbzogVHVkb3IgQW1iYXJ1cyA8dHVkb3Iu
YW1iYXJ1c0BsaW5hcm8ub3JnPjsgUHJhdHl1c2ggWWFkYXYKPj4gPHByYXR5dXNoQGtlcm5lbC5v
cmc+OyBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz47IE1pcXVlbCBSYXluYWwKPj4g
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+OyBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0PjsgVmlnbmVzaAo+PiBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+PiBDYzog
UHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPjsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc7Cj4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5k
ZXY7IEJvdWdoIENoZW4KPj4gPGhhaWJvLmNoZW5AbnhwLmNvbT4KPj4gU3ViamVjdDogW1BBVENI
XSBtdGQ6IHNwaS1ub3I6IGNvcmU6IGNvcnJlY3QgdGhlIG9wLmR1bW15Lm5ieXRlcyB3aGVuIGNo
ZWNrCj4+IHJlYWQgb3BlcmF0aW9ucwo+PiAKPj4gV2hlbiBjaGVjayByZWFkIG9wZXJhdGlvbiwg
bmVlZCB0byBzZXR0aW5nIHRoZSBvcC5kdW1teS5uYnl0ZXMgYmFzZWQgb24KPj4gY3VycmVudCBy
ZWFkIG9wZXJhdGlvbiByYXRoZXIgdGhhbiB0aGUgbm9yLT5yZWFkX3Byb3RvLgo+PiAKPj4gRml4
ZXM6IDBlMzBmNDcyMzJhYiAoIm10ZDogc3BpLW5vcjogYWRkIHN1cHBvcnQgZm9yIERUUiBwcm90
b2NvbCIpCj4+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4K
Wy4uLl0KCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRhdgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
