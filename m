Received: from mx0.gmx.de ([213.165.64.100] helo=mx0.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zu2X-0006wl-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 15:01:25 +0100
Date: Wed, 31 Jul 2002 16:00:53 +0200 (MEST)
From: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
References: <3243.1028116115@redhat.com>
Subject: Re: Root-FS on DOC2000 (was Re: Compiling Grub for DOC2000)
Message-ID: <28783.1028124053@www26.gmx.net>
Content-Type: text/plain; charset="us-ascii"
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

> 	Remove the bogus invalidate_device() from the nftl_release() 
> 	function in drivers/mtd/nftlcore.c
Yeah! That worked! Thanks a lot! I don't what I really did, but it
worked!

Thanks
  Frank

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
