Received: from dragon.actrix.co.nz ([203.96.26.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tFlW-0006Nc-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 23:31:34 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: <acurtis@onz.com>, <linux-mtd@lists.infradead.org>
Subject: Re: AND Flash
Date: Fri, 5 Apr 2002 08:26:37 +1200
References: <NCBBIINEHIPFGJPLBEIFEEMMDFAA.acurtis@onz.com>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFEEMMDFAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020404203008.1A47E8AC@dragon.actrix.co.nz>
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

> Does anyone have experience with AND flash? Does MTD support it?

You're looking at the Hitachi stuff right?

I have not used it, but I have had a good sniff around it when evaluating it 
as a storage option against various others. NAND won in the end for the 
following reasons:
* Simpler interface. The AND chips required some funky extra clocks.
* Cost: NAND prices started to fall rapidly. I believe they are now cheaper.
* Multi-source: As far as I can tell only Hitachi does AND. ie. supply 
concerns.
* Supply concerns: AND uptake by the market is uncertain, leading to future 
availability concerns.

Functionally AND is much the same as NAND. ie. page/block oriented stuff.

At the start of the investigation, AND had appeal because it was the cheapest 
per bit. Since then however, NAND (Samsung/Toshiba) prices have fallen 
dramatically and densities are increasing. This, I attribute largely to 
Smartmedia uptake. As NAND rides the Smartmedia consumer wave, I expect to 
see further price drops and density increases. Unless AND gets a similar 
boost I expect it to fade away.

Without having investigated things too far, I'd expect AND to be able to slot 
into mtd rather neatly as a NAND variant. AND commands are likely not the 
same, but equivalent ones exist.

IMHO


-- Charles
