Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jc00o-00017m-Ci
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 15:15:36 +0000
Date: Wed, 19 Mar 2008 15:15:28 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Duke <ezbonites@gmail.com>
Subject: Re: JFFS2 filesystem integrity issue
Message-ID: <20080319151528.GA22758@shareable.org>
References: <79ac09b60803182045i376f78deh289c6ee5d49d06ec@mail.gmail.com>
	<20080319040244.GA11832@shareable.org>
	<79ac09b60803190635h6935e15aiebad0b2a45dc0ce4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ac09b60803190635h6935e15aiebad0b2a45dc0ce4@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Duke wrote:
> >  > For some reason it either seem to read the file incorrectly or the
> >  > file is corrupt some how. When this happens I don't loose the
> >  > calibration altogether but it is intermittent and sporadic at times.
> >  > Has anyone seen something similar? Does the cause seem realistic?
> >  > Has anyone had a possible corruption like this?
> >
> >  I have seen similar, and it was due to borderline timing or signal
> >  integrity issues, possibly affected by what else the CPU was doing at
> >  the time.
> 
> Didn't adjusting the timing of the banks help you any?

I'm not sure what you mean by this.  The only adjustment that can be
made in software on our device, as far as I know, is to reduce the
clock frequency.

> >  It was fixed in our case by improving the PCB design.
> 
> I'm doing a rev of the board but as far as improving the design, I
> have no reason to adjust my memory design.
> Perhaps you have something I can look for?

I don't know what fixed our design.  A new hardware rev arrived, and
the problem no longer occurred.  But my instincts suggest two
possibilities:

    - Supply voltage too low, or insufficient stabilisation near the chips.
    - Excessive propagation delay between the CPU and flash, failing
      to meet timing specs.

Both of these I've observed on our boards, and both of them cause
spurious bit errors when reading flash (or RAM for that matter).  I
noticed that these bit errors, in both cases, are dependent on what
other activity the board is doing at a similar time - e.g. reading
from disk, booting, CPU busy or idle, even specific code sequences, etc.

Spurious bit errors results in JFFS2 temporary file corruption on
reads, similar to what you have.  Unfortunately, JFFS2 doesn't report
this as an error.  Because of the way it works, it can only silently
change the file contents.

If you can reproduce these occasional errors by soak testing, try
lowering the clock frequency.  If the errors go away, you know it's
probably a marginal hardware problem.

-- Jamie
