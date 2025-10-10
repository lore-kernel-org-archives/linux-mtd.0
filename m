Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C545ECCD185
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dpja9LNFlTHRzImBHmm9nWH/qJAjZ+sUcy8S47ejvos=; b=uD9txP6RqOLwkr
	6SKVTvYycVTctgkK3e+jPvn8rMoHLl4J4lwSFa9wO4DRkXDhHYp2BOxBcdgbe79jfQ4KUtPZErvZv
	PVjuv8wkuwd/6KtKXIVBnijGlDWJmogyHTk45Ny0TVXY52+3DXBBK9YWDolDn+DxjtEmyqsrvHlH7
	4sU7oo2hOmBiGS6Ux4gVA5LLYwBpXE80lgZb4wdeReNN5Oz1uAtmHN1PuIIz4KB1HI9uekKlgZjuE
	QywJOkCMJ+4JBWcVJyk9mN0hSwukE4TlQHe2HY3tNSUhOHsXfQ6qUKZXHRRBW+D829nf4PmU2qQRW
	XsPzzFDPFxXuD8wViOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJg-00000008t8w-2lXN;
	Fri, 10 Oct 2025 15:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJf-00000008t7s-1kr0
	for linux-mtd@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eASh6cvJVj3ZQiKmd81xQ1N7sMEhlMr/vAwAJqYpdfs=; b=OhbKJOZs0bini8aYvjv8CUqVaZ
	KZqgrBal86Sb7HKAPS56tHnmcn0JT1yd9TzxLw6AT6zWhRzZiocMy/+d+Q2hG09dcl/fnBsVt5vus
	JAiXKJayBf4tdrB9HbmmH+nELyvWPmVxtyUNFfTkIUziPTlRVkt75tuwWSBc9JQVBgiNiJsQjFKt8
	jtXwZPVamA1yYW+H5Z0qS6H2bLLvPcdZdcGqgITZKE3wUH/CfMoLDgNOybm/K+Jp3uztKA6FWQQ5D
	LoYPHCT2Oxm8x/RcEy8U4D8XN7jNAE1Tv5OJjXHznATa1uSyQCiMnDnmlG88cBZv9/UtbxrixkAUV
	SF/wKf4A==;
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJZ-00000002FFo-3T4a
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 15:45:57 +0000
Message-ID: <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760111130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eASh6cvJVj3ZQiKmd81xQ1N7sMEhlMr/vAwAJqYpdfs=;
	b=SF/3xsLq2Uaq/8N8nWIy0srJ0SSsnv2VxPXLeZL+6NBZpb64arhUuhnoW/VaFeAvZrGmWA
	5Y4718lwCC5xD9+56bWbUb58zMYqwjlpZO4+KArRs54208zlz23x6xuyEexyIPbNQwUjd0
	v9sY5E8rTqGFa6M3jx4dtQanShvZBZ8=
Date: Fri, 10 Oct 2025 11:45:26 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <mafs0ikgnn07u.fsf@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164554_491393_230EAE9D 
X-CRM114-Status: GOOD (  28.47  )
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

