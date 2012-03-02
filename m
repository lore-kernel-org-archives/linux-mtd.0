Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3W6w-0002Hq-Um
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 17:17:44 +0000
Received: by iaky10 with SMTP id y10so3066602iak.36
 for <linux-mtd@lists.infradead.org>; Fri, 02 Mar 2012 09:17:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F50F2AB.10209@flatfrog.com>
References: <4F50F2AB.10209@flatfrog.com>
Date: Fri, 2 Mar 2012 19:17:40 +0200
Message-ID: <CANOLnOM6X=29r7_aMs=z4eiDtw0kvWZ-jSeds_NO0KdZ3E8Ouw@mail.gmail.com>
Subject: Re: Spurious ECC errors with mtd_subpagetest (OMAP3, NAND)
From: Grazvydas Ignotas <notasas@gmail.com>
To: Orjan Friberg <of@flatfrog.com>
Content-Type: text/plain; charset=UTF-8
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

Hello,

On Fri, Mar 2, 2012 at 6:17 PM, Orjan Friberg <of@flatfrog.com> wrote:
> When running the mtd_subpagetest I'm seeing more or less spurious ECC
> corrections. =C2=A0I.e., one round may show 4 corrections and the next wi=
ll show
> 7, only some of which are the same as the previous 4.
>
> Are the ECC errors expected to be that volatile and frequent?
>
>
> I've seen various discussions regarding the OMAP sub page support, as wel=
l
> as problems with the GPMC prefetch engine. =C2=A0Disabling both made no
> difference regarding this. =C2=A0I've also tried two different sets of NA=
ND
> timings (relaxed and optimized), with no difference.
>
> I'm using a Micron NAND that requires 4-bit ECC correction but I'm runnin=
g
> with only 1-bit (software) ECC. =C2=A0This is on an old kernel, 2.6.32.

IIRC NAND in mainline was broken for very long time on OMAP3, I think
it was only fixed in 2.6.39.1.

--=20
Gra=C5=BEvydas
