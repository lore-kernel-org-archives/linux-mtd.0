Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7232C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psmgulh68pglxLRVXSHDVTc0+cLz0lj0OtS+HDTiZJM=; b=R+8Nw9dkB4sQXP
	S9a+aDoNYNk949U1KuoRWyR5gIUXEbsThHtoof2yVauY14w/U+Br81Bc68Hf1LxMEeL6toSKQG2JL
	duXQoVJVQr0987TonJURheNTH6uaCPWP01H0IWUTvXyD5TCNnpDi4XDj8Epb+NS9KXdS1N0NhKcaa
	ncmljAs9oyz4d2U72uzHPdKOo2flYzVUGygV/CAi4+ipx/RpE8rwLx9CePDBzvYD3Qx0qVfoQfLe5
	tFedzWeKK/dBhLfYy+nkOmzVvVJ7VrfMJ6/BbsqzGGzk6uSJ62hYxJFq2KnXgD0feHqPEe8uV1USg
	qYaR2/n0yBOFFxDJx/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUGr-00000008X1c-2dpI;
	Mon, 26 May 2025 09:37:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUBR-00000008WD7-2V5e;
	Mon, 26 May 2025 09:31:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 406AD433B6;
	Mon, 26 May 2025 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748251906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/ZZTG2q7hLM3GZrcupIxllRxvC3z0wIhPiqMbFVFDg=;
	b=aPapo4hOvLjoEd66BIkA1dN4XiHOGFqdSVXpM3loHuOVl3pSD0unXcrWWA3fVyjd/4bUYi
	Lop5M09S/nBAzIH7xe+RPoFfpRXaInKFiPKzvhd0bawG3B+uoMMxZ0d9TqT73I5LTtnD2u
	9ziR6MYLBMB59L83vuLT3V11TJqiZCt8d6gk38yJlwz0l/TV/yFrNBTdqQyznw7fRuClVY
	F1Y5nmyQp78/YVeEwhhWIilpyJD7IoeoIMFH5kmq+mbOHuVe8XNgePIv7xz03qy/hRK/vx
	NWG43ivHn85uB3NbW3MrdP/zX/wg6ujySE0ttHMWcTFRTbgvKHHnpohQlefNyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: ruanjinjie@huawei.com, u.kleine-koenig@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 stable@vger.kernel.org
In-Reply-To: <20250526034344.517-1-vulab@iscas.ac.cn>
References: <20250526034344.517-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: sunxi: Add randomizer configuration in
 sunxi_nfc_hw_ecc_write_chunk
Message-Id: <174825190312.1028286.17391612651322284901.b4-ty@bootlin.com>
Date: Mon, 26 May 2025 11:31:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeduieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepvhhulhgrsgesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrght
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_023149_762472_326ED368 
X-CRM114-Status: UNSURE (   7.67  )
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

T24gTW9uLCAyNiBNYXkgMjAyNSAxMTo0Mzo0NCArMDgwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IFRoZSBmdW5jdGlvbiBzdW54aV9uZmNfaHdfZWNjX3dyaXRlX2NodW5rKCkgY2FsbHMgdGhlCj4g
c3VueGlfbmZjX2h3X2VjY193cml0ZV9jaHVuaygpLCBidXQgZG9lcyBub3QgY2FsbCB0aGUgY29u
ZmlndXJhdGlvbgo+IGZ1bmN0aW9uIHN1bnhpX25mY19yYW5kb21pemVyX2NvbmZpZygpLiBDb25z
ZXF1ZW50bHksIHRoZSByYW5kb21pemF0aW9uCj4gbWlnaHQgbm90IGNvbmR1Y3QgY29ycmVjdGx5
LCB3aGljaCB3aWxsIGFmZmVjdCB0aGUgbGlmZXNwYW4gb2YgTkFORCBmbGFzaC4KPiBBIHByb3Bl
ciBpbXBsZW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgaW4gc3VueGlfbmZjX2h3X2VjY193cml0ZV9w
YWdlX2RtYSgpLgo+IAo+IEFkZCB0aGUgc3VueGlfbmZjX3JhbmRvbWl6ZXJfY29uZmlnKCkgdG8g
Y29uZmlnIHJhbmRvbWl6ZXIuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IG5hbmQ6IHN1bnhpOiBBZGQgcmFuZG9taXplciBjb25maWd1cmF0aW9u
IGluIHN1bnhpX25mY19od19lY2Nfd3JpdGVfY2h1bmsKICAgICAgKG5vIGNvbW1pdCBpbmZvKQoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
