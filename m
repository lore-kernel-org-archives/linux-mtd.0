Subject: Re: For UBIFS users: be aware of write-back!
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1223020676.3328.28.camel@macbook.infradead.org>
References: <1222840288.8051.24.camel@sauron>
	<1223018149.3328.21.camel@macbook.infradead.org>
	<1223019946.8051.45.camel@sauron>
	<1223020676.3328.28.camel@macbook.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 03 Oct 2008 11:03:30 +0300
Message-Id: <1223021010.8051.61.camel@sauron>
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


On Fri, 2008-10-03 at 08:57 +0100, David Woodhouse wrote:
> On Fri, 2008-10-03 at 10:45 +0300, Artem Bityutskiy wrote:
> > "In contrast, JFFS2 does not have write-back support and all the JFFS2
> > file system changes go the flash synchronously. Well, this is not
> > completely true and JFFS2 does have a small buffer of a NAND page
> > size, but it is small and we may treat JFFS2 as completely
> > synchronous."
>=20
> That's quite poorly phrased. You may _not_ treat JFFS2 as completely
> synchronous. You treat it like a normal file system, or it's going to
> eat your babies.
>=20
> There was a reason I was perfectly happy to make the change which made
> JFFS2 start requiring fsync() like normal file systems -- it was because
> people should have been doing it _anyway_.
>=20
> Anyone who was skipping the required sync handling because they 'knew'
> that it didn't matter on JFFS2, even though it didn't cost them anything
> anyway -- and who didn't wake up at 3am every morning in a cold sweat,
> worrying that it might have broken today -- deserves to be taken out
> back and shot.
>=20
> When it comes to correctness, people shouldn't have to do anything
> special for different file systems. If there is _anything_ fs-specific
> about the correctness issues, you are doing something WRONG (cf. NFS).

Well, this is what I actually assume. I'll change the docs to make them
telling loudly about this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
