Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uHvz-0002ed-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 18:58:07 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uHtn-00015x-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 18:55:51 +0100
Message-ID: <3AEDA75F.69F71554@mvista.com>
Date: Mon, 30 Apr 2001 10:56:47 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, ds@schleef.org, jonas.holmberg@axis.com,
   cwryu@debian.org, eauth@softsys.co.at, nico@cam.org, ahennessy@mvista.com
Subject: Re: Flash driver probe/commandset separation.
References: <26353.988569497@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:

> We seem to have an unnecessary amount of duplication of flash chip driver
> code. We have three drivers for AMD/Fujitsu compatible chips -
> cfi_cmdset_0002.c, amd_flash.c and jedec.c. We have two drivers for Intel/
> Sharp compatible chips - cfi_cmdset_0001.c and sharp.c.
>
> Erwin noticed this and wrote code to fall back to an AMD-compatible probe
> for JEDEC ID if the CFI probe failed, and then use cfi_cmdset_0002.c if
> appropriate. I think that was the right approach, but I don't like merging
> the probes together like that. I think the mfr-specific probes for JEDEC ID
> should be kept separate. The map driver can always call them in order if
> the CFI probe fails, if it wants to.
>
> What I'd like to do is provide core drivers for each of the different
> command sets, and separate probe functions which set up the necessary
> parameters and invoke the core drivers.
>
> The current cfi_cmdset_000x drivers are the most generic, so I'd like to use
> those as the basis of the core drivers, and ensure that they can fully
> replace the functionality of the other individual drivers.
>
> We end up with:
>         cmdset_intel (and sharp, etc.)
>         cmdset_amd (and fujitsu, macronix, etc.)
>         cfi_probe
>         intel_jedec_probe
>         amd_jedec_probe
>
> Comments?

Definitely the way to go.  The probe and the cmdset code should be totally
independent;
the structures in cfi.h are already set up as the interface.
If the cfi probe fails then fall back to the  JEDEC ID and provide the
the cfi info for the chips that don't support it.   While we're at it,
perhaps we can add dynamic discovery of endianness, buswidth
and command set.

Alice

>
>
> Even assuming people agree (or disagree unconvincingly :), I'm not sure
> whether I should hold off on this until after I've sync'd up with Linus, or
> whether I should get this all done first and worry about feeding the new
> code to Linus later on. Probably the latter.
>
> --
> dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
