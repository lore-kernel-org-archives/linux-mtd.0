Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1evOTk-00017n-LA
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 14:31:15 +0000
From: Richard Weinberger <richard@nod.at>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: use put_device() if device_register fail
Date: Mon, 12 Mar 2018 15:32:29 +0100
Message-ID: <3321429.TYNOhWIX1S@blindfold>
In-Reply-To: <4a280604-16f2-776b-d997-d5882af6fe35@gmail.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <3975609.gPYExXdWMR@blindfold>
 <4a280604-16f2-776b-d997-d5882af6fe35@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arvind,

Am Montag, 12. M=E4rz 2018, 06:51:24 CET schrieb Arvind Yadav:
> On Monday 12 March 2018 01:05 AM, Richard Weinberger wrote:
> > Am Freitag, 9. M=E4rz 2018, 11:50:47 CET schrieb Arvind Yadav:
> >> if device_register() returned an error! Always use put_device()
> >> to give up the reference initialized.
> >>=20
> >> Arvind Yadav (2):
> >>    [PATCH 1/2] mtd: use put_device() if device_register fail
> >>    [PATCH 2/2] mtd: ubi: use put_device() if device_register fail
> >=20
> > Uhh, this is not obvious. Does device_register() really always return w=
ith
> > a reference held in all (error) cases?
> >=20
> > Thanks,
> > //richard
>=20
> if device_register() returned an error! Always use put_device()
> to give up the reference initialized.(-- Please see the comment
> for device_register() ). put_device() is able to handle those case
> where it'll not return a reference.

You are right.

=46or both patches:
Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
