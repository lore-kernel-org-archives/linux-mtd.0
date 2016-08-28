Date: Sun, 28 Aug 2016 14:10:47 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828141047.1f9c0893@gmail.com>
In-Reply-To: <20160828114445.GA1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160828091017.06fc2312@gmail.com>
 <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
 <20160828111931.6eb3a10d@gmail.com>
 <f7733dca-068a-38f4-f715-1abb439a71bc@nod.at>
 <20160828114445.GA1623@makrotopia.org>
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

On Sun, 28 Aug 2016 13:44:48 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

> Hi Richard,
>=20
> On Sun, Aug 28, 2016 at 11:28:18AM +0200, Richard Weinberger wrote:
> > Ralph,
> >=20
> > On 28.08.2016 11:19, Ralph Sennhauser wrote: =20
> > >>> On the other hand an initramfs can carry the logic to figure out
> > >>> which to mount and is what I use for my self. The busybox based
> > >>> implementation I use adds a tad over 300Kb to the uImage,
> > >>> perfectly acceptable in my case.   =20
> > >>
> > >> When your minimal initramfs consumes 300KiB you're doing
> > >> something wrong. As I said in another thread, for your special
> > >> purpose you'd need to create a minitmal userspace for initramfs,
> > >> no fancy (eg)libc, just a bare minimum /init program which does
> > >> the mount probing. Shouldn=E2=80=99t be more than a few system calls=
. =20
>=20
> That would indeed be nice, however, I fail to see how this can work
> with little effort *before* having devtmpfs ready. Also, we'll need a
> non-standard kernel parameter (usually "real_root=3D") to pass the
> selected rootfs down to our to-be-implemented micro-sized initramfs.

There is no such requirement, an initramfs lets you do with root=3D what
you want.

>=20
> > >>
> > >> Thanks,
> > >> //richard =20
> > >=20
> > > Well, I use busybox because I'm lazy and still get away with only
> > > 300Kb. And as I said there is plenty space on my device. (6M per
> > > uImage OEM firmware configuration) =20
> >=20
> > So, problem solved. Use an initramfs. :-) =20
>=20
> I agree this might be acceptable for some, but certainly not all
> cases.

It's not guaranteed to be solved, but it looks a lot like it is. I
suggest you pick a target that can be solved with dtb and one that
needs an initramfs and experiment with it. The comments I came across
in the openwrt sources wrt initramfs are often misguided.

Once you have an example that can't be reasonably addressed with
either dtb or initramfs would be the time to resume here.

Cheers
Ralph
