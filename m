Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15k0W6-0004c8-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2001 10:53:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010920123922.A8940@kosh.hut.fi> 
References: <20010920123922.A8940@kosh.hut.fi> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: Preparation for sync with Linus. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 Sep 2001 10:58:42 +0100
Message-ID: <5023.1000979922@redhat.com>
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

jlavi@iki.fi said:
>  if the chip has sectors locked after cold boot, currently I have to
> either  run unlock command or add a call to unlock function into the
> map driver.

> Should chip driver unlock sectors if chip is detected and the sectors
> are  suspected to be locked? 

There are two possible types of mishap which the locking can protect us 
from:

1. Kernel bugs where misdirected memory accesses could write to or erase
	parts of the flash.
2. User error leading to the erasure of important flash partitions, like
	mounting the boot loader partition as JFFS2.

If we care primarily about #1, we should keep the sectors locked at all 
times and unlock them only when we want to access them. 

If we care primarily about #2, then we should unlock sectors _only_ when 
explicitly requested to do so by the user.

I think that the facility to switch Vpp off while the chip is idle, coupled
with the complexity of the sequence of writes necessary to actually write to
a flash chip, makes it unlikely that #1 is a serious concern - so we
currently unlock sectors only when explicitly requested to do so by the
user.

--
dwmw2
