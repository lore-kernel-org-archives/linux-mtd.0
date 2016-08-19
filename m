Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baf2h-0001bf-BS
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 08:20:47 +0000
Date: Fri, 19 Aug 2016 10:20:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dongsheng Yang <dongsheng.yang@easystack.cn>
Cc: Dongsheng Yang <dongsheng081251@gmail.com>, fabf@skynet.be,
 jesper.nilsson@axis.com, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-cris-kernel@axis.com, shengyong1@huawei.com, Ard Biesheuvel
 <ard.biesheuvel@linaro.org>, richard <richard@nod.at>,
 dmitry.torokhov@gmail.com, dooooongsheng.yang@gmail.com,
 jschultz@xes-inc.com, starvik@axis.com, mtownsend1973@gmail.com,
 linux-mtd@lists.infradead.org, Colin King <colin.king@canonical.com>,
 asierra@xes-inc.com, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD RAID
Message-ID: <20160819102016.0640b6d5@bbrezillon>
In-Reply-To: <57B6B073.9060404@easystack.cn>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon>
 <57B6B073.9060404@easystack.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 Aug 2016 15:08:35 +0800
Dongsheng Yang <dongsheng.yang@easystack.cn> wrote:

> On 08/19/2016 02:49 PM, Boris Brezillon wrote:
> > Hi Dongsheng,
> >
> > On Fri, 19 Aug 2016 14:34:54 +0800
> > Dongsheng Yang <dongsheng081251@gmail.com> wrote:
> >  
> >> Hi guys,
> >>      This is a email about MTD RAID.
> >>
> >> *Code:*
> >>      kernel:
> >> https://github.com/yangdongsheng/linux/tree/mtd_raid_v2-for-4.7  
> > Just had a quick look at the code, and I see at least one major problem
> > in your RAID-1 implementation: you're ignoring the fact that NAND blocks
> > can be or become bad. What's the plan for that?  
> 
> Hi Boris,
>      Thanx for your quick reply.
> 
>      When you are using RAID-1, it would erase the all mirrored blockes 
> when you are erasing.
> if there is a bad block in them, mtd_raid_erase will return an error and 
> the userspace tool
> or ubi will mark this block as bad, that means, the 
> mtd_raid_block_markbad() will mark the all
>   mirrored blocks as bad, although some of it are good.
> 
> In addition, when you have data in flash with RAID-1, if one block 
> become bad. For example,
> when the mtd0 and mtd1 are used to build a RAID-1 device mtd2. When you 
> are using mtd2
> and you found there is a block become bad. Don't worry about data 
> losing, the data is still
> saved in the good one mirror. you can replace the bad one device with 
> another new mtd device.

Okay, good to see you were aware of this problem.

> 
> My plan about this feature is all on the userspace tool.
> (1). mtd_raid scan mtd2 <---- this will show the status of RAID device 
> and each member of it.
> (2). mtd_raid replace mtd2 --old mtd1 --new mtd3.   <---- this will 
> replace the bad one mtd1 with mtd3.
> 
> What about this idea?

Not sure I follow you on #2. And, IMO, you should not depend on a
userspace tool to detect address this kind of problems.

Okay, a few more questions.

1/ What about data retention issues? Say you read from the main MTD, and
it does not show uncorrectable errors, so you keep reading on it, but,
since you're never reading from the mirror, you can't detect if there
are some uncorrectable errors or if the number of bitflips exceed the
threshold used to trigger a data move. If suddenly a page in your main
MTD becomes unreadable, you're not guaranteed that the mirror page will
be valid :-/.

2/ How do you handle write atomicity in RAID1? I don't know exactly
how RAID1 works, but I guess there's a mechanism (a journal?) to detect
that data has been written on the main MTD but not on the mirror, so
that you can replay the operation after a power-cut. Do handle this
case correctly?

On a general note, I don't think it's wise to place the RAID layer at
the MTD level. How about placing it at the UBI level (pick 2 ubi
volumes to create one UBI-RAID element)? This way you don't have to
bother about bad block handling (you're manipulating logical blocks
which can be anywhere on the NAND).

One last question? What's the real goal of this MTD-RAID layer? If
that's about addressing the MLC/TLC NAND reliability problems, I don't
think it's such a good idea.

Regards,

Boris
