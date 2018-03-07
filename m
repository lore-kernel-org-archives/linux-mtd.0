Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etTzi-0003ai-0s
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 08:00:20 +0000
From: Richard Weinberger <richard@nod.at>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com, tharvey@gateworks.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] ubi: Reject MLC NAND
Date: Wed, 07 Mar 2018 09:01:16 +0100
Message-ID: <6772577.AmT7QaWTNU@blindfold>
In-Reply-To: <20180306231805.GA28183@amd>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
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

Pavel,

Am Mittwoch, 7. M=E4rz 2018, 00:18:05 CET schrieb Pavel Machek:
> On Sat 2018-03-03 11:45:54, Richard Weinberger wrote:
> > While UBI and UBIFS seem to work at first sight with MLC NAND, you will
> > most likely lose all your data upon a power-cut or due to read/write
> > disturb.
> > In order to protect users from bad surprises, refuse to attach to MLC
> > NAND.
> >=20
> > Cc: stable@vger.kernel.org
>=20
> That sounds like _really_ bad idea for stable. All it does is it
> removes support for hardware that somehow works.

MLC is not supported and does not work. Full stop.
If someone manages to get it somehow work, either with hardware or software=
=20
hacks they are on their own.
Having it in stable is the only chance we have to get it into vendor kernel=
s.

All this patch does is representing the current state of UBI/UBIFS.

In the last months I got a way too much boards with MLC NAND on my desk whe=
re=20
UBIFS broke. Customers wished they had known before...

Thanks,
//richard
