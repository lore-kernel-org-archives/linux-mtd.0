Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC633C369C9
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mbxJv494fQcRdeliH4DrfoSeg0tLiQYUv130n1jJDW4=; b=oFks6duSeJcTYnY/GYs8yn1Gb3
	jnQlv9qCVP69g7I+Dhp7ksiZQzE3emKGHl6HYx9ASha/yEL1Wgk6ozvXAJsnJG0kSbml45XLQtdBM
	InBqAenJ9Dorjt3GXisjBqfhFJqh+9Wf5fERBLcWCqfvBGbrzWvdEccGtpdA2+nIzD7bu1gvWALIv
	9oSQEcvnKtarhCQ8dVBqP0u4T+I4frSvSHAHrDJL4fr4vmfgqvdvsyjptTqkj+Bl1/3AvAeBWjuPY
	ZTmL20OeYIpL8MF1NkiAa+cyHUpep9ObzE1d0Lgwo8ZvlGmkRWfJ7UoNeoNa5ykNqjfPEhAZMdT0T
	c7fmmRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iS-0000000AazY-2Ot2;
	Wed, 16 Apr 2025 18:42:32 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57hK-0000000Aaj9-28WT
	for linux-mtd@lists.infradead.org;
	Wed, 16 Apr 2025 18:41:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 57A49294730;
	Wed, 16 Apr 2025 20:41:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id sM60Dn9crzIu; Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 92068298566;
	Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IfrJQsT_emOt; Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 66DDC294730;
	Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Date: Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	=?utf-8?Q?Tam=C3=A1s?= Szentendrei <szentendrei.tamas@prolan.hu>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <81225127.297167214.1744828878236.JavaMail.zimbra@nod.at>
In-Reply-To: <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
References: <20250415180434.513405-1-csokas.bence@prolan.hu> <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org> <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu> <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at> <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF136 (Linux)/8.8.12_GA_3809)
Thread-Topic: spi-nor: Verify written data in paranoid mode
Thread-Index: 316iU8/+hGzm5OegdVUSCxd/avO+wg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114122_685435_184F11C2 
X-CRM114-Status: UNSURE (   7.89  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNzw7Nrw6FzIEJlbmNlIiA8
Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KPj4gSSdtIG5vdCBzbyBzdXJlIHdoZXRoZXIgaXQgbWFr
ZXMgc2Vuc2UgYXQgYWxsLgo+PiBJbiBpdCdzIGN1cnJlbnQgZm9ybSwgdGhlcmUgaXMgbm8gcmVj
b3ZlcnkuIFNvIGFueXRoaW5nIG5vbi10cml2aWFsCj4+IG9uIHRvcCBvZiB0aGUgTVREIHdpbGwg
anVzdCBzZWUgYW4gLUVJTyBhbmQgaGFzIHRvIGdpdmUgdXAuCj4+IEUuZy4gYSBmaWxlc3lzdGVt
IHdpbGwgcmVtb3VudCByZWFkLW9ubHkuCj4gCj4gSW4gb3VyIGNhc2UsIHdlIHVzZSBVQklGUyBv
biB0b3Agb2YgVUJJLCB3aGljaCBpbiB0aGlzIGNhc2UgY2hvb3Nlcwo+IGFub3RoZXIgZXJhc2Vi
bG9jayB0byBob2xkIHRoZSBkYXRhIGluc3RlYWQsIHRoZW4gcmUtdGVzdHMgKGVyYXNlK3dyaXRl
Cj4gY3ljbGVzKSB0aGUgb25lIHdoaWNoIGdhdmUgLUVJTy4gU2luY2UgdGhlIGJ1cyBlcnJvciBp
cyBvbmx5IHRyYW5zaWVudCwKPiBpdCBnb2VzIGF3YXkgYnkgdGhpcyB0aW1lLCBhbmQgdGh1cyBV
QklGUyB3aWxsIHJlY292ZXIgZnJvbSB0aGlzIGNsZWFubHkuCgpBcmUgeW91IHN1cmUgYWJvdXQg
dGhhdD8KCkknZCBleHBlY3QgVUJJIHRvIGdvIGludG8gUk8gbW9kZSB2aWEgYSBjYWxsIHBhdGgg
bGlrZToKdWJpX2ViYV93cml0ZV9sZWIoKSAtPiB1YmlfaW9fd3JpdGUoKSAtPiBtdGRfd3JpdGUo
KQpJZiBtdGRfd3JpdGUoKSByZXR1cm5zIGFuIEVJTywgVUJJIHdpbGwgZ28gaW50byBSTyBtb2Rl
IGltbWVkaWF0ZWx5LgoKKEknbSBhc3N1bWluZywgeW91ciBTUEktTk9SIGhhcyBubyBiYWQgYmxv
Y2sgc3VwcG9ydCwgc28gdWJpLT5iYWRfYWxsb3dlZAppcyBmYWxzZSkuCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
