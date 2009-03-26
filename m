Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lmz42-0002Ox-Lo
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 23:32:53 +0000
Date: Fri, 27 Mar 2009 02:32:45 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 3/4] powerpc: NAND: FSL UPM: document new bindings
Message-ID: <20090326233245.GA17048@oksana.dev.rtsoft.ru>
References: <fa686aa40903252209r52a1bc1cn995a7da16bc3527f@mail.gmail.com>
	<49CB31CB.2010704@grandegger.com>
	<fa686aa40903260727y3266e394g5e574680fe70bbbf@mail.gmail.com>
	<49CBA062.5050000@grandegger.com>
	<fa686aa40903260904s67258fbbge3c87e06946c5f58@mail.gmail.com>
	<49CBAED4.8030802@grandegger.com>
	<fa686aa40903261002l2c8e0d41s6e5ad4bc049058bf@mail.gmail.com>
	<20090326173302.GA23187@oksana.dev.rtsoft.ru>
	<49CBFE52.6090706@grandegger.com>
	<fa686aa40903261622wa2a93f9i98435080c7ab6cea@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <fa686aa40903261622wa2a93f9i98435080c7ab6cea@mail.gmail.com>
Cc: linuxppc-dev@ozlabs.org,
	devicetree-discuss list <devicetree-discuss@ozlabs.org>,
	linux-mtd@lists.infradead.org, Wolfgang Grandegger <wg@grandegger.com>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2009 at 05:22:36PM -0600, Grant Likely wrote:
[...]
> That said, I won't oppose it if you go this route.  However at the
> very least, please change the nand node's compatible list to be:
> 
> compatible = "tqc,tqm8548-upm-nand", "fsl,upm-nand";

Yeah, that's definitely a good idea.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
