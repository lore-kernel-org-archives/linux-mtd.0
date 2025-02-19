Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53419C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ql9Qbbui3C7f1UTF3P1cNShpdy5EwRnwkWHslqjbF/E=; b=Rh7sgl7ywIS+VK
	0JgWoOkeq+YtN+87VEn6Kh9E1JFnwu2ZPDOJwxdmvD7JhrJLgqt/xcizSg4Jxftg+BqTxb/TFYSWL
	XtXINz8Nb7tRnn6AWRiK4OEUIL0CdYJlk01h5DdOuvZAwWK3pkDCkSwldJsDThLWbr6IBc32UAvmY
	1ZXzezdF4IGj1zGVLZgVuXA4YfNkQfYVlHAJ8sPDyxMMIn1BqLkc0wbI7aQcpb/q6qzuGR4eW7LEH
	DdTnBduxKe9bHM9NJUZjnFJL5T9q9Xx51Lh+C+pnWpVlj9ITWN+S/o1ndLsMrN0/WPBeacJY5Hrl/
	PEaDmTSKa7YNC339dVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkMp-0000000D1yJ-2QOj;
	Wed, 19 Feb 2025 13:43:59 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkKH-0000000D1GN-1SZE
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:41:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FFFF443EF;
	Wed, 19 Feb 2025 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739972479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcBRoz8d8kfVyEGHs3Q9+R3j8VA136sGzn8ZA7cE/sU=;
	b=UwfrExLByhzPWOX2cZk++dnv8S1jfe7JPEOeEXBm2csPgjTE2VjZJVzVyFSGOWgjIFEzbK
	FTPdvxd+zOEBb/MjKVg/J9c6gm4tXv53pzIHfbEjNnDkq4iML8+BQv7HuLGJY/mRPpzA/y
	h+Y+TVSnYMF8U0D8gQfOwe4ucf0p2pPrmiVO9r/obAKnbMZT0+U3cBB7SH31cRej3SKxsZ
	YlA05x5/xeF+n4p0UP09oSxFX27jlOatqbUqk29OSzJgEsz4jPNyHmWl9eMaiULJgP6pqv
	Ku3m/aQQOQKmwQQKErQGD9TYBRDbLpqjzyGraVQm6FDs657tlXiTBxS3nqaj9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux@treblig.org,
	Shen Lichuan <shenlichuan@vivo.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	u.kleine-koenig@baylibre.com,
	nirav.rabara@altera.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH mtd/fixes] mtd: rawnand: cadence: fix unchecked dereference
Date: Wed, 19 Feb 2025 14:41:17 +0100
Message-ID: <173997243493.1255269.588065932781621293.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216031536.3366360-1-niravkumar.l.rabara@intel.com>
References: <20250216031536.3366360-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeugfdvffefhfduhfetfffgieeiudeugeffvdehvddvledujeejvedvgfdtvefgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehshhgvnhhlihgthhhurghnsehvihhvohdrtghomhdprhgtphhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihli
 hgsrhgvrdgtohhmpdhrtghpthhtohepnhhirhgrvhdrrhgrsggrrhgrsegrlhhtvghrrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054121_515178_88BCEAAF 
X-CRM114-Status: UNSURE (   5.46  )
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

T24gU3VuLCAxNiBGZWIgMjAyNSAxMToxNTozNiArMDgwMCwgbmlyYXZrdW1hci5sLnJhYmFyYUBp
bnRlbC5jb20gd3JvdGU6Cj4gQWRkIE5VTEwgY2hlY2sgYmVmb3JlIHZhcmlhYmxlIGRlcmVmZXJl
bmNlIHRvIGZpeCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nLgo+IAo+IAoKQXBwbGllZCB0byBtdGQv
Zml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogY2FkZW5jZTogZml4IHVuY2hlY2tl
ZCBkZXJlZmVyZW5jZQogICAgICBjb21taXQ6IDYwMjU1ZjM3MDRmZGU3MGVkM2M0ZDYyZjkxOWFh
NGI0NmY4NDFmNzAKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5n
aXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2Jv
dCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
