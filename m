Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIEF3-00008C-9m
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 04:33:38 +0000
Received: by bwz4 with SMTP id 4so5184645bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Dec 2009 20:33:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1260274841.19669.51.camel@localhost>
References: <ce9ab5790912020630s160fee35r340d02ae9f41bcfb@mail.gmail.com>
	<1260274841.19669.51.camel@localhost>
Date: Tue, 8 Dec 2009 20:33:29 -0800
Message-ID: <ce9ab5790912082033j1d3b605am34d626bc97020451@mail.gmail.com>
Subject: Re: [RFC] [PATCH] [MTD-UTILS]: flash_unlock: enhancing for unlocking
	of specified number of blocks
From: Vimal Singh <vimal.newwork@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/8/09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2009-12-02 at 20:00 +0530, Vimal Singh wrote:
> > This patch enhances the flash_unlock utility to be able to do
> > unlocking for specified blocks range.
> > This patch also fixes calculation of 'length' as in previous patch.
> >
> > Say there are 240 blocks present in the device. Then:
> > offset starts from: 0x0
> > and full size of device: 0x1E00000
> >
> > doing: 240 * 0x20000 gives -> 0x1E00000
> > But last block address should be 0x1DE0000 (which spans for 0x20000
> > bytes, adding up to size of 0x1E00000)
> >
> > Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> > ---
> >
> > --- a/flash_unlock.c  2009-11-24 19:33:18.000000000 +0530
> > +++ b/flash_unlock.c  2009-11-24 19:36:18.000000000 +0530
> > @@ -21,13 +21,14 @@ int main(int argc, char *argv[])
> >       int fd;
> >       struct mtd_info_user mtdInfo;
> >       struct erase_info_user mtdLockInfo;
> > +     int count;
> >
> >       /*
> >        * Parse command line options
> >        */
> > -     if(argc != 2)
> > +     if(argc < 2)
> >       {
> > -             fprintf(stderr, "USAGE: %s <mtd device>\n", argv[0]);
> > +             fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block
>
> The patch looks fine for me, except that you should instead make these
> to be some command line options.

I guess you did not go through the patch fully. The same is done in this patch.

-- 
Regards,
Vimal Singh
