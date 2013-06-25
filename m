Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrZbH-0002Pj-CH
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 20:12:28 +0000
Received: by mail-ve0-f176.google.com with SMTP id c13so10475914vea.21
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2013 13:12:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368760654-28754-1-git-send-email-b32955@freescale.com>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
Date: Tue, 25 Jun 2013 13:12:03 -0700
Message-ID: <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: vikram186@gmail.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang and others,

On Thu, May 16, 2013 at 8:17 PM, Huang Shijie <b32955@freescale.com> wrote:
> 1.) Why add the ECC information to the nand_chip{} ?
>    Each nand chip has its requirement for the ECC correctability, such as
>    "4bit ECC for each 512Byte" or "40bit ECC for each 1024Byte".
>    This ECC info is very important to the nand controller, such as gpmi.
>
>    Take the Micron MT29F64G08CBABA for example, its geometry is
>    8k page size, 744 bytes oob size and it requires 40bit ECC per 1K bytes.
>    If we do not provide the ECC info to the gpmi nand driver, it has to
>    calculate the ECC correctability itself. The gpmi driver will gets the 56bit
>    ECC for per 1K bytes which is beyond its BCH's 40bit ecc capibility.
>    The gpmi will quits in this case. But in actually, the gpmi can supports
>    this nand chip if it can get the right ECC info.
>
> 2.) About the patch set:
>    2.1) patch 1:
>               The keynote patch.
>
>    2.2) patch 2 ~ patch 6:
>                These patches are for ONFI nand.
>                Parse out the ecc info from the parameter page if we can, else
>                parse out the ecc info from the extended parameter page.
>
>    2.2) patch 7 ~ patch 9:
>                Add the ECC info for full-id nand, and parse it out.
>
>    2.3) patch 10
>                The gpmi uses the ecc info to set the BCH module. and with this
>                patch set, the gpmi can supports the MT29F64G08CBABA now.

What's the status on this patch set? Surely by v6 we have some
reasonable stable state on things like naming. Does anyone have any
other objections? Unfortunately, I've been awfully distracted, and on
top of that, I'm running into some bugs with my NAND controller
sending the ONFI parameter read/change column commands. But any time
my controller actually outputs a correct parameter page + extended
parameter page, this series has worked for me.

I've put my 2 cents in on most of the issues I had, and I tested the
whole series on my driver at around v5. The only issues I have with it
are somewhat cosmetic and not worth bikeshedding. So for all the
non-GPMI specific stuff I'll give my:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
Tested-by: Brian Norris <computersforpeace@gmail.com>

Thanks for the work Huang.

Brian
