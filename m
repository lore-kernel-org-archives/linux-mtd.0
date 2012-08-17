Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2NHh-0000Dp-Bx
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 14:12:22 +0000
Date: Fri, 17 Aug 2012 16:12:16 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: UBI problems on 2nd mount
Message-ID: <20120817141216.GC2232@pengutronix.de>
References: <20120816105445.GV2232@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120816105445.GV2232@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, James Nute <newten82@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Aug 16, 2012 at 12:54:45PM +0200, Uwe Kleine-König wrote:
> I'm on v3.6-rc1 with a few patches, but all unrelated to ubi/ubifs.
> I'm experiencing a very similar problem to the one James Nute and Iwo
> Mergler reported which resulted in commit c6727932c (included in
> v3.6-rc1).
> 
> The first boot looks ok, but on the second boot it fails with 
> 
> 	[   14.843501] UBIFS error (pid 1): replay_log_leb: first CS node at LEB 3:0 has wrong commit number 0 expected 1
> 	[   14.853626] UBIFS error (pid 1): replay_log_leb: log error detected while replaying the log at LEB 3:0
> 
> It doesn't reproduce 100%, I only saw it after issuing $(poweroff) and
> then only if that resulted in the error
> 
> 	[  173.019073] UBI error: ubi_io_write: error -5 while writing 64 bytes to PEB 30:0, written 0 bytes
> 
> $(reboot) and just switching off + reenabling the power supply don't
> yield this problem.
> 
> The same happes if I don't use -F (space_fixup) for mkfs.ubifs.
> (Then the two ubifs_assert(!c->space_fixup); in ubifs_write_node are not
> hit which I think are a seperate problem.) The kernel panic after power
> off is a seperate problem that is triggered because poweroff doesn't
> stop the cpu.
While bisecting I noticed that doing poweroff after the machine is up
for some time the issue doesn't occur. Bisection yielded commit

commit d51f17ea0a3afe11fb4c4ad6635877e24df2758f
Author: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
Date:   Sat Jul 14 20:52:58 2012 +0300

    UBIFS: simplify reply code a bit
    
    In the log reply code we assume that 'c->lhead_offs' is known and may be
    non-zero, which is not the case because we do not store it in the master
    node and have to find out by scanning on every mount. Knowing this fact
    allows us to simplify the log scanning loop a bit and remove a couple
    of unneeded local variables.
    
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

 fs/ubifs/replay.c |   20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

AFAICT the replay function runs early after the filesystem was mounted,
so this seems to match.

I didn't try yet to debug that further or even test a revert of this
commit on top of v3.6-rc1. Will take a look later today.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
