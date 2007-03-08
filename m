Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1173361473.4861.12.camel@zod.rchland.ibm.com>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
	<1173359044.3461.433.camel@pmac.infradead.org>
	<20070308131257.GD23216@lazybastard.org>
	<1173360167.3461.438.camel@pmac.infradead.org>
	<1173361473.4861.12.camel@zod.rchland.ibm.com>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 13:58:25 +0000
Message-Id: <1173362305.3461.447.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: R&D4 <r&d4@dave-tech.it>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 07:44 -0600, Josh Boyer wrote:
> Wait... why?  Rejecting mount -o sync seems sane, but why can't O_SYNC
> support be handled?  If users want to open their files like that and it
> causes JFFS2 to flush a bunch of padding out, well they asked for it. 

Users ask for shared writable mmap too. That isn't a good idea either.

Contemplate what Linus always says about using 'volatile' vs. proper
barriers. Now consider it for O_SYNC vs. fsync(). And factor in the fact
that O_SYNC is going to be massively suboptimal if it causes syncs when
they otherwise didn't need to happen.

-- 
dwmw2
