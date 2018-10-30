Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHPMc-0001Lb-Rf
 for linux-mtd@lists.infradead.org; Tue, 30 Oct 2018 08:27:04 +0000
Date: Tue, 30 Oct 2018 09:26:05 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Grandbois, Brett" <brett.grandbois@opengear.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for SPI boot flash access
 for AMD Family 16h
Message-ID: <20181030092605.38851906@bbrezillon>
In-Reply-To: <a6edf985-0d15-5b2b-a6ba-9cfcd7a67836@opengear.com>
References: <20181016005726.26813-1-brett.grandbois@opengear.com>
 <20181027173945.241e87b2@bbrezillon>
 <a6edf985-0d15-5b2b-a6ba-9cfcd7a67836@opengear.com>
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

On Mon, 29 Oct 2018 23:15:42 +0000
"Grandbois, Brett" <brett.grandbois@opengear.com> wrote:

> On 28/10/18 1:39 am, Boris Brezillon wrote:
> > Hi Brett,
> >
> > On Tue, 16 Oct 2018 00:57:41 +0000
> > "Grandbois, Brett"<brett.grandbois@opengear.com>  wrote:
> >  
> >> Add support to expose the SPI boot flash on AMD Family 16h CPUs as
> >> a standard mtd device to give userspace BIOS updaters greater
> >> feature support.  The BIOS and Kernel Developer's Guide refers to
> >> this as the 'SPI ROM' controller and so the driver follows that
> >> naming convention for consistency.
> >>  
> > We're currently trying to convert spi-nor controller drivers to the
> > spi-mem interface [1]. Can you look at this new interface and tell
> > me if you'd be able to implement it? If that's not possible, then
> > I'd prefer to have this driver implement the mtd_info interface
> > directly.  
> 
> So from going over the spi-mem interface it looks like the intent is
> for these sorts of devices to be a standard spi_controller with only
> mem_ops defined and the transfer/_one/_one_message left as NULL?  Is
> that correct? 

Yes

> That's a bit of a pivot from how it's currently done
> (it's conceptually similar to the intel-spi-pci driver so I was
> following that)

Yes, and that's exactly what I'd like to avoid. intel-spi-pci will
probably be the trickiest conversion, so I'd like to avoid having
another one ;-).

> but I should be able to rework it to the new
> interface.  This then lives under drivers/spi and thus should be
> submitted to linux-spi? 

Actually, if the controller is only ever connected to the same SPI NOR
chip (no need for advanced detection scheme) and does not support
support Octo/Quad/Dual modes (or any other advanced features), you'll
be better off implementing mtd->_read/_write/_erase() directly (the
driver would then live in drivers/mtd/devices/).
