Received: from msr91.hinet.net ([168.95.4.191] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17d3eO-0008GK-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 07:53:32 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration 
Date: Fri, 9 Aug 2002 14:53:17 +0800
Message-ID: <000901c23f71$7115bea0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <12213.1028804745@redhat.com>
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

The patch can work on my system. Thanks. 

I got another problem in mounting  JFFS2 file system.  When I write a
JFFS2 image into the NAND partition, I can mount it on /mnt. If I write
a JFFS2 image into the NAND partition and reboot system to use it as the
root file system, there are some CRC errors occur. When the system
mounts the root file system, it will start to access files also. Does
the kernel access file on jffs2 file system too early?

Steve Tsai


> 
> Try this (it's in CVS).... 
> 
> Index: wbuf.c 
> ===================================================================
> RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
> retrieving revision 1.12
> retrieving revision 1.13
> diff -u -p -r1.12 -r1.13
