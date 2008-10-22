Subject: Re: [PATCH][nandsim] FIX RAM wasting via kmalloc
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0810221611550.30499@casper.infradead.org>
References: <alpine.LFD.1.10.0810221611550.30499@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 22 Oct 2008 18:49:06 +0300
Message-Id: <1224690546.4466.118.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexey,

thanks for the patch.

On Wed, 2008-10-22 at 16:33 +0100, Alexey Korolev wrote:
> Hi All,
>=20
> Nandsim consumes ~2x more RAM than the density of simulated device.=20
> It becomes critical if we need to simulate 256MB NAND and run stress test=
s=20
> on it.
>=20
> We investigated the reasons. nandsim allocates space for pages using kmal=
loc
> function. The size of LP nand page is 2112 bytes.
> kmalloc gets space from slab pools by chunks 2^n. So if we need to kmallo=
c
> 2112 bytes, 4096 bytes will be consumed by system.
> The best way to avoid this issue would be using kmem_cache allocations. A=
FAIK
> this mechanism specially designed to handle cases when arrays of allocati=
ons
> are used.

Acked-by: Artem Bityutskiy <dedekind@infradead.org>

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
