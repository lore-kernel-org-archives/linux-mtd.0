Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17biac-0003gn-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 15:12:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEEHJFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLEEHJFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 15:12:06 +0100
Message-ID: <25084.1028556726@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  I am on PPC and SysRq-T does not display anything useful :-( Perhaps
> readprofile?

SysRq-T should work on PPC. It's mostly generic code. What's wrong with it?

The profile _may_ help but it's most likely to tell us that the CPU spend
most time sleeping, without actually telling us _where_ each process was
sleeping.

>  Perhaps kupdate is holding some VFS specific block? I am on a MV
> 2.4.2 kernel 

I'd care more if you could reproduce it with something a little more 
recent. I'm assuming you're using v1.100 of cfi_cmdset_0001.c, since you 
committed that change.


--
dwmw2
