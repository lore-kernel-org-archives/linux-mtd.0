Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uEE8-0003gq-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 16:37:24 +0100
Received: from rsp ([172.22.2.62])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with SMTP id g8PFbKm17699
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 17:37:20 +0200
Message-Id: <200209251537.g8PFbKm17699@dagobert.svc.sysgo.de>
Date: Wed, 25 Sep 2002 17:37:20 +0200
From: Ralf Spachmann <rsp@sysgo.de>
To: linux-mtd@lists.infradead.org
Subject: Is DoC2000's nftla possibly write protected ?
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

All,

according to the jffs howto, I nftl_formatted the DOC2000
I insmod the nftl.o and the partition check issues 
'unknown partition table' 
So I want to fdisk the /dev/nftla, create my partitions but
on the 'w' it complains :  'Unable to write /dev/nftla'

What's wrong ?

TIA 
Ralf
