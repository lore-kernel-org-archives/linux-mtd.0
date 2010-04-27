Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6ft3-0003r3-6u
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 08:11:22 +0000
Received: by wwg30 with SMTP id 30so488668wwg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Apr 2010 01:11:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100427075229.GB27497@kernel.dk>
References: <20100423100532.GN27497@kernel.dk>
	<20100426094810.GE27497@kernel.dk> <20100426143253.GB4364@logfs.org>
	<20100426143803.GM27497@kernel.dk> <20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org> <20100426163126.GD4364@logfs.org>
	<20100426170247.GP27497@kernel.dk> <20100426171236.GG4364@logfs.org>
	<20100427075229.GB27497@kernel.dk>
Date: Tue, 27 Apr 2010 10:11:18 +0200
Message-ID: <z2g4aa525de1004270111r8a9a475fna8715219551a889d@mail.gmail.com>
Subject: Re: [PATCH 2/2] [MTD] Call bdi_init() and bdi_register()
From: Paolo Minazzi <paolo.minazzi@gmail.com>
To: Jens Axboe <jens.axboe@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I Jens,
I'm Paolo Minazzi and I have a problem with logfs and 2.6.34rc5.
Can I apply the patch to rc5 and make a test on my ARM board ?
Paolo



On Tue, Apr 27, 2010 at 9:52 AM, Jens Axboe <jens.axboe@oracle.com> wrote:
> On Mon, Apr 26 2010, J=F6rn Engel wrote:
>> On Mon, 26 April 2010 19:02:48 +0200, Jens Axboe wrote:
>> > On Mon, Apr 26 2010, J=F6rn Engel wrote:
>> > > Otherwise we hit a BUG_ON in bdi_queue_work().
>> > >
>> > > Signed-off-by: Joern Engel <joern@logfs.org>
>> > > ---
>> > > =A0drivers/mtd/mtdcore.c | =A0 17 ++++++++++++++++-
>> > > =A01 files changed, 16 insertions(+), 1 deletions(-)
>> > >
>> > > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> > > index cb4858b..8dd3e46 100644
>> > > --- a/drivers/mtd/mtdcore.c
>> > > +++ b/drivers/mtd/mtdcore.c
>> > > @@ -322,6 +322,12 @@ int add_mtd_device(struct mtd_info *mtd)
>> > > =A0 =A0 =A0 =A0 =A0 if (!mtd_table[i]) {
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_notifier *not;
>> > >
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D bdi_register(mtd->backing_=
dev_info, NULL, "mtd%d",
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i)=
;
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* We lose the err=
no information :( */
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> >
>> > This is not a good idea, even if it'll currently work.
>> >
>> > > @@ -692,6 +698,15 @@ static int __init init_mtd(void)
>> > > =A0 int ret;
>> > > =A0 ret =3D class_register(&mtd_class);
>> > >
>> > > + ret =3D bdi_init(&mtd_bdi_unmappable);
>> > > + if (ret)
>> > > + =A0 =A0 =A0 =A0 return ret;
>> > > + ret =3D bdi_init(&mtd_bdi_ro_mappable);
>> > > + if (ret)
>> > > + =A0 =A0 =A0 =A0 return ret;
>> > > + ret =3D bdi_init(&mtd_bdi_rw_mappable);
>> > > + if (ret)
>> > > + =A0 =A0 =A0 =A0 return ret;
>> >
>> > Do the bdi_register() here as well.
>>
>> -ENOBRAIN
>>
>> Initially I wanted to do just than. =A0Then I looked at the block layer
>> and thought we could create one backing_dev_info per mtd as well. =A0Not
>> necessarily a bad if I would actually _create_ them and not just reuse
>> the same ones over and over again.
>
> I cooked up that patch myself, here:
>
> http://git.kernel.dk/?p=3Dlinux-2.6-block.git;a=3Dcommit;h=3D0661b1ac5d48=
eb47c8a5948c0554fea25e0895ab
>
> Care to give it a quick spin?
>
> --
> Jens Axboe
>
>
