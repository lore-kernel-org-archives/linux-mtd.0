Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kj5GR-0002jN-9x
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 04:49:11 +0000
Subject: Re: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240809251728u71366888s9cf81b4eac99472d@mail.gmail.com>
References: <33142758.53091221828088797.JavaMail.weblogic@epml16>
	<9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
	<000001c91d6f$238a6ea0$3dd66c6b@sisodomain.com>
	<9c9fda240809251728u71366888s9cf81b4eac99472d@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Sep 2008 07:48:53 +0300
Message-Id: <1222404533.5012.1.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: apgmoorthy <moorthy.apg@samsung.com>, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2008-09-26 at 09:28 +0900, Kyungmin Park wrote:
> > We can now use these utilities on 4KB devices.
> >
> > Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
> > ---
>=20
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Err, isn't this ABI change which is going to break backward
compatibility and is NO-NO in Linux?

> >  }
> > --- a/include/mtd/mtd-abi.h     2008-09-23 15:36:26.000000000 +0530
> > +++ b/include/mtd/mtd-abi.h     2008-09-23 15:48:48.000000000 +0530
> > @@ -104,7 +104,7 @@ struct nand_oobinfo {
> >        uint32_t useecc;
> >        uint32_t eccbytes;
> >        uint32_t oobfree[8][2];
> > -       uint32_t eccpos[32];
> > +       uint32_t eccpos[128];
> >  };

Err, isn't this ABI change which is going to break backward
compatibility and is NO-NO in Linux?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
