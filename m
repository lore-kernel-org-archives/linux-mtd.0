Received: from dhcp695.linuxsymposium.org ([209.151.10.193]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g4rv-0003Mv-Ca
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 16:52:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f4ebb46f6708c1c@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
Message-Id: <1059148279.28255.43.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 25 Jul 2003 11:51:21 -0400
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

On Fri, 2003-07-25 at 11:12, J.D. Bakker wrote:
> Hi all,
> 
> I have an expansion board for the LART (an embedded computer based on 
> the DEC/Intel StrongARM) with eight NAND flash devices on it. As 
> suggested by the Toshiba datasheet, they share data, CLE, ALE, nWE 
> and nRE and RDY. Each chip has its own nCE line.

Btw, I suspect that when we come to implement this, we'll find you'd get
much more parallelism if you had _separate_ FR/B# lines for each chip. 

If you can hook your FR/B# lines up to an IRQ-capable GPIO, that'd be
cute too.

-- 
dwmw2
