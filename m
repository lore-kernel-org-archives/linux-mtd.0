Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhBcg-0000Si-DZ
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 07:16:19 +0000
Date: Wed, 30 Sep 2015 09:15:45 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com"
 <guz.fnst@cn.fujitsu.com>, "gsi@denx.de" <gsi@denx.de>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frank Liu
 =?UTF-8?B?5YiY576k?= (frankliu)" <frankliu@micron.com>, Andrea Scian
 <rnd4@dave-tech.it>, "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)"
 <peterpandong@micron.com>, "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?=
 (karlzhang)" <karlzhang@micron.com>, Iwo Mergler
 <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] drivers:nand:mtd: add support for UBI bakvol in mtd
 layer
Message-ID: <20150930091545.57a4047e@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4D4F4@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CECC@NTXXIAMBX02.xacn.micron.com>
 <20150928114008.06dcd1cd@bbrezillon>
 <A765B125120D1346A63912DDE6D8B6310BF4D4F4@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

On Wed, 30 Sep 2015 06:05:44 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:


> > > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h index
> > > f17fa75..cfcb3a68 100644
> > > --- a/include/linux/mtd/mtd.h
> > > +++ b/include/linux/mtd/mtd.h
> > > @@ -204,6 +204,9 @@ struct mtd_info {
> > >  			  struct mtd_oob_ops *ops);
> > >  	int (*_write_oob) (struct mtd_info *mtd, loff_t to,
> > >  			   struct mtd_oob_ops *ops);
> > > +	int (*_dual_plane_write_oob) (struct mtd_info *mtd, loff_t to_plane=
0,
> > > +			struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
> > > +					struct mtd_oob_ops *ops_plane1);
> >=20
> >=20
> > IMHO, if we were about to allow parallel write operations this should be
> > exposed as a more generic API, something like:
> >=20
> > struct mtd_write_op {
> > 	loff_t to;
> > 	struct mtd_oob_ops ops;
> > };
> >=20
> > struct mtd_multi_write_ops {
> > 	struct list_head writes;
> > };
> >=20
> > int (*_multi_write)(struct mtd_info *mtd,
> > 		    struct mtd_multi_write_ops *ops);
> >=20
> > Then the NAND layer could optimize that if the NAND chip supports "two-=
plane
> > page program", and if 2 pages in the write list are fulfilling the requ=
irements.
> >=20
> Good suggestion, I can improve it for next version patch. Thanks.
>=20

Please wait for other reviews before reworking that.

> > > index 1e271cb..1da3418 100644
> > > --- a/include/linux/mtd/ubi.h
> > > +++ b/include/linux/mtd/ubi.h
> > > @@ -35,6 +35,15 @@
> > >   */
> > >  #define UBI_MAX_SG_COUNT 64
> > >
> > > +enum {
> > > +	UBI_BAKVOL_UNONE,
> > > +	UBI_BAKVOL_INIT_INFO,
> > > +	UBI_BAKVOL_INIT_INFO_DONE,
> > > +	UBI_BAKVOL_INIT_VOLUME,
> > > +	UBI_BAKVOL_INIT_VOLUME_DONE,
> > > +	UBI_BAKVOL_RUN
> > > +};
> > > +
> >=20
> > Are those changes related to this patch?
> >=20
>=20
> Yes, maybe can simplify more.

Actually that was a rhetorical question. My point was that this enum
definition has nothing to do in this patch, and you're doing that
(mixing unrelated changes in the same commit) a lot in your other
patches.
So please make sure you correctly split your changes next time you send
a patch set.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
