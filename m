Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KJ39-0006Rs-LC
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 15:34:08 +0100
Date: Mon, 26 May 2003 16:33:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030526143324.GB18612@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
	<20030526094050.GA30361@wohnheim.fh-wedel.de>
	<1053942836.17182.83.camel@imladris.demon.co.uk>
	<20030526101918.GA11734@wohnheim.fh-wedel.de>
	<20030526123500.GA12485@wohnheim.fh-wedel.de>
	<1053956308.17182.88.camel@imladris.demon.co.uk>
	<20030526134852.GA18612@wohnheim.fh-wedel.de>
	<1053957469.17182.90.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1053957469.17182.90.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 May 2003 14:57:49 +0100, David Woodhouse wrote:
> On Mon, 2003-05-26 at 14:48, Jörn Engel wrote:
> > On Mon, 26 May 2003 14:38:28 +0100, David Woodhouse wrote:
> > > 
> > > Assuming you add a preempt_disable()... in one of the pieces of code
> > > which was one of the main culprits for non-voluntary scheduling anyway.
> > 
> > Good point!
> > 
> > preempt_disable();
> > down();
> 
>  // which causes BUG() due to scheduling with preemption disabled.

Correct.  And
down();
preemp_disable();

is a race we don't always win.

> > //long processing time
> > up();
> > preempt_enable();
> > 
> > That way, preemption will be turned of on all CPUs for a long time,
> 
> Is that true? I thought not.

How about the following:

static int workspace_pid[some];
static void *workspace[some];
DECLARE_MUTEX(workspace_sem);

zlib_deflateInit2_() {
	...
again:
	down(&workspace_sem);
	for (i=0; i<some; i++) {
		if (workspace_pid[i])
			continue;
		workspace_pid[i] = current_pid;
	}
	if (i == some) { /* no workspaces left */
		up(&workspace_sem)
		schedule();
		goto again;
	}
	...
}

zlib_deflate() {
	...
	for (i=0; i<some; i++) {
		if (likely(workspace_pid[i] == current_pid))
			break;
	}
	mem = (deflate_workspace *) workspace[i]
	...
}

zlib_deflateEnd() {
	...
	for (i=0; i<some; i++) {
		if (likely(workspace_pid[i] != current_pid))
			break;
	}
	workspace_pid[i] = 0;
	...
}

"some" can be any number up to (and possible even beyond) the number
of CPUs in the system.  I take wishes, but my default would be
smp_num_cpus.

This way, the workspace is not owned by the CPU, but by the process
and will be migrated across CPUs on schedule(), preempt, etc.  Much
nicer than the original idea.  The search for the right workspace is
cheap on low loads (zero or one workspace used) and may cost one
pileline stall on higher loads.  For uniprocessor (embedded), gcc
should optimize the SMP complexity out completely.  At least, I don't
see why it shouldn't.

Comments?

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
