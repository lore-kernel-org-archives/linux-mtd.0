Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVgTV-0008LI-JH
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2010 08:24:38 +0000
Received: by wwb17 with SMTP id 17so6570596wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Dec 2010 00:24:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
References: <ActfCy0cZc3bW9yIT5u5fx8oZO9GQw==>
	<2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
Date: Thu, 23 Dec 2010 16:24:35 +0800
Message-ID: <AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
Subject: Re: Issue : jffs2 and ecc layout
From: Ming Lei <tom.leiming@gmail.com>
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2010/9/28 Ghorai, Sukumar <s-ghorai@ti.com>:
> Hi,
> I was using the following ecc layout which is not working to mount the jf=
fs2 File-system. I was in 2.6.32 kernel and working; but same layout is not=
 working with latest 2.6 kernel.
>
> Observation is that - no read request issued to the driver (say omap2.c).
>
> # mount -t jffs2 /dev/mtdblock4 /mnt/nand
> [=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 bytes,=
 read 0 bytes, error -22
> mount: Mounting /dev/mtdblock4 on /mnt/nand failed: Input/output error

I meet the issue too, kernel is  2.6.37-rc6-next-20101217+, and board is
beagle B5.

Is there any way to fix or workaround the issue?


thanks,
--=20
Lei Ming
