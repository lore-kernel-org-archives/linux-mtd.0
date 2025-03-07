Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB49C28B23
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mP4GHqvZVaP28MzmeU5f8cLn9taH0zpOjLvO0O1sduE=; b=ep5915fHH5nNOk
	mkDzT0oSRh+/jQTRaCN7OhLwX4KuiKgMFEYUqaKBGGK+dnYniI2NVQe5ldUMXcGdUIEdR/cfJeFhj
	50lVjtQXWVHttL0iH9Kw014o+KKy63n5v67a/r49Tr0/rMDmKrz9jm7X3DpfoPFRlsYfWZc73csRl
	pNt+XIlDbAoPFEdFqZBu0HCGZ3fDtMOxsEJEVY+qoSShqBv/Vr13nDT09uGEZVO9eo+hwd2JDFHUI
	hVLglhds1iLXWrN5oa3YXx773uIfdvzRc6CyYQzGIyd7P9Xrn7UjQ8adKfLBJej76AydH9Mvb7cKW
	4aZjJVQ7WgUjBEgGrUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa2C-0000000Em6G-0lH5;
	Fri, 07 Mar 2025 15:54:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZxN-0000000ElI5-2j9J
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:49:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40A98443B6;
	Fri,  7 Mar 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741362586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VtL6eoYzvzBLjULBoBQyAiTAY2Kt7SvuQGNIxrXTK3A=;
	b=Cc0On2EA9eTB1jEVIhHE9+rFfERJFTWUYrnL7O+IIJsSjjapNhZE7P6AqYNCl2ExsAUAcS
	sRPKv30gNFtzBVa/5QC9+3+gNs3r3J1nd4qPmC59nLQGrrNDW+sCoZE9UG7m53pZ274ZNh
	LhEZoUsvRp5AVsATntS67Tg94dpqg9wnDznBP6qWTKqLHQhYUweEbI/L2Dtq18tvxDsSs4
	jSKs3Iwf6FoMONGNpQRYM+u5OS303TqUesgR4Hyt2kqKjWvVjF17H/Ix7l8rOVbNZBWXLx
	QbT4+z7If/qJMxQZJ3YxaRJBDtqDpx48kcCdHq67/aOxsl0yP7KDHqLvXY+vVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/21] mtd: spinand: Use more specific naming for the
 write enable/disable op
In-Reply-To: <80da4df1-cd35-469b-a636-8f405358ef00@linaro.org> (Tudor
	Ambarus's message of "Fri, 7 Mar 2025 15:39:43 +0000")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-2-45c1e074ad74@bootlin.com>
	<80da4df1-cd35-469b-a636-8f405358ef00@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 16:49:39 +0100
Message-ID: <87jz90rgbw.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeelvddrudekgedruddtkedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrudejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074949_816450_B375FBC2 
X-CRM114-Status: UNSURE (   8.23  )
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

On 07/03/2025 at 15:39:43 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>> -#define SPINAND_WR_EN_DIS_OP(enable)					\
>> +#define SPINAND_WR_EN_DIS_1S_0_0_OP(enable)				\
>>  	SPI_MEM_OP(SPI_MEM_OP_CMD((enable) ? 0x06 : 0x04, 1),		\
>>  		   SPI_MEM_OP_NO_ADDR,					\
>>  		   SPI_MEM_OP_NO_DUMMY,					\
>
> here too, I lean towards keeping the name as it was, but maybe others
> can jump in.

These are indeed the three commands with just a command cycle. But then
we have eg. page data reads which have no data: 1s-1s-0 (or 8d-8d-0)
makes sense to me because it is clear that there is no data cycle. Or
even worse, a read ID instruction can be 1s-0-1s (or, again,
8d-0-8d). Removing the 0 in the middle would definitely not make sense,
and to keep something clear I would actually prefer to keep these three
members for clarity, even though in this case they will remain 0.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
