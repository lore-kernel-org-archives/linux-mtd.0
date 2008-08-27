Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF7C027ED9.D9F1F324-ON882574B2.0007025B-882574B2.000767B6@selinc.com>
References: <OF7C027ED9.D9F1F324-ON882574B2.0007025B-882574B2.000767B6@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 27 Aug 2008 08:56:37 +0300
Message-Id: <1219816597.18027.145.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd-bounces@lists.infradead.org, Bruce Leonard <brucle@earthlink.net>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bruce,

On Tue, 2008-08-26 at 18:21 -0700, Bruce_Leonard@selinc.com wrote:
> > This changes the kernel<->userspace ABI and is hence a big no-no.  I
> > assume that this change will cause old userspace to malfunction on new
> > kernels, and vice versa.
> >=20
>=20
> Well, in my posting I noted that the mtd-utils were broken because of thi=
s=20
> but I didn't really have any idea as to how to fix things.  I can see why=
=20
> it would be a big no-no to change this.  Do you have any suggestions on=20
> what I could do differently to prevent making that change?

Unfortunately, it is unacceptable to break existing stuff, even old
crappy mtd utils :-). That's simply how we work in the kernel community.

Stuff which you do is always not simple because you have to make sure
all legacy stuff does not break. So you'll need to invest more time into
your work.

> There was a LOT of interest in this over the last few months while I was=20
> working on it, but a very suprising silence has developed since I posted=20
> the patches.  I guess I'm more cutting edge than I thought :).

I understand your frustration. Apologies for not reacting faster.

> > Please cc linux-mtd@lists.infradead.org (at least) on MTD-related
> > patches, thanks.
>=20
> I started with the MTD list and then also posted to lkml when I realized =
I=20
> had forgotten to CC it.

Yeah, sometimes MTD ML just ignores patches, I am in the same boat, but
even if you've decided to send stuff to lkml, please, CC MTD ML anyway.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
