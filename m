Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cjbK-0004j8-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 10:29:02 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0I00BJ5QBK1O@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 08 Aug 2002 11:28:32 +0200 (MEST)
Date: Thu, 08 Aug 2002 11:28:30 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: NAND Configuration
In-reply-to: <2777.1028798042@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alice Hennessy <ahennessy@mvista.com>, Steve Tsai <startec@ms11.hinet.net>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028798911.9592.11.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <3D518D06.B809B67@mvista.com>
 <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw>
 <1028717345.19447.249.camel@thomas.tec.linutronix.de>
 <2777.1028798042@redhat.com>
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

On Thu, 2002-08-08 at 11:14, David Woodhouse wrote:
> 
> ahennessy@mvista.com said:
> >  From looking at nand_erase(), it appears that the attempted erase of
> > a bad block would result in not performing the erase and exiting with
> > -EIO, correct?
> 
> > What is the preferred method to erase nand? 
> 
> As I understand it, the preferred method to erase factory-marked bad blocks
> is not at all.
nand.c takes care of factory-marked blocks now, wether CONFIG_NAND_ECC_JFFS2 is set of not.
So you can use erase(all) and bad blockes are skipped.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
