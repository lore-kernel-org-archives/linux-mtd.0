Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19aebU-0001mo-Jr
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 17:49:09 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h6AGnJD48688	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jul 2003 09:49:19 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: jasmine@regolith.co.uk
In-Reply-To: <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
	 <Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
	 <1057846853.21073.378.camel@passion.cambridge.redhat.com>
	 <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
Message-Id: <1057855838.2659.333.camel@localhost>
Mime-Version: 1.0
Date: 10 Jul 2003 09:50:38 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Charles Manning <manningc2@actrix.gen.nz>
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: nand flash driver
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-07-10 at 08:12, jasmine@regolith.co.uk wrote:
> On Thu, 10 Jul 2003, David Woodhouse wrote:
> 
> > Hmmm. When sending multiple bytes of address, isn't ALE supposed to
> > remain high for the entire duration, without going low again between
> > cycles? How do you achieve this if it's on the address bus?
> 
> By waiting to see if the next write is to the same address-  it's not hard 
> to do that sort of thing in an FPGA or SoC.  Since the only line involved 
> is the ALE to the NAND, there's no downside in hanging on a little longer
> before dropping it.

yup, and a CPLD only costs about $1 (32 io, 32 mc) or $2.65 for a
72io/72 mc. Makes this sort of thing pretty trivial, although for 2 or 3
signals, discrete logic will do just fine.

-- 
Russ Dill <Russ.Dill@asu.edu>
