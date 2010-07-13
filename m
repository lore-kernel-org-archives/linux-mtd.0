Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYbw2-0000Pv-Io
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 09:37:55 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Sudhakar Rajashekhara'" <sudhakar.raj@ti.com>,
	"'Andrew Morton'" <akpm@linux-foundation.org>
References: <1278653389-12019-1-git-send-email-sudhakar.raj@ti.com>	<20100709153932.0a6cdbcd.akpm@linux-foundation.org>
	<00c701cb218b$6e4d6dd0$4ae84970$@raj@ti.com>
In-Reply-To: <00c701cb218b$6e4d6dd0$4ae84970$@raj@ti.com>
Subject: RE: [PATCH] mtd-nand: davinci: correct 4-bit error correction
Date: Tue, 13 Jul 2010 15:02:59 +0530
Message-ID: <012f01cb226e$61ac9b80$2505d280$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: nsnehaprabha@ti.com, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Jul 12, 2010 at 11:58:18, Sudhakar Rajashekhara wrote:
> On Sat, Jul 10, 2010 at 04:09:32, Andrew Morton wrote:
> > On Fri,  9 Jul 2010 10:59:49 +0530
> > Sudhakar Rajashekhara <sudhakar.raj@ti.com> wrote:
> > 
> > > +
> > > +	/*
> > > +	 * ECC_STATE field reads 0x3 (Error correction complete) immediately
> > > +	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> > > +	 * begin trying to poll for the state, you may fall right out of your
> > > +	 * loop without any of the correction calculations having taken place.
> > > +	 * The recommendation from the hardware team is to wait till ECC_STATE
> > > +	 * reads less than 4, which means ECC HW has entered correction state.
> > > +	 */
> > > +	do {
> > > +		ecc_state = (davinci_nand_readl(info,
> > > +				NANDFSR_OFFSET) >> 8) & 0x0f;
> > > +		cpu_relax();
> > > +	} while ((ecc_state < 4) && time_before(jiffies, timeo));
> > 
> > An up-to-100-milliseond busy wait is pretty bad.  For how long do you
> > expect this to spin in practice?
> 
> On the hardware, I have never seen this taking 100 msec to come out of
> the loop. I'll check with the hardware folks on the maximum time to wait
> for, before the ECC engine is ready.

I checked this with the hardware team but no one is sure about the exact
time one should wait before the ECC engine becomes ready. But everyone is
of the opinion that 100 loop cycles should be enough. To be on the safer
side, I'll be changing the timeout to 10 milliseconds in the next version
of this patch.

Thanks,
Sudhakar
