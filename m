Received: from dhcp893.linuxsymposium.org ([209.151.11.135]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gUNX-00072m-DV
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 20:06:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f07bb4875574a88@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
	 <1059147413.28255.40.camel@lapdancer.baythorne.internal>
	 <a05200f01bb4700e6ff94@[130.161.115.44]>
	 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
	 <a05200f05bb4803789a4f@[130.161.115.44]>
	 <1059231977.539.2.camel@lapdancer.baythorne.internal>
	 <a05200f07bb4875574a88@[130.161.115.44]>
Message-Id: <1059246321.1471.3.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Sat, 26 Jul 2003 15:05:23 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-07-26 at 14:20, J.D. Bakker wrote:
> Not really, if you exclude braindead setups like multiple 
> hot-swappable SmartMedia cards. The only sane setup I could imagine 
> is having one partition per NAND device, but it's not one I would be 
> using myself.

True, but in that case you can still do it as separate devices. 

> Would you expect all devices to have the same size ?

Yes. I made that optimisation for NOR chips and nobody's bitched about
it yet, IIRC. 

-- 
dwmw2
