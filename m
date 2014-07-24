Received: from mail.aswsp.com ([193.34.35.150])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAFlp-00064l-VK
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 09:57:06 +0000
Date: Thu, 24 Jul 2014 11:56:50 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: nand: define struct nand_timings
Message-ID: <20140724115650.46cbb3cf@parrot.com>
In-Reply-To: <20140722141219.7f2c2890@bbrezillon>
References: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
 <1405064982-11456-2-git-send-email-boris.brezillon@free-electrons.com>
 <20140722120346.0f2d0e77@parrot.com>
 <20140722141219.7f2c2890@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Le Tue, 22 Jul 2014 14:12:19 +0200,
Boris BREZILLON <boris.brezillon@free-electrons.com> a =E9crit :

> Hi Matthieu
>=20
> On Tue, 22 Jul 2014 12:03:46 +0200
> Matthieu CASTET <matthieu.castet@parrot.com> wrote:
>=20
> > Hi,
> >=20
> >=20

> >=20
> > I did a similar patch [1] (that wasn't merged :( ), and I used reduced
> > timing info.
>=20
> I'm sorry it didn't make it to mainline, do you know why ?
For the omap part there was a gpmc code rewrite that conflict with the
patch.
For the mtd stuff, I don't know/remember (I think for was no reply).

> Could you point out where "reduced timing info" is defined in the ONFI
> specification ?
It is not defined on onfi.
This was more a simplification of timings in order to simplify the
driver side (avoid code duplication). Most controller allow to control
nRE and nWE pulse and the setup time.

Do you have drivers that use onfi timings ?
>=20
> >=20
> > I also have support for the omap driver
> > (http://article.gmane.org/gmane.linux.ports.arm.omap/88606/match=3D) and
> > a controller we use in our chip (not upstream).
>=20
> It should be pretty easy to convert the full timings list into a
> reduced one (actually, that's what your patch is doing), and you can
> thus port your work on top of these patches.
Yes I think an helper will be useful in order to help driver to use
these timings.
It can be a function that return the reduced version for a onfi mode
and edo support.

>=20
> Anyway, I'm not sure what you have in mind, but unless there is a strong
> reason to drop full timings in favor of reduced ones I'd like to
> keep them (even if this implies adding a new converter to get reduced
> timings list).
>=20
No problem. I have nothing special in mind. I hope this could give ideas
how to use the onfi timings in mtd drivers (understanding how to use
ONFI timings can be tricky).


Matthieu
