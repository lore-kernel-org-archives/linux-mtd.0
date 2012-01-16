Received: from lnx503.hrz.tu-darmstadt.de ([130.83.156.232])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmo2J-0003wL-Rf
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 14:59:53 +0000
From: Tim Sander <tim01@iss.tu-darmstadt.de>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com
Subject: Re: ubiformat & linux 3.0.14-rt
Date: Mon, 16 Jan 2012 15:59:43 +0100
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
 <201201161359.49629.tim01@iss.tu-darmstadt.de>
 <1326719043.14299.88.camel@sauron.fi.intel.com>
In-Reply-To: <1326719043.14299.88.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201201161559.44592.tim01@iss.tu-darmstadt.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem
Am Montag, 16. Januar 2012 schrieb Artem Bityutskiy:
> On Mon, 2012-01-16 at 13:59 +0100, Tim Sander wrote:
> > Am Montag, 16. Januar 2012 schrieb Artem Bityutskiy:
> > > On Mon, 2012-01-16 at 11:43 +0100, Tim Sander wrote:
> > > > > http://git.infradead.org/ubifs-2.6.git/commit/1f5d78dc4823a85f112aa
> > > > > a2d0 f176 24f8c2a6c52
> > > > > http://git.infradead.org/ubifs-2.6.git/commit/d34315da9146253351146
> > > > > 140e a4b 277193ee5e5f
> > > > 
> > > > Do you think it is worthwhile checking the ubifs 3.0 backport with
> > > > the above two cherry-picked?
> > > 
> > > I've pushed them to the ubifs-v3.0 back-port tree as well. But I think
> > > they are useless - sorry, I was confused.
> > 
> > Ok i was wondering that logging was causing this cind of behavoir...
> > 
> > > Also, if you say this happens when you run ubiformat - this is
> > > something about your flash driver. Do you use NOR or NAND? Can you
> > > detect which interrupt takes too much time? If the theory is that this
> > > is your flash driver interrupt - can you verify it by injecting some
> > > instrumentation to the interrupt handler?
> > 
> > This is a arm i.mx35 (pcm43) platform using the nor and nand driver. The
> > mxc_nand driver is loaded later which seems to be around the same time
> > this message:
> > "sched: RT throttling activated" comes up and the ubi on the nand gets
> > attached. I will see what if i can dig s.t. up with the instrumentation
> > and will report back.
> 
> My theory is that this is related to the NOR driver then. UBI does not
> use interrups. UBIFS uses hrtimer so it does have some code which may
> run in interrupt context, but all it does - it wakes up a thread and
> finishes.
The pcm-043 platform uses the "physmap-flash" nor driver. I have not found 
any related interrupt handler? So probably the problem is more sublte. For 
example that the ubi background daemon is working and the timings are different 
after a firmware update which triggers this interrupt. Initially i thought this 
is closely related to the loading of the mxc_nand driver, attaching the ubi 
and mounting the ubifs filesystem since this message is output at roughly the 
same time. But it is only the nor flash which has been updated with ubiformat 
and not the nand flash when this error occurs.

So is there some work to be done, after mounting a ubiformat updated image?

Best regards
Tim
