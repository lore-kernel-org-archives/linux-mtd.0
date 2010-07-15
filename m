Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OZMCa-0001z2-HZ
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2010 11:02:06 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Thu, 15 Jul 2010 12:01:19 +0100
Subject: RE: [PATCH v2] mtd-nand: davinci: correct 4-bit error correction
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903CBD539@Cloud.RL.local>
In-Reply-To: <1279170641-24494-1-git-send-email-sudhakar.raj@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sudhakar Rajashekhara wrote:
> On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
> 4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
> before waiting for the NAND Flash status register to be equal to 1, 2
> or 3, we have to wait till the ECC HW goes to correction state.
> Without this wait, ECC correction calculations will not be proper.
>
> This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and
> DM365 EVMs.
>
> Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Have these people acked and signed off this new version of the patch?

> Since v1:
> a. Timeout has been changed from 100 msec to 100 usec.
> b. Comment above the do, while loop was not matching the code.
>    This has been corrected.
> c. Initialization of 'timeo' variable has been moved down.
> d. It was observed that, while calculating the time in the loop,
>    if there is a context switch between setting the
>    4BITECC_ADD_CALC_START bit and reading of ECC_STATE field, then
>    the loop will not come out until the timeout happens. To prevent
>    the context switch, spin_lock_irqsave and spin_unlock_irqrestore
> are used.

d. means interrupts are disabled for up to 100us while waiting for ECC.
Doesn't sound good if it can be avoided.

How about instead of spinlock, set timeo first time inside the loop?

>From this:

+       timeo =3D jiffies + usecs_to_jiffies(100);
+       do {
+               ecc_state =3D (davinci_nand_readl(info,
+                               NANDFSR_OFFSET) >> 8) & 0x0f;
+               cpu_relax();
+       } while ((ecc_state < 4) && time_before(jiffies, timeo));
+       spin_unlock_irqrestore(&ecc_spin_lock, flags);

To something like:

+       timeo =3D 0;
+       do {
+               ecc_state =3D (davinci_nand_readl(info,
+                               NANDFSR_OFFSET) >> 8) & 0x0f;
+               if (!timeo)
+                       timeo =3D jiffies + usecs_to_jiffies(100);
+               cpu_relax();
+       } while ((ecc_state < 4) && time_before(jiffies, timeo));

Sorry if my mailer has messed up the formatting. Hopefuly readable.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
