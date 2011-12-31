Date: Sat, 31 Dec 2011 15:24:42 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] MTD/GPMI : select more modules for GPMI by default
Message-ID: <20111231072441.GF12182@S2100-06.ap.freescale.net>
References: <1325220337-23165-1-git-send-email-b32955@freescale.com>
 <20111231054432.GE12182@S2100-06.ap.freescale.net>
 <4EFEA210.30606@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4EFEA210.30606@freescale.com>
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem.Bityutskiy@intel.com,
 shijie8@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 31, 2011 at 01:48:00PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2011=E5=B9=B412=E6=9C=8831=E6=97=A5 13:44, Shawn Guo =E5=86=99=
=E9=81=93:
> >>+	select MXS_DMA
> >We should probably have it depend on MXS_DMA rather than select it.
> IMHO, I think `select` is better. :)
> The MXS_DMA not only service for NAND, but SD card, etc.
> In logic, the GPMI does not depends on MXS_DMA, the GPMI may use
> SDMA too(just in logically).
>=20
Here is what Documentation/kbuild/kconfig-language.txt tells:

        select should be used with care. select will force
        a symbol to a value without visiting the dependencies.
        By abusing select you are able to select a symbol FOO even
        if FOO depends on BAR that is not set.
        In general use select only for non-visible symbols
        (no prompts anywhere) and for symbols with no dependencies.
        That will limit the usefulness but on the other hand avoid
        the illegal configurations all over.

--=20
Regards,
Shawn
