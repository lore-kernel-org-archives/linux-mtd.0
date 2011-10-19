Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGXrm-0006QG-NR
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 15:15:39 +0000
Received: by wyg8 with SMTP id 8so2228954wyg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2011 08:15:37 -0700 (PDT)
Subject: Re: UBIFS recovery fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Wed, 19 Oct 2011 18:15:15 +0300
In-Reply-To: <20111018082955.GB5997@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch>
	<1318882668.2172.10.camel@koala> <20111018082955.GB5997@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WAmIqJNW1LBUzISKBlaa"
Message-ID: <1319037322.25389.111.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Daniel Kuhn <cheeef@swissonline.ch>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WAmIqJNW1LBUzISKBlaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-10-18 at 10:29 +0200, Ivan Djelic wrote:
> That's interesting... Do you have more details or any data on those eMMC
> power-cut failures ?

Not much. We were testing eMMC and were trying to make sure that if we
sync the data, and then have a power cut, we never lose the data which
was synced. We have a test which worked directly with the block device,
so no file-system involved. And in some cases eMMC had sectors which
were reported to be already written corrupted. The vendor later said
that yes, there is a FW bug, and promised to fix it in the next
revision.

eMMC FW is written by humans as well :-)

> I plan to be working soon (December) on UBIFS robustness issues with unst=
able
> modern SLCs; besides using nandsim to simulate SLC (and maybe MLC) issues=
,
> I also have real hardware with a power-cutting framework ready for testin=
g.

I suggest you to improve the UBIFS power cut emulation functions and
make them emulate unstable bits, and then use integck which is already
able to handle emulated power cuts. This will allow you to

1. Test quickly
2. Continue the half-done work
3. Work with nicer code-base than ugly nandsim
4. Make it possible to emulate unstable bits in interesting places like
   TNC, LPT, orphans area, etc. Otherwise most of the failures will be
   emulated in data area.


Similarly, something like that should be done in UBI level which will
emulate power cuts _only_ when writing UBI-specific stuff (e.g., the
headers).

Something on driver level can also be done later.

I know you are driver guy and it is more natural for you to start from
driver, but I suggest starting from UBIFS and fix 90% of the issues
there, then go down. This way you will also isolate non-UBIFS specific
issues.

Anyway, we should start with _documenting_:
1. What are unstable bits
2. Which work UBIFS/UBI/MTD needs to handle that.
3. What are MLC-specific issues
4. What would have to be done to handle them.

I have ideas about the paired pages in MLC.

But the thing also is that the whole stack is complex and big and
has a lot of states (like any FS), so it is easy to miss something and
you never know the complete list until you actually start stressing the
stack.

But let's document what we know at the moment. Then people who are
interested to have that fixed can start approaching that.

--=20
Best Regards,
Artem Bityutskiy

--=-WAmIqJNW1LBUzISKBlaa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOnumDAAoJEJtuLFy+q7feDD8H/155lTGtN0mwiTreBx610uUW
tJSc1vdA31QUj/2Qnyc7OkQpb3dBmWZiSssfS/LfFhNnfvxD0Mfna0+3ry3H36RN
HP7DJGF8MiwmzwH8m0vSEnzrmjHT8fHOzXZqyGYbzj7LDr5B1uV2u0XVn699y5Xz
FJJVG7n4/E2wTrB1fo6l60vXWMcXRz1EQwGw9pPskzTYFH7d54hqYuWdXtKjhfUq
rjHXS1XgX8c7l1c27ioa5BCLFvOr3bHEuF8lS71gZD/TFSyeyO23mmoB1f2jJ43h
EtHY1d6FJ5iGJ7bFefwzFdiZYEzisiWeirXkHQFmay3e5hbX0zBIyjYn/bM/+c8=
=Baq8
-----END PGP SIGNATURE-----

--=-WAmIqJNW1LBUzISKBlaa--
