Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFS37-0001Fu-5f
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 04:28:12 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1170972968.4884.140.camel@zod.rchland.ibm.com>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 09 Feb 2007 11:12:19 +0200
Message-Id: <1171012339.10670.33.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTDML <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Josh,

On Thu, 2007-02-08 at 16:16 -0600, Josh Boyer wrote:
> Do image creation tools now how to understand how to increment the
> counter for each block in a binary image that would be flashed onto the
> card raw?  Or do you leave the counter in all the VID headers as 0 for
> such images?

They don't and they should be updated. But yes, they write zeroes to the
sqnum and UBI is happy.

> If a new kernel is run with an older UBI image, will it automatically
> start using the field and increment the counter values?  (If yes, that
> makes my first question go away I think.)

Yes. Both are used, incremented, etc.

> No you can't.  You cannot determine time and rate from a simple counter
> number.  All you can determine is that LEB N is older than LEB M.  It
> could be older by 40 seconds, or older by 5 years.

Here is an example:

I know the number of PEBs on the media N and I may introduce an
empirical criteria of oldness M =3D F(N). For example, M=3DkN, k is a
natural number. Its a subject for an investigation.

I know the highest sqnum (=3D the current global sequence counter) H, and
any LEB with sqnum=3DS is treated it as old if S < H-M, and as "fresh"
otherwise.

When I move a PEB with low EC, and I need to pick the target PEB (T),
where I move the data to. I pick T with the highest EC if the data is
old, and I pick T with an average EC if the data is fresh.

>=20
> >    is close to the current one, it was written recently. This provides =
us
> >    an opportunity to distinguish between LEBs with static data vs. LEBs
> >    with not really static data (e.g., we have just recently taken a LEB
> >    with low erase counter and wrote data there). This is useful for WL.
>=20
> Yes, this might help wear-leveling.  But if the data is used, I would
> recommend being very conservative about using the counter value to
> distinguish between "static" and "non-static" data.

Yes, this has to be carefully thought of.

> > + * eraseblocks P and P1. But P1 has greater sequence number, so UBI pi=
ck P1.
>=20
> "... so UBI picks P1"

Yup, Tx.

> > + * which PEB is the original (obviously P will have lower @ts) and the=
 copy.
>=20
> What is @ts?

I first wanted to call it "time stamp", but store sequence number.
Leftovers, tx.


> > + * Note, there is an obsolete @leb_ver field which was used instead of=
 @ts in
>=20
> Again with @ts... I think you mean @seqnum?

Yup, tx.

> >  	ubi32_t data_crc;
> > -	uint8_t padding1[24];
> > +	uint8_t padding1[4];
> > +	ubi64_t sqnum;
> > +	uint8_t padding2[12];
>=20
> Can't you add the field at the bottom before hdr_crc so you don't have
> split padding like that?

No, it is 64-bit and I want it to be aligned.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
