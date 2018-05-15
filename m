Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIUUw-0001EH-Bo
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 07:35:52 +0000
Date: Tue, 15 May 2018 09:35:25 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Shreeya Patel <shreeya.patel23498@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Jane Wan <Jane.Wan@nokia.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 ties.bos@nokia.com, prabhakar.kushwaha@nxp.com, "open list:MEMORY
 TECHNOLOGY..." <linux-mtd@lists.infradead.org>, jagdish.gediya@nxp.com,
 Richard Weinberger <richard@nod.at>, Shawn Guo <shawnguo@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: use bit-wise majority to recover
 the contents of ONFI parameter
Message-ID: <20180515093525.051856dd@bbrezillon>
In-Reply-To: <CAHp75VcET7PZYfeRkmiP=n_xCnDzEFYS98ZLjszc1fHjdfDF2A@mail.gmail.com>
References: <1525920400-11392-1-git-send-email-Jane.Wan@nokia.com>
 <20180510140311.02805561@bbrezillon>
 <CAHp75VcET7PZYfeRkmiP=n_xCnDzEFYS98ZLjszc1fHjdfDF2A@mail.gmail.com>
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

On Mon, 14 May 2018 20:54:36 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, May 10, 2018 at 3:03 PM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> 
> >> +#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)  
> >
> > Not sure we need that macro, see below.  
> 
> +1. We have too many nice helpers for bit manipulations
> (for_each_set_bit() as an example).
> 
> 
> >                         for (k = 0; k < nbufs; k++) {
> >                                 const u8 *srcbuf = srcbufs[j];
> >
> >                                 if (srcbuf[i] & BIT(k))
> >                                         m++;
> >                         }  
> 
> ...which is effectively hweightXX().

No it's not.
