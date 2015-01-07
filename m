Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8fsG-0003q7-6K
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 01:57:29 +0000
Message-ID: <54AC924E.80805@huawei.com>
Date: Wed, 7 Jan 2015 09:56:30 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Joseph Balough <jbb5044@gmail.com>
Subject: Re: [PATCH 1/2] mtd: ubiformat: Add --confirm argument
References: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
 <1420037925-31156-2-git-send-email-jbb5044@gmail.com>
 <54A8A5EB.6060204@huawei.com>
 <CACuXwh49YRxqYMHyu_8YH3_VW_EaT4hAuxEWyXWosczZPbfdnA@mail.gmail.com>
In-Reply-To: <CACuXwh49YRxqYMHyu_8YH3_VW_EaT4hAuxEWyXWosczZPbfdnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/1/7 4:27, Joseph Balough wrote:
> 
> 
> On Sat, Jan 3, 2015 at 9:31 PM, hujianyang <hujianyang@huawei.com <mailto:hujianyang@huawei.com>> wrote:
> 
>     This option 'c' seems only use when *flash-image* is specified. So maybe you
>     can check the validity of this option depending on *args.image* in parse_opt().
> 
> 
> That's a good idea. I'll do that and send an updated patch.
> 
>     Do we have a function like *mtd_write_and_check()*? I think the operation
>     first write and then check it by reading may be used in many cases.
> 
> 
> I looked through the libmtd source and didn't see an already existing mtd_write_and_check function (or anything like it). And in the whole mtd-utils repository, only ubiformat and nandwrite actually use the mtd_write function itself.
> 

Er, I'm not sure if it's related to CONFIG_MTD_NAND_VERIFY_WRITE or
something else.

Actually, I'm writing a script to check nand state. This script will
first write some bytes to nand and then read back to check. After
repeating several times, production team will ensure whether the nand
in their product is in right state and sell them out.

That's why I need a function like *mtd_write_and_check*. I don't think
it's necessarily for your need.


> 
>     It's worthy to check the writing data of the *flash-image* without any
>     additional options in my considering.
> 
> 
> I feel like most programs like this require an additional argument to check the written data which is why I made it a separate argument. I can change it to be default behavior if that is desired.
> 

I'm not the maintainer of the utility, you can resend a new version and
wait for Artem's reply.

Thanks,
Hu
