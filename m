Received: from web86903.mail.ukl.yahoo.com ([217.12.13.55])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHiB9-0005Pf-DP
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 09:01:27 -0500
Message-ID: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
Date: Fri, 10 Mar 2006 13:54:31 +0000 (GMT)
From: Adam Ward <adamward2005@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm working on a Sandgate2-P board on 2.6.15-4 kernel.
I was a little confused by the existence of mtd
initialisation code in /arch/arm/mach-pax/mainstone.c
which when duplicated for SG2-P failed to work.

So I realised that there was also
/devices/mtd/maps/mainstone-flash.c (and I had played
with this under 2.6.9 when it was pxa27x-flash.c)
which I again duplicated and have had some success
with.

But only to read!

My jffs2 image will mount as ro.
If I do 'mount / -o remount,rw' it appears to be
happy, but I soon get told 'Read-only file system' if
I try anything too presumptuous!

As running mount still declares it as read/write, I am
assuming the error is with the mtd block driver
refusing to co-operate.

Is there anything you guys can suggest that I should
pay closer attention to?

--
Adam



		
___________________________________________________________ 
NEW Yahoo! Cars - sell your car and browse thousands of new and used cars online! http://uk.cars.yahoo.com/
