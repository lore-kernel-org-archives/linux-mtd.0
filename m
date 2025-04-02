Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33105C36017
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnXYzHv4GLB6qGPzsVK1WP09xy3xO/RxVqN01BcnZVg=; b=1Q2ULJ/e7yzSuz
	s394FPuVp812e3B1Y7Ip/MjaczkilfrGdjj/0EU2u0Ym5Zg0jE3qxZWJ4iAKrLaXFkF0FtiFRzuFM
	eh9mCjIK4SibViCK3faJiHgctZ2gRG/t6tlBzU3kUi0TMGRuv5+As73M8bMJNPfD1zqhlK6DNIlAU
	h1THFImVM5Pj4UCkvi95ni786mqskRW/h2C0UFv88Bv9JE8ZN3Ak1dP51+biS/9+vry6Rfo0Xf1ut
	DQZB2sKLmfRyv5CGM1ECXXVJeOZ1v4PLx5l7m+SZaH7xksBbLaKdMUPMMzHfqvinEMUiv7b8mdvG6
	IN/zl2nFyxzQbeAe4bdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01Xy-00000006hzo-39Fm;
	Wed, 02 Apr 2025 17:06:38 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01Xv-00000006hzH-0s7z
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 17:06:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0054442AB;
	Wed,  2 Apr 2025 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743613592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X33ULJkNEeFrm6fvuw+896JvktkT2V4WZKxemmZPflg=;
	b=kBY0Dbo683L1ijljTpbIlXZ3KD0c3DAGbCnvmx5LXHf9yPsikrDdE62hnu+/atDU770P5q
	Yr/2IObNNw3Y9VOLRCBWnFcLrYhJNNH0RiY3NjVhvNgbUtARG/tnIB3fnR7ngfeAWUSAmg
	l3UCF4TSlCEal2jXaAX6JHPG6bLr/wDGjeOt9O6vKuZseTs293i4861eHQsKnwf2VPwI2o
	s7kay1IWlQB7xiazqoyPh8n7VNEfm8zPRJHWVhzRTB/Zk+6cNxlYl6A11oi1+qD/XcZuJR
	OgHk6AivUYGjyhtDu2v7QvyzVYY0vfXJuiawKhIsE0GMxm+hL01oTeMwQ/h3/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/21] mtd: spinand: winbond: Add support for W35N01JW
 in single mode
In-Reply-To: <94ed8cf8-1e0d-412d-9f8f-959fe4b5b505@linaro.org> (Tudor
	Ambarus's message of "Wed, 2 Apr 2025 16:22:41 +0100")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-16-45c1e074ad74@bootlin.com>
	<94ed8cf8-1e0d-412d-9f8f-959fe4b5b505@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 02 Apr 2025 19:06:29 +0200
Message-ID: <87semqpk6i.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeivdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_100635_378485_85B1FE05 
X-CRM114-Status: GOOD (  15.98  )
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

On 02/04/2025 at 16:22:41 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>> Add support for the W35N series by describing the smaller (single die)
>> chip. It has 1b/512B ECC support and its own OOB layout.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/mtd/nand/spi/winbond.c | 54 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>> 
>> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
>> index 99b9f333eb3142999d8f73d43537f1ed9789c975..9b0369a077efadac8bd6be632f15b822d42a7227 100644
>> --- a/drivers/mtd/nand/spi/winbond.c
>> +++ b/drivers/mtd/nand/spi/winbond.c
>> @@ -23,6 +23,16 @@
>>   * "X4" in the core is equivalent to "quad output" in the datasheets.
>>   */
>>  
>> +static SPINAND_OP_VARIANTS(read_cache_octal_variants,
>> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>
> strange to see octal variants name, but just single SPI ops defined. I
> see you define octal in the next two patches.

Octal is what supports the chip, even though at this stage it is not
pictured. I could rename the variant somewhere later, but I don't like
that as it makes git-blames more difficult and the result is the same
anyway.

> How about squashing all 3?

I prefer to keep core changes separated from manufacturer driver changes
when possible. And for the introduction of the features, it felt correct
to introduce a first level of feature, show the performance, and then a
second level, show again the performance improvement. Maybe I can
re-shuffle the patches to sort core vs. manufacturer changes and squash
patches 17-19 and 18-20 though.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
