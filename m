Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cONk-00010L-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 11:49:36 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0G00L4BZDSAG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2002 12:49:05 +0200 (MEST)
Date: Wed, 07 Aug 2002 12:49:05 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: NAND Configuration
In-reply-to: <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: 'David Woodhouse' <dwmw2@infradead.org>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028717345.19447.249.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: quoted-printable
References: <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw>
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

On Wed, 2002-08-07 at 12:19, Steve Tsai wrote:
> > > JFFS2 on NOR type flash does not use buffering, OOB check and bad=20
> > > block management, but it can be used now. I meant that=20
> > > CONFIG_JFFS2_FS_NAND is not defined, maybe the driver still=20
> > can work,=20
> > > but it is not good as the original one.
> >=20
> > JFFS2 cannot work on NAND flash without the extra code enabled by=20
> > CONFIG_JFFS2_FS_NAND. You need to batch writes into=20
> > page-sized chunks and=20
> > use ECC. It looks like you have enabled CONFIG_JFFS2_FS_NAND=20
> > in the log you=20
> > show -- is that correct?
> >=20
>=20
> Yes, I enable CONFIG_JFFS2_FS_NAND. I follow
> http://www.linux-mtd.infradead.org/tech/nand.html to config the
> settings. Can I do not care ECC on NAND flash?
>=20
ECC _HAS_ to be enabled !

Have you ever erased your flash with erase /dev/mtdX ?
This may have caused the problem, because erase is not aware of bad
block handling and may have erased a block, which was marked as bad
already and erased the bad block marker too. So if you write to this
block, you get a write failure and therefor a read failure afterwards.=20
I will change nand.c, so that bad blocks cannot be erased anymore.

Another problem could be your command delay time. You have set it to
15=B5sec. Is that correct for your chip ? Which chip are you using ?
Have you tried to set it to a higher value ?=20

--=20
Thomas=20
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
