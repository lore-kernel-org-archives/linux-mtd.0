Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c09tf-0003YI-Eq
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 16:20:48 +0000
Date: Fri, 28 Oct 2016 18:20:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Message-ID: <20161028182022.7643c4ea@bbrezillon>
In-Reply-To: <alpine.DEB.2.02.1610281725060.9986@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
 <20160603162207.0688c9e6@bbrezillon>
 <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
 <20160608175018.16c88207@bbrezillon>
 <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon>
 <alpine.DEB.2.02.1610261152170.9986@lnxricardw1.se.axis.com>
 <20161026135241.63653c4f@bbrezillon>
 <alpine.DEB.2.02.1610261359290.9986@lnxricardw1.se.axis.com>
 <20161026150557.587a7387@bbrezillon>
 <alpine.DEB.2.02.1610280900260.9986@lnxricardw1.se.axis.com>
 <20161028164440.253b0c96@bbrezillon>
 <alpine.DEB.2.02.1610281725060.9986@lnxricardw1.se.axis.com>
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

On Fri, 28 Oct 2016 18:01:44 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> On Fri, 28 Oct 2016, Boris Brezillon wrote:
> 
> > > One thing I would have liked to have is to have the actual timing mode 
> > > number in the nand_data_interface struct, for controllers like in my case 
> > > where it's problematic to take the numeric timing values and map them to 
> > > register values, and the timing register values need to be pre-computed.   
> > 
> > What do you mean by pre-computed? If you're able to pre-compute the
> > timings, why can't you do that at runtime?  
> 
> The short answer in this case is because the timing values were delivered 
> by our ASIC integration vendor, partly after running simulations to verify 
> the exact timing using the actual silicon layout. That is why I originally 
> wanted to put those timing register values directly in the DT, becuase 
> they are in practice part of the specifications for the actual ASIC. In 
> essence, we looked at the flash chips we wanted to use with the ASIC, and 
> realized they all conformed to ONFi mode 2. Our vendor then provided us 
> with mode 2 timing values that they guaranteed would work with the chip. 
> (In addition, mode 0 is used during initial boot so minimize the 
> likeleyhood that something would go wrong, given that the boot loader is 
> in a ROM.) Especially given that there was no mtd timing setup 
> infrastructure at the time, we had no interest in how the values were 
> derived, or to support more modes.
> 
> Another issue is how to model the internal delays within the ASIC between 
> the NAND controller IP and the pads, which are also part of the equation.
> 
> I don't know if our case is unique, but at least it is an example of a 
> situation in which runtime calculation of the timing register values is 
> problematic.

Okay. I guess we could add the associated ONFI timing mode to the
nand_data_interface struct (it would represent the closest one if the
NAND is not ONFI and some vendor specific implementation decided to
tweak the timing values).

> 
> > > There might be other reasons where the driver might want to know the mode 
> > > number.  
> > 
> > Do you have real examples?  
> 
> No, it just seemed like a reasonable concept, given that 
> nand_init_data_interface() actually does this mapping anyway, so it might 
> as well inform chip->setup_data_interface() about it, since the 
> information is right there anyway.
> 
> > We could pass the ONFI timing mode here, but some timings are not
> > defined using this mode (like tCCS), and I'm not sure we have the same
> > mapping between ONFI and JEDEC modes. The other thing is that I wanted
> > to leave the door open for vendor specific timing definitions which do
> > not exactly match one of the timing mode defined in the ONFI spec.
> > 
> > That's why I didn't bother exposing the ONFI timing mode to the NAND
> > controller ->setup_data_interface() implementation.  
> 
> Ok, so the reason is really future expansion, where ONFi modes 0..5 may 
> not be the only modes to be configured. Fair enough.

Yep.
