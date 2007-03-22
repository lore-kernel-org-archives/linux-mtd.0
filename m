Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUOQO-0002Lf-Bs
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 14:37:58 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HUOQG-0003Yv-3w
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 15:37:48 +0100
Received: from obelix.objectxp.com ([62.2.156.213])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2007 15:37:48 +0100
Received: from mma by obelix.objectxp.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2007 15:37:48 +0100
To: linux-mtd@lists.infradead.org
From: Michel Marti <mma@objectxp.com>
Subject: Re: JFFS2: Filesystem corruption after umount/mount
Date: Thu, 22 Mar 2007 15:37:27 +0100
Message-ID: <etu4b7$idd$1@sea.gmane.org>
References: <etoj9s$b84$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
In-Reply-To: <etoj9s$b84$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

on 03/20/2007 01:15 PM Michel Marti said the following:
> I'm experiencing a strange problem with JFFS2 using Linux 2.6.21-rc4-g78157a82 from
> denx.de on PowerPC. After unmounting and remounting the filesystem, some directory entries
> are corrupt. See the transcript below.
> 
> Flash in use is a Spansion S29GL256N. I'm using the physmap driver and pass the MTD
> partition layout on the kernel command line.

FYI, applying the patch attached to

  http://ozlabs.org/pipermail/linuxppc-embedded/2006-April/022558.html

fixes the problem.


--Michel
