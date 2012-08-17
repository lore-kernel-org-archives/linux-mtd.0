Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2RF7-0002MI-K1
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 18:25:58 +0000
Date: Fri, 17 Aug 2012 20:25:53 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI problems on 2nd mount
Message-ID: <20120817182553.GE2232@pengutronix.de>
References: <20120816105445.GV2232@pengutronix.de>
 <20120817141216.GC2232@pengutronix.de>
 <1345213644.27859.94.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1345213644.27859.94.camel@sauron.fi.intel.com>
Cc: James Nute <newten82@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, Aug 17, 2012 at 05:27:24PM +0300, Artem Bityutskiy wrote:
> On Fri, 2012-08-17 at 16:12 +0200, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Thu, Aug 16, 2012 at 12:54:45PM +0200, Uwe Kleine-König wrote:
> > > I'm on v3.6-rc1 with a few patches, but all unrelated to ubi/ubifs.
> > > I'm experiencing a very similar problem to the one James Nute and Iwo
> > > Mergler reported which resulted in commit c6727932c (included in
> > > v3.6-rc1).
> > > 
> > > The first boot looks ok, but on the second boot it fails with 
> > > 
> > > 	[   14.843501] UBIFS error (pid 1): replay_log_leb: first CS node at LEB 3:0 has wrong commit number 0 expected 1
> > > 	[   14.853626] UBIFS error (pid 1): replay_log_leb: log error detected while replaying the log at LEB 3:0
> > > 
> > > It doesn't reproduce 100%, I only saw it after issuing $(poweroff) and
> > > then only if that resulted in the error
> > > 
> > > 	[  173.019073] UBI error: ubi_io_write: error -5 while writing 64 bytes to PEB 30:0, written 0 bytes
> > > 
> > > $(reboot) and just switching off + reenabling the power supply don't
> > > yield this problem.
> > > 
> > > The same happes if I don't use -F (space_fixup) for mkfs.ubifs.
> > > (Then the two ubifs_assert(!c->space_fixup); in ubifs_write_node are not
> > > hit which I think are a seperate problem.) The kernel panic after power
> > > off is a seperate problem that is triggered because poweroff doesn't
> > > stop the cpu.
> > While bisecting I noticed that doing poweroff after the machine is up
> > for some time the issue doesn't occur. Bisection yielded commit
> > 
> > commit d51f17ea0a3afe11fb4c4ad6635877e24df2758f
> > Author: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> > Date:   Sat Jul 14 20:52:58 2012 +0300
> 
> Thanks Uwe. I think this patch will fix the issue:
> 
> From e9d7e9731df27b4ef5190f919f9f96334439a36c Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Fri, 17 Aug 2012 17:21:14 +0300
> Subject: [PATCH] UBIFS: fix regression
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  fs/ubifs/replay.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
> index eba46d4..57ca44d 100644
> --- a/fs/ubifs/replay.c
> +++ b/fs/ubifs/replay.c
> @@ -1026,7 +1026,6 @@ int ubifs_replay_journal(struct ubifs_info *c)
>  	c->replaying = 1;
>  	lnum = c->ltail_lnum = c->lhead_lnum;
>  
> -	lnum = UBIFS_LOG_LNUM;
>  	do {
>  		err = replay_log_leb(c, lnum, 0, c->sbuf);
>  		if (err == 1)
This patch makes my problem go away. So if at the end of this mail you
are still convinced the patch is correct you can add my:

Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Tested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I wonder if the patch is correct though. Before d51f17ea0a3
replay_log_leb was called c->log_lebs times. After d51f17ea0a3 
the order of lebs replay_log_leb was called for was different and there
were c->log_last - UBIFS_LOG_LNUM + 1 calls. This number might just be
the value stored in c->log_lebs. With your suggested fix
the order is restored to pre-d51f17ea0a3, but the count of calls to
replay_log_leb is c->log_last - c->lhead_lnum + 1 which looks too small.
Don't you need to call replay_log_leb for the lebs between
UBIFS_LOG_LNUM (inclusive) and c->lhead_lnum (exclusive) to restore the
intended behaviour?

Note this is the first time that I looked at ubifs' code and I don't
have a clue about how it works. I just looked at the patch (and the
definition of ubifs_next_log_lnum) so my concerns might be void.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
