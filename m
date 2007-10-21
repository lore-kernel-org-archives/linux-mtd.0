Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IjYnc-0004fT-3i
	for linux-mtd@lists.infradead.org; Sun, 21 Oct 2007 12:16:54 +0100
Date: Sun, 21 Oct 2007 13:12:18 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [BLOCK2MTD] WARNING: at kernel/lockdep.c:2331 lockdep_init_map()
Message-ID: <20071021111217.GC5052@lazybastard.org>
References: <200710191753.l9JHreeS012064@agora.fsl.cs.sunysb.edu>
	<1192818689.9471.14.camel@lappy>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1192818689.9471.14.camel@lappy>
Cc: dwmw2@infradead.org, Ingo Molnar <mingo@elte.hu>,
	Erez Zadok <ezk@cs.sunysb.edu>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 October 2007 20:31:29 +0200, Peter Zijlstra wrote:
> > 
> > BUG: key f88e1340 not in .data!
> > WARNING: at kernel/lockdep.c:2331 lockdep_init_map()
> >  [<c0102bc2>] show_trace_log_lvl+0x1a/0x2f
> >  [<c0103692>] show_trace+0x12/0x14
> >  [<c01037b2>] dump_stack+0x15/0x17
> >  [<c0125432>] lockdep_init_map+0x94/0x3e4
> >  [<c0125001>] debug_mutex_init+0x2c/0x3c
> >  [<c01210d4>] __mutex_init+0x38/0x40
> >  [<f88e01d3>] 0xf88e01d3
> >  [<c011dda7>] parse_args+0x123/0x200
> >  [<c012b725>] sys_init_module+0xdd0/0x122c
> >  [<c0102586>] sysenter_past_esp+0x5f/0x91
> >  =======================
> > block2mtd: mtd0: [d: /dev/loop0] erase_size = 128KiB [131072]
> > block2mtd: version $Revision: 1.30 $
> 
> Someone stuck a key object in non static storage. That breaks lockdep,
> don't do that :-)
> 
> Is the mutex_init() done from a function tagged with __init?

Root cause is an ordering problem in module loading.  Code flow is
roughly this:
sys_init_module
`-> load_module
:   `->	parse_args
:	`-> block2mtd_setup
:	    `-> __mutex_init
:		`-> lockdep_init_map
:		    `-> static_obj
:			`-> is_module_address
`-> __link_module

is_module_address() would return something sane, if __link_module() had
already been called.  In fact, if the parameter is passed through
/sys/modules/block2mtd/parameters/block2mtd _after_ module load time,
the exact same code works fine.  Only when passing the parameter as a
module parameter do we see this problem.

So what should be done?  We could move parse_args() below
__link_module(), but I'd guess such a change would break some other
modules what depend on certain parameters or at least should fail to
load with illegal parameters.  Do such modules exist?

Or we could add some kind of parse_args_late() that is called after
__link_module(), if requested by a module, and annotate block2mtd to
prefer that version.

[ Adding Ingo on Cc:.  Since block2mtd predates lockdep I found a bug in
  his code and not the other way around. ;) ]

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
