Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eIz7-0006EB-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 16:55:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202221726010.8843-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202221726010.8843-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re-entrancy of flash erase/write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Feb 2002 17:06:52 +0000
Message-ID: <23802.1014397612@redhat.com>
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

rob@sysgo.de said:
>  Am I right in assuming that it is not possible to erase and/or write
> different blocks of the same flash chip concurrently ?

No - on some chips you can. Not most though.

> If so, where is the lock in the MTD code that would prevent concurrent
> execution of erase/write on the same chip by multiple processes ? 

In the chip drivers themselves. Grep for TASK_UNINTERRUPTIBLE in 
cfi_cmdset_0001.c, for example.


--
dwmw2
