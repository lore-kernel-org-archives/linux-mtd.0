Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OZNEv-0000Ar-CC
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2010 12:08:34 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Jon Povey'" <Jon.Povey@racelogic.co.uk>, <linux-mtd@lists.infradead.org>
References: <1279170641-24494-1-git-send-email-sudhakar.raj@ti.com>	<70E876B0EA86DD4BAF101844BC814DFE0903CBD539@Cloud.RL.local>
	<034101cb2412$ac5bcde0$051369a0$@raj@ti.com>
In-Reply-To: <034101cb2412$ac5bcde0$051369a0$@raj@ti.com>
Subject: RE: [PATCH v2] mtd-nand: davinci: correct 4-bit error correction
Date: Thu, 15 Jul 2010 17:33:03 +0530
Message-ID: <034501cb2415$ad54cc80$07fe6580$@raj@ti.com>
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

On Thu, Jul 15, 2010 at 17:11:32, Sudhakar Rajashekhara wrote:
> Hi,
> 
> On Thu, Jul 15, 2010 at 16:31:19, Jon Povey wrote:
> > Sudhakar Rajashekhara wrote:
> > > On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
> > > 4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
> > > before waiting for the NAND Flash status register to be equal to 1, 2
> > > or 3, we have to wait till the ECC HW goes to correction state.
> > > Without this wait, ECC correction calculations will not be proper.
> > >
> > > This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and
> > > DM365 EVMs.
> > >
> > > Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> > > Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> > > Cc: David Woodhouse <dwmw2@infradead.org>
> > > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> > Have these people acked and signed off this new version of the patch?
> > 
> 
> No. Andrew Morton has not signed off this version. I'll remove
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 

Andrew Morton had signed off an earlier version of this patch and
it was present in -mm tree for a long time. He has not yet commented
on v2 version of this patch. But I thought I can carry forward the
Sign-offs from previous version to the next version. What's the common
practice?

Thanks,
Sudhakar
