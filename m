Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPcZy-0003Zg-3p
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 18:48:06 +0000
Received: by mail-pb0-f48.google.com with SMTP id md12so6049726pbc.7
 for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2014 11:47:44 -0700 (PDT)
Date: Mon, 17 Mar 2014 11:47:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140317184741.GB3834@ld-irv-0074>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
 <20140313062845.GT31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2FD2@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB2FD2@DBDE04.ent.ti.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 13, 2014 at 07:01:13AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >Really? So if you read a blank (all 0xff) page that has no bitflips, you
> >see an ECC error? I'm sorry, but I didn't realize that's how your
> >hardware worked. 
> >
> > That's the worst hardware ECC design I've seen so far
> >:(
> >
> - GPMC and ELM hardware engines were design during OMAP3 and earlier
>   time-frames. When only 1-bit Hamming was enough, and there were
>   hardly any bit-flips seen on erased-pages :-).
> - And I don't think h/w IP designers have too much visibility on actual usage
>   and software framework of these engines. So this remained un-changed.
> However, I do have internally raised this issue of getting a feature added
> in hardware to check for all(0xff). But still we have to support legacy devices.

I would think even a hardware designer could figure out that flagging an
ECC error every time you read an all-0xff erased page would be a bad
idea. And that has nothing to do with bit error rates.

Brian
