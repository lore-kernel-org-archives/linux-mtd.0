Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M1DR-00020y-W5
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 08:55:50 +0100
Date: Sat, 31 May 2003 09:56:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "David S. Miller" <davem@redhat.com>
Message-ID: <20030531075615.GA25089@wohnheim.fh-wedel.de>
References: <20030530174319.GA16687@wohnheim.fh-wedel.de>
	<20030530.171410.104043496.davem@redhat.com>
	<20030531064851.GA20822@wohnheim.fh-wedel.de>
	<20030530.235505.23020750.davem@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030530.235505.23020750.davem@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Con Kolivas <kernel@kolivas.org>
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

CC List pruned a little.

On Fri, 30 May 2003 23:55:05 -0700, David S. Miller wrote:
>    From: Jörn Engel <joern@wohnheim.fh-wedel.de>
>    
>    How about preemption?  zlib operations take their time, so at least on
>    up, it makes sense to preempt them, when not in softirq context.  Can
>    this still be done lockless?
> 
> You'll need to disable preemption.

My gut feeling claims that this would hurt interactivity.  Con, would
contest on a jffs2 (zlib compressed) filesystem be able to show
interactivity problems wrt zlib?

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
