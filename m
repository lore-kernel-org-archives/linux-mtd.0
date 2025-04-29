Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF32C369DC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwMhFbbRx5ii8JEKd/aB15heqOLn99qRvKQqPHxj/wk=; b=s8BKxMxCVfR5G/
	I5oMpBieBcuzcX4KzH0SLtxGY+u3/r350dERxJnsFsmQhz+hMfLmWwej0AlSSk0qoohw90y6gAcn6
	uyPV0D+z9SmVTpUmUPfuoeDiGKn9hwZAEszIP5EeSK5uWRSQq7Si2azJWf+m5BIU23SsZWHhGVep7
	by1bN03GZhGYBWIXC4ByMqK+CSV98TRhinQmT2eTpBlX571ccVK8zOg5cy8enPhnuD3uQy94j6nVr
	GBempGc5kxrmyCaMfn/BTJmwR6ISmFU6cmSRHcIwWSDCVvzj0LNJNLr0FA6b+7KFrzmQvB5vltxBW
	dlZ1XOxzYAZXeN1sif+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hEe-000000097xO-1USq;
	Tue, 29 Apr 2025 09:26:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hEa-000000097vI-3xXm
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:26:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 227EF43ACC;
	Tue, 29 Apr 2025 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9PV1lEC3z14dCKQJep2/Y47TCOjibjgPvzjWr13y7FY=;
	b=Yb4lkZBzty6dQHEJvFBapNYfiCzNjr7fJMo9ZaQwhnbWTYFrPPiIKW9QU1KY7QQo4uXNVO
	GshDaWFfWML5BRlLEO48/CJ4BMhlIOLudF4tStLc34Wc4FMfDp+0uqQaSp/WjFr2H5i8St
	DwRyElpMD5AeYTjOkWrLJL4ey1oB3zMqFDWumrG9MqmqAPQtKr/lmEoUqiE3wXyoBDx+Xi
	Iwfjog5iIi6OQd2vy45O8hXuduQAj3VnLgQX73UtvHlM9zu/wKNLj6XV/KGy1YdeqAbv0P
	SLV5b4C7vP3PSIsNxWIaxylQ/Pu11r14C4ymrkGRNs8h0Zh9WePZ3uHmMB7jlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407094347.2108-1-vulab@iscas.ac.cn>
References: <20250407094347.2108-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v3] mtd: bcm47xxnflash: Add error handling for
 bcm47xxnflash_ops_bcm4706_ctl_cmd()
Message-Id: <174591879227.993707.10510220720735935886.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:26:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022637_109729_4FB7A394 
X-CRM114-Status: UNSURE (   8.25  )
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

T24gTW9uLCAwNyBBcHIgMjAyNSAxNzo0Mzo0NyArMDgwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IFRoZSBmdW5jdGlvbiBiY200N3h4bmZsYXNoX29wc19iY200NzA2X2NtZF9jdHJsKCkgY2FsbHMg
dGhlIGZ1bmN0aW9uCj4gYmNtNDd4eG5mbGFzaF9vcHNfYmNtNDcwNl9jdGxfY21kKCksIGJ1dCBk
b2VzIG5vdCBjaGVjayBpdHMgcmV0dXJuIHZhbHVlLgo+IEEgcHJvcGVyIGltcGxlbWVudGF0aW9u
IGNhbiBiZSBmb3VuZCBpbiBiY200N3h4bmZsYXNoX29wc19iY200NzA2X3dyaXRlKCkuCj4gCj4g
QWRkIGVycm9yIGxvZyB0byB0aGUgYmNtNDd4eG5mbGFzaF9vcHNfYmNtNDcwNl9jdGxfY21kKCkg
dmlhIHByX2VycigpCj4gdG8gcHJldmVudCBzaWxlbnQgZmFpbHVyZS4gVGhlIGVycm9yIExvZyBm
dW5jaXRvbiAnZGV2X2VycicgaXMgdW5zdWl0YWJsZQo+IGluIHRoaXMgc2l0dWF0aW9uIGZvciBp
dCBpcyBoYXJkIHRvIGdldCBkZXZpY2UgcG9pbnRlci4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBu
YW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogYmNtNDd4eG5mbGFzaDogQWRkIGVycm9yIGhh
bmRsaW5nIGZvciBiY200N3h4bmZsYXNoX29wc19iY200NzA2X2N0bF9jbWQoKQogICAgICBjb21t
aXQ6IDAwYjEwMmQ5ZTM4MjdmYWJhZDM2NmU0NjQ1MTJhMzRmOTc0MDYzODkKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
