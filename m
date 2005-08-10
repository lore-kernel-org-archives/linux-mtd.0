Message-ID: <20050810035630.65991.qmail@web8507.mail.in.yahoo.com>
Date: Wed, 10 Aug 2005 04:56:30 +0100 (BST)
From: Soma sundaram Veerappan <soma_edu@yahoo.co.in>
To: Todd Poynor <tpoynor@mvista.com>, x0nishan@ti.com
In-Reply-To: <42E51974.4050401@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Linux-Mtd@lists.infradead.org
Subject: RE: Patch for flash unlock
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

> If your flash is CFI compliant, the code is already
> in place. Depends on
> the kind of flash that you are speaking of.

I am using Intel Strata Flash.

I have attached the  mail response from another
mailing list for the Flash Erase problem.
 
> > Erase at 0x00240000 failed immediately: -EROFS. Is
> the
> > sector locked?
> 
> You're probably using a flash chip that powers up
> with all blocks 
> locked, such as Intel K/L/P StrataFlash.  What to do
> about these has 
> been discussed periodically on linux-mtd with no
> real conclusion.  I'd 
> suggest booting from a cramfs partition (this is a
> good idea for other 
> reasons, avoiding jffs2 write/erase/gc activity from
> interfering with 
> access to executables) and have startup scripts do a
> flash_unlock 
> /dev/mtd<x> prior to mounting your jffs2 partition. 
> There are also 
> various patches that unlock all blocks at flash chip
> probe time, etc. 
> that can be searched on that list.

I tried mtd utility flash_unlock,but it didn't
help.got error "Could not get MTD device  info from
/dev/mtd1".
But i could see the entry in /proc/mtd.
 
Regards,
Soma sundaram.V


	

	
		
____________________________________________________
Send a rakhi to your brother, buy gifts and win attractive prizes. Log on to http://in.promos.yahoo.com/rakhi/index.html
