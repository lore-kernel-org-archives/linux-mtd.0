Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cjKw-0004ZX-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 10:12:06 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0I00CM1PJBZI@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 08 Aug 2002 11:11:36 +0200 (MEST)
Date: Thu, 08 Aug 2002 11:11:33 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: NAND Configuration
In-reply-to: <001201c23e9b$c188b490$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028797894.9586.8.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <001201c23e9b$c188b490$5501a8c0@synso.com.tw>
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

On Thu, 2002-08-08 at 07:23, Steve Tsai wrote:
> Thomas,
> The following are the content of the page writing error. All the tests
> have the similar data in the page and the area have the data already
> always start with 0x1985  and  there are empty data next to the area.
> Does it mean that the area was written before?
Yep.

Can you please do the following ?

Update to latest CVS code.
Erase the partition, you can use erase(all) /dev/mtdX
echo 9 >/proc/sys/kernel/printk
Start log
mount
do your mkdir, cp ...

if this happens again, please send a dump of the concerned page and the
logfile 

Thanks

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
