Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE2C87FC9
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPwCzcmQ13vc2Swfydgx6PUeoIhmlTXXClkQbRQIXhg=; b=znzU3XR1ra4RIF
	RZKoBxnOTO0Ivop4PU6YpuLw7xB4CqNGDa/sAgbOqgnwP+eApZchOLCJRovod7j/arpO4NtndRkLI
	VA1WB8UorLWceVdAM0uwLKAUP3csI931/wQ5jg/0TeU521+WwpZ8czqYIMg5DWwKS3OcB6O6IN5VE
	sdSuXe4rSv2qGMXRpMCHRmumsIFUu5Ga+VRCyqqjngFZlnVXYZcOoloTDrF3EmuIOvu2yrZrYddOC
	Zbzwd98aHK9/UdXjvlUYHvbEmHlkuYDKBdSdVfmHlAkGa9mY2erOh/d2FMf/Sw3PfPy4gnwG33wWn
	ktLpAaE/08q/P6Wi8dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL2I-0000000EDps-2euH;
	Mon, 28 Jul 2025 10:24:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKv3-0000000ECXg-1XS0;
	Mon, 28 Jul 2025 10:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ke/PcRqDTW/FMp/3ob8XCd3S2uQ0KPzfCYd8FTbMaV8=; b=UwYK0bVLPy1JGuvbQa8MY8igmE
	tj0GERnptCfOFS4kjNGY4a90DEcJcrzuuX6JLQCv7Ox25iwndBBTva+q68TdtU4FDvg0XYmE/NTqo
	M30uagWK59vvaRVz8Sp0xwjbFX6NEPVyRQRY+84HNGeS++iJoDi3nSYCD5+iSV/qzZrGW2/P5+vim
	TBAUKfA9152xK/nXgS5WIyJ97Sf8s6yJVqI3bEVuaUqjnmLBoaHd6VLvo8Kcq+RT0SJld+hH37l+a
	4BtEZPliVYjc+uyZG8uZD7zIa9XJIEL8gV2RPXE7vogU3dK1toYoxDisn739IqIg6L6/Cw5WtLQYb
	BsoNTr6g==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKus-0000000CQxC-00Wk;
	Mon, 28 Jul 2025 10:17:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA56143292;
	Mon, 28 Jul 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ke/PcRqDTW/FMp/3ob8XCd3S2uQ0KPzfCYd8FTbMaV8=;
	b=DMrEeugyTNMXGKe1CzbreCKWjokenAc8UxJeIvfsxDVtEzNl5HnTdUD/B1HSBTdFQbfjPx
	P54fmXSzxO9JNTSKsmBchXcE2W1TKHalp8XfoIdmP1VDl3p1xjT3LnC530DFefdYihPyxY
	IQa2PJ7mH72uV6k2I7cjE5zjT6gXQlv4UexV94XQmbHuatogHWUtssVcsXMDCIo60ye4wZ
	XPd4RuBLGVIOofanoAO+aajL+GCpNFnwbOQjPFg1Xdn45yBBgiD4QrtAu/NR8sN02G8Pfa
	zXHcfOvGH+JuHOMZW5uvrKBz6fw2DA6M+0tPwdXSwu3zHjgwHB0/rn+oJATrXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250707071555.17704-2-fourier.thomas@gmail.com>
References: <20250707071555.17704-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: rockchip: Add missing check after DMA
 map
Message-Id: <175369782677.102528.4677825344596689403.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhurghnjhhinhhjihgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtoheplhhinhhug
 idqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohephihifhgvnhhgrdiihhgrohesrhhotghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111714_383773_C8AAD837 
X-CRM114-Status: UNSURE (   5.73  )
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

T24gTW9uLCAwNyBKdWwgMjAyNSAwOToxNTo1MCArMDIwMCwgVGhvbWFzIEZvdXJpZXIgd3JvdGU6
Cj4gVGhlIERNQSBtYXAgZnVuY3Rpb25zIGNhbiBmYWlsIGFuZCBzaG91bGQgYmUgdGVzdGVkIGZv
ciBlcnJvcnMuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiByYXduYW5kOiByb2NrY2hpcDogQWRkIG1pc3NpbmcgY2hlY2sgYWZ0ZXIgRE1BIG1hcAogICAg
ICBjb21taXQ6IGZkMjc3NTMyYTg0ZjRjOWQ5MTI5YTg3ZTczZGRlNmE2ZDlmMzQyMDAKClBhdGNo
ZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFy
dCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhl
bikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
