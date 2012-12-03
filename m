Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfU3s-0003mM-Mr
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 11:19:45 +0000
Date: Mon, 3 Dec 2012 12:19:34 +0100
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Re: UBI wl_tree_add problems after PEB scrubbed
Message-ID: <20121203121934.5c365ca7@spider.haslach.nod.at>
In-Reply-To: <1354531729.30168.189.camel@sauron.fi.intel.com>
References: <50B8CB36.3010604@itwatchdogs.com>
 <1354531729.30168.189.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Zach Sadecki <zsadecki@itwatchdogs.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mon, 03 Dec 2012 12:48:49 +0200
schrieb Artem Bityutskiy <dedekind1@gmail.com>:

> On Fri, 2012-11-30 at 09:05 -0600, Zach Sadecki wrote:
> > Every time I see UBI scrub a PEB with fixable bit-flips (on my
> > custom Freescale i.MX28 board) the background thread has problems
> > shortly thereafter.  I'm not exactly sure where to start debugging
> > this and I'm hoping someone can help point me in the right
> > direction.  Below are kernel messages showing the problem from 2
> > different runs (in which both ended up with a hung CPU).  This is
> > using kernel 3.7-rc7.
> > 
> > Also worth noting is that I had to modify the gpmi-nand driver to 
> > actually report max_bitflips back to the MTD layer to even get to
> > this point (before that everything would just run along happily
> > until it hit an uncorrectable ECC error).  I will submit a patch
> > for this once everything seems OK...
> 
> Ack, reproducible on nandsim with 
> 
> sudo sh -c 'echo 1 > /sys/kernel/debug/ubi/ubi0/tst_emulate_bitflips'
> 
> I did not confirm this by bisecting, but it seems it is fastmap that
> broke it.
> 
> And looking at fastmap changes, I immediately see some thing
> completely bogus, not related to this:
> 
> 
> /**
>  * __wl_get_peb - get a physical eraseblock.
>  * @ubi: UBI device description object
>  *
>  * This function returns a physical eraseblock in case of success and
> a
>  * negative error code in case of failure. Might sleep.
>  */
> static int __wl_get_peb(struct ubi_device *ubi)
> 
> Might sleep? Well, yes, because it calls 
> 
> ubi_self_check_all_ff()
> 
> But then why is this:
> 
>        spin_lock(&ubi->wl_lock);
>        peb = __wl_get_peb(ubi);
>        spin_unlock(&ubi->wl_lock);
> 
> Bogus.
> 
> Richard, could you please re-test fastmap with all debugging enabled?
> I see at least one bug already.
> 
> Namely these ones: chk_gen  chk_io  tst_disable_bgt
> 
> Also, it seems UBI is completely broken ATM - it craps out immediately
> on the first bit-flip. Let me revert fastmap and check if it is
> fastmap.

Okay, I'll look at it this afternoon.

Thanks,
//richard
