Received: from zproxy.gmail.com ([64.233.162.192])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8c8G-0002fy-Bq
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 07:12:32 -0400
Received: by zproxy.gmail.com with SMTP id s18so299585nze
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Aug 2005 04:12:23 -0700 (PDT)
Message-ID: <82e4189c050826041230ec96fa@mail.gmail.com>
Date: Fri, 26 Aug 2005 16:12:23 +0500
From: Adil Hafeez <adilhafeez80@gmail.com>
To: tglx@linutronix.de
In-Reply-To: <1125054422.20120.153.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <82e4189c05082603546248689a@mail.gmail.com>
	<1125054422.20120.153.camel@tglx.tec.linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash erase wait time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks, Thomas.

I am using 2.4.20 kernel, with Linux MTD framework backported from 2.4.31.

The $id flash in cfi_cmdset_0002.c file is:

$Id: cfi_cmdset_0002.c,v 1.62 2003/01/24 23:30:13 dwmw2 Exp $

Adil

On 8/26/05, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Fri, 2005-08-26 at 15:54 +0500, Adil Hafeez wrote:
> > Was it really required to double check the polarity bit, or there are
> > some timeout timer issues with my mips port ?
>=20
> 1. We have no idea, which version of cfi_cmset_0002.c you are using.
> Please provide the $Id string on top of the file. The kernel version and
> the applied patches on top of this kernel.
>=20
> 2. If you send patches, read linux/Documentation/SubmittingPatches first
>=20
> 3 . From your patch:
>=20
> file: /home/embedded/linux-2.4.20_palmchip/drivers/mtd/chips/cfi_cmdset_0=
002.c,v
>=20
> Please read
> http://www.linux-mtd.infradead.org/source.html#kernelversions
>=20
> tglx
>=20
>=20
>
