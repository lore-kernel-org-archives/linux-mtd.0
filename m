Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzMMm-0005Hm-NI
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 11:27:34 +0000
Date: Wed, 26 Oct 2016 13:27:00 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
In-Reply-To: <20160610175454.327f51a2@bbrezillon>
Message-ID: <alpine.DEB.2.02.1610261152170.9986@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
 <20160603162207.0688c9e6@bbrezillon>
 <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
 <20160608175018.16c88207@bbrezillon>
 <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Boris,

Juggling the rework of the Evatronix NAND flash driver with other projects 
I'm plodding on and will hopefully have something that can be reviewed in 
a few weeks' time.

In the meantime there is an issue which I want to bring up, regarding the 
timing configuration. Back in June we had this discussion, regarding my 
suggestion to put the raw values for the timing control registers in the 
IP in the DT:

On Fri, 10 Jun 2016, Boris Brezillon wrote:

> On Fri, 10 Jun 2016 17:35:24 +0200
> Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
> > > > > > +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
> > > > > > +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.    
> > > > > 
> > > > > 
> > > > > Can this be extracted from the timing mode exposed by the NAND chip.
> > > > > IMO it shouldn't be defined in the DT. 
> >
> > [ ... ]
> > 
> > > Just because it's complicated to extract these information at the driver 
> > > level level doesn't mean you should put it in the DT. That's exactly the 
> > > opposite: the DT is supposed to encode the hardware representation, not 
> > > how you want to configure it.  
> > 
> > [ ... ]
> > 
> > > How about using a default/safe timing mode for now (ONFI timing mode 0
> > > should work for all NANDs).
> > > The only thing you'll have to do is retrieve the source clk rate and
> > > calculate timing register values accordingly. Or you can even assume
> > > you always have a 100MHz source clk and hardcode it in your driver.  
> > 
> > Yes, that is certainly possible of course, and the driver already has a 
> > hard-coded default setup for this case.
> > 
> > In that case though the driver could have pre-set setups for other ONFi 
> > modes, and we could have an _optional_ DT property to select them, the 
> > reason for that being in order to handle non-ONFi flashes whose timing 
> > cannot be gleaned from the device itself.
> > 
> > I.e. something like
> > 
> > evatronix,onfi-timing-mode = <2>;
> > 
> Actually this has been added to the nand_flash_dev structure, and it's
> called onfi_timing_mode_default.
> If you need a different timing, define a full ID entry for your NAND.

In our products, we use 1, 2 and 4 Gbit SLC NAND flashes, some of which 
are ONFi complient and some not, depending on the manufacturer. For the 
non-ONFi flashes, the ones which we have looked at and which we specify in 
our products actually support ONFi mode 2. However, in practice, as part 
of the nand_scan_ident() procedure, the chip->onfi_timing_mode_default 
value is set to 0, because the EXTENDED_ID_NAND() macro used for these 
flashes doesn't set the timing mode to anything else. There are some full 
ID listings which apparently set a different timing mode for certain 
flashes (such as Toshiba TC58NVG0S3E).

What I would like to have in the device tree, either as a general mtd or 
proprietary property, is something like the above, possibly called 
something like force-onfi-timing-mode, which forcibly sets the timing mode 
of the hardware. When this property is not set, the timing mode used will 
default to onfi_timing_mode_default for non-ONFi flashes, or 
onfi_get_async_timing_mode() for ONFi flashes.

The reationale behind this is that it is impractical to list all specific 
flash chips which actually support a given timing mode. Say another chip 
comes out on the market either from an existing or a new manufacturer, 
which correctly identifies itself using the ID bytes, but not using the 
full ID. In order to support the speed of this device, we would need to 
upgrade the kernel in the product. If we on the other hand have a hardware 
specification that says that we only use flashes which support a certain 
specified timing mode (because of memory bandwidth requirements), we can 
simply put force-onfi-timing-mode = <2> in the DT, and it will work for 
all flashes that meet the specifications, whether they match the full ID 
or not.

For the case of a .dts file specifying a more general board which can be 
populated with any flash chip, the property can be left out, and the 
timing mode will then be determined using the ID and ONFi parameter page, 
as applicable.

Alternatively having this property as a proprietary one (i.e. 
"evatronix,force-onfi-timing-mode") is an alternative, but I still wanted 
to bring up the discussion for the general case.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
