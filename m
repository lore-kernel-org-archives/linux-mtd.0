Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KoHNL-0007qG-GH
	for linux-mtd@lists.infradead.org; Fri, 10 Oct 2008 12:45:47 +0000
Subject: Re: [RFC] Support for > 2Gib MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF9C9CDDAA.CE29A97E-ON882574DD.00672609-882574DD.00675F3E@selinc.com>
References: <OF9C9CDDAA.CE29A97E-ON882574DD.00672609-882574DD.00675F3E@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 10 Oct 2008 15:44:08 +0300
Message-Id: <1223642648.3395.7.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-10-09 at 11:49 -0700, Bruce_Leonard@selinc.com wrote:
> > Please, add something like
> > uint8_t padding[128]; /* Reserved for future, should be zeroed */
> > to the new data structures.
> >
>=20
> Is this for future expandibility?

Sure.

> > >   To indicate that the new 64 bit interface is to be used=20
> > > I would introduce a new flag for 'struct mtd_info_user_XX->flags',=20
> > > something like this:
> > >=20
> > > #define MTD_LARGE_SIZE 0x4000
> >=20
> > No need for this. Because you'll change size of data structures and
> > their layout, this is not going to be compatible anyway.
> >
> How then would you indicate to user space that they need to use the new=20
> 64-bit structures and IOCTLs?  How does using another bit in an existing=20
> 'flags' field of a structure change the size and layout of the structure?

If you have different data structure, you cannot reuse old ioctl. You
have to define a new ioctl for the 64-bit interface. Old code will use
old ioctl which you do not change. New code will use new ioctl. Once we
have new ioctls, the old one may be declared as obsolete. This is my
understanding of how things go.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
