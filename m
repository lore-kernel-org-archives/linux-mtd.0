Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7e0-0000hE-4P
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 20:57:32 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so1524239pab.38
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 12:57:10 -0800 (PST)
Date: Wed, 5 Nov 2014 12:57:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhi Li <lznuaa@gmail.com>
Subject: Re: mtd: nand: lock unlock function
Message-ID: <20141105205706.GP23619@ld-irv-0074>
References: <CAHrpEqSum1__d5Y1tysEzpa_MGuQSWfOW=m4idSxzCTdGbNKTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHrpEqSum1__d5Y1tysEzpa_MGuQSWfOW=m4idSxzCTdGbNKTQ@mail.gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, White Ding <bpqw@micron.com>,
 linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+

On Wed, Nov 05, 2014 at 02:31:34PM -0600, Zhi Li wrote:
> Does any know the reason why there are nand_lock and nand_unlock
> function in nand_base.c, but
> 
>         mtd->_lock = NULL;
>         mtd->_unlock = NULL;
> 
> Not set to nand_lock and nand_unlock?

Possible answers:

 * Lack of testing

 * The LOCK/UNLOCK opcodes are not supported by all vendors

 * Even the vendors that support them don't do so consistently (not sure
   about this one; I know Micron supports this in some cases)

 * The opcodes aren't even documented (again, I'm not even sure about
   this one; but many Micron datasheets I see don't mention LOCK/UNLOCK.
   I recall that other similar lock/protection implementations are
   secret to some extent, and are intentionally omitted from the
   datasheets)

I'd be happy to be proven wrong on any of these points.

Brian
