Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0sEm-00051W-Bx
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 16:13:51 +0000
Received: by mail-wr0-x241.google.com with SMTP id l44so3846468wrc.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 09:13:27 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] mtd: dataflash: Replace pr_debug, printk with
 dev_* functions
To: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
 <20170419152305.17226-3-andrew.smirnov@gmail.com>
 <2033d520-c908-0d89-e17f-b55f7210b69d@gmail.com>
 <CAHQ1cqHeKYVzQEoCXGWsnEpimXt+RyCyTj2xhit77sxgRJxkSA@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-kernel <linux-kernel@vger.kernel.or>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e22628d5-faeb-7e2d-abe8-906d708d3e8c@gmail.com>
Date: Wed, 19 Apr 2017 18:13:25 +0200
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqHeKYVzQEoCXGWsnEpimXt+RyCyTj2xhit77sxgRJxkSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/19/2017 05:50 PM, Andrey Smirnov wrote:
> On Wed, Apr 19, 2017 at 8:33 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 04/19/2017 05:23 PM, Andrey Smirnov wrote:
>>> Lion's share of calls to pr_debug in this driver follow the pattern of
>>> pr_debug("%s <message>", dev_name(<dev>), <arguments>), which should
>>> be semantically identical to dev_dbg(<dev>, "<message>", <arguments>),
>>> so replace such occurencies to simplify the code.
>>>
>>> Convert the small minority of pr_debug that do not follow pattern from
>>> above to use dev_dbg as well, for the sake of consistency.
>>>
>>> Convert similar patter of printk(KERN_ERR, "%s: ...", dev_name(...),
>>> ...) to use dev_err instead.
>>>
>>> No functional change intended.
>>>
>>> Cc: cphealy@gmail.com
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> Cc: Marek Vasut <marek.vasut@gmail.com>
>>> Cc: Richard Weinberger <richard@nod.at>
>>> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> Cc: linux-kernel@vger.kernel.or
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>> ---
>>
>> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>>
>> btw where is 1/6 and 2/6 ?
> 
> Sorry, looks like git send-mail didn't pick up Acked-by tag to be
> added to CC list. They are here:

Yeah, git send-email doesn't CC people in the Ack list. Keep the CC: tag
please.

> https://marc.info/?l=linux-kernel&m=149261547916625
> https://marc.info/?l=linux-kernel&m=149261543416614
> 
>>
>> --
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
