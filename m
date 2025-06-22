Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E72C7115A
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Jun 2025 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20LWbym7UNTInx+TTBRqf0II56Nd8FCZQ7TCFYBAAbY=; b=0/rvxAZHqKTzYP
	jp9R2ghziFTS14cSpijJkOqEgPkyXGh/2rU+vSRgb4oa3LzXVKirP2n3KH+oGNbQvir5me35+30lw
	c8IU9dMomzU9VEpduYozFw/fjrSt4V76lQntnAeyXL6YDUVFr1ej6OntOOIuS+CtfAPVf4yIg9p0y
	762rIJMgq3Or6b0OE9LdpaK/0+hI6l0Fhzq5qlh8h4eXb2/LH8NA7s2ToFTQ/+lIndkG1U1VhegE2
	E/53H8ohd+oB7zbvkfNvU847tSKoYUPgjTIm09FF5c/Q7Q6E9navESHfT7uqNqjm8gfaJsQu7GtBL
	+ju67Q9fQ6wVnfelumKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTQ3x-000000017Oj-2jzu;
	Sun, 22 Jun 2025 19:09:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTQ3t-000000017OO-40KT
	for linux-mtd@lists.infradead.org;
	Sun, 22 Jun 2025 19:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 255B85C1049;
	Sun, 22 Jun 2025 19:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605A9C4CEE3;
	Sun, 22 Jun 2025 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750619344;
	bh=5uq9U95xetAEdfYaxJoX7pftJ4HxoJ8sSXX494DjvuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AOZWAFw2G6nw//KwBElILCC717XC2H1Zc5M2VkGzloauCOeuG/qWoqmUHzk6JTe7d
	 8vo2mpdIio5AF5Cq7zj8dXbfWVk6ThhiYO6VW9gYHFSxHrm1PcGqnGK55cWY250rXc
	 dJVEJwqgZacqgvBqeQfyOLapn0Oegd9htjezBFXg9/+T2Fn4RjWzJ1p2OlNxeEO9Hd
	 vAEOkWO8dpURmuOP60VT3+n2Cdbi9AqFaQivz8+60H2UyBGTIrj64YpsdErqY6gTXV
	 eptmOApQzuLOg/nrRL6uWDArZ73lSilwMgZ+s0WWy9rEvfJkNH59C4LFp+ifMfxTye
	 XPXDPlh6kuK0Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Cheng Ming Lin <chengminglin@mxic.com.tw>,  Cheng
 Ming Lin <linchengming884@gmail.com>,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
In-Reply-To: <ff485da8-1a02-40a9-9286-94459e52b26c@roeck-us.net>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-2-linchengming884@gmail.com>
	<d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
	<mafs05xh6pf7s.fsf@kernel.org>
	<da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
	<a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
	<aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
	<ff485da8-1a02-40a9-9286-94459e52b26c@roeck-us.net>
Date: Sun, 22 Jun 2025 21:09:01 +0200
Message-ID: <mafs01prbvbjm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_120906_084957_F20D6C64 
X-CRM114-Status: GOOD (  22.05  )
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

Hi Guenter,

On Tue, Jun 10 2025, Guenter Roeck wrote:

> On 6/9/25 23:46, Tudor Ambarus wrote:
>> On 6/10/25 1:14 AM, Guenter Roeck wrote:
>>> On 6/8/25 18:13, Guenter Roeck wrote:
>>>> On 6/8/25 05:53, Pratyush Yadav wrote:
>>>>> On Sat, Jun 07 2025, Guenter Roeck wrote:
[...]
>>>>>> With this patch in place, some of my qemu tests no longer recognize the
>>>>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>>>>> this other than avoiding Macronix flash chips when working with qemu ?
>>>>>
>>>>> Could you share some logs? Does the flash fail to detect, or does the
>>>>> SFDP-based probing fail? Since this is qemu, it would be even better if
>>>>> you can share a setup/reproduction guide. I have been meaning to set up
>>>>> qemu for SPI NOR testing for some time now, but never got around to
>>>>> figuring it out.
>>>>>
>>>>
>>>> I suspect that the SFDP data for the affected flashes is incorrect in
>>>> qemu.
>>>> Since this is very likely a qemu problem, I'll just configure
>>>> different flash
>>>> chips when running affected tests.
>>>>
[...]
>
> Some debugging shows two problems with qemu: The returned SFPD data for one
> of the flashes is wrong and does not reflect the data qemu is supposed
> to provide, and qemu does not provide SFPD data for all flashes.
>
> I don't know if the bad data is due to a bad Linux driver (unlikely), a bug
> in qemu's SPI emulation code, or a bug in qemu's flash emulation code.
> Unfortunately I don't really have time to track this down further.

I used the command you posted in [0] and tried to reproduce the bug, but
for me the flash probes just fine:

    root@romulus:/sys/bus/spi/devices/spi0.0/spi-nor# cat manufacturer 
    macronix
    root@romulus:/sys/bus/spi/devices/spi0.0/spi-nor# cat jedec_id 
    c22019
    root@romulus:/sys/bus/spi/devices/spi0.0/spi-nor# uname -a
    Linux romulus 6.16.0-rc2-00308-gf7301f856d35-dirty #5 SMP Sat Jun 21 19:29:15 CEST 2025 armv6l GNU/Linux

The rootfs is also mounted on a mtdblock device backed by this flash,
and everything appears to work fine.

Which version of qemu are you using? I can see that SFDP data for
mx25l25635e was added to qemu in commit dc907a667c ("m25p80: Add the
mx25l25635e SFPD table"), which was released in v7.2.0. Older versions
of qemu might run into trouble with this flash if SFDP data is not
available.

FWIW, my qemu version:

    $ qemu-system-arm --version
    QEMU emulator version 10.0.0
    Copyright (c) 2003-2025 Fabrice Bellard and the QEMU Project developers

[0] https://lore.kernel.org/linux-mtd/da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
