Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO9YA-0000yw-N9
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 13:50:20 +0000
Date: Thu, 2 Dec 2010 14:50:27 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101202145027.266b30a6@wker>
In-Reply-To: <1291296951.2526.34.camel@localhost>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101202105729.04c25fc1@wker> <1291292325.2526.23.camel@localhost>
	<20101202142351.197abbde@wker> <1291296951.2526.34.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 02 Dec 2010 15:35:51 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2010-12-02 at 14:23 +0100, Anatolij Gustschin wrote:
> > On Thu, 02 Dec 2010 14:18:45 +0200
> > Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > 
> > > On Thu, 2010-12-02 at 10:57 +0100, Anatolij Gustschin wrote:
> > > > UBIFS DBG (pid 1290): no_more_nodes: unexpected bad common header at 37:157472
> > > > UBIFS error (pid 1290): ubifs_recover_leb: bad node
> > > > UBIFS error (pid 1290): ubifs_scanned_corruption: corruption at LEB 37:157472
> > > > UBIFS error (pid 1290): ubifs_scanned_corruption: first 8192 bytes from LEB 37:157472
> > > > 00000000: 31181006 270758c8 0c331500 00000000 ffffffff ffffffff ff4fffff f3428020  1...'.X..3...............O...B. 
> > > 
> > > But this looks exactly like you have 64-bit write-buffer, but UBIFS
> > > c->min_io_unit is not 64, but it should be 64. Or you need a NOR hack to
> > > force 8-bytes write-buffer.
> > 
> > This looks exactly like I have a 16 byte write buffer. The first
> > 16 bytes of the common header node have been written correctly but
> > the remaining 8 bytes of the common header and then the 8 bytes of
> > the data are corrupt.
> > > 
> > > Are you sure you did not miss your NOR write-buffer hacks?
> > 
> > I'm sure that the kernel running this test uses the modification in
> > the CFI code as follows:
> > diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> > index e63e674..9eb47b8 100644
> > --- a/drivers/mtd/chips/cfi_probe.c
> > +++ b/drivers/mtd/chips/cfi_probe.c
> > @@ -213,6 +213,12 @@ static int __xipram cfi_chip_setup(struct map_info *map,
> >         cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
> >         cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
> >  
> > +       /*printk("NOTE: change CFI MaxBufWriteSize from 2^%d to 2^%d\n",*/
> > +       /*cfi->cfiq->MaxBufWriteSize, 3);*/
> > +       if (cfi->cfiq->MaxBufWriteSize) {
> > +               cfi->cfiq->MaxBufWriteSize = 3;
> > +       }
> > +
> > 
> > But I'm not sure whether the CFI driver is really using 8 byte
> > write buffer since the error pattern indicates the usage of a
> > bigger buffer. I'll check the actual size used in the CFI driver
> > at runtime.
> 
> Can you instead make mtd->writesize to be 64? This is much closer to the
> "right thing to do" :-)

Yes. But I also must ensure that the buffer size configured in
cfi->cfiq->MaxBufWriteSize is actually used by the driver. This
is not the case, it seems. If this is true, then I'll still run
into the similar trouble even when using 64 for max_io_size in UBI.

Thanks,
Anatolij
