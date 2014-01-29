Received: from mailrelay001.isp.belgacom.be ([195.238.6.51])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8c5S-0000sZ-07
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 20:50:20 +0000
Date: Wed, 29 Jan 2014 20:51:05 +0800
From: Fabian Frederick <fabf@skynet.be>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: block2mtd: check device size
Message-Id: <20140129205105.b88b00ea09c07de7014ab1d9@skynet.be>
In-Reply-To: <20140129100424.GA15271@localhost>
References: <20140123205331.03314c6f82f24a6bb4b8ef53@skynet.be>
 <20140129100424.GA15271@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: rdunlap@infradead.org, joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 29 Jan 2014 07:04:25 -0300
Ezequiel Garcia <ezequiel.garcia@free-electrons.com> wrote:

> Hi Fabian,
>=20
> I saw you sent a v2 for one of the patches on this series,
> but maybe this is worth considering too.
>=20
> On Thu, Jan 23, 2014 at 08:53:31PM +0100, Fabian Frederick wrote:
> [..]
> > -/* FIXME: ensure that mtd->size % erase_size =3D=3D 0 */
> >  static struct block2mtd_dev *add_device(char *devname, int erase_size)
> >  {
> >  	const fmode_t mode =3D FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> > @@ -250,6 +249,11 @@ static struct block2mtd_dev *add_device(char *devn=
ame, int erase_size)
> >  		goto devinit_err1;
> >  	}
> > =20
> > +	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
> > +		pr_err("erasesize muse be a divisor of device size\n");
> > +		goto devinit_err1;
> > +	}
> > +
>=20
> Brian: What do you think?
>=20
> Fabian: Have you tested this patch? Can you elaborate a bit more about
> the effect it would have, compared to the current behavior?

Hi Ezequiel,

   This patch was tested with the following commands :
  =20
rmmod block2mtd;modprobe block2mtd block2mtd=3D/dev/loop0,<erasesize>;dmesg

with both correct and incorrect values.It tries to address the fixme=20
comment above the function.
(/* FIXME: ensure that mtd->size % erase_size =3D=3D 0 */)=20
  =20
   From what I understand, global size must be a multiple of=20
erase_size when it comes to any MTD I/O operations. If Brian finds this one=
=20
interesting I can repost it with current error names against l2-mtd.git/next

   AFAICS, current behavior let any value work...
 =20
 PS : This would need further testing (eg boot command).
=20
Regards,
Fabian


> --=20
> Ezequiel Garc=EDa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com
