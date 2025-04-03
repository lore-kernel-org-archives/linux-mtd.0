Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454BEC3601B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAC9+MQZK1cZ9JW7YFEOV9yCIAfE2C5DDnFyNAfxLLo=; b=rJy9qgvRFtHsEy
	4WCde820bNvSR3w7LDCj+QQbpf1iRs8WHy/VmmKaacESxsbCWvRBzlIX2uOS7xLHWR2qokH5XJD2F
	uDOibwHyBAAJs3rzZvA7i0S1wSDIsodiB6S7RaosKQ5mZhK0kA0614pZjtYRj8DlEuR/GQ24IMnGL
	XQ7JiNOM+Yw2RVPMu4L8xFAaDexKx8y93f4OvJ+4uWQFz9+WHky0ySBsWw5mK0u6FIJUOATYbIDJT
	AK5gnb+mOm3JJURmvSoCNqmj6LzgNTSEpVi3/0oL3uwHsU0Q3Nyh1Xr1AjWqq2ejBGmdHvPlmAQtm
	3H+p76WY+8asZniTKBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hzg-00000008b1A-19xy;
	Thu, 03 Apr 2025 10:40:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hiy-00000008Ypd-1pqz
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 10:23:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F6FE4327B;
	Thu,  3 Apr 2025 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743675782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t5/K9HJKSTAwWcOGKvkV7Il6F2anBbyFZIJpq4YyIMM=;
	b=jadAHXUOk0brAQoHqnG0ixpvW8VoN0Ho9IEDCHiOFKz9Ek2oHttCU+IDtOKG4iUIYN+nxH
	ydjFmk5yx6QQv/1s29yBKMEqbwR3trwkCfTHTTiRsgrmgsAv7c/64d4PE1SQaXF4LQ7yHq
	6i67blakCppBUDiiGU03aMz0s2EgPWP7SixsOQuG72q/ZI3mRiZkgGc6qiQ9FppHw7OhP0
	uwea1nVsVBm1byRyo7CiWF1/tinsEWbHlaeJR6dOMOh+Y9U261BKZkKI87PmV6aDdAdaiv
	7K2MB3wIIo85ATJrq5M+gddxfkDHiF+83GobeRAA/K33Z2mlzjAPvJGdCrsMig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/19] mtd: spinand: Use more specific naming for the
 (quad) program load op
In-Reply-To: <e1d8108f-50c1-4924-bb68-53436728e701@linaro.org> (Tudor
	Ambarus's message of "Thu, 3 Apr 2025 11:00:46 +0100")
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
	<20250403-winbond-6-14-rc1-octal-v2-14-7846bd88fe83@bootlin.com>
	<e1d8108f-50c1-4924-bb68-53436728e701@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 03 Apr 2025 12:23:00 +0200
Message-ID: <87h63535ob.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeelvddrudekgedruddutddrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_032304_927727_0092CAF5 
X-CRM114-Status: GOOD (  13.35  )
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

On 03/04/2025 at 11:00:46 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 4/3/25 10:19 AM, Miquel Raynal wrote:
>> SPI operations have been initially described through macros implicitly
>> implying the use of a single SPI SDR bus. Macros for supporting dual and
>> quad I/O transfers have been added on top, generally inspired by vendor
>> naming, followed by DTR operations. Soon we might see octal
>> and even octal DTR operations as well (including the opcode byte).
>> 
>> Let's clarify what the macro really means by describing the expected bus
>> topology in the (quad) program load macro name.
>> 
>> While at modifying it, better add the missing_ OP suffix to align with
>> all the other macros of the same kind.
>> 
>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> I don't remember giving R-b on this, not seeing it on ml as well, so
> please drop it when applying.
>
> I used Acked-by and not R-b because I wanted to signify that I'm OK with
> the general idea of the patches and that I'm OK with them landing, but I
> may not have reviewed it as thoroughly as if a Reviewed-by: was
> provided. Please use only the tags that I sent. And if by mistake I sent
> both A-b and R-b, use just the latter. Thanks!

I use b4 for collecting tags, but yeah that's strange.

I will use your Acked-by here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
