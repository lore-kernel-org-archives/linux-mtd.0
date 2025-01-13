Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FE9E7719F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wm0RnHZg+HYizodIl0Y6bGNwccSnltJLguBeufK82Vc=; b=dM67XN7oO7h7Fy
	usHU+Ie+JwnEBTqImQVub+Hmictn2N/9yKTODkUxfJEKBXeQVHLKoGfKJ5QXHOVeV97tpWYsbPYIl
	KL6dBpOto6crYxFQjspxEXkwGMxvrivI41iB+sC8n+g+xMaHDRPugFi8wwfn4ij/4otYLXFHnGTyw
	mlCfYyGHHWPNw6rqEphQ6S5J4Gyz4tsY2Wk+lOjUQwFKhLROHkErj6zHJFIPxGwG//ZheLXBkxG21
	ECtVFh3bt6BUdNiCUVToKQZl/aGBPU5dx3Zcb1UjhOimFWqTGHtgdAW8SOoEu4VdC87o3bbh4NqGz
	RVZamLU9/cB7Y7vRLHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKgK-00000005HWa-0eCd;
	Mon, 13 Jan 2025 13:40:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKgG-00000005HWD-0ht6
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jan 2025 13:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C5625C5422;
	Mon, 13 Jan 2025 13:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EF7C4CED6;
	Mon, 13 Jan 2025 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736775635;
	bh=B+07sCY10tpw21NMC2JISBSUbjbJMcqCQOLgT04sJtg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qPpkfcOdv3FaNeKTpPahHgpYJ98rqlGyiiQffLhCs2dgx+J/S3ssw/19DNwRaGrOh
	 n3xqsc4ySn/JRsJNCEZ+rC3yrVWF8AjWGSVm9dyXfVJ3T9OmHpa1eCR+5ovsk9SBK5
	 sihyI2FL6D8qlyg3tVEcBzeGbXz1H0g0+b6nZfJtmN3TrnK6IKm9Z68sJGJaATh1Iy
	 k5umLuwidB3UiN3V5qmhA1WKBMrIC8ib+pdQ2B8SzPAOtq6jJxbFezRzVprTJpvwMl
	 Xj7ZrHxhzeiCO6BOIiGe+gIPrCkc8b/6f+8kHHVcclestmsrusje3z2sMgIbYkVOfB
	 DKDrKGJiXBQtg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <87ed1carsk.fsf@bootlin.com> (Miquel Raynal's message of "Thu, 09
	Jan 2025 17:14:03 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <87ed1carsk.fsf@bootlin.com>
Date: Mon, 13 Jan 2025 13:40:32 +0000
Message-ID: <mafs0plkq7rxr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054036_250225_D54712A2 
X-CRM114-Status: GOOD (  10.90  )
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

On Thu, Jan 09 2025, Miquel Raynal wrote:

> Hello Pratyush,
>
>>> +	}, {
>>> +		.id = SNOR_ID(0xef, 0x40, 0x21),
>>> +		.name = "w25q01jv",
>>
>> We no longer set the name for new flash entries. But knowing the flash
>> name for an entry is still useful, so make this a comment on top of the
>> entry.
>
> I just connected the dots and understood your request. I will respin a
> series will all your comments addressed. Thanks!

Yeah sorry, I was on vacation and didn't get around to opening my
computer too often. Your v3 gets my suggestion right, thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
