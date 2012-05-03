Received: from ogre.sisk.pl ([193.178.161.156])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPw3V-0004H5-Sn
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 13:26:51 +0000
From: "Rafael J. Wysocki" <rjw@sisk.pl>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 02/10] ARM: sh-mobile: mackerel: Add error IRQ resource
Date: Thu, 3 May 2012 15:31:31 +0200
References: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
 <CABYn4szWZP4zZcz1MJ1xk5oCxiWh0nyJczcHGUqw4wE5MfJunA@mail.gmail.com>
 <1336039535.13013.17.camel@sauron.fi.intel.com>
In-Reply-To: <1336039535.13013.17.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <201205031531.31219.rjw@sisk.pl>
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, May 03, 2012, Artem Bityutskiy wrote:
> On Thu, 2012-05-03 at 11:29 +0200, Bastian Hecht wrote:
> > 
> > Am 03.05.2012 08:01 schrieb "Artem Bityutskiy" <dedekind1@gmail.com>:
> > >
> > > On Thu, 2012-05-03 at 09:00 +0300, Artem Bityutskiy wrote:
> > > > On Wed, 2012-05-02 at 22:49 +0200, Rafael J. Wysocki wrote:
> > > > > On Wednesday, May 02, 2012, Bastian Hecht wrote:
> > > > > > Supply the platform data for the FLSTEI error IRQ.
> > > > > >
> > > > > > Signed-off-by: Bastian Hecht <hechtb@gmail.com>
> > > > >
> > > > > I'm going to take this patch into the renesas.git tree and push
> > it
> > > > > upstream throuch arm-soc, if that's not a problem.
> > > >
> > > > It is already in the MTD tree with the rest of the 10 patches...
> > >
> > > Ops, sorry, this is not true. Then Bastian should separate it out
> > and
> > > not send it to the MTD tree.
> > 
> > Alright I'll do. I need to fix the compiler warnings of the mtd
> > patches anyway. So the board code is independant and can be pushed
> > already by Rafael, right? How is it supposed to work in general? I
> > think the sh-mobile list wants to be informed when I change something
> > in the flctl code. Would the right approach be to send 2 patchsets -
> > posted on both MLs so that Artem can take the mtd portions and Rafael
> > the mackerel ones?
> 
> If the patches are completely independent, post them separately.

Yes, please.

> I think it is also OK to CC more than one mailing list.

Yes, it is.

Thanks,
Rafael
