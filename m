Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PanPk-00029r-0y
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 10:49:54 +0000
Date: Thu, 6 Jan 2011 11:49:48 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
Message-ID: <20110106114948.37ca06d0@wker>
In-Reply-To: <1292942724.2286.57.camel@localhost>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
	<AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
	<1292942724.2286.57.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, ext Guillaume LECERF <glecerf@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 21 Dec 2010 16:45:24 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Mon, 2010-12-20 at 17:36 +0100, ext Guillaume LECERF wrote:
> > Hello.
> > 
> > 2010/12/16 Anatolij Gustschin <agust@denx.de>:
> > > Initialize mtd->writebufsize to the value obtained
> > > by CFI query command at probe time.
> > >
> > > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > > ---
> > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > @@ -428,6 +428,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
> > >        mtd->flags   = MTD_CAP_NORFLASH;
> > >        mtd->name    = map->name;
> > >        mtd->writesize = 1;
> > > +       mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
> > 
> > What about wbufsize initialized in cfi_amdstd_write_buffers() to
> > "cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize" ?
> > I don't know this piece of code, but I just wanted to point it to you.
> 
> Yes, fair question, Anatolij?

Just answered it.

Thanks,
Anatolij
