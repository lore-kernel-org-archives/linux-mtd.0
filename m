Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16knTt-0006rd-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 14:42:25 +0000
Date: Tue, 12 Mar 2002 15:53:52 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org, Robert Schwebel <robert@schwebel.de>
Subject: Re: [patch] dilnetpc.c broken?
Message-ID: <20020312155351.A10431@wohnheim.fh-wedel.de>
References: <20020311202323.A11507@wohnheim.fh-wedel.de> <200203121322.g2CDMLw14608@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200203121322.g2CDMLw14608@dagobert.svc.sysgo.de>; from rob@sysgo.de on Tue, Mar 12, 2002 at 02:22:56PM +0100
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

On Tue, 12 March 2002 14:22:56 +0100, Robert Kaiser wrote:
> > The DIL/Net PC mapping driver appears to be broken. At least, it
> > didn't compile properly on my machine. After a quick look at the code,
> > the following appears to be the correct fix for the problem.
> 
> It had a stray #endif that I have just removed in CVS. Other than that it 
> compiles fine for me. What exactly went wrong when you tried to compile it ?

MTDPART_OFS_NXTBLK was unknown. A quick grep over
/usr/src/linux/include didn't show it #defined anywhere. I replaced it
with MTDPART_OFS_APPEND, which appeared to be the intended offset.

Jörn

-- 
Often, the most striking and innovative solutions come from realizing
that your concept of the problem was wrong.
-- Eric Raymond in "The cathedral and the bazaar"
