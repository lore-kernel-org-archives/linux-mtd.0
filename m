Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KhtgS-0006N5-9U
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 22:15:09 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KhtgM-00057O-Dc
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 22:15:02 +0000
Received: from lns-bzn-50f-62-147-234-34.adsl.proxad.net ([62.147.234.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2008 22:15:02 +0000
Received: from moore by lns-bzn-50f-62-147-234-34.adsl.proxad.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2008 22:15:02 +0000
To: linux-mtd@lists.infradead.org
From: Christopher Moore <moore@free.fr>
Subject: Re: uniform flash using =?utf-8?b?Y21kc2V0XzAwMDI=?=
Date: Mon, 22 Sep 2008 22:08:11 +0000 (UTC)
Message-ID: <loom.20080922T213423-993@post.gmane.org>
References: <20080709071615.GA15212@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uwe Kleine-König <Uwe.Kleine-Koenig <at> digi.com> writes:

[snip]
> 	physmap-flash.0: CFI does not contain boot bank location. Assuming top.
> 
> The last message comes from the following code in
> cfi_cmdset_0002() (drivers/mtd/chips/cfi_cmdset_0002.c):
> 
> 	bootloc = extp->TopBottom;
> 	if ((bootloc != 2) && (bootloc != 3)) {
> 		printk(KERN_WARNING "%s: CFI does not contain boot "
> 		       "bank location. Assuming top.\n", map->name);
> 		bootloc = 2;
> 	}
> 
> For that chip extp->TopBottom is 5.
> 
> I wonder what is intended here.  The only other usage of bootloc (which
> is a local variable for cfi_cmdset_0002()) is
> 
> 	if (bootloc == 3 && something_else) {
> 		...
> 
> So if ((bootloc != 2) && (bootloc != 3)) setting bootloc = 2 doesn't
> change anything!?
> 
> If I didn't oversee something I suggest to delete the if containing the
> warning.
> 

Full ACK.

Nice catch, Uwe.

The worst thing is that it says "Assuming top" but sets bootloc to
bottom (2) :(

I figure that:
- this code was intended for early chips with an AMD/Fujitsu V1.0 CFI PRI
which does not contain TopBottom (such AMD chips are now handled in
fixup_amd_bootblock()),
- an earlier version of this code must have set bootloc to top (3) which
would have had some effect.

However the effect would possibly be undesirable in cases such as yours :(

I see you sent a patch to linux-mtd but it seems to have been completely
ignored :(

Do you know where I can find your patch in a form where I can reply to it?
If so I shall add my ACK (FWIW) and ping it.

Cheers,
Chris
