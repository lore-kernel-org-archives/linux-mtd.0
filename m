Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FC8C282C5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7Xa7G9/c+hv4MLTyXjHpTLa2+uhXtwkWIkK9eGIHog=; b=yu0tnv+tYJEgev
	yYwsfYb5hlE1Cv9ZH4wA1AEd0KQqWoLDzQNIYpV8KyH+jEO+zuSbigo5Qps547qLxO4U+iOiHEvdz
	CuZMWjNUWCim0WTMeszBHhUO62OOU8g4ACuHHxPYviwqWcMstEG8k8smwhcXKQR+gcLkBtVnM3X2p
	QZzd9anFaUUABgQ78z61MOVA4N7a44Ftb9MYRVtXQuFAghUhTKvvxlef574lnKCQXvpiDRZABvM8R
	ADNwlAsTc80qb1GsaHQO3PWregFonZLwyLFXihxOMwQtvLu9/uwPGsKPu5QxkfHOqHrHM1qL4oK8t
	dvkOyxhpx9xbyoD+G0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Jx-00000000NyN-3rn4;
	Mon, 03 Mar 2025 10:46:49 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3IQ-00000000NXw-2S1J
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 10:45:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE933433F0;
	Mon,  3 Mar 2025 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740998712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MU1m2UBny3vxat6MOLy5E4TOlCrCvh7NBR/89VGKh8A=;
	b=SuUEdi88Ke5PTzEk4N1AL+fxDz7nWqSrvASio6ISkR4jAUdcE9j0gmqolzFPSM8+AmoKWv
	+U8T9zcxy8iw1qbUAgep6Etagt6qHKccBUOTdACBtHqsj87Nb9FPTjQxIBFn3cUal/P7pE
	7D6EXlzjZ7vrge02YvTCbfMt094TMJhnUyoXFjZeJUiPx1twa8yvs66t+I/guPqMvJknwZ
	owqn3E65P7hoWRcqkKm6BtAZCarHXNYXTihVkWPrlzRGEiRA5nj61ENZAJCK04IK8hN31f
	H/rSqYhJQpwq2RVl20x1vKHjVxMzCOK5d4P5KqShXlGeW5Rv80kF+yjiMfWcFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: richard@nod.at, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20250220125812.2370056-1-festevam@gmail.com>
References: <20250220125812.2370056-1-festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Document fsl,imx31-nand
Message-Id: <174099871176.2206965.17458275544052780017.b4-ty@bootlin.com>
Date: Mon, 03 Mar 2025 11:45:11 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhgvshhtvghvrghmseguvghngidruggvpdhrt
 ghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_024514_750298_D41026D1 
X-CRM114-Status: UNSURE (   5.24  )
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

T24gVGh1LCAyMCBGZWIgMjAyNSAwOTo1ODoxMiAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToK
PiBpbXgzMS5kdHNpIHVzZXMgdGhlIGZvbGxvd2luZyBOQU5EIGNvbXBhdGlibGU6Cj4gCj4gY29t
cGF0aWJsZSA9ICJmc2wsaW14MzEtbmFuZCIsICJmc2wsaW14MjctbmFuZCI7Cj4gCj4gRG9jdW1l
bnQgJ2ZzbCxpbXgzMS1uYW5kJyB0byBmaXggdGhlIGZvbGxvd2luZyBkdC1zY2hlbWEgd2Fybmlu
ZzoKPiAKPiBjb21wYXRpYmxlOiBbJ2ZzbCxpbXgzMS1uYW5kJywgJ2ZzbCxpbXgyNy1uYW5kJ10g
aXMgdG9vIGxvbmcKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsx
LzFdIGR0LWJpbmRpbmdzOiBtdGQ6IG14Yy1uYW5kOiBEb2N1bWVudCBmc2wsaW14MzEtbmFuZAog
ICAgICBjb21taXQ6IDQyM2Y3OTg4MmM5OGIxZTFlYjlhNzEwZDlhMmE2Yzg3NGMwOTQ4ODMKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
