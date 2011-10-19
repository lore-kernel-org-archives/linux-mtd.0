Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGZv8-0000WZ-NJ
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 17:27:15 +0000
Date: Wed, 19 Oct 2011 19:27:04 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS recovery fails
Message-ID: <20111019172704.GA19732@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<20111018082955.GB5997@parrot.com>
	<1319037322.25389.111.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1319037322.25389.111.camel@sauron>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Daniel Kuhn <cheeef@swissonline.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 19, 2011 at 04:15:15PM +0100, Artem Bityutskiy wrote:
> I suggest you to improve the UBIFS power cut emulation functions and
> make them emulate unstable bits, and then use integck which is already
> able to handle emulated power cuts. This will allow you to
>=20
> 1. Test quickly
> 2. Continue the half-done work
> 3. Work with nicer code-base than ugly nandsim
> 4. Make it possible to emulate unstable bits in interesting places like
>    TNC, LPT, orphans area, etc. Otherwise most of the failures will be
>    emulated in data area.
>=20
>=20
> Similarly, something like that should be done in UBI level which will
> emulate power cuts _only_ when writing UBI-specific stuff (e.g., the
> headers).
=20
My first hope was maybe to garantee stable data at UBI level, as this would=
 also
secure raw UBI storage. But I have not looked into this seriously yet.

> I know you are driver guy and it is more natural for you to start from
> driver, but I suggest starting from UBIFS and fix 90% of the issues
> there, then go down. This way you will also isolate non-UBIFS specific
> issues.

OK; I also work on filesystem code; so I'm not really obsessed with drivers=
 :-)
=20
> Anyway, we should start with _documenting_:
> 1. What are unstable bits
> 2. Which work UBIFS/UBI/MTD needs to handle that.
> 3. What are MLC-specific issues
> 4. What would have to be done to handle them.
>=20
> I have ideas about the paired pages in MLC.
>=20
> But the thing also is that the whole stack is complex and big and
> has a lot of states (like any FS), so it is easy to miss something and
> you never know the complete list until you actually start stressing the
> stack.
>=20
> But let's document what we know at the moment. Then people who are
> interested to have that fixed can start approaching that.

OK, sounds good to me.

BR,
--
Ivan
