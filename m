Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ecp2h-0004ox-0F
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 14:03:36 -0500
Received: by zproxy.gmail.com with SMTP id m22so2032728nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Nov 2005 11:03:29 -0800 (PST)
Message-ID: <6934efce0511171103y6cefe302u91c80dd60a8464ae@mail.gmail.com>
Date: Thu, 17 Nov 2005 11:03:29 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: dalomar@serrasold.com
In-Reply-To: <003c01c5e9dd$d57d9ab0$091a1bac@serra.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <003c01c5e9dd$d57d9ab0$091a1bac@serra.es>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mtd under kernel 2.6
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/05, Daniel Alomar <dalomar@serrasold.com> wrote:
> Hi,
>
> My name is Daniel Alomar, and I'm working in to an embedded linux (Coldfi=
re
> 5282) with mtd drivers. I have a problem, and I wonder if this list could
> help me.... (I hope).
>
> I'm trying to port a board from kernel 2.4 to 2.6. I'm using uClinux and
> with the 2.4 Kernel I have no problem to use the flash. (I have 8 Mb flas=
h.
> An Intel strata flash 28F640J3). I put my own device driver, but when I
> boot, my system doesn't detect the flash chip.
>
> This is my 2.4 output:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .....
> fec.c: Probe number 1 with 0x0000
> eth0: FEC ENET Version 0.2, 00:50:dd:00:4e:61
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> uclinux[mtd]: RAM probe address=3D0x11d4c8 size=3D0x208000
> uclinux[mtd]: root filesystem index=3D0
> avnet5282 flash device: 200000 at ff800000
> cfi_cmdset_0001: Erase suspend on write enabled
> Using buffer write method
> Creating 3 MTD partitions on "AVNET5282 flash device":
> 0x00000000-0x00040000 : "uboot (256 KB)"
> 0x00040000-0x00340000 : "kernel (3 MB)"
> 0x00340000-0x00800000 : "rootfs (4,75 MB)"
> ...
>
> And this my 2.6 output:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ...
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> eth%d: FEC ENET Version 0.2, 00:50:dd:00:2a:35
> PPP generic driver version 2.4.2
> FEC: No PHY device found.
> Using cfq io scheduler
> uclinux[mtd]: RAM probe address=3D0x14a180 size=3D0x218000
> Creating 1 MTD partitions on "RAM":
> 0x00000000-0x00218000 : "ROMfs"
> uclinux[mtd]: set ROMfs to be root filesystem
> MCF5282 flash device: 200000 at ff800000
> CFI: Found no SERRA 5282 flash device device at location zero
> NET: Registered protocol family
>
> It seems 2.6 can't detect my flash device, and uClinux creates the
> partition from the uclinux.c instead the one from avnet5282.c. I can't
> understand why with 2.4 use the avnet5282.c partitions but with 2.6 use
> the uclinux.c one.
>
> Somebody have 2cents??
>
> Daniel Alomar i Claramonte
> Research & Development Electronic Dept.
> SERRA SOLDADURA, S.A.
> WEB Site: http://www.serrasold.com
> Knowledge Site: http://serratron.serrasold.com
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

Why is your kernel probing RAM?  Is avnet5282.c being compiled?
