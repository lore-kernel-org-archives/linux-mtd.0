Received: from taku.hut.fi ([130.233.228.87])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cjX8-0008KH-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 09:20:10 +0100
Date: Fri, 31 Aug 2001 11:26:01 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Cc: Ashok M Padmanaban <ashokmp@sasken.com>
Subject: Re: Lock utility in MTD util directory.
Message-ID: <20010831112601.A26643@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B8E0B3B.3182A367@sasken.com>; from ashokmp@sasken.com on Thu, Aug 30, 2001 at 09:45:31AM +0000
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

On Thu, Aug 30, 2001 at 09:45:31AM +0000, Ashok M Padmanaban wrote:
>   how can i use the lock utiliry in the MTD/util directory.

I have to run the unlock command manually before mounting jffs2. Something 
like "unlock /dev/mtd0". Kernel needs to have the MTD character device
configured and the corresponding chip driver needs to have lock/unlock
functions implemented. Whether sectors are locked after power on depends 
on the chip. The reverse works also: "lock /dev/mtd0 0 -1" would lock all 
sectors.

Regards,
Jarkko Lavinen
