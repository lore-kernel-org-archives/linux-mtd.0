Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtNKa-0006PC-OI
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 22:12:01 +0000
Received: by pabfh17 with SMTP id fh17so36465733pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 14:11:39 -0800 (PST)
Date: Mon, 2 Nov 2015 14:11:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tim Harvey <tharvey@gateworks.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
Message-ID: <20151102221136.GF7274@google.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
 <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
 <562FD60E.9020807@nod.at>
 <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
 <CAJ+vNU3Y_SnLSAojp3-hXxR02dtfX5n78GkS6Zt-izDZMh2msQ@mail.gmail.com>
 <5637D649.8060802@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5637D649.8060802@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Boris

On Mon, Nov 02, 2015 at 10:31:53PM +0100, Richard Weinberger wrote:
> Am 02.11.2015 um 21:31 schrieb Tim Harvey:
> 
> >> I've cc'd Huang, Elie, and Brian who were involved in the patch to
> >> detect bit-flips in gpmi-nand.c reads - perhaps they have some more
> >> ideas. I find it interesting that in one case that patch resolves the
> >> issue and in the other it does not.
> 
> Yeah, good idea!

Sorry, I don't have much time to care about gpmi-nand right now. I
recall that there was ugly support for detecting bitflips in erased
pages posted at some point (in case that's relevant; didn't read the
whole essay), but that never got merged, and Huang left Freescale.

I also recall Boris struggled with that driver at some point. Perhaps he
can be persuaded to care.

Brian
