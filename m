Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XURsK-0001rC-HO
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 02:55:17 +0000
Received: by mail-pd0-f171.google.com with SMTP id p10so408929pdj.16
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 19:54:54 -0700 (PDT)
Date: Wed, 17 Sep 2014 19:54:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
Message-ID: <20140918025447.GA8127@brian-ubuntu>
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D6CAB.7020501@ti.com> <540D8A92.2040209@ti.com>
 <20140910124849.GA25308@arch.hh.imgtec.org>
 <54104CB4.4020703@ti.com>
 <20140917083353.GB7362@norris-Latitude-E6410>
 <CAAEAJfDPnYZJbryFqDkBbq3p0CBFgwP9v9PG_j9cv-5T2Ymdnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfDPnYZJbryFqDkBbq3p0CBFgwP9v9PG_j9cv-5T2Ymdnw@mail.gmail.com>
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 17, 2014 at 10:54:03AM +0100, Ezequiel Garcia wrote:
> On 17 September 2014 09:33, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Wed, Sep 10, 2014 at 04:05:56PM +0300, Roger Quadros wrote:
> >> On 09/10/2014 03:48 PM, Ezequiel Garcia wrote:
> >> > On 08 Sep 01:53 PM, Roger Quadros wrote:
> >> >> On 09/08/2014 11:45 AM, Roger Quadros wrote:
> >> >>> On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
> >> >> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y and
> >> >> CONFIG_MTD_NAND_OMAP_BCH to m.
> >> >>
> >> >> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must be limited to
> >> >> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
> >> >>
> >> >
> >> > Hm, yup. Any ideas on how to accomplish that? My Kconfig-foo is not strong enough :(
> >>
> >> Mine neither ;). I'm unaware of any other method than making CONFIG_MTD_NAND_OMAP_BCH to bool.
> >
> > That could be part of the solution. Does the following patch work? It
> > now forces elm and omap to be built the same -- either both as modules
> > or both built-in -- but it solves the rest of the problem I think.
> >
> > (This also has the side effect of causing transition pains for any
> > .config file that had CONFIG_MTD_NAND_OMAP_BCH=m, since this becomes
> > boolean now.)
> >
> 
> http://patchwork.ozlabs.org/patch/388249/
> 
> I used my time-machine to go back in time and submitted the patch for you :-)

I'm glad you prioritized MTD over all the other cool things you could do
with your time machine. But I guess, you really don't need to prioritize
much when you have infinite time, do you?

</joke>

I can get lost when I only pay 50% attention for a few weeks, then try
to sort through the accumulated pile of email.

Brian
