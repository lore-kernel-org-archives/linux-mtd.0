Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fiiO-0000QM-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 15:40:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>, MTD for Linux <linux-mtd@lists.infradead.org>
In-Reply-To: <5.1.0.14.0.20030203081101.0257c980@64.170.22.132>
References: <5.1.0.14.0.20030202082532.02427e68@64.170.22.132>
	 <5.1.0.14.0.20030203081101.0257c980@64.170.22.132>
Message-Id: <1044286824.8053.20.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: 03 Feb 2003 15:40:24 +0000
Subject: Re: mtd partition1 corruption during writes to JFFS2 on partition2.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Mon, 2003-02-03 at 14:13, Vipin Malik wrote:
> I'll take a look. Anyone care to tell me where the locking to prevent 
> multiple processes from accessing the flash at the same time takes place? 
> (is this a chip driver feature or an mtd feature? There are some spin locks 
> in the cfo_cmdset0002.c driver but AFAIK spin locks are really NOPS on 1P 
> machines.

Look at how it handles chip->state and sleeps on chip->wq if the chip is
currently busy. The spin_lock is only required for SMP (or preempt) --
for uniprocessor the handling of chip->state is perfectly sufficient.


-- 
dwmw2
