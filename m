Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhmJm-0002Ai-W7
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 23:31:47 +0000
Message-ID: <1473291077.30217.84.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, linux-mtd@lists.infradead.org, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 07 Sep 2016 18:31:17 -0500
In-Reply-To: <20160907181514.27a7fefc@bbrezillon>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
 <20160907092257.77915c23@bbrezillon>
 <CADFuHZ7e4-vrP+kys1U9Pc7e4A4+-J_W3-QERBv6KAi9hQy8ZA@mail.gmail.com>
 <20160907181514.27a7fefc@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-09-07 at 18:15 +0200, Boris Brezillon wrote:
> On Wed, 7 Sep 2016 09:50:50 -0500
> Ronak Desai <ronak.desai@rockwellcollins.com> wrote:
> 
> > IFC input clock is divide by 2 platform clock which is fixed in T, P
> > series
> > and Layerscape series of processors where IFC is used, maximum
> > platform clock is 600 MHz so IFC input clock becomes 300 MHz maximum.
> > To avoid floating operation, I chose next possible frequency of
> > 333.33 MHz which gives me period of 3 ns. There was no easy way to find
> > the input IFC clock without knowing platform clock which requires RCW
> > values.
> > So, to avoid that I selected this route where we will end up waiting few
> > more
> > cycles then required but it does not harm. For example, my input IFC clock
> > is
> > 266.66 Mhz and my NAND part tells me to wait minimum 200 ns so I have to
> > wait for  54 cycles while with this calculation I will be waiting for 66
> > cycles
> > which I think won't matter as the data-sheet specifies minimum change
> > column
> > set-up time.
> Ok, let's forget this aspect for now. It just feels weird for someone
> who is working on ARM platforms to see code that is making assumptions
> on the parent clk rate.
> We usually have most clocks exposed through the clk framework, and
> query the rate of the clock driving the IP before calculating
> sub-timings. 

I don't like seeing these assumptions hardcoded either, and we do have a clock
driver that can supply this information.  We just need to add an appropriate
clocks property to the IFC node (though the driver should keep working at
least as well as it currently does on existing device trees).

Prabhakar, do you know of a FIR operation other than NWAIT that would be
suitable here if we do go the route of sending a real RNDOUT command?

> > > > In
> > > > particular, I don't think we should be sending a real RNDOUT command
> > > > at the
> > > > device here -- it breaks the model of self-contained operations.  The
> > > > read
> > > > command is over and the chipselect has been dropped (do all ONFI chips
> > > > support
> > > > "CE don't care"?).  If the new offset (plus size to be read) fits
> > > > within the
> > > > page buffer, we could just adjust ifc_nand_ctrl->index to the desired
> > > > location.  
> > > It should be supported (releasing the CE after the PARAM command and
> > > then sending a RNDOUT), but who knows what NAND vendors decide to
> > > implement.
> > >  
> > Initially I though of just adjusting the index as we don't do any read
> > operation
> > again and already we read the required bytes.
> > So, what should be the final take on this ? Should I just update the index
> > and
> > avoid sending the change column command at all? Or should I keep the
> > existing
> > implementation ?
> Not sure what you mean. Do you mean updating the index of your internal
> buffer?

Yes, the offset within the SRAM buffer that the next read_byte()/read_buf()
will access.

-Scott
