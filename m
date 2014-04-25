Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdiiV-0000dc-A2
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 16:11:11 +0000
Received: by mail-vc0-f181.google.com with SMTP id id10so5093972vcb.12
 for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2014 09:10:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140425075943.GA2221@localhost>
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
 <5359C361.9000302@freescale.com>
 <CAC=U0a0OwJe4f4ZC6GBWzrVZ6fF1Lq=QB1E0ZBANww=k7L4cXA@mail.gmail.com>
 <20140425074310.GA2117@localhost> <20140425075943.GA2221@localhost>
Date: Fri, 25 Apr 2014 12:10:43 -0400
Message-ID: <CAC=U0a3_O2AHX8Y_gCxftkZjrH97U32=8ksLbaBTgTBPX7oWmg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf as
 bounce buffer
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang,

"In the gpmi driver, i do a memcpy for the highmem buffer passed from
upper layer."

In other l2-mtd driver examples when the mapping fails those drivers
are reverting to bouce buffering using kmall'd dma buffer and memcpy
to highmem buffer. So the solutions have been implemented in the
l2-mtd (lowest level nand controller) driver.

In contrast this in change in nand_base uses the generic mm api
virt_addr_valid() to check if the passed address is in highmem, and if
it is I am not trying to convert(map) it, rather using the kmalloc'd
databuf in nand_base and memcpy to/from the highmem buffer. Also
using this check is optional, if l2-mtd driver can handle highmem in
other ways like gpmi, then chip->option need not be set.

"Which dma api do you use?"

For mapping the va to pa dma_map_single() is used.

"In the ARM platform, we use the sg_init_one to initialize the sg.
It can only convert the kmalloc memory, please see the code:
   #define __virt_to_phys(x)    ((x) - PAGE_OFFSET + PHYS_OFFSET)
It does a linear convert for a kernel address.
So in the ARM platform, it can _NOT_ support the highmem which is not linear."

I am not converting the address anywhere, merely checking if it is in highmem.
Are you suggesting that using virt_addr_valid() for ARM platform is
not sufficient ?.
I see that ret= dma_map_sg() is being used in case of the gpmi driver
to achieve the same.

Thanks
Kamal

On Fri, Apr 25, 2014 at 3:59 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Fri, Apr 25, 2014 at 03:43:13PM +0800, Huang Shijie wrote:
>> On Thu, Apr 24, 2014 at 11:52:41PM -0400, Kamal Dasu wrote:
>> > Huang,
>> >
>> > "could you show us how do the driver use the highmem buffer?"
>> >
>> > This is the stack on a BMIPS platform we are doing a read dma transaction.
>> > drv_*  calls are from out of tree nand controller  driver. This
>> I can read the driver since it is not in the l2-mtd. :(
>
> s/can/can't/
>
>>
>> > example shows the driver trying to map
>> > highmem virtual address(0xfe1141e0)  for DMA operation passed from
>>
>> Which dma api do you use?
>
> In the ARM platform, we use the sg_init_one to initialize the sg.
>
> It can only convert the kmalloc memory, please see the code:
>
>    #define __virt_to_phys(x)    ((x) - PAGE_OFFSET + PHYS_OFFSET)
>
> It does a linear convert for a kernel address.
> So in the ARM platform, it can _NOT_ support the highmem which is not linear.
>
>
> I am not familiar with MIPS.
>
> I do not know how the MIPS convert the highmem address.
>
> thanks
> Huang Shijie
