Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F4C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vZTn/5E99nRP+Q+shVbdBbbvphHl1xn5x7ae7mdoIE=; b=E4NoXykvwwgU5P
	TZGjL0FVUoHSEQf53xgGZaEgxmrBmsXyfClDR8oGQfxYnZsnC1SWwak61hW68n97RptLq8BYIjL2u
	v5ZTHPIE5bha8Ixe1h9Dxc6wREqdPXXtFH/1pgHa8T1mgEBct/Ee6tzkJAfY3P3kvc2w4VECaH1J9
	2Ktim8/yoestlzgIYYq3K4y7RMDTFD+cfV/WW/hSPTDxHVSJhS2yOTGALNh/XR/64ly2AD6kVCwn0
	5WPxcHs3yAEBBvV+8M9GncPFdKUHeKbiN9u2kNhOkCFkN0s0vHHR98xI4iOPpp53uOuLYWy6h0qap
	Lze/KxEk2ZoXFb47qT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUcA-00000009ogy-2JkN;
	Mon, 12 May 2025 14:58:46 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU9V-00000009jVb-0W3D
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 14:29:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB5C71FCEC;
	Mon, 12 May 2025 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747060146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5JO8FMyqvxtRo7A5Z/7iXBTLAs6G75BYMdiwJxV6g2U=;
	b=C6t4/EmEjYn0Our7hR2cpogHfq1Ae26J+qPfs6SBCrdYYUyEzWWYMx5VNBkqz8t0AGh/Cc
	nWbVZcNda2hCK3AtYJwyHqiq5MIsZJ/SepFTgipgTPBdih3UPT1HEHtSGxlz35OI/z+MM+
	BmhABqguGHzRnVFd+rgNI6bp6Js0WHSZdCE/Y9z20hTn06S8jY2mxemqmeO201iHzsQ3+M
	WKeItsVqcg7CQPRedpCTmLzSdDh4uV6qNHo0zktJYIF/wg68yzaR2raOD9zW9AF9kj2JTs
	JAZ72rqGQz5G6rEKPVPwDpBkR1wZA1VFpge7t4d12akhJotRW/4/b+h9VAuf6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aBSEwag_ducqOwy7@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-Id: <174706014455.62075.9908160461728250420.b4-ty@bootlin.com>
Date: Mon, 12 May 2025 16:29:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehri
 hgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072909_611090_A71C4DAF 
X-CRM114-Status: UNSURE (   5.55  )
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

T24gRnJpLCAwMiBNYXkgMjAyNSAxMTozOToyOSArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBUaGUgImRlc2MiIHZhcmlhYmxlIGlzIE5VTEwgYW5kIFBUUl9FUlIoTlVMTCkgaXMgemVyby9z
dWNjZXNzLiAgUmV0dXJuCj4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluc3RlYWQuCj4gCj4gCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBsb29uZ3Nv
bjE6IEZpeCBlcnJvciBjb2RlIGluIGxzMXhfbmFuZF9kbWFfdHJhbnNmZXIoKQogICAgICBjb21t
aXQ6IDBkNDcwYzcyYmVhNGQ5ZjRjMjRiMzA0ZmVmZGM4NTc5NzljYjVjYTAKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
