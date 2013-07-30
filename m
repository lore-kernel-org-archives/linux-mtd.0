Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4CIQ-0003BP-TX
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 15:57:11 +0000
Date: Tue, 30 Jul 2013 16:56:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Pawel Moll <Pawel.Moll@arm.com>
Subject: Re: [PATCH v2 4/4] mtd: nand: gpio: Add support for multichip devices
Message-ID: <20130730155635.GE29859@e106331-lin.cambridge.arm.com>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
 <1375182325-30003-2-git-send-email-shc_work@mail.ru>
 <1375183165.2272.1.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375183165.2272.1.camel@hornet>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ian Campbell <ian.campbell@citrix.com>, Alexander Shiyan <shc_work@mail.ru>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "rob.herring@calxeda.com" <rob.herring@calxeda.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 12:19:25PM +0100, Pawel Moll wrote:
> On Tue, 2013-07-30 at 15:05 +0400, Alexander Shiyan wrote:
> > +- gpio-ale : specifies the ALE gpio pin.
> > +- gpio-cle : specifies the CLE gpio pin.
> > +- gpio-nwp : specifies the NWP gpio pin (Optional).
> > +- gpios-nce : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
> > +- gpios-rdy : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.
> 
> Let me quote Documentation/devicetree/bindings/gpio/gpio.txt:
> 
> 	GPIO properties should be named "[<name>-]gpios"
> 
> So I believe it should rather be: "ale-gpios", "cle-gpios", "nwp-gpios",
> "nce-gpios", "rdy-gpios"...
> 
> Pawel
> 

+1

Mark.
