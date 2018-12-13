Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPKC-0000Hx-8X
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 11:38:41 +0000
From: Richard Weinberger <richard@nod.at>
To: Martin Lund <martin.lund@keep-it-simple.com>
Cc: takei744@oki.com, linux-mtd@lists.infradead.org
Subject: Re: Questions about ubifs,ubi and mtd?
Date: Thu, 13 Dec 2018 12:38:27 +0100
Message-ID: <3057355.peyXOFjNrj@blindfold>
In-Reply-To: <CAB7pii3ayyPK=trs=wV_Egs+Lt1GMMeh_g_=D82MNefgqqE00A@mail.gmail.com>
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <TY2PR01MB2700C1902D91862C39D966E79DA00@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <CAB7pii3ayyPK=trs=wV_Egs+Lt1GMMeh_g_=D82MNefgqqE00A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin,

Am Donnerstag, 13. Dezember 2018, 12:32:43 CET schrieb Martin Lund:
> On Thu, Dec 13, 2018 at 11:45 AM =E6=AD=A6=E4=BA=95 =E5=85=8B=E6=98=8E <t=
akei744@oki.com> wrote:
> >
> > Dear Richard,
> >
> > We appreciate your precious advice.
> > We understood the quality status of kernel 3.2.26.
> > From now on, we would like to backport from the latest UBI and UBIFS.
> > Do you think that it is enough to backport the next part?
> >  - drivers/mtd
> >  - drivers/mtd/ubi
> >  - fs/ubifs
> >
>=20
> I recommend you first take a close look at the git history of Linux
> 3.2.26 and onward to see if there are any immediate UBI/UBIFS fixes
> available that might relate/solve the issue you are seeing. It might
> be an easier path than jumping into a big task like back porting
> latest UBI/UBIFS to such an old kernel.

Given the age of this kernel it will be massive pain in any case.
Digging through the history, identifying and backporting fixes sounds
more easier than it actually is.
Small fixes often depend on larger patches which are hard to apply
to old kernels.

Thanks,
//richard=20
