Received: from idiom.com ([216.240.32.1] ident=espin)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168vGL-0005b7-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 03:19:53 +0000
Date: Tue, 27 Nov 2001 19:30:15 -0800
From: Geoffrey Espin <espin@idiom.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 4 x AMD29LV800B CFI?
Message-ID: <20011127193015.A35212@idiom.com>
References: <20011123130136.A94932@idiom.com> <E1669aI-0001iv-00@pentafluge.infradead.org> <20011123130136.A94932@idiom.com> <16214.1006859128@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16214.1006859128@redhat.com>; from David Woodhouse on Tue, Nov 27, 2001 at 11:05:28AM +0000
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

> >  Perhaps my h/w setup is insisting that all 4 parts are programmed at
> > once?  I see ifdef SOMEONE_ACTUALLY... for width 4 type 32 interleave
> > 4; maybe this means generate the right pattern? 
> That's around the code for 32-bit flash chips. You don't have 32-bit chips, 
> you have 16-bit chips, in 8-bit mode.
> I've used the 29LV160, and it's definitely CFI-compliant. Strangely, the 
> 29LV800 isn't. But the jedec_probe code doesn't yet recognise it. Try 
> this...
> Index: drivers/mtd/chips/jedec_probe.c
> ...

Thanks, David, ever so much for the patch.  I'd played with Jedec too.
I actually got amd_flash.c to seemingly work on its own -- just
tested with "mtd_debug read/write ..."  My hacked amd_flash.c prints:

    Physically mapped flash: Found 1 x 4MiB AMD AM29LV800BT (*4) at 0x0
                                                            ^^^^
Yeah!

I'd prefer to use your version, will give it a try...

Geoff
-- 
Geoffrey Espin
espin@idiom.com 
