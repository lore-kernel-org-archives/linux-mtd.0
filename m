Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OZ0B4-0003ev-7a
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2010 11:31:02 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Andrew Morton'" <akpm@linux-foundation.org>
References: <1278653389-12019-1-git-send-email-sudhakar.raj@ti.com>	<20100709153932.0a6cdbcd.akpm@linux-foundation.org>	<00c701cb218b$6e4d6dd0$4ae84970$@raj@ti.com>	<012f01cb226e$61ac9b80$2505d280$@raj@ti.com>
	<20100713104126.95891684.akpm@linux-foundation.org>
In-Reply-To: <20100713104126.95891684.akpm@linux-foundation.org>
Subject: RE: [PATCH] mtd-nand: davinci: correct 4-bit error correction
Date: Wed, 14 Jul 2010 16:55:34 +0530
Message-ID: <025e01cb2347$46817310$d3845930$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	nsnehaprabha@ti.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jul 13, 2010 at 23:11:26, Andrew Morton wrote:
> On Tue, 13 Jul 2010 15:02:59 +0530 "Sudhakar Rajashekhara" <sudhakar.raj@ti.com> wrote:
> 
> > Hi,
> > 
> > On Mon, Jul 12, 2010 at 11:58:18, Sudhakar Rajashekhara wrote:
> > > On Sat, Jul 10, 2010 at 04:09:32, Andrew Morton wrote:
> > > > On Fri,  9 Jul 2010 10:59:49 +0530
> > > > Sudhakar Rajashekhara <sudhakar.raj@ti.com> wrote:
> > > > 
> > > > > +
> > > > > +	/*
> > > > > +	 * ECC_STATE field reads 0x3 (Error correction complete) immediately
> > > > > +	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> > > > > +	 * begin trying to poll for the state, you may fall right out of your
> > > > > +	 * loop without any of the correction calculations having taken place.
> > > > > +	 * The recommendation from the hardware team is to wait till ECC_STATE
> > > > > +	 * reads less than 4, which means ECC HW has entered correction state.
> > > > > +	 */
> > > > > +	do {
> > > > > +		ecc_state = (davinci_nand_readl(info,
> > > > > +				NANDFSR_OFFSET) >> 8) & 0x0f;
> > > > > +		cpu_relax();
> > > > > +	} while ((ecc_state < 4) && time_before(jiffies, timeo));
> > > > 
> > > > An up-to-100-milliseond busy wait is pretty bad.  For how long do you
> > > > expect this to spin in practice?
> > > 
> > > On the hardware, I have never seen this taking 100 msec to come out of
> > > the loop. I'll check with the hardware folks on the maximum time to wait
> > > for, before the ECC engine is ready.
> > 
> > I checked this with the hardware team but no one is sure about the exact
> > time one should wait before the ECC engine becomes ready. But everyone is
> > of the opinion that 100 loop cycles should be enough. To be on the safer
> > side, I'll be changing the timeout to 10 milliseconds in the next version
> > of this patch.
> 
> Going from 100ms down to 10ms sounds a bit risky.  It'd be better to
> retain the 100ms and to make the kernel spend most of that time
> sleeping, rather than busywaiting, IMO.
> 

I chose 100ms timeout randomly, but today I did some calculation using
do_gettimeofday() to find out the actual time spent inside the loop. I
found that, control is coming out of loop within 5 microseconds. So I'll
go ahead and use usecs_to_jiffies(100) as timeout. Busywaiting for such
a short duration may not be a problem.

Regards,
Sudhakar