On 10/9/25 19:07, Pratyush Yadav wrote:
> On Thu, Oct 09 2025, Sean Anderson wrote:
> 
>> On 10/8/25 08:30, Pratyush Yadav wrote:
>>> On Tue, Oct 07 2025, Sean Anderson wrote:
>>> 
>>>> On 10/7/25 09:15, Pratyush Yadav wrote:
>>>>> On Mon, Oct 06 2025, Sean Anderson wrote:
>>>>> 
>>>>>> The datasheet for n25q00a shows that the status register has the same
>>>>>> layout as for n25q00, so use the same flags to enable locking support.
>>>>>> These flags should have been added back in commit 150ccc181588 ("mtd:
>>>>>> spi-nor: Enable locking for n25q128a11"), but they were removed by the
>>>>>> maintainer...
>>>>> 
>>>>> This makes it sound like the maintainer did something wrong, which is
>>>>> not true. Tudor had a good reason for removing them.
>>>>
>>>> I disagree. The maintainer used his position of authority to make the
>>>> submitter second-guess their correct patch.
>>> 
>>> Sean, you are being very combative over such a small issue. You must
>>> test your changes. This is one of the most basic principles in software
>>> engineering. It was perfectly reasonable from Tudor to push back on
>>> untested changes.
>>> 
>>> There is no abuse of "position of authority" here. When things break, we
>>> get to do the work of putting the pieces back together. So of course, we
>>> are reluctant to take things that increase this burden for us. Having
>>> contributors test their changes is the simplest of things we ask for to
>>> keep the quality bar.
>>> 
>>> Beyond that, I'd say that a little politeness goes a long way in life.
>>> Especially towards the people maintaining the software for free that you
>>> (or your employer) use. We are both wasting our energy on this debate.
>>> Please stop. Take a step back and think from the other side's
>>> perspective. And try to work _with_ people, not against them.
>>> 
>>>>
>>>> These flashes have capacity of greater than the 8 MiB that can be
>>>> protected using 3 BP bits. Micron (and ST before them?) addressed this
>>>> by adding a fourth BP bit. This is consistent across every flash in this
>>>> series, and is clearly documented in every datasheet. Defaulting to 3
>>>> bits is buggy behavior: we should assume flashes behave per their
>>>> datasheets until proven otherwise, especially for less-popular features
>>> 
>>> If I had a euro every time I found a bug in a datasheet, well, I would
>>> have enough money to at least buy a nice dinner. My point is, datasheets
>>> are not perfect. Only running on real hardware gets you the true
>>> picture.
>>
>> Well, it's even *more* buggy to pretend that the datasheet doesn't exist
>> and just do whatever you please. Might as well reverse-engineer every
>> chip that comes across your desk from first principles with that
>> attitude.
> 
> ... or, you know, read the data sheet, write the driver, and _test_ if
> it actually works?

Which I did.

But apparently it's not enough to confirm that the datasheet does
describe the hardware.

Which is frankly absurd because the first generation chips have been
obsolete for a decade and there are literally dozens of variants of
these chips and none of them have any documented difference in the
status register.

The datasheet is innocent until proven guilty. While it's important to
verify its claims, it's up to *you* to prove it's wrong. You have given
me no evidence to believe it is incorrect.

And you would prefer to believe that the existing (broken!) behavior is
better? The one that clearly no one tested locking with because:

- Locking literally can't work with the "default" BP semantics. BP holds
  the log2 size of the protected area in eraseblocks plus one. The maximum number
  of eraseblocks that can be protected with 3 bits is 1 << (7 - 1) = 64. So
  if you have more than 64 eraseblocks (the smallest flash in this
  series has 128) you have to come up with different semantics:

  - Enlarge the protection granularity (e.g. to some multiple of the
    eraseblock size or to 
  - Add another bit to BP (what Micron did)

  Both of these are incompatible with existing behavior and need
  feature flags since they can't be discovered via SFDP. If you pretend
  that BP only has 3 bits, you will either not lock the whole flash (if
  you wanted to lock the whole thing) or you will lock too much of the
  flash (if you only wanted to lock part of it).

- Locking is broken based on the documentation. Every datasheet for
  flashes in this series clearly shows the 4th BP bit in the status
  register:

    https://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/N25Q032A_RevJ.pdf
    This is the only exception because it has 64 eraseblocks and doesn't
    need an extra BP bit.
    https://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/N25Q064Ax3.pdf
    https://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/N25Q128A.pdf
    https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/6657/MT25QL256ABA8ESF-0SIT.pdf
    https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/789/N25Q256A.pdf
    https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/7156/mt25q-qlkt-l-512-abb-0.pdf
    https://www.digikey.com/htmldatasheets/production/1952775/0/0/1/N25Q512Ax3.pdf
    https://www.alldatasheet.com/datasheet-pdf/download/585916/MICRON/N25Q00AA.html
    https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/6242/MT25QL02GCBB.pdf
    https://www.digikey.com/htmldatasheets/production/2058522/0/0/1/n25q016a.pdf

    etc.
 
- Locking is broken based on my testing.

- Locking is broken whenever anyone else tests it on one of these
  flashes. And they all fix it in exactly the same way:

    f3f2b7eb2f1c ("mtd: spi-nor: Enable locking for n25q512ax3/n25q512a")
    f80ff13135cb ("mtd: spi-nor: micron-st: Enable locking for n25q00")
    bcc0c61e6134 ("mtd: spi-nor: micron-st: Enable locking for mt25qu256a")
    a2a3e5430e7b ("mtd: spi-nor: micron-st: enable lock/unlock for mt25qu512a")

- Locking is not in your suggested test procedure for new flashes
  (although it probably should be if you're so gung ho about mistrusting
  datasheets).

- None of the commits adding support for these chips report testing
  locking:

    c692ba6de1c5 ("mtd: spi-nor: micron-st: Add support for mt25qu01g")
    7f412111e276 ("mtd: spi-nor: Add entries for mt25q variants")
    bd8a6e31b87b ("mtd: spi-nor: Split mt25qu512a (n25q512a) entry into two")
    9607af6f857f ("mtd: spi-nor: Rename "n25q512a" to "mt25qu512a (n25q512a)"")
    21ed90acd178 ("mtd: spi-nor: Add Micron MT25QL02 support")
    a98086e00420 ("mtd: spi-nor: add entry for mt35xu512aba flash")
    56c6855c81c8 ("mtd: spi-nor: Add Micron MT25QU02 support")
    835ed7bf1260 ("mtd: spi-nor: Add support for N25Q256A11")
    61e4611864b3 ("mtd: spi-nor: Add support for N25Q016A")
    cebc1fd06907 ("mtd: spi-nor: Added support for n25q00a.")
    f9bcb6dc8013 ("mtd: spi-nor: Add support for Micron n25q032a")
    2a06c7b1fd23 ("mtd: spi-nor: Add support for Micron n25q064a serial flash")
    c14deddec1fb ("mtd: spi-nor: add support for flag status register on Micron chips")
    867f770de812 ("mtd: m25p80: Add support for Micron N25Q512A memory")
    98a9e2450667 ("mtd: m25p80: modify info for Micron N25Q128")
    3105875f6b89 ("mtd: m25p80: add support for Micron N25Q128")
    8da28681eb14 ("mtd: m25p80: add support for Micron N25Q256A")

There is no evidence that the status register has three bits (except
when the flash has 64 eraseblocks or fewer), and there overwhelming
evidence to the contrary.

--Sean

>>
>> The locking doesn't work on any of these flashes without these flags. If
>> you don't believe me you can try it yourself. The people who submitted
>> the original patches certainly didn't test it.
> 
> Right. So can you send the patches you _did_ test on the hardware you do
> have? So this time we are sure we got it right. And reply to the other
> review comments? Without that, I don't think this patch can make
> progress.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
