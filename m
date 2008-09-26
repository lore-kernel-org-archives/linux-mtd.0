Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
In-Reply-To: <A09E9029F2344F78959A3E36179C468E@sisodomain.com>
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2008 11:19:36 +0300
Message-Id: <1222417176.5012.17.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kmpark@infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	lkml <linux-kernel@vger.kernel.org>, apgmoorthy <moorthy.apg@samsung.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-09-26 at 13:31 +0530, Amit Kumar Sharma wrote:
> Hi Artem
>=20
> we have following erro message  if we maintain 64 bytes=20
> eccpos.
>=20
> /flash_eraseall -j /dev/mtd4
> ./flash_eraseall: /dev/mtd4: unable to get NAND oobinfo
>=20
> ./nandwrite -j /dev/mtd2 /jffs2.img
> MEMSETOOBSEL: Inappropriate ioctl for device
>=20
> but i think as OneNAND has hw ecc controller so Jffs2 will=20
> not face any problem
> still i think mtd should consider for 128 bytes eccpos for=20
> 4K page size.

Well, anyway, in Linux ABI is a holy cow, you cannot change it.
That is a tough rule. Old user-space binaries have to always
works.

Thus you may do one of:
1. Invent a new ioctl for 4KiB page NANDs
2. Add sysfs support
3. Just do not expose whole OOB as Kyungmin suggested

But I think assume dwmw2 would need to comment on this and
tell which approach would agree on.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
