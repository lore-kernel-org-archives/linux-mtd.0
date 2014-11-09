Date: Sun, 9 Nov 2014 07:18:05 -0500 (EST)
From: Rodrigo Freire <rfreire@redhat.com>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <9691395.7454649.1415535485079.JavaMail.zimbra@redhat.com>
In-Reply-To: <20141105202303.GN23619@ld-irv-0074>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> From: "Brian Norris" <computersforpeace@gmail.com>
> Sent: Wednesday, November 5, 2014 6:23:03 PM

> On Wed, Sep 17, 2014 at 04:28:03PM -0400, Rodrigo Freire wrote:
> > Currently, a block MTD device is not presented to the system on time, i=
n
> > order to start mounting the filesystems. This patch ensures that block2=
mtd
> > is presented at the right time, so filesystems can be mounted on boot t=
ime.
> > This issue was seen on BCM2835 (Raspberry Pi) systems when mounting JFF=
S2
> > block2mtd filesystems.

> This still seems like a bad idea (using a block device + block2mtd +
> JFFS2). Why are you doing this? See comments here:
> http://www.linux-mtd.infradead.org/faq/jffs2.html#L_hdd_jffs2

As Felix stated on a previous message to the thread, I am using JFFS2 over
block2mtd where regular filesystems failed to do so well. There are several
[1] threads pointing this issue, and JFFS2 over block2mtd works like a char=
m
on more harsh scenarios. The block2mtd behavior was not working correctly o=
n
BCM2835 architecture (the kernel waited for the block device prior to its
actual enumeration by the kernel) and this patch ensures that block2mtd
kicks in _after_ the block devices was enumerated or after a user-defined
timeout.=20
The patchset also enables block2mtd to define a MTD name (a MTD supports it
natively, the block2mtd had its name hard-coded to its block device name).

> You're stating right up front that this patch is doing several different
> things. Please split these up into separate commits which get their own
> description.

Done. I'll send a new split V3 patchset.

> You have several checkpatch warnings. Please fix them.

Thanks for pointing. Done.

> The addition of this name parameter should definitely be its own patch.

I agree. Done.

> This variable produces a warning when built as a module:

> drivers/mtd/devices/block2mtd.c: In function =E2=80=98add_device=E2=80=99=
:
> drivers/mtd/devices/block2mtd.c:228:6: warning: unused variable =E2=80=98=
i=E2=80=99
> [-Wunused-variable]
> int i;
> ^

Oooops. Fixed.

> > +#ifndef MODULE
> > +/*
> > +* We might not have the root device mounted at this point.
> > +* Try to resolve the device name by other means.
> > +*/

> These lines should start with a space, so the asterisks line up.

Fixed, and also fixed other non-aligned asterisks as well.

> > - dev->mtd.size =3D dev->blkdev->bd_inode->i_size & PAGE_MASK;
> > + dev->mtd.size =3D dev->blkdev->bd_inode->i_size & ~(erase_size - 1);

> This deserves its own patch, or at least some explanation of why you're
> doing this. I guess you're seeing cases where the provided erasesize is
> not aligned with the size of the block device?

J=C3=B6rg pointed it on https://lkml.org/lkml/2014/9/9/680. Now, we just ke=
ep
it aligned with erase_size. Separated on a 3rd patch.

> > dev->mtd.erasesize =3D erase_size;
> > dev->mtd.writesize =3D 1;
> > dev->mtd.writebufsize =3D PAGE_SIZE;
> > @@ -276,15 +301,19 @@ static struct block2mtd_dev *add_device(
> > dev->mtd.priv =3D dev;
> > dev->mtd.owner =3D THIS_MODULE;
> >
> > - if (mtd_device_register(&dev->mtd, NULL, 0)) {
> > + part =3D kzalloc(sizeof(struct mtd_partition), GFP_KERNEL);
> > + part->name =3D name;
> > + part->offset =3D 0;
> > + part->size =3D dev->mtd.size;

> Why are you doing this? This also does not fit the description of this
> patch. And what's wrong with using the default partitioning options?
> Won't we (if not specified in some other way) default to an
> unpartitioned MTD, which covers the entire device?

This code was changed in order to support a MTD name.

Thanks for your dilligent review.

Best regards,

- RF.

[1] - http://bit.ly/1smGvwa
