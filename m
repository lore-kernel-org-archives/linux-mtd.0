Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eJyq-0001wi-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 19:04:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3E395E76.5030401@imc-berlin.de> 
References: <3E395E76.5030401@imc-berlin.de> 
To: Steven Scholz <steven.scholz@imc-berlin.de>
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Data CRC failed on node at ... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Jan 2003 19:34:53 +0000
Message-ID: <14124.1043955293@passion.cambridge.redhat.com>
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

steven.scholz@imc-berlin.de said:
>  What can I do now?

Ignore it.

> Is there something like a repair tool? 

Not at the moment, no.

> Or can I at least find out which file is corrupted? 

Nothing's corrupted. It's probably because the machine was powered off or 
rebooted while it was busy garbage-collecting. As it writes out new 
replacement nodes before the old ones are marked obsolete, if you interrupt 
it, it means that the original node will have remained intact on the flash 
-- only the new node which was _going_ to replace it is broken, and that's 
part of what the CRC check is there for.

It'll go away in time when the block in which the offending node resides is 
garbage collected. 



--
dwmw2
