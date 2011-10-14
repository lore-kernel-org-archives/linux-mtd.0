Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REiz9-0006KM-Ta
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:43:44 +0000
Received: by wwg9 with SMTP id 9so867125wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 07:43:40 -0700 (PDT)
Date: Fri, 14 Oct 2011 15:43:37 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
Message-ID: <20111014144337.GB25079@totoro>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
	<1318600108.12351.130.camel@sauron> <20111014142149.GA25079@totoro>
	<1318602329.12351.143.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318602329.12351.143.camel@sauron>
Cc: devicetree-discuss@lists.ozlabs.org,
	Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 14, 2011 at 05:25:21PM +0300, Artem Bityutskiy wrote:
> On Fri, 2011-10-14 at 15:21 +0100, Jamie Iles wrote:
> > > the top of my head, it is logical when things go like this: I have a
> > > kernel with working platform data, but I can change that dynamically by
> > > feeding it a device tree configuration. Hmm?
> > 
> > I think in general platform data and device tree should be mutually 
> > exclusive.
> 
> OK, but would you please confirm this by pointing to some docs or
> discussions, or may be people from devicetree-discuss@lists.ozlabs.org
> could confirm that?

I found https://lwn.net/Articles/449058/ from Grant that I think covers 
it, but that's the best I could find written down!

Jamie
