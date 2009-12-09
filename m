Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIJuV-0000Rv-S6
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 10:36:48 +0000
Subject: Re: [RFC] [PATCH] [MTD-UTILS]: flash_unlock: enhancing for
	unlocking  of specified number of blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790912082033j1d3b605am34d626bc97020451@mail.gmail.com>
References: <ce9ab5790912020630s160fee35r340d02ae9f41bcfb@mail.gmail.com>
	<1260274841.19669.51.camel@localhost>
	<ce9ab5790912082033j1d3b605am34d626bc97020451@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 12:36:34 +0200
Message-Id: <1260354994.19669.1283.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-12-08 at 20:33 -0800, Vimal Singh wrote:
> On 12/8/09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2009-12-02 at 20:00 +0530, Vimal Singh wrote:
> > > This patch enhances the flash_unlock utility to be able to do
> > > unlocking for specified blocks range.
> > > This patch also fixes calculation of 'length' as in previous patch.
> > >
> > > Say there are 240 blocks present in the device. Then:
> > > offset starts from: 0x0
> > > and full size of device: 0x1E00000
> > >
> > > doing: 240 * 0x20000 gives -> 0x1E00000
> > > But last block address should be 0x1DE0000 (which spans for 0x20000
> > > bytes, adding up to size of 0x1E00000)
> > >
> > > Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> > > ---
> > >
> > > --- a/flash_unlock.c  2009-11-24 19:33:18.000000000 +0530
> > > +++ b/flash_unlock.c  2009-11-24 19:36:18.000000000 +0530
> > > @@ -21,13 +21,14 @@ int main(int argc, char *argv[])
> > >       int fd;
> > >       struct mtd_info_user mtdInfo;
> > >       struct erase_info_user mtdLockInfo;
> > > +     int count;
> > >
> > >       /*
> > >        * Parse command line options
> > >        */
> > > -     if(argc != 2)
> > > +     if(argc < 2)
> > >       {
> > > -             fprintf(stderr, "USAGE: %s <mtd device>\n", argv[0]);
> > > +             fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block
> >
> > The patch looks fine for me, except that you should instead make these
> > to be some command line options.
> 
> I guess you did not go through the patch fully. The same is done in this patch.

No, I looked. What I meant was doing:

flash_unlock /dev/mtdZ --offset=X --block=Y

or

flash_unlock /dev/mtdZ -b Y -o X

instead of

flash_unlock /dev/mtdZ X Y

Obviously the first one is cleaner and is easier to extend, and you do
not have so strict dependency on the X and Y order, and this is more
readable, and less error-prone.

However, I glanced to flash_lock, and it uses similar bad style, so I
guess it is ok if flash_unlock is symmetric. Thus, I've pushed this
patch, thank you!

****** NB !!!! *******
Your patch was again line-wrapped. How many times I complained about
this??? I've fixed it up, but really, it not funny already.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
