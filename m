Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFC16DD021.1CA8E33E-ONC1257728.002FE329-C1257728.0035CD60@transmode.se>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
	<OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
	<1274207844.6930.7754.camel@macbook.infradead.org>
	<1274209152.6930.7802.camel@macbook.infradead.org>
	<OFD51FB25D.7FE00DFB-ONC1257727.007C6420-C1257727.007CE876@transmode.se>
	<1274226122.6930.8416.camel@macbook.infradead.org>
	<OFC16DD021.1CA8E33E-ONC1257728.002FE329-C1257728.0035CD60@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 19 May 2010 11:05:31 +0100
Message-ID: <1274263531.6930.9695.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-19 at 11:47 +0200, Joakim Tjernlund wrote:
> 
> This looks like a typo and I had to change that to:
> BUG_ON(spin_is_locked(&c->erase_completion_lock)); 

Hm, no -- we want it to BUG() if the spinlock is _NOT_ locked.

You're building on UP, without preemption or spinlock debugging. In that
case, spinlocks are a no-op. So spin_trylock() _always_ succeeds, and
spin_is_locked() always returns 0.

It should be lockdep_assert_held(), I think.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
