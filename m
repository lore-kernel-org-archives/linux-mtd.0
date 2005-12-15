Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Emkks-00021r-L3
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 23:30:12 -0500
Received: by wproxy.gmail.com with SMTP id i5so582047wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Dec 2005 20:30:08 -0800 (PST)
Message-ID: <29f916510512142030i3f6df27aqb6230f518e2b7526@mail.gmail.com>
Date: Wed, 14 Dec 2005 23:30:08 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0512140537h20e291e8i10951ced01f2a290@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <29f916510512132353y39427546j1413e0fdc5dcaa7a@mail.gmail.com>
	<625fc13d0512140537h20e291e8i10951ced01f2a290@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd size calcualtion assumes same size'd flashes ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi josh,

Thanks for your mail.
I am not so clear on this separate mtd device for each chip thing.
I have been simply creating the say map file in ixp425.c with whole
flash layout declared there.
I had to do mknod for each partition created in map separately
something like this say:
ixp425.c: static struct mtd_partition ixp425_partitions[] =3D {
        {
                name:   "bootloader",
                offset: 0x00000000,
                size:   0x00020000,
        },
        {
                name:   "bootloader-config",
                offset: 0x00020000,
                size:   0x00020000,
        },
        {
                name:   "normal-kernel",
                offset: 0x00040000,
                size:   0x00100000,
        },
}

and I had to do a mknod of  /dev/mtd0,1.2 etc with sequential minor numbers=
 ..

Can you please tell me how to create separate MTD devices if this isnt
that ? or any relavant doc ?

Regards,
Alfred

On 12/14/05, Josh Boyer <jwboyer@gmail.com> wrote:
> On 12/14/05, alfred hitch <alfred.hitch@gmail.com> wrote:
> > Hi,
> >
> > Please correct me if my understanding is wrong here:
> > but while grepp'ing through the code of linux 2.6 base I had.
> > File cfi_cmdset0001.c :
> > function: static struct mtd_info *cfi_intelext_setup(struct map_info *m=
ap)
> >
> >       mtd->size =3D devsize * cfi->numchips;
> >
> > This seems to me an assumption that the flash'es in system are all of
> > same size and so can be added up ?
> > Is my understanding correct, sorry dont have latest code access.
>
> I believe your understanding is correct.  Your device size can span
> multiple chips if they are physically contiguous and of the same type.
>
> >
> > If that is the case, any reasons to do so  ?
> > My system happened to have an odd sized flash config and was creating m=
essups.
> > If my understanding is correct, I would have like to patch and post it.
>
> The normal method of dealing with heterogenous chips is to create
> separate MTD devices for each chip in your map driver.  You can then
> use MTD_CONCAT to  concatenate these separate devices into one large
> device.
>
> josh
>
