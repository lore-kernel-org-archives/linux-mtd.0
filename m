Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17d4qe-0008SG-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 09:10:16 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0K00DMRHC8FS@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 09 Aug 2002 10:09:45 +0200 (MEST)
Date: Fri, 09 Aug 2002 10:09:41 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: NAND Configuration
In-reply-to: <000901c23f71$7115bea0$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: 'David Woodhouse' <dwmw2@infradead.org>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028880582.9673.28.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <000901c23f71$7115bea0$5501a8c0@synso.com.tw>
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

On Fri, 2002-08-09 at 08:53, Steve Tsai wrote:
> The patch can work on my system. Thanks. 
> 
> I got another problem in mounting  JFFS2 file system.  When I write a
> JFFS2 image into the NAND partition, I can mount it on /mnt. If I write
> a JFFS2 image into the NAND partition and reboot system to use it as the
> root file system, there are some CRC errors occur. When the system
> mounts the root file system, it will start to access files also. Does
> the kernel access file on jffs2 file system too early?
No, also the kernel has to wait until the filesystem is mounted
complete. The kernel reads files, which you probably do not access, when
you mount it manually on /mnt. Try to copy all your files from /mnt to
anywhere and check, if the same errors occure. 


-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
