Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79785C87FCA
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFRx5QcmNlZ8dclwymbpcG8eX5RPprT2P+qs3ZeTBfs=; b=N1A+961Stfv2c/
	jkuXvsJYb54sRRUhUMyp65XoAIUDwEn0/wTPQ4LG3+7kyRRZy++zOgUjwIa4LmF12gFhCJLLDYBAl
	8PMV78+jQrFvAWYJZ1OmgsoZrhZrtbGkz0RWAzCFdR1WfboAV0DVY8QJ2gdiXiybbchdMAD/qeauD
	AHcc7LG4dGclWC6usWvCvQnlWx1F3/hzMk+Tb88mjPVhyuMCs0IjvRL1BqlSXuMFcn/x/IdSMVY9y
	bU7Wyf6p2sJffOorFuC4DFuPXDDCa4h4o3BwY6Za/tO2QcvbJ32xUh8aLktkaAf+xBQ7Wq+9zhJVs
	eBD65d7z8xlYKvXZEv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWZg-000000047aD-30PS;
	Thu, 31 Jul 2025 16:56:12 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWZe-000000047Z7-0FEn
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 16:56:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8700D4422C;
	Thu, 31 Jul 2025 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753980967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eGKsIaoc81M+4yxExXNWTtfGa7rntTlLqdvHgJABQU=;
	b=a0xIT7GJUN688fzwSM1b+jQtUHQ/LF/HSmkbE28GAgMQsYuydkqP19Ly2EIJZVV7TxJk0p
	SGB+bKAag9J7SuM8XsxTdyi4fzMhHb5GgE1j1k3HOYMEvbJzKVwkdd8WYEcWn8tyOKtoSb
	uOoJjMV9BSTwQ/bpcDM9UGtwIV6gn9Z8Q4oP/u7RzUW+h+TLUoacdxBOQWirI13QdpRzFZ
	hIbgGbaCWa/Weg5Q1TPYClu2qkHs7s4TY86KVNcgNOM5ujuEmiLH4nev6A7+6jqr5682zQ
	bVozkuv/qqqMb7IDlMk0hnzzSYHvjbGBgdLFocGt8WIaQ8R+Mi//DXha6M4PIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.17
In-Reply-To: <mafs0v7nhstda.fsf@kernel.org> (Pratyush Yadav's message of "Thu,
	24 Jul 2025 13:47:29 +0200")
References: <mafs0v7nhstda.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 31 Jul 2025 18:56:07 +0200
Message-ID: <875xf89u54.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddufeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffueffvdeuvdelhfelgeduiefgueejieehvdevhffffedvffekheffleejheenucffohhmrghinhepudejrdhnohifnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_095610_225776_1B4D2BEC 
X-CRM114-Status: UNSURE (   4.73  )
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

SGVsbG8gUHJhdHl1c2gsCgpPbiAyNC8wNy8yMDI1IGF0IDEzOjQ3OjI5ICswMiwgUHJhdHl1c2gg
WWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBIZXJl
IGFyZSB0aGUgU1BJIE5PUiBjaGFuZ2VzIGZvciB2Ni4xNy4KCk5vdyBtZXJnZWQgaW50byBtdGQv
bmV4dCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
