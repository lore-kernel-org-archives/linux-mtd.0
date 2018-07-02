Received: from mail1.bemta24.messagelabs.com ([67.219.250.112])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZp3Z-0006Jd-B9
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 02:59:15 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Greg KH
 <gregkh@linuxfoundation.org>
CC: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "stable-commits@vger.kernel.org" <stable-commits@vger.kernel.org>
Subject: RE: Patch "mtd: cfi_cmdset_0002: Change erase functions to retry for
 error" has been added to the 4.17-stable tree
Date: Mon, 2 Jul 2018 02:58:58 +0000
Message-ID: <TY1PR01MB0954A71DC52090DB84576889DC430@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <1530439761164133@kroah.com>	<20180701102205.GA30410@kroah.com>
 <20180701153403.6ea52135@bbrezillon>
In-Reply-To: <20180701153403.6ea52135@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg-san and Boris-san,

Sorry for the error caused.
I have just sent the patches revised for the stable branches separately to =
Greg-san by git send-emal.
If you are okay please applied the patches.
  Note: The patch series includes the patch below already applied in stable=
-queue.git as PATCH 1/4.
          mtd-cfi_cmdset_0002-change-write-buffer-to-check-correct-value.pa=
tch

If any problem or concern please let me know.

Regards,
Ikegami

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Sunday, July 01, 2018 10:34 PM
> To: Greg KH
> Cc: Joakim.Tjernlund@infinera.com;
> boris.brezillon@free-electrons.com; PACKHAM Chris;
> computersforpeace@gmail.com; cyrille.pitchen@wedev4u.fr;
> dwmw2@infradead.org; IKEGAMI Tokunori; linux-mtd@lists.infradead.org;
> marek.vasut@gmail.com; richard@nod.at; stable-commits@vger.kernel.org
> Subject: Re: Patch "mtd: cfi_cmdset_0002: Change erase functions to
> retry for error" has been added to the 4.17-stable tree
>=20
> Hi Greg,
>=20
> On Sun, 1 Jul 2018 12:22:05 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
> > On Sun, Jul 01, 2018 at 12:09:21PM +0200, gregkh@linuxfoundation.org
> wrote:
> > >
> > > This is a note to let you know that I've just added the patch titled
> > >
> > >     mtd: cfi_cmdset_0002: Change erase functions to retry for error
> > >
> > > to the 4.17-stable tree which can be found at:
> > >
> http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable/stable-queue.gi
> t;a=3Dsummary
> >
> > Nope, this broke the build everywhere, so I've dropped it from all tree=
s
> > now.  If you want this backported, please provide a working version.
>=20
> That's not surprising, this patch depends on "mtd: cfi_cmdset_0002:
> Change definition naming to retry write" which did not apply cleanly on
> 4.17.
>=20
> To be honest, I was not convinced those 2 patches deserved to be
> backported to stable releases, but Joakim and Ikegami thought they were
> good candidate. I'll let Ikegami propose a revised version of those 2
> patches that apply cleanly on 4.17 if he wants.
>=20
> Sorry for the inconvenience.
>=20
> Regards,
>=20
> Boris
