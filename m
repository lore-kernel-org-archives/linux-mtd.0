Received: from shyguy.smb.utfors.se ([195.58.112.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cheB-0004Cz-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 08:23:51 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Dave Ellis" <DGE@sixnetio.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods 
Date: Thu, 8 Aug 2002 09:23:49 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLIEJFFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <31147.1028713904@redhat.com>
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

> 
> joakim.tjernlund@lumentis.se said:
> >  Can the JFFS2 layer also use spin_lock() instead of spin_lock_bh()?
> > Shold we try not to disable bottom-halves or does it not matter?
> 
> Well, the MTD API documentation (in my head) says that the erase completion 
> callback may be called in bottom-half context (i.e. from a timer), which is 
> why JFFS2 uses spin_lock_bh().

I noticed that erase_callback() in erase.c useses spin_lock(), not spin_lock_bh().
Should it?
 
> 
> I suppose we could change that.

I dont understand what using a timer would give us. I suppose that one could have
more the one erase simontainously(one per bank) but that won't give a significant
improvement and erase.c must be made "bank aware" as well. 

Unless there is some other advantage, I think you should change the spec.

 Jocke

> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
