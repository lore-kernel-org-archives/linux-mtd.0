Received: from zmaj.etf.bg.ac.yu ([147.91.8.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mydE-0002Mb-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 15:01:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by zmaj.etf.bg.ac.yu (Postfix) with ESMTP id 0625E4627D
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 16:12:23 +0100 (CET)
Received: from burzum.etf.bg.ac.yu (burzum.etf.bg.ac.yu [147.91.9.13])
	by zmaj.etf.bg.ac.yu (Postfix) with ESMTP id 25C5346272
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 16:12:18 +0100 (CET)
Date: Mon, 18 Mar 2002 14:48:55 +0100
From: Veselin Mijuskovic <panzer@etf.bg.ac.yu>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: DOC2000 + GRUB/LILO booting problems
Message-ID: <20020318134855.GA22168@etf.bg.ac.yu>
References: <20020314152040.GA24274@etf.bg.ac.yu> <Pine.LNX.4.44.0203141100270.3848-100000@server.superbt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0203141100270.3848-100000@server.superbt.com>
Resent-Message-Id: <20020318151217.AD62380E4@burzum.etf.bg.ac.yu>
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

Ilguiz Latypov [Thu, Mar 14, 2002 at 11:06:28AM -0500, Re: DOC2000 + GRUB/LILO booting problems]:
> 
> Veselin,
> 
> Could you overwrite the NFTL information when installing grub_firmware?  

	I'm pretty new to MTD and all these stuff, but if this is the 
case, how the kernel mounts the /dev/nftla1 with no problems at all when I 
boot from the hard disk?

> I believe one can re-format the chip with
>     nftl_format /dev/mtd0 0x18000
> 
	
	Isn't it dangerous? It's a 16MB DOC2000 - are these the right
parameters? Can I overwrite bad block table with the above command?
How can I recover bad block table (I can make 'dd if=/dev/mtd0 of=some_file'
to create a backup copy, can I)?

	Sorry to bother you with this, but it's rather important.

Cheers,
-- 
 | \|/ Panzer (a.k.a Veselin Mijuskovic), Unix SysAdmin 
/|\ |  Computer Centre, School of Electical Engineering, University of Belgrade
-------------------------------------------------------------------------------
       Unix is very friendly, it's just picky about who its friends are
