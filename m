Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3B0C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAc/ZticS+crpMS8cHypEO0/vGjphrQ/kxlMRsf8IS0=; b=EZxXqr7olGJi7f
	svPfwrPkNZHkDa9piGzVocgUWbkTZoE3TJ2A+nMy15cbvbpxjUAHufbQT7KMy2GQ3SX2L4U9cVqqZ
	IQZAHmeXr3Bc37wGK3M8MBsg0eC6Sw9/HkDPrxmcjYf/hAnuJIqGqIwjc1+5w4tLYnPj1vLlFKHNE
	ze1Pon2VftNBSFg8X6vytoZp+cGVE7R3i5ciwU6POyfusKP2wNVTCxadnl8mhLN+eXMTgqqAddnew
	NU0QiJiqjLTeCY1uZoOYKxlXgchWfWmr6gcjxC6KLdTwz+mQFeViKx3blmdDcajvQQ8lS87BwhVyj
	q/nT72+jlpkEkeEyUalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZgw-00000006VYy-3Jc5;
	Tue, 18 Mar 2025 16:21:22 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZf5-00000006Uoe-1sor;
	Tue, 18 Mar 2025 16:19:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED1EF444D6;
	Tue, 18 Mar 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742314765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/AxgIgt8vecfvtvzMLhuv/34eYNrWZI3TyC35mHmZw=;
	b=IhggZrELsy2jktQSttbwimH0C/+Ti+xR7lRFIi8W9GwEmfzp5Cb9a7r+puX9C5lr/dcm/j
	riQmWafNX5Kdvv1eLT/cPa/BkRQ2O276+H+ynspd0ISlLF5kwSycQCGec/BICzeTVJUlvh
	M1SRHc+FuR6tH64h80rrN2tDBdalQUYew2zYQeFJnWmkRSd/3RGMmeyjvmpk0KVCS1jqOP
	HwlQUFW91l9rOxiRyE2vDyoX98aGpo5ZMlDBY1/gvtgecdzzwbxXonEpu9MnWYuIc4p/3b
	b89R8hWNtP+MPUo/HJM7NWxgUfoXBaYAYbQ7egQpmlEqLeh+5WqFZR1McoZ8Bw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250317-atmel-dataflash-v1-1-1a3247f40299@microchip.com>
References: <20250317-atmel-dataflash-v1-1-1a3247f40299@microchip.com>
Subject: Re: [PATCH RESEND] dt-bindings: mtd: atmel,dataflash: convert txt
 to yaml
Message-Id: <174231476490.980483.3190469118057006004.b4-ty@bootlin.com>
Date: Tue, 18 Mar 2025 17:19:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhig
 hhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehnrgihrggssggrshhhrgdrshgrhigvugesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_091927_629107_B56E8BFF 
X-CRM114-Status: UNSURE (   4.63  )
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

T24gTW9uLCAxNyBNYXIgMjAyNSAxOTowMTowOCArMDUzMCwgTmF5YWIgU2F5ZWQgd3JvdGU6Cj4g
Q29udmVydCBhdG1lbC1kYXRhZmxhc2gudHh0IGludG8gYXRtZWwsZGF0YWZsYXNoLnlhbWwKPiAK
PiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBtdGQ6
IGF0bWVsLGRhdGFmbGFzaDogY29udmVydCB0eHQgdG8geWFtbAogICAgICBjb21taXQ6IDQ4YTI5
NzIxYzk2N2RhMWFmNjU3Mjc5ZmE2OTZkNmMzODZiZGQ1Y2EKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
