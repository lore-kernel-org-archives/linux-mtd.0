Date: Sun, 28 Aug 2016 11:19:31 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828111931.6eb3a10d@gmail.com>
In-Reply-To: <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160828091017.06fc2312@gmail.com>
 <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
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

Hi Richard,

On Sun, 28 Aug 2016 10:12:31 +0200
Richard Weinberger <richard@nod.at> wrote:

> Ralph,
>=20
> On 28.08.2016 09:10, Ralph Sennhauser wrote:
> > Using CONFIG_CMDLINE or the dtb isn't an option either for dual
> > firmware devices. You'd have to provide two images, one for each
> > partition so the rootfs belonging to the kernel gets mounted.
> > Sounds like a recipe for disaster. =20
>=20
> With "image" you mean the uImage?

uImage - padding to 6MB - ubinized rootfs. A firmware image as is
flashed by users.

Linksys set it up so that if one firmware image is broken there is a
good chance the bootloader will attempt to boot the other.

> Well, then you need to add the cmdline to the DT.
> If your bootloader does not support DT loading and you need to append
> it to uImage, yes, you'll have to two uImage for these devices.

Two uImages / firmware images is probably more problematic than asking
the user to fix the kernel parameters passed by u-boot.

> Or a initramfs...
>=20
> But IMHO it still does not justify adding these hacks to the kernel.
>=20

Those hacks can be justified if there is a case an initramfs or
CONFIG_CMDLINE/dtb doesn't work. I can't think of such a case right
now.

> > On the other hand an initramfs can carry the logic to figure out
> > which to mount and is what I use for my self. The busybox based
> > implementation I use adds a tad over 300Kb to the uImage, perfectly
> > acceptable in my case. =20
>=20
> When your minimal initramfs consumes 300KiB you're doing something
> wrong. As I said in another thread, for your special purpose you'd
> need to create a minitmal userspace for initramfs, no fancy (eg)libc,
> just a bare minimum /init program which does the mount probing.
> Shouldn=E2=80=99t be more than a few system calls.
>=20
> Thanks,
> //richard

Well, I use busybox because I'm lazy and still get away with only 300Kb.
And as I said there is plenty space on my device. (6M per uImage OEM
firmware configuration)

Cheers
Ralph
