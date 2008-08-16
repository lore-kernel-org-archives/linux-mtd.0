Subject: Re: SV: Jffs2 crach in 2.6.25.6.atmel.1
From: David Woodhouse <dwmw2@infradead.org>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
Content-Type: text/plain
Date: Sat, 16 Aug 2008 10:11:16 +0100
Message-Id: <1218877876.3184.185.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-15 at 18:10 +0200, Eirik Aanonsen wrote:
> 
> JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->nr_blocks =
> 0x0x000031
> JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[0] =
> 0x0xffffffff
> JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[1] =
> 0x0xffffffff
> JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[2] =
> 0x0xffffffff
> JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[3] =
> 0x0xffffffff
> JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[4] =
> 0x0xffffffff

That just shouldn't happen. It doesn't matter that u-boot has the first
blocks reserved -- those aren't counted in this, which is about the
_logical_ partition. JFFS2 doesn't know that they exist at all.

Can you put a hardware watchpoint on c->blocks[0] and see when it's
getting scribbled on? Or failing that, set up a software check on every
interrupt, to BUG() if it's set to 0xffffffff.

(Assuming you only have one JFFS2 fs, you can hack jffs2 to store 'c' in
a global variable, then put a hack into the core interrupt handler code
to do something like:
	if (jffs2_c && jffs2_c->blocks &&
	    jffs2_c->blocks[0] == 0xffffffff)
		breakpoint();  // or BUG();

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
