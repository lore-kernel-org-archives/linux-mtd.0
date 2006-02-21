Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBTwf-0000N0-2W
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 04:36:39 -0500
Date: Tue, 21 Feb 2006 10:35:50 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20060221093550.GA32288@wohnheim.fh-wedel.de>
References: <43EB96DC.3030900@eptar.com>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<1140477524.2480.827.camel@localhost.localdomain>
	<35fb2e590602201629i1c4eefd8v3dc4e43bfa194f2c@mail.gmail.com>
	<1140510373.2480.842.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1140510373.2480.842.camel@localhost.localdomain>
Cc: jonathan@jonmasters.org, Vitaly Wool <vwool@ru.mvista.com>,
	Charles Manning <manningc2@actrix.gen.nz>,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 February 2006 09:26:13 +0100, Thomas Gleixner wrote:
> 
> It's about some piece of software relying on a non guaranteed hardware
> feature.
> 
> I'm looking into the variety of hardware which evolves around NAND flash
> and I carefully look in which direction this is going.
> 
> I see that the near future will require more complexity in the nand code
> and I'm looking for a sane solution for that. I'm not saying that its
> wrong, when something uses a nice hardware feature, but my point still
> stands that it is wrong to rely on a feature which is nowhere
> guaranteed. 

Ack.  One of the better features of hard disks is that they have a
standard interface.  I can take an ext3 image from a 5 year old disk
from one vendor and write it to a brand new disk from a different
vendor and things just work.  No conversion tool is needed.

For flash, moving images between arbitrary chips is just a pipe dream.
But things will get pushed into that direction.  So for a filesystem
to work on many chips, it should be prepared to work with different
page- and block-sizes and not rely on OOB at all.

Jörn

-- 
You ain't got no problem, Jules. I'm on the motherfucker. Go back in
there, chill them niggers out and wait for the Wolf, who should be
coming directly.
-- Marsellus Wallace
