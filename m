Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rq8uT-0005KW-Rc
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2012 19:53:34 +0000
Message-ID: <4F205DBA.2090103@flatfrog.com>
Date: Wed, 25 Jan 2012 20:53:30 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com>
In-Reply-To: <4F1F004C.6040501@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/24/2012 08:02 PM, Orjan Friberg wrote:
> I'll be trying out various kernel versions next.

I've boiled it down to whether CONFIG_PREEMPT (bug happens) or 
CONFIG_PREEMPT_VOLUNTARY (bug doesn't happen) is selected.  Of course, 
changing that affects a other things like inline spinlocking.

By changing this option, I've made the bug go away in a 2.6.32 and 
2.6.37 setup where it previously happened, and I've made it appear in a 
2.6.39 setup where it previously didn't happen.


I'll be posting this on linux-omap mailing list too.  I don't have any 
other architecture to try this on, and I'm aware that the problem may 
lie in arch-dependent code (spinlock implementation?).

-- 
Orjan Friberg
FlatFrog Laboratories AB
