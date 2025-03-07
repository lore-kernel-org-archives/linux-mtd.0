Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7969C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgS/2t2B4B2/adk8RMHzyFEeau7IdBQZAd4eu5pyrXk=; b=ArND7GPtZsk/Ak
	Dt1Y/1AJtvVSO+Z6vgNBhMV5gp2zqQcZ2IIXxNbYcGIqeveyi/ConINR6FQgar6wmuhQfHaCUR6HD
	08ZQ4yztXIG0Pz/MpTfdLJzejciKbSxTakqA58NKZm2HwBVO4wRbsncgfWWmiZYTSqkR6jYXhvhgx
	JPh0aEauB4IziMZBsyHGe6f5TR0NTgg7lGZaD2Dt7TuFyOXS4Uo+ELEgYxpxPBE1CPs+FLqgTVU0N
	kYXHKMvRCu/x45jEhMGYes0VBC4Z9btpyORWftCbwff/BMj7R0jxWgVheh8kdw672w1tXAggk/zBZ
	enbdQjOT4XqnhcBhQgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaEI-0000000EosJ-3KcW;
	Fri, 07 Mar 2025 16:07:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaAq-0000000EoLy-3Jqg
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 16:03:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2E0B20454;
	Fri,  7 Mar 2025 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741363422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tqNSpD/VzmVqzNzsBmJgam3pWcCCgI2wH+06au4N76E=;
	b=f2Idy/CxV1lx6YSbxmrSN4qQ0N3qz0lY0sb/DTeL4NvLrydB/+gn2edmHrGeo5MV5P1CWw
	4zO2cSJiDJRo90vWU9smQYi9TgRU/UN1MtVRxFkkKcvKFaobnFRgf1bl/AaHSEhNPZ34JF
	h+OIPD8c2XkkwkHQS2vECGdIwytKbKCS2Xs2VRDJq59tE5X1uXkE39gwx8LxoB7ZbUcmxS
	QybDkY4ESlC0keNDk/lj1R54FSgxaB9+Zblf0amHITjKgfGVaNbEBZTUMs8irezKRu2tW1
	w50W04kRItYmyx7uW4pSk8kj94vwE9MzXNAkdX4iOapl3A8Gosc9xNRfH/gjNg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/21] mtd: spinand: Use more specific naming for the
 erase op
In-Reply-To: <48453010-560b-4985-a6e5-31401da24d62@linaro.org> (Tudor
	Ambarus's message of "Fri, 7 Mar 2025 15:45:03 +0000")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-5-45c1e074ad74@bootlin.com>
	<48453010-560b-4985-a6e5-31401da24d62@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 17:03:40 +0100
Message-ID: <87bjucrfoj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeelvddrudekgedruddtkedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrudejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_080345_125374_3903B2A2 
X-CRM114-Status: UNSURE (   7.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07/03/2025 at 15:45:03 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> If there's no chip erase for SPI NANDs, then keeping the name as it was
> makes more sense to me.

There is no chip erase indeed, but my goal is to mostly clarify the bus
topology here. Specifically the 1s-1s-0 vs. 8d-8d-0 operations.

It is true that this series only uses the data-oriented commands because
that is where the time penalty really is, but I figured renaming all ops
would be nicer to keep the harmony among them and prepare for the next
step (octal dtr).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
