Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpe4-0004rk-6k
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:56:41 +0000
Received: by mail-pb0-f47.google.com with SMTP id up15so3800653pbc.34
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:56:18 -0800 (PST)
Date: Thu, 6 Mar 2014 23:56:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140307075615.GG31517@norris-Latitude-E6410>
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
 <20140221060833.GA29360@shlinux2.ap.freescale.net>
 <CAGWqfig_LO69C6dHt0qwVEtt0Winu5Jqk7Ef5N6H1qaPMnw58A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqfig_LO69C6dHt0qwVEtt0Winu5Jqk7Ef5N6H1qaPMnw58A@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 bpringlemeir@nbsps.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vikram.Narayanan@in.bosch.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Pekon (he's doing something similar in OMAP NAND)

On Mon, Mar 03, 2014 at 08:47:07AM +0100, Elie De Brauwer wrote:
> On Fri, Feb 21, 2014 at 7:08 AM, Huang Shijie <b32955@freescale.com> wrote:
> > On Mon, Jan 13, 2014 at 04:47:18PM +0800, Huang Shijie wrote:
> > Just a ping.
> >
> > could you merge this patch?
> 
> Also a ping from my side, I'm also a demanding party for a solution
> for this issue, and I'm also waiting for a solution to get applied
> upstream to integrate it into my board.

Hmm, I'm not terribly opposed to this patch, but you, Pekon, and I
(in my local driver) are all doing something very similar, and I believe
Pekon has gotten the logic wrong one or more times. I believe I actually
have a version of this type of patch locally that could probably be put
into the nand_base layer, with a flag so that drivers could request the
check themselves (something like chip->options |=
NAND_NEED_FF_ECC_CHECK; or pick your own name!).

What do you think? All interested parties please chime in. I can try to
push a patch out soon for you all to test soon, or else I can see about
taking your patches as-is for now, then try to unify them myself
afterward.

Brian
