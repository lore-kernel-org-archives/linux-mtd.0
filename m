Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eth8u-0002OV-TO
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 22:02:39 +0000
From: Richard Weinberger <richard@nod.at>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: boris.brezillon@free-electrons.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] mtd: nand: Added spaces around ('=' and '<')
Date: Wed, 07 Mar 2018 23:03:53 +0100
Message-ID: <4005910.RbgyVDuFdx@blindfold>
In-Reply-To: <CA+XqjF-2K48uEPHhgoH4K+4X0Gnr=S3VaG4-VeZ9urfsNEf3QQ@mail.gmail.com>
References: <20180303140233.GA9634@seema-Inspiron-15-3567>
 <2872216.aoWXzO2rYL@blindfold>
 <CA+XqjF-2K48uEPHhgoH4K+4X0Gnr=S3VaG4-VeZ9urfsNEf3QQ@mail.gmail.com>
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

Arushi,

Am Mittwoch, 7. M=E4rz 2018, 16:38:50 CET schrieb Arushi Singhal:
> On Mon, Mar 5, 2018 at 9:12 PM, Richard Weinberger <richard@nod.at> wrote:
> > Arushi Singhal,
> >=20
> > Am Samstag, 3. M=E4rz 2018, 15:02:33 CET schrieb Arushi Singhal:
> > > Add spaces around ('=3D' and '<'),  to conform to the Linux
> > > kernel coding style. Issue found using checkpatch.
> >=20
> > please fix real issues. Coding style fixes to existing code just add too
> > much
> > churn. Except for drivers/staging/.
>=20
> Hello Richard
> Thanks for explaining,
>=20
> > If you're looking for a small MTD related project, I can offer the
> > following.
> > Cleanup all ubi_assert()s in drivers/mtd/ubi/.
> > Some of them need to be transformed into a meaningful warning/error
> > message,
> > others into a hard error, such as WARN_ON().
> > Review/understand every ubi_assert() and convert it.
>=20
> Before doing this task, I read about this discussion (
> http://lists.infradead.org/pipermail/linux-mtd/2014-November/056352.html =
).
> In this discussion it is decided to split ubi_assert() into two different
> functions, BUG_ON() and WARN_ON(). Even some of the asserts can be removed
> too.

Very good! You managed to exhume my forgotten TODOs. ;-)

One comment on BUG_ON(), we have to make very sure that it is not user=20
trigger-able.

Thanks,
//richard =20
