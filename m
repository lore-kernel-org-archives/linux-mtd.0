Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M1SF-0002FG-Nq
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 09:11:07 +0100
Date: Sat, 31 May 2003 10:11:29 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "David S. Miller" <davem@redhat.com>
Message-ID: <20030531081129.GA26179@wohnheim.fh-wedel.de>
References: <20030531064851.GA20822@wohnheim.fh-wedel.de>
	<20030530.235505.23020750.davem@redhat.com>
	<20030531075615.GA25089@wohnheim.fh-wedel.de>
	<20030531.005909.68051039.davem@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030531.005909.68051039.davem@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: kernel@kolivas.org
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
cc: jmorris@intercode.com.au
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 31 May 2003 00:59:09 -0700, David S. Miller wrote:
> 
> You can't leave the per-cpu workspace in an indeterminate
> state, you'll context switch and meanwhile that workspace will
> be used by another client or you'll next get scheduled on
> a different cpu and use a different workspace.

Did you read the patch?

When getting scheduled, the workspace remains associated with the
owning process ( z->workspace, z->ws_num ).  Other processes trying to
grab a workspace will get put on a waitqueue ( zlib_workspace_sem ).

The workspace is not exactly per cpu, it is per process.  Just the
amount of workspaces happens to be equal to the amount of cpus in the
system, but a couple more or less should work just as well.  

In softirq context you would be right.  Preempt is disabled anyway and
cpu affinity comes for free.

Jörn

-- 
A defeated army first battles and then seeks victory.
-- Sun Tzu
