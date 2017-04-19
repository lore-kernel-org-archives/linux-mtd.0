Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0ru7-0001n5-3v
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 15:52:28 +0000
Received: by mail-it0-x232.google.com with SMTP id e132so17976122ite.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 08:52:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2033d520-c908-0d89-e17f-b55f7210b69d@gmail.com>
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
 <20170419152305.17226-3-andrew.smirnov@gmail.com>
 <2033d520-c908-0d89-e17f-b55f7210b69d@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 19 Apr 2017 08:50:46 -0700
Message-ID: <CAHQ1cqHeKYVzQEoCXGWsnEpimXt+RyCyTj2xhit77sxgRJxkSA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] mtd: dataflash: Replace pr_debug, printk with
 dev_* functions
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-kernel <linux-kernel@vger.kernel.or>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 19, 2017 at 8:33 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 04/19/2017 05:23 PM, Andrey Smirnov wrote:
>> Lion's share of calls to pr_debug in this driver follow the pattern of
>> pr_debug("%s <message>", dev_name(<dev>), <arguments>), which should
>> be semantically identical to dev_dbg(<dev>, "<message>", <arguments>),
>> so replace such occurencies to simplify the code.
>>
>> Convert the small minority of pr_debug that do not follow pattern from
>> above to use dev_dbg as well, for the sake of consistency.
>>
>> Convert similar patter of printk(KERN_ERR, "%s: ...", dev_name(...),
>> ...) to use dev_err instead.
>>
>> No functional change intended.
>>
>> Cc: cphealy@gmail.com
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Cc: linux-kernel@vger.kernel.or
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>
> btw where is 1/6 and 2/6 ?

Sorry, looks like git send-mail didn't pick up Acked-by tag to be
added to CC list. They are here:

https://marc.info/?l=linux-kernel&m=149261547916625
https://marc.info/?l=linux-kernel&m=149261543416614

>
> --
> Best regards,
> Marek Vasut
