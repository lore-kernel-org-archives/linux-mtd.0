Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h7zE-00061G-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 13:19:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D623224.1090604@hp.com> 
References: <3D623224.1090604@hp.com>  <007201c247e0$1022fcd0$a15f040f@SNAGGLE> <32719.1029838865@redhat.com> 
To: Jamey Hicks <jamey.hicks@hp.com>
Cc: Christopher Hoover <ch@murgatroid.com>,
    "'Conn Clark'" <clark@esteem.com>,
    =?ISO-8859-1?Q?=27J=F6rn_Engel=27?= <joern@wohnheim.fh-wedel.de>,
    "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is writeable? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Aug 2002 13:19:14 +0100
Message-ID: <12777.1029845954@redhat.com>
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

jamey.hicks@hp.com said:
>  I would much rather that JFFS2 not unlock blocks automatically.  We
> tend  to lock blocks for a reason (e.g., so that we don't accidentally
> erase  the boot loader with incorrect mount options).  I think it
> would be  reasonable for JFFS2 to query whether flash is locked
> beforehand and to  mount read-only.  I think it would also be
> reasonable to provide a mount  option directing it to unlock flash.  

Yeah -- you're probably right. That's the reason I refused to do the 
automatic unlock when it was originally suggested. We are fairly good about 
aborting a mount attempt if it really doesn't look like a JFFS2 partition, 
but if you have the partitioning wrong so that the range we try to mount 
includes some JFFS2 _and_ something important, that's still going to break.


--
dwmw2
