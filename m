Received: from msr32.hinet.net ([168.95.4.132] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cdLE-0003SO-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 03:48:01 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Thomas Gleixner'" <tglx@linutronix.de>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration
Date: Thu, 8 Aug 2002 10:47:49 +0800
Message-ID: <001101c23e85$fcbad3b0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1028717345.19447.249.camel@thomas.tec.linutronix.de>
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

> > > > JFFS2 on NOR type flash does not use buffering, OOB=20
> check and bad
> > > > block management, but it can be used now. I meant that=20
> > > > CONFIG_JFFS2_FS_NAND is not defined, maybe the driver still=20
> > > can work,
> > > > but it is not good as the original one.
> > >=20
> > > JFFS2 cannot work on NAND flash without the extra code enabled by
> > > CONFIG_JFFS2_FS_NAND. You need to batch writes into=20
> > > page-sized chunks and=20
> > > use ECC. It looks like you have enabled CONFIG_JFFS2_FS_NAND=20
> > > in the log you=20
> > > show -- is that correct?
> > >=20
> >=20
> > Yes, I enable CONFIG_JFFS2_FS_NAND. I follow=20
> > http://www.linux-mtd.infradead.org/tech/nand.html to config the=20
> > settings. Can I do not care ECC on NAND flash?
> >=20
> ECC _HAS_ to be enabled !
>=20
> Have you ever erased your flash with erase /dev/mtdX ?
> This may have caused the problem, because erase is not aware=20
> of bad block handling and may have erased a block, which was=20
> marked as bad already and erased the bad block marker too. So=20
> if you write to this block, you get a write failure and=20
> therefor a read failure afterwards.=20
> I will change nand.c, so that bad blocks cannot be erased anymore.
>=20
> Another problem could be your command delay time. You have=20
> set it to 15=B5sec. Is that correct for your chip ? Which chip=20
> are you using ? Have you tried to set it to a higher value ?=20
>=20

Yes, I use eraseall /dev/mtd1 to erase the partition. But I check the
page that causes the problem, it is fine to read/write all the page.

I use Samsung K9F6408 and I try to set the delay time to 20=B5sec and it
can not solve the problem.

Could I use the content of the page that the error occures to trace the
problem? Can it help to solve the problem? Thanks.


Steve Tsai
