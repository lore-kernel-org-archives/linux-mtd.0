Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PV3TX-00027h-4b
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2010 14:46:03 +0000
Received: by bwz14 with SMTP id 14so4402510bwz.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Dec 2010 06:46:00 -0800 (PST)
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
From: Artem Bityutskiy <dedekind1@gmail.com>
To: ext Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
	<AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Dec 2010 16:45:24 +0200
Message-ID: <1292942724.2286.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Anatolij Gustschin <agust@denx.de>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-12-20 at 17:36 +0100, ext Guillaume LECERF wrote:
> Hello.
> 
> 2010/12/16 Anatolij Gustschin <agust@denx.de>:
> > Initialize mtd->writebufsize to the value obtained
> > by CFI query command at probe time.
> >
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -428,6 +428,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
> >        mtd->flags   = MTD_CAP_NORFLASH;
> >        mtd->name    = map->name;
> >        mtd->writesize = 1;
> > +       mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
> 
> What about wbufsize initialized in cfi_amdstd_write_buffers() to
> "cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize" ?
> I don't know this piece of code, but I just wanted to point it to you.

Yes, fair question, Anatolij?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
