Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187Lx0-0003ou-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 20:29:58 +0000
Date: Thu, 31 Oct 2002 22:00:01 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian J. Murrell" <4b07d544b5c5062e647d85db08f8d05c@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021031210001.GB31035@wohnheim.fh-wedel.de>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <20021031190518.GL27880@pc.ilinx>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021031190518.GL27880@pc.ilinx>
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

On Thu, 31 October 2002 14:05:19 -0500, Brian J. Murrell wrote:
> On Thu, Oct 31, 2002 at 07:37:18PM +0100, Jörn Engel wrote:
> > 
> > All right. This patch will only create the mtd devices from ram and
> > block devices, unless $CONFIG_MEMORY_BUS is defined.
> 
> Cool.  Is the memory bus the only bus that MTD devices can be attached
> to?  They can't be attached to USB or PCMCIA or anything else?  Or
> perhaps the only ones supported by Linux right now are ones attached
> to a memory bus?

Nor flashes are usually attached to the memory bus. If something else
is possible as well, I don't know about it.
Nand comes in many varieties, attached via ide, pcmcia, ..., never to
a memory bus directly. But at least, all of those systems do have a
memory bus, so the patch is not completely wrong here.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
