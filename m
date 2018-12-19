Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZgd0-00068u-A0
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 18:31:31 +0000
From: Richard Weinberger <richard@nod.at>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 19 Dec 2018 19:31:17 +0100
Message-ID: <3542497.Sqr1i8Hk3A@blindfold>
In-Reply-To: <BYAPR08MB45331E5653451102C61BAC54DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20181219151751.74931b39@xps13>
 <BYAPR08MB45331E5653451102C61BAC54DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am Mittwoch, 19. Dezember 2018, 18:19:43 CET schrieb Bean Huo (beanhuo):
> Hi, Boris and Miquel
> Thanks for your email.
> Since the patch is based on v4.2 which doesn't separate specific NAND vendor
> driver into vendor specific chip driver file. I will rebase my patch to latest linux kernel,
> and implement  a specific hook funciton in the nand_micron.c as you suggested.
> After testing well, you will see the version 2.

Please also check your patch using checkpatch.pl to make sure it matches the kernel coding style.

Can we also limit the workaround to a subset of Micron NANDs?
Enabling it for every kind of Micron NAND seems overkill to me.
Maybe you can precise "legacy planar 2D Micron NAND devices" bit more. :-)

Thanks,
//richard
