Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e99jh-0003Ec-QM
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 13:04:19 +0000
Date: Mon, 30 Oct 2017 14:03:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek =?UTF-8?B?VmHFoXV0?=
 <marek.vasut@gmail.com>, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC] NAND: Optimize NAND_ECC_HW_OOB_FIRST read
Message-ID: <20171030140351.16cb4461@bbrezillon>
In-Reply-To: <CANc+2y4U+BbOnWZzEZ4+2dNfJNEA0Was+ySuJRJwyakm-GxYiA@mail.gmail.com>
References: <20171028074351.13118-1-prasannatsmkumar@gmail.com>
 <20171030093426.30827ef5@bbrezillon>
 <CANc+2y4U+BbOnWZzEZ4+2dNfJNEA0Was+ySuJRJwyakm-GxYiA@mail.gmail.com>
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

On Mon, 30 Oct 2017 18:17:50 +0530
PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com> wrote:

> Hi Boris,
> 
> On 30 October 2017 at 14:04, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi PrasannaKumar,
> >
> > On Sat, 28 Oct 2017 13:13:51 +0530
> > PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com> wrote:
> >  
> >> From: Lars-Peter Clausen <lars@metafoo.de>
> >>
> >> Avoid sending unnecessary READ commands to the chip.
> >>
> >> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> >> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> >> ---
> >> This patch is taken from git://projects.qi-hardware.com/qi-kernel.git
> >> branch jz-3.16. From [1] and [2] it can be seen that the patch author
> >> thinks this can be sent upstream but it never happened so far. This
> >> patch is used in OpenWRT as seen from [3].  
> >
> > Sounds reasonable, but it's likely to conflict with something I'd like
> > to queue for 4.16 [1]. I'll rebase this patch on nand/next once the  
> > ->exec_op() series is merged. Don't hesitate to ping me if I forget.  
> >
> > Regards,
> >
> > Boris
> >
> > [1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=8923  
> 
> Okay. I will remind you if required.
> 
> There is another patch used in OpenWRT at [1]. Do you mind to have a
> look at it and take that if it is useful? I don't see a point in me
> sending it as a RFC as I am not contributing anything to it other than
> noticing its existence.

Yep, it makes sense to have that one applied too, but this is pretty
much the same problem: it will conflict with the ->exec_op() rework.

Can you please send it to the ML so I can track it in patchwork and
respin it when ->exec_op() is out. I'll also need someone owning a HW
using NAND_ECC_HW_OOB_FIRST to test the changes. Do you have such HW?

> 
> 1. https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/xburst/patches-3.18/003-NAND-Add-support-for-subpage-reads-for-NAND_ECC_HW_O.patch;h=974eb7a5db9a09347fa6137461f030575f9a4328;hb=c03d4317a6bc891cb4a5e89cbdd77f37c23aff86
> 
> Thanks,
> PrasannaKumar
