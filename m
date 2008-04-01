Received: from web50709.mail.re2.yahoo.com ([206.190.38.250])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgY0p-0001Pv-Iq
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2008 04:22:20 +0000
Date: Mon, 31 Mar 2008 21:22:17 -0700 (PDT)
From: maser <maseriyer@yahoo.com>
Subject: Is a JFFS2 image needed for dataflash ?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <578302.74350.qm@web50709.mail.re2.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Per this:

http://mailman.uclinux.org/pipermail/uclinux-dev/2003-January/014455.html

It looks like a JFFS2 FS is created on the fly on the
following commands: 

eraseall /dev/mtd0
mount -t jffs /dev/mtdblock0 /mnt
cp /usr/ls /mnt


If the JFFS2 FS is created on the fly on mounting to a
dataflash partition, why do we need to invoke the
mkfs.jffs2 utility to make a JFFS2 image for a
dataflash such as the AT45DBxxx?

The sysinit script could have something on the lines
of this :

/bin/mount -t jffs2 /dev/mtdblock2 /mnt

Thanks,
iyer




      ____________________________________________________________________________________
Like movies? Here's a limited-time offer: Blockbuster Total Access for one month at no cost. 
http://tc.deals.yahoo.com/tc/blockbuster/text4.com
