Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpga-00054C-41
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:59:17 +0000
Received: by mail-pa0-f43.google.com with SMTP id bj1so3816110pad.16
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:58:54 -0800 (PST)
Date: Thu, 6 Mar 2014 23:58:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140307075851.GH31517@norris-Latitude-E6410>
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
 <20140221060833.GA29360@shlinux2.ap.freescale.net>
 <CAGWqfig_LO69C6dHt0qwVEtt0Winu5Jqk7Ef5N6H1qaPMnw58A@mail.gmail.com>
 <20140307075615.GG31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140307075615.GG31517@norris-Latitude-E6410>
Cc: bpringlemeir@nbsps.com, Vikram.Narayanan@in.bosch.com,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(+ Pekon for real this time! Sorry for the noise)

Pekon, please note the question directed to you (and others) below.

And in case you're missing the actual patch context:

  http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html

On Thu, Mar 06, 2014 at 11:56:15PM -0800, Brian Norris wrote:
> + Pekon (he's doing something similar in OMAP NAND)
> 
> On Mon, Mar 03, 2014 at 08:47:07AM +0100, Elie De Brauwer wrote:
> > On Fri, Feb 21, 2014 at 7:08 AM, Huang Shijie <b32955@freescale.com> wrote:
> > > On Mon, Jan 13, 2014 at 04:47:18PM +0800, Huang Shijie wrote:
> > > Just a ping.
> > >
> > > could you merge this patch?
> > 
> > Also a ping from my side, I'm also a demanding party for a solution
> > for this issue, and I'm also waiting for a solution to get applied
> > upstream to integrate it into my board.
> 
> Hmm, I'm not terribly opposed to this patch, but you, Pekon, and I
> (in my local driver) are all doing something very similar, and I believe
> Pekon has gotten the logic wrong one or more times. I believe I actually
> have a version of this type of patch locally that could probably be put
> into the nand_base layer, with a flag so that drivers could request the
> check themselves (something like chip->options |=
> NAND_NEED_FF_ECC_CHECK; or pick your own name!).
> 
> What do you think? All interested parties please chime in. I can try to
> push a patch out soon for you all to test soon, or else I can see about
> taking your patches as-is for now, then try to unify them myself
> afterward.

Thanks,
Brian
