Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxuRD-0001t1-Ey
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 09:17:04 +0000
Message-ID: <54856C75.1050309@nod.at>
Date: Mon, 08 Dec 2014 10:16:37 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/20] mtd: s3c2410: fix misspelling of current function
 in string
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417980062-25151-2-git-send-email-Julia.Lawall@lip6.fr>
 <CAFLxGvyiqxQ6U6p-A-JW8Nv8OvXFGsna93afUu-Gek0EV3gATA@mail.gmail.com>
 <alpine.DEB.2.02.1412080809400.2100@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1412080809400.2100@localhost6.localdomain6>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-samsung-soc@vger.kernel.org,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 linux@rasmusvillemoes.dk, LKML <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Joe Perches <joe@perches.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.12.2014 um 08:11 schrieb Julia Lawall:
>>> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
>>> index 35aef5e..0a9c41f 100644
>>> --- a/drivers/mtd/nand/s3c2410.c
>>> +++ b/drivers/mtd/nand/s3c2410.c
>>> @@ -948,7 +948,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
>>>
>>>         cpu_type = platform_get_device_id(pdev)->driver_data;
>>>
>>> -       pr_debug("s3c2410_nand_probe(%p)\n", pdev);
>>> +       pr_debug("%s(%p)\n", __func__, pdev);
>>
>> I think we can drop the line completely.
>> We have ftrace to trace function calls...
> 
> Should the "initialised ok" at the end of the function be remove as well?
> 
> Will it be confusing if this cleanup is done in this function, but not in 
> others where it may be useful?  Perhaps s3c2410_nand_update_chip, for 
> example?

Hmm, this driver seems to have a lot of debugging printks().
IMHO we can remove them.
Let's see what Brain says.

Thanks,
//richard
