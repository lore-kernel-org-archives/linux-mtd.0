Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBz7c-0004ya-W8
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 07:16:06 +0000
Date: Wed, 30 Nov 2016 08:15:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>, Brian Norris
 <computersforpeace@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jason Roberts
 <jason.e.roberts@intel.com>, David Woodhouse <David.Woodhouse@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Dinh Nguyen
 <dinguyen@altera.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: How read_oob() should work for HW_SYNDROME NAND controller?
Message-ID: <20161130081534.1fc5432e@bbrezillon>
In-Reply-To: <CAK7LNATS-Vd0BEWZEdp7skHrpngvyyLm6OFXJsRQ=87VMbUOAQ@mail.gmail.com>
References: <CAK7LNATS-Vd0BEWZEdp7skHrpngvyyLm6OFXJsRQ=87VMbUOAQ@mail.gmail.com>
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

On Wed, 30 Nov 2016 16:05:36 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi.
> (CCing Intel engineers because this is related to Denali driver
> and comments from them are very appreciated.)
> 
> I am tacking on Denali NAND driver rework.
> 
> My question is:
> Which data should chip->ecc.read_oob() get
> in case of a controller with syndrome-like ECC engine.
> 
> For example, say we have a NAND chip
> with 2048 byte page + 64 byte oob.
> (the picture in the right side.)
> 
> And let's say the controller's ecc.size = 1024 and ecc.bytes == 14.
> I am omitting BBM to make the situation simpler.

Hm, actually the placement of the BBM is important. Do you know where
it's placed in the page layout used by Denali.

> 
> The Denali NAND controller interleaves
> payload and ECC like the picture in the left side.
> 
>   |-----------|    |-----------|
>   |           |    |           |
>   | Payload0  |    |           |
>   |           |    |           |
>   | (ecc.size |    |           |
>   |  1024B)   |    | Main Page |
>   |           |    |   area    |
>   |-----------|    |           |
>   |  ECC0     |    |   2048B   |
>   | (ecc.bytes|    |           |
>   |   14B)    |    |           |
>   |-----------|    |           |
>   |           |    |           |
>   | Payload1  |    |           |
>   |           |    |           |
>   | (ecc.size |    |           |
>   |  1024B)   |    |-----------|
>   |           |    |           |
>   |-----------|    |           |
>   |  ECC1     |    | OOB area  |
>   | (ecc.bytes|    |           |
>   |   14B)    |    |   64B     |
>   |-----------|    |           |
>   | OOB free  |    |           |
>   |    36B    |    |           |
>   |-----------|    |-----------|
> 
> The controller can transfer
> Main page area, OOB area, or both of them,
> like the physical structure of the device
> in the right-side picture.
> 
> This is different from how
> Denali controller uses the page logically
> (in the left-side picture).
> 
> 
> The current read_oob() implementation in the Denali driver
> simply get the data in the physical OOB area.
> It corresponds the tail of Payload1 + ECC1 + OOB free.
> 
> 
> I am afraid the behavior is different from
> the reference implementation of
> nand_read_page_raw_syndrome()
> nand_read_oob_syndrome()

Yep, you got it right, the read_oob() method should abstract away the
internal/controller-dependent page layout. In this specific case, you
should read each ECC section and the OOB free section.

> 
> 
> I think we should collect ECC sections
> into oob_poi to get along with the ooblayout APIs.
> 
> 
> The Denali IP also supports lowlevel
> command-base interface to issue NAND_CMD_RNDOUT
> and cherry-pick ECC sections.
> 
> But, more simply, I can transfer the whole page + oob
> into a temporary buffer, then only copy
> ECC sections into oob_poi.

It should be faster if you only retrieve ECC sections (less I/Os), but
that's just optimization. Note that read_oob() is heavily used when
scanning bad blocks, so it might make a huge boot-time difference in the
end.

Regards,

Boris
