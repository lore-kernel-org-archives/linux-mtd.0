Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCNT8-0000kh-Ao
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 09:15:56 +0000
Date: Thu, 1 Dec 2016 10:15:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>, Brian Norris
 <computersforpeace@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jason Roberts
 <jason.e.roberts@intel.com>, David Woodhouse <David.Woodhouse@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Dinh Nguyen
 <dinguyen@altera.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 masahiroy@kernel.org
Subject: Re: How read_oob() should work for HW_SYNDROME NAND controller?
Message-ID: <20161201101522.0abc7491@bbrezillon>
In-Reply-To: <CAK7LNAS7n3k=+MzQk-oQOP3VzE4Koj=PsreV=bf8EznNSFRUBA@mail.gmail.com>
References: <CAK7LNATS-Vd0BEWZEdp7skHrpngvyyLm6OFXJsRQ=87VMbUOAQ@mail.gmail.com>
 <CAK7LNAS7n3k=+MzQk-oQOP3VzE4Koj=PsreV=bf8EznNSFRUBA@mail.gmail.com>
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

On Thu, 1 Dec 2016 18:09:37 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> >>
> >> And let's say the controller's ecc.size = 1024 and ecc.bytes == 14.
> >> I am omitting BBM to make the situation simpler.  
> >
> > Hm, actually the placement of the BBM is important. Do you know where
> > it's placed in the page layout used by Denali.  
> 
> 
> BBM is placed at the beginning of the OOB area.
> (so, factory BBMs are protected from the ECC correction engine.)
> 
> 
> The more precise layout is as follows:
> 
>    |-----------|    |-----------|
>    |           |    |           |
>    | Payload0  |    |           |
>    |           |    |           |
>    | (ecc.size |    |           |
>    |  1024B)   |    | Main Page |
>    |           |    |   area    |
>    |-----------|    |           |
>    |  ECC0     |    |   2048B   |
>    | (ecc.bytes|    |           |
>    |   14B)    |    |           |
>    |-----------|    |           |
>    |           |    |           |
>    | Payload1  |    |           |
>    |           |    |           |
>    | (ecc.size |    |           |
>    |  1010B)   |    |           |
>    |-----------|    |-----------|
>    | BBM (8B)  |    |           |
>    |-----------|    |           |
>    | Payload1  |    |           |
>    |   14B     |    |           |
>    |-----------|    |           |
>    |  ECC1     |    | OOB area  |
>    | (ecc.bytes|    |           |
>    |   14B)    |    |   64B     |
>    |-----------|    |           |
>    | OOB free  |    |           |
>    |    28B    |    |           |
>    |-----------|    |-----------|
> 
> 
> The Playload1 is split by the BBM area.

Okay, thanks for the detailed layout.
Everything looks good, and you should be able to disable the BBT and
force BBM scanning.

> 
> 
> 
> 
> >> The Denali IP also supports lowlevel
> >> command-base interface to issue NAND_CMD_RNDOUT
> >> and cherry-pick ECC sections.
> >>
> >> But, more simply, I can transfer the whole page + oob
> >> into a temporary buffer, then only copy
> >> ECC sections into oob_poi.  
> >
> > It should be faster if you only retrieve ECC sections (less I/Os), but
> > that's just optimization. Note that read_oob() is heavily used when
> > scanning bad blocks, so it might make a huge boot-time difference in the
> > end.  
> 
> 
> I think this comes down to
> 
> "PIO register access only for ECC sectors"
>     vs
> "DMA transfer for the whole page"
> 
> I will test which is better.
> 
> 
> BTW, surprisingly enough, the Denali still sets
> NAND_SKIP_BBTSCAN flag.
> 
> 
> 
