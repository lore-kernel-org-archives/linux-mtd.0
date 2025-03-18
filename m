Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56F2C28B28
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pivxUiNn3duaKlX4DMEF+KllaDfqqxTHmSu0DGu+eJo=; b=qfeOT3+RaZGUBH
	5HI/PAZGfSjRx3AFguqDLfOYRCcptlWeTvWBKohRLAdzB8Zsy+rjHm1dk4V/7oeTrSX231hvvMkRX
	7lyFn4ttPn9ddTksT7LZMfAuAQ16miHSVGFUSduPO5Vqsim0f2R5GqABJBP8zQotldyd2+raoMCgW
	9fhx+7rFia64M7ssFwD3zhIBSMTtYiDBgWC1LwFxziqaYJklrp1j5MYfLdyyoFNZhIPYqZ+YIPyjS
	vRGgeNtyUNfVLzAMfCna24CVY0ltc7YGEehH3ImVzDO7TQUCkKloyY98oN1lhEqK/Ui+DA72P4gdM
	2ObSnXPpGYayxXWNT59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZKd-00000006R6J-47l9;
	Tue, 18 Mar 2025 15:58:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZKa-00000006R5p-3TQC
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 15:58:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EAEB431EB;
	Tue, 18 Mar 2025 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742313494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/q4926rB+57Nx21Ffl9GnfKylDsjsZU0uG11Y++pClM=;
	b=WGaVtmtkUAEbaIx5rTLAxJ4N65o7Nwf+3CYEaHeyIOwGoNj7QKv0mS2/MlPPOnLHDuwn5H
	D7P34wL/EoZNzpUIEeHGIa2zZQ2SqQC9UN6S01L58TCjne6XbrbhpGCL//bIm/Xx/5Yoj0
	ihGkeYGnkkixhBpOgfCy0rUILlvinrtLp6l87jcLgDJx3E7M/UUk7/4nlE4h26v2YPF+k7
	L5IIGfIevzYz//Vm9SPDZApUl+aIa5AZblYfW9VUgYOfFEj6SAbs9L1h90W1bw0myoK4np
	9bt62EoQ1kCdiXJlzhE2mQddYiqaiYGH81WvT9Q6t/3oGfi1pWDLz0IUWzPjjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Improve spinand_info macros style
Date: Tue, 18 Mar 2025 16:58:12 +0100
Message-ID: <174231341604.976942.6445069518381171901.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
References: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefuefgvdfffefhudfhteffgfeiieduueegffdvhedvvdeludejjeevvdfgtdevgfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifrdhsthgvphhhrghngihprdhlohgtrghlpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigq
 dhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_085816_995562_B186AB2C 
X-CRM114-Status: UNSURE (   7.12  )
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

T24gVHVlLCAwNCBNYXIgMjAyNSAxMjowNTozOSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBMZXQncyBhc3N1bWUgYWxsIHRoZXNlIG1hY3JvcyBzaG91bGQgbm90IGhhdmUgYSB0cmFpbGlu
ZyBjb21hLCB0aGlzIHdheQo+IHRoZSBjYWxsZXIgY2FuIHVzZSBhIG1vcmUgZm9ybWFsIGFuZCB1
c3VhbCBDIHdyaXRpbmcgc3R5bGUsIGFzIHJlZmxlY3RlZAo+IGluIHRoZSBNYWNyb25peCBkcml2
ZXIuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCBhZnRlciBmaXhpbmcgdGhlIHR5cG8gcmVw
b3J0ZWQgYnkgUHJhdHl1c2gsIHRoYW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDogSW1wcm92ZSBz
cGluYW5kX2luZm8gbWFjcm9zIHN0eWxlCiAgICAgIGNvbW1pdDogYjI4ZjQ3YWMzZGRkMDcyY2Nl
MGU0NDdhY2U4OWUyYjRkNjkzMmM2NgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
