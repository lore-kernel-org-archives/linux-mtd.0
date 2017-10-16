Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e47jv-0004yJ-ML
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 15:55:42 +0000
Date: Mon, 16 Oct 2017 17:55:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>
Cc: William Kennington <wak@google.com>, Mark Rutland
 <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Cyril Bur <cyrilbur@gmail.com>, Stewart
 Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Message-ID: <20171016175517.264e710a@bbrezillon>
In-Reply-To: <8760cbv090.fsf@concordia.ellerman.id.au>
References: <20170905202339.20732-1-wak@google.com>
 <20170921095930.4b473f91@bbrezillon>
 <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com>
 <8760cbv090.fsf@concordia.ellerman.id.au>
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

Hi Michael,

Sorry for the late reply.

On Fri, 22 Sep 2017 14:13:47 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> William Kennington <wak@google.com> writes:
> 
> > +Cyril Bur and
> >
> > Not sure what you mean by mainline, but the commit is in the master branch
> > at
> > https://github.com/open-power/skiboot/commit/ba99af9b149d02438347b055e6e7d6bd15e33551  
> 
> I suspect Boris missed that you were referring to a skiboot commit and
> looked in Linux?
> 
> > I'm unsure about the documentation of the properties as I'm not really the
> > maintainer of any of the code on either side. I just added this DT property
> > for plumbing through the NO_ERASE flag. I added Cyril and Michael as they
> > both work closely with this driver and could comment better than I could.
> >
> > - William
> >
> > On Thu, Sep 21, 2017 at 12:59 AM Boris Brezillon <
> > boris.brezillon@free-electrons.com> wrote:
> >  
> >> +the DT maintainers
> >>
> >> On Tue,  5 Sep 2017 13:23:39 -0700
> >> "William A. Kennington III" <wak@google.com> wrote:
> >>  
> >> > As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support  
> >>
> >> I didn't find this commit in mainline.
> >>  
> >> > adding a device tree entry which marks a flash device as not needing
> >> > erase. This patch adds support for setting MTD_NO_ERASE on powernvflash
> >> > devices which have the property no-erase.
> >> >
> >> > Signed-off-by: William A. Kennington III <wak@google.com>
> >> > ---
> >> >  drivers/mtd/devices/powernv_flash.c | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/drivers/mtd/devices/powernv_flash.c  
> >> b/drivers/mtd/devices/powernv_flash.c  
> >> > index f5396f26ddb4..fab9f9121b4c 100644
> >> > --- a/drivers/mtd/devices/powernv_flash.c
> >> > +++ b/drivers/mtd/devices/powernv_flash.c
> >> > @@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct  
> >> device *dev,  
> >> >       mtd->name = of_get_property(dev->of_node, "name", NULL);
> >> >       mtd->type = MTD_NORFLASH;
> >> >       mtd->flags = MTD_WRITEABLE;
> >> > +     if (of_property_read_bool(dev->of_node, "no-erase"))
> >> > +             mtd->flags |= MTD_NO_ERASE;  
> >>
> >> I don't see this property document in a DT binding doc, which is
> >> mandatory. Actually, there's no DT bindings doc at all for the
> >> 'ibm,opal-flash' device in mainline, is this normal?  
> 
> The binding doc is here:
> 
>   https://github.com/open-power/skiboot/blob/master/doc/device-tree/ibm%2Copal/flash.rst
> 
> But that property is not documented :(

Would be good to update the doc then :-).

> 
> We have some of the skiboot bindings also in the kernel tree, but there
> was talk of moving all the binding docs *out* of the kernel, so we never
> made an effort to put more in. I've lost track of whether there are
> still plans to move the binding docs out or not.


Okay, I don't know what's the policy for external DT bindings doc, but
maybe you can add a file in Document/devicetree/bindings/mtd pointing
to the skiboot doc.

Rob, what's your opinion?
