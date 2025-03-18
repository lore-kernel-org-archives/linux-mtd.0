Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB78C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSU876OpMWQnls+UzhGbPqj0x0fMLC/An1DoVZtfUxU=; b=ImRn4SMRqb2eIO
	RM8jiH8BgIeRX+aY+qDFzJeFmW6/a/kAU3frrSDdfsf6bvRl3LhvigYJNm+rTgp5TBkDvVfTivrAv
	96aCVmsp2y7cMdTZDeg+vlzhFIvEN+L240drHKitiCsmgOneHCN1CAsPFdf6dDidOvrJM0m0enI5M
	VmQLA4dGGxQL4qyN2Hkyx7MEQi2e/zeN6sbsSLWKJKZEkgn5z1uHzA7VlsvOiDBpm+FdTSTTXtt/4
	tRja7EL6vHE04R9CJn+taHiYL8UMS2omlNiShEeL3QuScy9DwGaKYgP7/uq/k4444vF6JWCydpWwr
	w4Ie6l2bryk0C+kmwzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZcy-00000006UCa-2Iiy;
	Tue, 18 Mar 2025 16:17:16 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZcv-00000006UA7-2yAz
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 16:17:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BE2C441C1;
	Tue, 18 Mar 2025 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742314631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVk+xYOAI24ssZ2g1HmfcjpWNVsVeIoJttJ9AIMmxhk=;
	b=IcZtxT6Magpaqd3Ff644q78D5Ny303/ipNwNNsIryS6a02MG3HGAppDF0x9kp2sM9g69RH
	/b+Lflpx+y99vJiOvkgfnHHrtzwfUhsSZJqAW5eV/mvXKn70BUtxkdIK36szKVN2BuIq3b
	irBuhuBzAZCy+chmQ63moM5CLUH8K4KDR9/xjbPk8mJXZg1c7w3vslVM+JeCMm6q5FBcna
	TykLaVh+7LuaHe89JeyIsb/LIUhm9r0QfG4aU6ENdqIyDQn9wHteWhFw+UsAQQOZliCSdk
	IFG1xO7Q0lfEQbpEXRi+dQj2mEhaHBRgcvrnSmW/EP8f3/P4yzj5f01wEKA/hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix a kdoc comment
Date: Tue, 18 Mar 2025 17:17:09 +0100
Message-ID: <174231458436.979692.11846172650554767394.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305194955.2508652-1-miquel.raynal@bootlin.com>
References: <20250305194955.2508652-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefuefgvdfffefhudfhteffgfeiieduueegffdvhedvvdeludejjeevvdfgtdevgfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifrdhsthgvphhhrghngihprdhlohgtrghlpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigq
 dhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_091713_874477_D3D0F271 
X-CRM114-Status: UNSURE (   6.07  )
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

T24gV2VkLCAwNSBNYXIgMjAyNSAyMDo0OTo1NSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGUgbWF4X2JhZF9lcmFzZWJsb2Nrc19wZXJfbHVuIG1lbWJlciBvZiBuYW5kX2RldmljZSBv
YnZpb3VzbHkKPiBkZXNjcmliZXMgYSBudW1iZXIgb2YgKm1heGltdW0qIG51bWJlciBvZiBiYWQg
ZXJhc2VibG9ja3MgcGVyIExVTi4KPiAKPiBGaXggdGhpcyBvYnZpb3VzIHR5cG8uCj4gCj4gCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCBhZnRlciBmaXhpbmcgdGhlIENjIHN0YWJsZSBsaW5lIGFzIGFk
dmlzZWQgYnkKVHVyb2QsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDogRml4IGEga2RvYyBjb21t
ZW50CiAgICAgIGNvbW1pdDogY2E4Y2JiYjJiZThmOTA2ZDk2MDJhNmU0MzI0ZjhhZGYyNzllOWNj
MgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
