Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEdwB-0007f5-3n
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 08:48:03 +0000
Received: by vxd2 with SMTP id 2so401238vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 01:48:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303804811.2778.37.camel@localhost>
References: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
	<1303804811.2778.37.camel@localhost>
Date: Tue, 26 Apr 2011 04:48:00 -0400
Message-ID: <BANLkTi=cHfoxmA_n2ttzR5=pacRgNX48BA@mail.gmail.com>
Subject: Re: Programming ubinized images
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2011 at 4:00 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
>> =A0 Or perhaps that I need to
>> be post-processing the ubinized images to strip out empty pages from
>> the end of the image before giving it to the production line?
>
> No, because this is not only about the end of the image, but end of
> eraseblocks.
>

Oh, I see.  So it's probably not feasible to leave out those portions
of the UBI image, unless the NAND programmer/software supports
specifying "holes" in the source image or something like that?

>
> Sure, it might easily be! But if this is the case for you you should be
> able to catch this by enabling UBI debugging extra checks. How
> up-to-date your UBI is, but relatively recently I added an extra check
> that will read all the written data back and check that it is correct.
> If you have a "bad" 0xFF page, then you write there, UBI will read it
> back just after write and compare with the data it wrote. If the data
> does not match, it'll complain. So you can stress-test your setup with
> UBI extra checks enabled. This is done by the 'ubi_dbg_check_write()'
> function.
>

Is 2.6.37 new enough?  It has ubi_dbg_check_write() anyway, right now
it's just #defined away with our config (paranoid checks aren't
enabled).

Unfortunately, the problem happens just often enough to be a serious
pain in the neck, but not often enough for us to catch it with a debug
build (so far).  But maybe it's possible to aggrevate it by repeating
the (bad) flash procedure - "nand erase" followed by flashing the
ubinized image, then doing lots of I/O on the subsequently mounted
UBIFS.

> We could teach the UBIFS tools and the kernel to deal with these things.
> It is possible to do with a special flag in the UBIFS superblock which
> would say - this FS has been just flashed, do not use space in
> half-filled eraseblocks! Then probably we could go through these
> half-filled eraseblocks and fix them up, and then remove that flag.
>

Makes sense.  I might take a stab at this later this week, since it
sounds like something along these lines is required if we plan to use
an industrial (fairly dumb) NAND programmer to flash ubinized UBIFS
images.

Thanks Artem

--=20
Matthew L. Creech
