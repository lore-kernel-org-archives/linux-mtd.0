Date: Fri, 8 May 2015 16:26:32 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
Message-ID: <20150508212632.GA7167@bshelton-desktop>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427232353.GD32500@ld-irv-0074>
 <CAGnW=BYVn5quNKooiB44CiCYtuYckWArTkft4BQLxs188FwUpg@mail.gmail.com>
 <20150428032213.GI19571@brian-ubuntu>
MIME-Version: 1.0
In-Reply-To: <20150428032213.GI19571@brian-ubuntu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/27, Brian Norris wrote:
> On Tue, Apr 28, 2015 at 08:18:12AM +0530, punnaiah choudary kalluri wrote:
> > On Tue, Apr 28, 2015 at 4:53 AM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> > > On Tue, Apr 28, 2015 at 12:19:16AM +0200, Richard Weinberger wrote:
> > >> Oh, I thought every driver has to implement that function. ;-\
> > >
> > > Nope.
> > >
> > >> But you're right there is a corner case.
> > >
> > > And it's not the only one! Right now, there's no guarantee even that
> > > read_buf() returns raw data, unmodified by the SoC's controller. Plenty
> > > of drivers actually have HW-enabled ECC turned on by default, and so
> > > they override the chip->ecc.read_page() (and sometimes
> > > chip->ecc.read_page_raw() functions, if we're lucky) with something
> > > that pokes the appropriate hardware instead. I expect anything
> > > comprehensive here is probably going to have to utilize
> > > chip->ecc.read_page_raw(), at least if it's provided by the hardware
> > > driver.
> > 
> > Yes, overriding the chip->ecc.read_page_raw would solve this.
> 
> I'm actually suggesting that (in this patch set, for on-die ECC
> support), maybe we *shouldn't* override chip->ecc.read_page_raw() and
> leave that to be defined by the driver, and then on-die ECC support
> should be added in a way that just calls chip->ecc.read_page_raw(). This
> should work for any driver that already properly supports the raw
> callbacks.
> 

Hi Richard et al,

I'm guessing it's probably too late for the on-die ECC stuff to land in
4.2 at this point.  Is there anything I can do to help this along
(testing, etc.)?

Thanks,
Ben
