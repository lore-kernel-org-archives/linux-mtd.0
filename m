Received: from nssinet2.co-nss.co.jp ([150.96.0.5])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18eriJ-0005xy-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Feb 2003 07:05:20 +0000
Date: Sat, 01 Feb 2003 16:04:41 +0900
From: OHMURA Yutaka <ohmura@co-nss.co.jp>
MIME-Version: 1.0
To: <acurtis@onz.com>, Linux-MTD <linux-mtd@lists.infradead.org>
Message-Id: <20030201160441zmR0zh@co-nss.co.jp>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFKEKEEBAA.acurtis@onz.com>
References: <NCBBIINEHIPFGJPLBEIFKEKEEBAA.acurtis@onz.com>
Subject: Re: HELP! How to use EP8260 MTD device?
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Thanks to your comments, now I'm trying to use bitkeeper.
After that, I'll try to use MTD again.

"Allen Curtis" <acurtis@onz.com> wrote:

> I am not sure about TSL kernel but 2.4.7 is very old for PPC. There were
> some major bugs prior to 2.4.5. I have posted new MPC kernel trees that may
> be of interest. There isn't any major improvements as of yet but I am trying
> to maintain several kernel revision branches for those who want a more
> stable base.
> 
> The release branch trees are:
> bk://linux-ajc.bkbits.net/linuxmpc_2.4.20
> bk://linux-ajc.bkbits.net/linuxmpc_2.4.19
> bk://linux-ajc.bkbits.net/linuxmpc_2.4.18
> 
> PS: I hope to incorporate the latest MTD/JFFS in the near future.
> 
> > Does no one uses EP8260 in this ML?
> >
> > Now I changed my .config as follows:
> > > #
> > > # Memory Technology Devices (MTD)
> > > #
> > > CONFIG_MTD=y
> > > CONFIG_MTD_DEBUG=y
> > > CONFIG_MTD_DEBUG_VERBOSE=3
> > > CONFIG_MTD_PARTITIONS=y
> > > CONFIG_MTD_CHAR=y
> > > CONFIG_MTD_BLOCK=y
> > > CONFIG_FTL=y
> > >
> > > #
> > > # RAM/ROM/Flash chip drivers
> > > #
> > > CONFIG_MTD_CFI=y
> > > CONFIG_MTD_CFI_AMDSTD=y
> > > CONFIG_MTD_AMDSTD=y
> > > CONFIG_MTD_JEDEC=y
> > >
> > > #
> > > # Mapping drivers for chip access
> > > #
> > > CONFIG_MTD_PHYSMAP=y
> > > CONFIG_MTD_PHYSMAP_START=FF000000
> > > CONFIG_MTD_PHYSMAP_LEN=FFFFFF
> > > CONFIG_MTD_PHYSMAP_BUSWIDTH=2
> > (Only enabled lines are here.)
> >
> > But still kernel says
> > "physmap flash device: ffffff at ff000000
> > CFI: Found no Physically mapped flash device at location zero
> > $Id: ftl.c,v 1.38 2001/09/23 21:15:12 dwmw2 Exp $"
> >
> > Is the TSL kernel(2.4.7 base) really support MTD?
> > If someoen have any hints, please tell me.
> >
> > Regards,
> >
> > Yutaka
> >
> > OHMURA Yutaka <ohmura@co-nss.co.jp> wrote:
> >
> > > Hello,
> > >
> > > Now I'm trying to use Embedded Planet 8260 board Flash memory
> > with TimeSys
> > > Linux 3.1(TSL). I have two type of this board. One has 200MHz
> > clock, have RTC,
> > > 64MB PSDRAM, 32MB LSDRAM and 16MB Flash ROM. The other has
> > 300MHz clock,
> > > no RTC, 32MB PSDRAM and 8MB Flash ROM. My goal is use MTD
> > device under TSL with
> > > 300MHz MPU board, but the board looks some other difference
> > with 200MHz board,
> > > so TSL can't works fine, so at first I'm trying to use MTD
> > device with 200MHz
> > > board. But I can't use MTD until now.
> > >
> > > Please tell me how to use MTD on EP8260 under TSL!
> > >
> > > FYI, I attached .config file renamed config.8260.
> > > Under this environment, MTD driver says
> > > > physmap flash device: 6ffffc at ff800000
> > > > CFI: Found no Physically mapped flash device at location zero
> > > > RPX Lite or CLLF flash device: 2000000 at fe000000
> > > > CFI: Found no RPX device at location zero
> > > > $Id: ftl.c,v 1.38 2001/09/23 21:15:12 dwmw2 Exp $
> > >
> > > This is first time to use MTD for me, so if you know good
> > reference to use it,
> > > please tell me too.
> > > /usr/src/timesys/ep8260/2.4.7-timesys-3.1.180/kernel/Documents
> > was not help me.
> > >
> > > Regards,
> > >
> > > Yutaka
> > >
