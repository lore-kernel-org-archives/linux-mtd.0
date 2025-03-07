Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50EEC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73MwkZTwEjVf6VR7RpUIIpRJ8E0x22LaGaaWHGhveLc=; b=VCdY5OzgzPkZ3v
	dPe384FNZP361cxlhH33DM6gGUBd7ocLdOpnMGcl5Jt6nFOZ1F4LHWNNkuVZ0PE+b2c3gWb0ykq7B
	UBv0ZkmDgGQVHTUmP4uQQd80bh5u3HUpwXrxhOFpPo90Yzgkv2rVO/7YYhgJxoDSOB+/K+ZZte3ub
	yBXxpVrz/Mr0+EqXLf9FtAc+zEUdebGZwTQnVjYaOQPIAeWAOv5jOdjJARNQCCjqEIgAcKjpKD6JA
	uBTKOuN8C1jKI2/0HnGNzf/dA0A8qjsGjTTgDUw+RsUddsNtguGSmqlGtm6iW2+Z+n9aojfbA1NLd
	gBCa64E/XHJ5RpyijVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSz6-0000000DYT8-1Jl0;
	Fri, 07 Mar 2025 08:23:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSz3-0000000DYRW-1XCd
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 08:23:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9397F4434F;
	Fri,  7 Mar 2025 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741335782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYXYH3Nursl7YH5mZTgIbp1tBPkKvkIol1KbKrK0QGA=;
	b=a+JqrXkzg6T7EjzBwlU+bGU7X4W5BxVKF6hGKXyh38sfXQbEqL/LqemJgg3IFPD1A37i0G
	aYPUtdGJfuKZGz54sUeAiO1shUmMHXX7am3ocUyjvd1jgSoFEpKitO1Lf95pPz4+NS6MBI
	83DxVkWTVNai1phbOLrrFtrdyQ7kXDQx2d/arXlZaesj0z3w9WevNLCt1DmTPFKT6pGAR3
	TEVOw6ZpxXZCoaZLHXMnOW/6wVidGcHWtisxcrwQe8XeaUcoqWsuBsTeU/xl/p42ORq4lf
	Qvm4w6fy59ynVrgcGevgxNV+4MeCmZyGZaEJ5mmB7SdVM/yNyNkR09nhTEXMiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: spi-nor: drop unused <linux/of_platform.h>
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-3-c186a9511c1e@linaro.org>
	(Tudor Ambarus's message of "Fri, 07 Mar 2025 09:09:07 +0200")
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
	<20250307-spi-nor-headers-cleanup-v1-3-c186a9511c1e@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 09:23:00 +0100
Message-ID: <87wmd1s10b.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddujeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddujeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_002305_538201_2C04F007 
X-CRM114-Status: UNSURE (   4.70  )
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

T24gMDcvMDMvMjAyNSBhdCAwOTowOTowNyArMDIsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoZXJlJ3Mgbm90aGluZyB1c2VkIGluIHRoZSBTUEkg
Tk9SIGNvcmUgZnJvbSA8bGludXgvb2ZfcGxhdGZvcm0uaD4sCj4gZHJvcCB0aGUgaGVhZGVyIGlu
Y2x1c2lvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNA
bGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
