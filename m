Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358E6105F7A8
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 13:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlhCupZK/FgSx4Tp+uprOpIJeUQLAuIAQH7KSNT9uqc=; b=zr3gFsXzMQApxZ
	MyMKm3lZwQK7y7dNKbs51//CuAeAAVLrL+DpkT/kKdpRGFlVrx/+A4HZ+Yj1PsooZaWp0e5NqmsEp
	vMCvW359xvMj6UsygFDMJlOU9SMvbKQ55fGtfe1cAVuPYVr022ZDcjripG9c8P41GdTBsEdlY694I
	OqqcwCIcoLQdOZsKa3vrf8v9SDK/BBf5FINRFIWYe2t5eTRuaxzzzJdrAXvrwGaGlUvHxbGVeuQQf
	vRuyGUWOCfiGj4/hN/FFMG3aqNN4ObKv/tpWUAnPmYKxPIePg8CiOpJDOprVcryqQnIwY+fYY09oS
	GrdgGPH7OvSjjaC1xJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jt-00000000IPw-1VHZ;
	Fri, 13 Mar 2026 13:39:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jp-00000000IO5-0TlB
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 13:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFCD240393;
	Fri, 13 Mar 2026 13:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD73C19425;
	Fri, 13 Mar 2026 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409176;
	bh=xnp+Riyh/w0YpgxEvhFWS/9bdMiL79ATIFLfP7pHKwI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uq+3PqYk5bxRdIZxNbbFeNn6Z2tT9FmuCHBT9bGu23AKK/FAm/m42z16iZ3L/IMoJ
	 u6aIcaigAKV2VxMz9c30y1iwOrvAL5f/FzeJTzva5tMrBWkbXIXBFEiY58G4hcKFK4
	 OvzixvLmvGLntJy3+xMTnRU6dt0h1rD85ZDdStA2yTUwudy3TVvdvHVlAey+feOuLK
	 9juPeU/F2JxozjlkQPtXsx4uhLE7IYIVcyT1kDluoiUXdxmjZmR2pLs9UOE82UA8fK
	 HkDaiej8qSJhVncd5R260aZlb53SEwjvD4f7A2mFT8393hFF1Xu7NX5TjfFOAazmv8
	 2N6bxXhE+OihQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Hendrik Donner <hd@os-cillation.de>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Sanjaikumar V S <sanjaikumarvs@gmail.com>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  miquel.raynal@bootlin.com,  richard@nod.at,
  sanjaikumar.vs@dicortech.com,  stable@vger.kernel.org,
  tudor.ambarus@linaro.org,  vigneshr@ti.com
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sst: Fix write enable before AAI
 sequence
In-Reply-To: <aa6bfa3a-8389-4dfa-a477-dcfb3340b1f5@os-cillation.de> (Hendrik
	Donner's message of "Fri, 13 Mar 2026 13:50:42 +0100")
References: <DGM6ZPOT1WCR.157JI0LW4W3E8@kernel.org>
	<20260223091733.47-1-sanjaikumarvs@gmail.com>
	<DGM8HPC181AF.3FCCS4MIE4A43@kernel.org>
	<8a1db3a5-09b3-4ef1-87e8-66553a81ec27@os-cillation.de>
	<2vxzpl58dk9u.fsf@kernel.org>
	<aa6bfa3a-8389-4dfa-a477-dcfb3340b1f5@os-cillation.de>
Date: Fri, 13 Mar 2026 13:39:32 +0000
Message-ID: <2vxz8qbvetm3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_063937_189245_D79A4C2C 
X-CRM114-Status: GOOD (  21.57  )
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

On Fri, Mar 13 2026, Hendrik Donner wrote:

> Hello,
>
> On 3/13/26 12:46, Pratyush Yadav wrote:
>> On Fri, Mar 06 2026, Hendrik Donner wrote:
>> 
>>> Hello,
>>>
>>> On 2/23/26 10:29, Michael Walle wrote:
>>>> Hi,
>>>> On Mon Feb 23, 2026 at 10:17 AM CET, Sanjaikumar V S wrote:
>>>>>> Raises concern about writes ending at odd offsets potentially
>>>>>> having the same issue
>>>>>
>>>>> The odd end address case (trailing byte) is already handled in the
>>>>> existing code at lines 243-255:
>>>>>
>>>>> /* Write out trailing byte if it exists. */
>>>>> if (actual != len) {
>>>>>       ret = spi_nor_write_enable(nor);
>>>>>       ...
>>>>>       ret = sst_nor_write_data(nor, to, 1, buf + actual);
>>>>> }
>>>> Ah, I must be blind. I stopped reading at the write_disable.
>>>>
>>>>> So write_enable is already called before writing the trailing
>>>>> byte. My patch only addresses the odd start case where BP clears
>>>>> WEL before the AAI sequence begins.
>>>>>
>>>>>> Suggests simplifying the conditional logic by removing the length
>>>>>> check
>>>>>
>>>>> The condition `if (actual < len - 1)` avoids an unnecessary
>>>>> write_enable when len == 1 (single byte write at odd address, no
>>>>> AAI follows). But if you prefer unconditional write_enable for
>>>>> simplicity, I can change it in v3.
>>>> I know, but I actually don't like repeating the condition in the for
>>>> loop. So I'd prefer to have a local "needs_write_enable" boolean
>>>> which will be set to true. But then, I wouldn't care too much if
>>>> there is a write enable followed by a write disable for a rare case.
>>>>
>>>>>> Notes the patch lacks runtime testing
>>>>>
>>>>> I don't have the hardware setup to test odd-address writes at the
>>>>> moment. The fix is based on code analysis. I have tested patch 2/2
>>>>> (dirmap fallback) on hardware.
>>>> I'm hesitant - because like I said, if there is really a bug - it
>>>> would have never worked correctly, since day 1. But yeah, I've also
>>>> read the datasheet and it clearly states that the byte write will
>>>> clear the write enable latch.
>>>>
>>>
>>> i can confirm both patches fix real issues, i have similiar fixes
>>> on a kernel tree i always wanted to clean up and upstream. Diffs
>>> based on 6.6.127:
>>>
>>> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>>> index 197d2c1101ed5..eaa50561ede2c 100644
>>> --- a/drivers/mtd/spi-nor/sst.c
>>> +++ b/drivers/mtd/spi-nor/sst.c
>>> @@ -155,6 +155,13 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>>>                  if (ret)
>>>                          goto out;
>>>
>>> +               ret = spi_nor_write_enable(nor);
>>> +               if (ret)
>>> +                       goto out;
>>> +               ret = spi_nor_wait_till_ready(nor);
>>> +               if (ret)
>>> +                       goto out;
>>> +
>>>                  to++;
>>>                  actual++;
>>>          }
>>>
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 1b0c6770c14e4..646bfb2e91a65 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -276,7 +276,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
>>>          if (spi_nor_spimem_bounce(nor, &op))
>>>                  memcpy(nor->bouncebuf, buf, op.data.nbytes);
>>>
>>> -       if (nor->dirmap.wdesc) {
>>> +       if (nor->dirmap.wdesc && nor->program_opcode != SPINOR_OP_AAI_WP) {
>> Why is this better? This removes the use of dirmap for all flashes other
>> than SST.
>
> i claim the opposite down below? That patch 2 of the posted patch series
> looks better to me. Sorry if that was unclear.

Oh, then I misunderstood.

Please review and test the v4, it will help land those fixes.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
