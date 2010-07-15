Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OZMte-0002sy-9u
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2010 11:46:35 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Jon Povey'" <Jon.Povey@racelogic.co.uk>, <linux-mtd@lists.infradead.org>
References: <1279170641-24494-1-git-send-email-sudhakar.raj@ti.com>
	<70E876B0EA86DD4BAF101844BC814DFE0903CBD539@Cloud.RL.local>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903CBD539@Cloud.RL.local>
Subject: RE: [PATCH v2] mtd-nand: davinci: correct 4-bit error correction
Date: Thu, 15 Jul 2010 17:11:32 +0530
Message-ID: <034101cb2412$ac5bcde0$051369a0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: akpm@linux-foundation.org, dwmw2@infradead.org,
	davinci-linux-open-source@linux.davincidsp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Jul 15, 2010 at 16:31:19, Jon Povey wrote:
> Sudhakar Rajashekhara wrote:
> > On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
> > 4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
> > before waiting for the NAND Flash status register to be equal to 1, 2
> > or 3, we have to wait till the ECC HW goes to correction state.
> > Without this wait, ECC correction calculations will not be proper.
> >
> > This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and
> > DM365 EVMs.
> >
> > Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> > Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
> Have these people acked and signed off this new version of the patch?
> 

No. Andrew Morton has not signed off this version. I'll remove
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

> > Since v1:
> > a. Timeout has been changed from 100 msec to 100 usec.
> > b. Comment above the do, while loop was not matching the code.
> >    This has been corrected.
> > c. Initialization of 'timeo' variable has been moved down.
> > d. It was observed that, while calculating the time in the loop,
> >    if there is a context switch between setting the
> >    4BITECC_ADD_CALC_START bit and reading of ECC_STATE field, then
> >    the loop will not come out until the timeout happens. To prevent
> >    the context switch, spin_lock_irqsave and spin_unlock_irqrestore
> > are used.
> 
> d. means interrupts are disabled for up to 100us while waiting for ECC.
> Doesn't sound good if it can be avoided.
> 

I wanted to avoid context switching between setting 4BITECC_ADD_CALC_START
bit:

	davinci_nand_writel(info, NANDFCR_OFFSET,
 			davinci_nand_readl(info, NANDFCR_OFFSET) | BIT(13));

And reading of ECC_STATE field inside the loop:

+		ecc_state = (davinci_nand_readl(info,
+				NANDFSR_OFFSET) >> 8) & 0x0f;

Because even if there was a slight delay after setting 4BITECC_ADD_CALC_START,
ECC_STATE would read < 4(meaning ECC engine has completed Error correction)
and I would wait in the loop for up to 100us.

> How about instead of spinlock, set timeo first time inside the loop?

I don't think this would also solve the problem which I stated above.

Adding spinlock was a blunder as that would cause jiffies not to increment.
I'll be removing the spinlocks and will be resubmitting the patch.

Regards,
Sudhakar
