MIME-Version: 1.0
In-Reply-To: <4FE39F19.9090105@grid-net.com>
References: <4FE39F19.9090105@grid-net.com>
Date: Fri, 22 Jun 2012 22:45:19 +0800
Message-ID: <CAMiH66HMCte-8BAqZiPu0T=U9MzCEfyznND0Hwm7TsctzJe9UQ@mail.gmail.com>
Subject: Re: GPMI NAND on MX28 with DT.with
From: Huang Shijie <shijie8@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>, mtd <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  yes, the gpmi-nand has bugs now.
I will try to fix it when I am free.

thanks
Huang Shijie


On Fri, Jun 22, 2012 at 6:24 AM, Subodh Nijsure <snijsure@grid-net.com> wro=
te:
> Has anyone gotten the latest GPMI NAND patches for MX28 with device-tree =
to
> work?
>
> I came across this thread where Huang Shijie reported that it has some
> issues with ECC.
>
> Our attempt to attach fail as shown below, anybody else encountered these
> errors?
>
> cat /proc/mtd
> dev: =C2=A0 =C2=A0size =C2=A0 erasesize =C2=A0name
> mtd0: 00a00000 00020000 "boot"
> mtd1: 0f200000 00020000 "data"
> mtd2: 00400000 00020000 "boot-config"
>
> ubiformat /dev/mtd1
> ubiformat: mtd1 (nand), size 253755392 bytes (242.0 MiB), 1936 eraseblock=
s
> of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 1935 -- 100 % complete
> ubiformat: 1933 eraseblocks have valid erase counter, mean value is 3
> ubiformat: 3 bad eraseblocks found, numbers: 264, 468, 1593
> ubiformat: formatting eraseblock 1935 -- 100 % complete
> / # ubiattach /dev/ubi_ctrl -m 1
> [ =C2=A0185.560000] UBI error: vtbl_check: bad CRC at record 0: 0x2b4f6dd=
5, not
> 0x000000
> [ =C2=A0185.560000] UBI error: vtbl_check: bad CRC at record 0: 0x2b4f6dd=
5, not
> 0x000000
> [ =C2=A0185.560000] UBI error: process_lvol: both volume tables are corru=
pted
> [ =C2=A0185.560000] UBI error: ubi_attach_mtd_dev: failed to attach mtd1,=
 error
> -22
> ubiattach: error!: cannot attach mtd1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error 22 (Invalid argument)
>
>
> -Subodh Nijsure
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
