Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBSq5-0007j2-67
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 03:25:44 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: jonathan@jonmasters.org
In-Reply-To: <35fb2e590602201629i1c4eefd8v3dc4e43bfa194f2c@mail.gmail.com>
References: <43EB96DC.3030900@eptar.com>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<1140477524.2480.827.camel@localhost.localdomain>
	<35fb2e590602201629i1c4eefd8v3dc4e43bfa194f2c@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 21 Feb 2006 09:26:13 +0100
Message-Id: <1140510373.2480.842.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Charles Manning <manningc2@actrix.gen.nz>,
	Vitaly Wool <vwool@ru.mvista.com>, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-21 at 00:29 +0000, Jon Masters wrote:
> > The worst serial device still guarantees a baudrate > 0 and the
> > effective baudrate has no impact on data storage size.
> 
> Just let me make sure I'm getting this right:
> 
> 1). You don't have OOB available to you with your NAND part.
> 2). You want YAFFS changed to suit your special case.

No, you get it wrong. Its not my personal problem at all. It's not about
the board on my desk.

It's about some piece of software relying on a non guaranteed hardware
feature.

I'm looking into the variety of hardware which evolves around NAND flash
and I carefully look in which direction this is going.

I see that the near future will require more complexity in the nand code
and I'm looking for a sane solution for that. I'm not saying that its
wrong, when something uses a nice hardware feature, but my point still
stands that it is wrong to rely on a feature which is nowhere
guaranteed. 

	tglx
