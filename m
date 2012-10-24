Received: from mail2.shareable.org ([80.68.89.115])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQxeQ-0006tK-51
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 09:53:26 +0000
Date: Wed, 24 Oct 2012 10:53:06 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Thomas.Betker@rohde-schwarz.com
Subject: Re: [question]MTD:unstable bit issues?
Message-ID: <20121024095305.GA17431@jl-vm1.vm.bytemark.co.uk>
References: <50877953.9040602@linux.vnet.ibm.com>
 <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
Cc: linux-mtd@lists.infradead.org, hejianet <hejianet@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas.Betker@rohde-schwarz.com wrote:
> Hello Jia:
> We have also seen this "4k zeros" issue for some time. I never found out 
> was was happening because the issue was suddenly no longer reproducible. 
> :-(
> 
> In our case, though, we didn't have NAND flash, but JFFF2 with serial NOR 
> flash. So I would guess that this is not a NAND problem.

I've seen it a number of times with JFFS2 with parallel NOR, on
ancient kernels (2.4.26-uc0).  Typically the symptom would be an
executable crashing, and a 4k hole would be causing that.

We always put it down to a faulty board with poor signal and/or timings
to the NOR, as it "seemed" to happen on particular boards more, and
simply removed those boards from service.  However testing wasn't very
systematic.

If JFFS2 sees a corrupt block (detected by CRC), it simply discards
that block from the file data as if it's never been written, making a
hole.  An I/O error would be much nicer than corrupt data, but a hole
is what we get.

It might have been caused by faulty boards but in a different way:
Some of our boards crashed every few weeks because the manufacturer's
tolerances between CPU and DRAM were too tight.  After a very long
time in the field (years), we learned to underclock those slightly.
Maybe, occasional DRAM corruption was also causing occasional NOR
corruption as a side effect (e.g. writing/reading data that didn't
match the CRC during JFFS2 GC), leading to 4k holes in previously good
files (bad but understandable); or maybe occasional crashes caused it
(not acceptable and shouldn't happen).  But I am not sure the two
issues were correlated anyway.

-- Jamie
