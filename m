Subject: Re: For UBIFS users: be aware of write-back!
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1223018149.3328.21.camel@macbook.infradead.org>
References: <1222840288.8051.24.camel@sauron>
	<1223018149.3328.21.camel@macbook.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 03 Oct 2008 10:45:46 +0300
Message-Id: <1223019946.8051.45.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-10-03 at 08:15 +0100, David Woodhouse wrote:
> On Wed, 2008-10-01 at 08:51 +0300, Artem Bityutskiy wrote:
> >=20
> > this e-mail informs about a quite important UBIFS feature which
> > have already confused many people.
> >=20
> > If you use UBIFS, and especially if you have been using JFFS2 before,
> > please, read this documentation entry:
> >=20
> > http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
> >=20
> > Please, remember that UBIFS is _asynchronous_ FS. JFFS2 was synchronous=
,
> > so expect some of your old applications which were fine on JFFS2 to be
> > not ready to handle power cuts correctly in case of UBIFS.
>=20
> JFFS2 wasn't synchronous on NAND. You still needed to use fsync() as
> appropriate to ensure that written data made it to the flash and not
> just to the write-buffer.

That's right, the above documentation even tells about this:

"In contrast, JFFS2 does not have write-back support and all the JFFS2
file system changes go the flash synchronously. Well, this is not
completely true and JFFS2 does have a small buffer of a NAND page size,
but it is small and we may treat JFFS2 as completely synchronous."

> Your list of things to think about is good, but it should be pointed out
> that it applies _generally_ to all systems and all file systems.

Right, agree. I'll amend the docs on the web site.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
