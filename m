Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187I6Y-0003Pr-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 16:23:34 +0000
Date: Thu, 31 Oct 2002 17:53:22 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian J. Murrell" <23025b7367b1a31e3ff7682b8a6ae18e@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org, Jamey.Hicks@hp.com
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021031165322.GA8263@wohnheim.fh-wedel.de>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <20021030224633.GI27880@pc.ilinx>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021030224633.GI27880@pc.ilinx>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 30 October 2002 17:46:33 -0500, Brian J. Murrell wrote:
> Right.  My example was a generalization around the whole MTD
> sub-system.  If it were going to be finer grained to specific devices,
> the tests would specific to the bus(es) they can use.

Ok.

> But any device that requires access to physical hardware will break
> during a UML build if it is enabled during the configure.  It should
> not even be selectable if it's required hardware is not selected,
> IMHO.
> 
> > "need to be protected by"? Propably not. "don't make much sense
> > without"? Propable yes.
> 
> And will break the building of a UML if selected.  The idea is not to
> get a couple of hours into a kernel build and go "oooops, I forgot to
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Yeah, I once had a machine like that! ;-)

> disable ______ hardware driver" when the build breaks because of some
> hardware access not being available in the UML configuration.

Absolutely correct. A couple of test compiles convinced me.

> > This looks like a tradeoff between complexity in the Config.ins and in
> > .config or the make *config interface. If you want to keep the user
> > interface shorter and are willing to do the work, go ahead!
> 
> It's fairly simple work in the Config.ins.  I would do it but I don't
> really know what kinds of devices (i.e. buses) are required by the
> various MTD devices.  I did do this work for PC apple/ethertalk cards
> and submitted it to Marcelo.
> 
> I hoped I could bring you (rather, somebody, anybody with more
> knowlege about this than I) around.  :-)

New sailor aboard, captain.

I'll try to create a sample patch soon. But it remains your duty to
make it production-ready and convince David.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
