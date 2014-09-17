Date: Wed, 17 Sep 2014 16:18:33 -0400 (EDT)
From: Rodrigo Freire <rfreire@redhat.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Message-ID: <1761405154.40124217.1410985113708.JavaMail.zimbra@redhat.com>
In-Reply-To: <20140909170231.GA14429@logfs.org>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
Subject: Re: [PATCH] block2mtd: mtd: Present block2mtd timely on boot time
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: nbd@openwrt.org, herton@redhat.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi J=C3=B6rn,

----- Original Message -----=20
From: "J=C3=B6rn Engel" <joern@logfs.org>=20
> On Mon, 8 September 2014 16:04:40 -0400, Rodrigo Freire wrote:=20
> >=20
> > @@ -257,13 +281,15 @@ static struct block2mtd_dev *add_device(=20
> >=20
> > /* Setup the MTD structure */=20
> > /* make the name contain the block device in */=20
> > - name =3D kasprintf(GFP_KERNEL, "block2mtd: %s", devname);=20
> > + if (!mtdname)=20
> > + mtdname =3D devname;=20
> > + name =3D kmalloc(strlen(mtdname) + 1, GFP_KERNEL);=20
> > if (!name)=20
> > goto err_destroy_mutex;=20
> >=20
> > + strcpy(name, mtdname);=20
> kstrdup.=20
> And see below for the ABI change.=20

Thanks for pointing. Fixed.


> >  =09dev->mtd.name =3D name;
> > -
> > -=09dev->mtd.size =3D dev->blkdev->bd_inode->i_size & PAGE_MASK;
> > +=09dev->mtd.size =3D dev->blkdev->bd_inode->i_size & PAGE_MASK & ~(era=
se_size - 1);
>=20
> PAGE_MASK is no longer needed with the new term.  Or does anyone
> seriously want to support erase_size < PAGE_SIZE?

Makes sense. I was talking to Felix and indeed there are some MTD devices=
=20
which have 4k erase page size. Unheard of something smaller.
But it is on the MTD land and not block2mtd.


> Timeout has a default value, but name defaults to NULL. Add three=20
> devices without specifying the name and you get funny results.=20
> If we handled the NULL case by doing what the driver used to do before=20
> this patch, I think this would be fine.=20

Please see the fragment below:

@@ -257,13 +281,15 @@ static struct block2mtd_dev *add_device(
=20
 =09/* Setup the MTD structure */
 =09/* make the name contain the block device in */
-=09name =3D kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
+=09if (!mtdname)
+=09=09mtdname =3D devname;
+=09name =3D kstrdup(mtdname, GFP_KERNEL);
 =09if (!name)
 =09=09goto err_destroy_mutex;

If the name is a NULL or not provided, the mtdname will then become the mtd=
 device name.
I also tried mounting several partitions, with both specified name and not =
and everything seemed to work nicely.

See a V2 patch on the next message.
