Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d96Bf-00027Z-PK
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 08:44:37 +0000
Date: Fri, 12 May 2017 10:44:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Mario Rugiero <mrugiero@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170512104404.6416cc11@bbrezillon>
In-Reply-To: <ecb9a289-cac4-d7b1-1897-ed52553407e3@nod.at>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
 <ecb9a289-cac4-d7b1-1897-ed52553407e3@nod.at>
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

On Fri, 12 May 2017 10:33:27 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris, Mario,
> 
> Am 12.05.2017 um 10:24 schrieb Boris Brezillon:
> >>> Hmm, this sounds like a gross hack.    
> >> It is, but I see no other solution. The NAND chips were used in an
> >> incompatible way by a hack-n-slash driver made by allwinner, and
> >> trying to load them with a proper MTD driver fails miserably if this
> >> is not done.
> >> If anyone can propose a better solution I'll more than happily implement it.
> >> I'm open to suggestions, and of course I'm open to rejection of my
> >> patches if needed.  
> > 
> > u-boot provides the nand.scrub command, which does exactly what you're
> > looking for. And no, I don't think it's a good idea to allow erasing
> > bad blocks, at least not by default.  
> 
> To make this very clear for all MTD users out there, scrubbing the NAND and
> losing the information which blocks are bad is awful.
> Bad blocks can work somehow and fail much later in funny ways.
> UBI/FS problems ahead...
> 
> Do this only if you *really* know what you are doing.

I'm clearly not encouraging people to use nand.scrub, it's just that
sometime you don't have a choice, and this is the case here:
Allwinner is putting non-FF data in the BBM region, and when we switch
from an Allwinner kernel to a mainline kernel, the mainline kernel
considers all programmed blocks as bad.
