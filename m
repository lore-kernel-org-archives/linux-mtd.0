Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188kK0-0006NI-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 16:43:28 +0000
Date: Mon, 4 Nov 2002 18:13:39 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian J. Murrell" <0c9fc0b0347685d368eb3e4aecd72738@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021104171339.GB13152@wohnheim.fh-wedel.de>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <20021104142950.GO16306@pc.ilinx>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021104142950.GO16306@pc.ilinx>
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

On Mon, 4 November 2002 09:29:51 -0500, Brian J. Murrell wrote:
> 
> Of course, you are absolutely correct.  I guess the reason I jumped
> the gun was that the last time I did this dance, there was no active
> maintainer so I went ahead and sent my patch to Marcelo my self.  I
> guess I was just following the footsteps of my last time around with
> this sort of thing.
> 
No problem. I've made bigger thinkos on a regular basis. :-(

> +++ linux-2.4.19-16mdkcustom.memory_bus/arch/alpha/defconfig	2002-11-01 18:50:35.000000000 -0500
> +++ linux-2.4.19-16mdkcustom.memory_bus/arch/i386/defconfig	2002-11-01 18:50:44.000000000 -0500
> +++ linux-2.4.19-16mdkcustom.memory_bus/arch/ia64/defconfig	2002-11-01 18:50:51.000000000 -0500
> +++ linux-2.4.19-16mdkcustom.memory_bus/arch/ppc/defconfig	2002-11-01 18:50:57.000000000 -0500
> +++ linux-2.4.19-16mdkcustom.memory_bus/arch/x86_64/defconfig	2002-11-01 18:51:03.000000000 -0500

That is five architectures out of of sixteen. You might argue that
s390 does not need mtd (which I'm not even sure about), but arm is
definitely missing and surely some more.

Can you add the other architectures or explain for each missing one,
why this was not necessary? Maybe I am just stupid.

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
