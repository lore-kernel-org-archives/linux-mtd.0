Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AHOq-0003Pf-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 21:10:20 +0000
Date: Sat, 1 Dec 2001 21:19:45 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Rothwell <rothwell@holly-springs.nc.us>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2, 2.4.16, CVS-mtd -- mount, free memory, then hang
In-Reply-To: <1007240688.4762.4.camel@gromit>
Message-ID: <Pine.LNX.4.33.0112012116520.24298-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 1 Dec 2001, Michael Rothwell wrote:

> alt-sysrq-t shows that init is the current task.
> 
> call trace shows:
> init

Hmmm. What's its PC? Also what's the PC of these three:

> kupdated
> blkmtdd
> mtdblockd

Backtrace would be good too - I think 2.4.16 should be giving you that.

> khubd appears to be the child of init, which seems strange.

That's normal. All kernel threads are supposed to reparent themselves to 
init.

-- 
dwmw2
