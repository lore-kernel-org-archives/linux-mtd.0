Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161o8C-0003G4-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 12:18:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01071015225100.01159@ronin> 
References: <01071015225100.01159@ronin> 
To: Anton Todorov <a.todorov@emness.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD on MBX860 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Nov 2001 12:27:13 +0000
Message-ID: <8307.1005222433@redhat.com>
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

a.todorov@emness.com said:
>  I am using linuxppc_2_4 (2.4.6) with current mtd support from cvs
> tree. The board is with JEDEC AMD 29F016 x4 flash chips (8M Flash
> space). Map file which I use for this board is attached (I use
> rpxlite.c and  tqm8xxl.c (for partitioning) as reference). The problem
> I found is that mtd says:

Thanks. May I add that map driver to CVS?

You should hopefully now find that the new jedec_probe stuff will work for 
your chips, and you don't have to use the old jedec code. 

--
dwmw2
