Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1co8RE-0005d3-Jr
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 12:54:02 +0000
Date: Wed, 15 Mar 2017 13:53:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thorsten Christiansson <thorsten.christiansson@idquantique.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "laurent.monat@idquantique.com" <laurent.monat@idquantique.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Timeout in denali.c on Micron nandflash (Altera SoC)
Message-ID: <20170315135328.58ec040f@bbrezillon>
In-Reply-To: <58C92E56.90207@idquantique.com>
References: <58BEB65B.3050003@idquantique.com>
 <CAFLxGvy=PHU1Yc74TgQ-S9+Q_jRnYEUVywzYqbhdmQRGHk_vJA@mail.gmail.com>
 <58C92E56.90207@idquantique.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Masahiro

On Wed, 15 Mar 2017 13:06:46 +0100
Thorsten Christiansson <thorsten.christiansson@idquantique.com> wrote:

> Hi all,
> 
> Follow-up:
> 
> > > I'm using Linux on an Altera SoC (Arria V), on which I'm using UBIFS  
> on a
> > > nandflash from Micron (MT29F8G08ADADAH4).  I have a 400Mb r/w  
> partition on
> > > which I have a sqlite3-based database. We're running an application that
> > > reads/writes fairly small blocks. After running for about a week at  
> moderate
> > > load, I get an error message, and the filesystem becomes read-only.
> > >
> > > The message I get is a timeout, originating in the denali.c driver.
> > > [11744.733748] timeout occurred, status = 0x0, mask = 0x4
> > > [11745.733685] timeout occurred, status = 0x0, mask = 0x120  
> 
> > Well, 4.4. is not very fresh. Maybe it saw fixes in recent version.
> > Can you please give MTD tests a try?  
> 
> I have now got a clean 4.10 up and running, and the MTD tests show the
> same error even quicker:
> # insmod /lib/modules/4.10.0/kernel/drivers/mtd/tests/mtd_stresstest.ko
> dev=1
> [  488.721072]
> [  488.722575] =================================================
> [  488.728337] mtd_stresstest: MTD device: 1
> [  488.732342] mtd_stresstest: MTD device size 536870912, eraseblock
> size 131072, page size 2048, count of eraseblocks 4096, pages per
> eraseblock 64, OOB size 64
> [  488.748845] mtd_test: scanning for bad eraseblocks
> [  488.756947] mtd_test: scanned 4096 eraseblocks, 0 are bad
> [  488.762322] mtd_stresstest: doing operations
> [  488.766601] mtd_stresstest: 0 operations done
> [  490.243583] timeout occurred, status = 0x4, mask = 0x3
> [  492.003933] timeout occurred, status = 0x4, mask = 0x3
> [  493.363590] timeout occurred, status = 0x4, mask = 0x3
> [  494.483584] timeout occurred, status = 0x4, mask = 0x3
> [  495.603585] timeout occurred, status = 0x4, mask = 0x3
> [  496.723582] timeout occurred, status = 0x4, mask = 0x3
> [  498.083600] timeout occurred, status = 0x4, mask = 0x3
> [  499.203582] timeout occurred, status = 0x4, mask = 0x3
> [  500.323921] timeout occurred, status = 0x4, mask = 0x3
> [  501.523590] timeout occurred, status = 0x4, mask = 0x3
> [  502.723584] timeout occurred, status = 0x4, mask = 0x3
> [  503.843583] timeout occurred, status = 0x4, mask = 0x3
> [  505.203584] timeout occurred, status = 0x4, mask = 0x3
> ^C[  506.883588] timeout occurred, status = 0x4, mask = 0x3
> [  506.913867] mtd_stresstest: aborting test due to pending signal!
> [  506.919940] mtd_stresstest: error -4 occurred
> [  506.924320] =================================================
> 
> Any ideas on how to go forwards from here are very welcome.

Masahiro is currently reworking the driver, maybe he'll have some ideas.

Regards,

Boris
