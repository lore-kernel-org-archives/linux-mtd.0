Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 190iUB-00056q-9A
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 14:41:03 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Wed, 2 Apr 2003 08:41:21 -0500
Message-ID: <002201c2f91d$8c6ff330$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <1049289082.32557.38.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: RE: reach of jffs2 within image vs. partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=20
> David Woodhouse
> Sent: Wednesday, April 02, 2003 8:11 AM
> To: John Burch
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: reach of jffs2 within image vs. partition
>=20
>=20
> On Wed, 2003-04-02 at 14:06, John Burch wrote:
> > Will JFFS2 ever read/write an area of flash memory that is=20
> within the=20
> > same mtd partition but outside of the jffs2 image (as defined -p=20
> > switch of mkfs.jffs2)?  In other words, if the jffs2 image=20
> spans 0x0 -=20
> > 0x120000 and it lies within an mtd partition that spans 0x0 -=20
> > 0x140000, will the last 128k, spanning from 0x120000 -=20
> 0x140000, ever=20
> > be accessed in any way by jffs2?  Would that 128k area be as=20
> > safe/non-volatile there as in a separate partition?
>=20
> No. JFFS2 will use the entire partition regardless of the=20
> amount of space taken by the original image.

Thanks.
 =20
Is there any advantage or disadvantage to creating the jffs2 image file
with the exact same size (via padding) as the partition, as opposed to
creating the jffs2 image with some size that's less than the partition
size?

>=20
> --=20
> dwmw2
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list=20
> http://lists.infradead.org/mailman/listinfo/li> nux-mtd/
>=20
