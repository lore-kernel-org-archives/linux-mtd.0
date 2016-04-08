Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoKQc-00031n-UM
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 00:37:39 +0000
Date: Fri, 8 Apr 2016 02:37:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org, Jacek Anaszewski <j.anaszewski@samsung.com>,
 linux-leds@vger.kernel.org
Subject: Re: nand-disk LED trigger: to remove, or not to remove
Message-ID: <20160408023713.181ffc4e@bbrezillon>
In-Reply-To: <20160406180316.GA11756@localhost>
References: <20160405195120.GA6111@laptop.cereza>
 <20160406180316.GA11756@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 Apr 2016 11:03:16 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Apr 05, 2016 at 04:51:20PM -0300, Ezequiel Garcia wrote:
> > Due to the way the 'nand-disk' LED trigger is implemented,
> > it currently does not work correctly for all NAND drivers.
> >=20
> > This is somewhat related to an old thread, where we discussed
> > the addition of an "mtd" LED trigger. See:
> >=20
> >   http://www.spinics.net/lists/linux-leds/msg01181.html
> >=20
> > My question is:
> >=20
> >  * given that nobody has complained about "nand-disk"
> >    working on just some NAND drivers, and...
> >  * given that nobody has complained (except that 2013 patch)
> >    about lacking a generic MTD LED trigger...
> >=20
> > Does it make any sense to have such a trigger at all?
> > In other words, should we simply get rid of "nand-disk" trigger?
>=20
> I don't have much opinion about the LED trigger, except that it'd be
> nice if it either worked consistently or was removed.
>=20
> > In case the answer is "We want to keep some LED trigger",
> > then here's a patch for you to f=CC=B6l=CC=B6a=CC=B6m=CC=B6e=CC=B6  rev=
iew:
> >=20
> > From 88c7102bb67056b443da323bd3e28b60aca948a2 Mon Sep 17 00:00:00 2001
> > From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > Date: Sat, 2 Apr 2016 18:35:50 -0300
> > Subject: [PATCH] leds: trigger: Introduce a MTD (NAND/NOR) trigger
> >=20
> > This commit introduces a MTD trigger for flash (NAND/NOR) device
> > activity. The implementation is copied from IDE disk.
> >=20
> > This deprecates the "nand-disk" LED trigger, but for backwards
> > compatibility, we still keep the "nand-disk" trigger around.
> >=20
> > The motivation for deprecating the "nand-disk" LED trigger is that
> > it only works for NAND drivers, whereas the "mtd" LED trigger
> > is more generic (in fact, "nand-disk" currently only works for
> > certain NAND drivers).
> >=20
> >   TODO: Measure how the trigger affects MTD I/O performance.
> >   It should be cheap because the blink is deferred, but still
> >   it makes sense to provide some hard numbers.
> >=20
> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>=20
> [...]
>=20
> Notably, your patch changes the behavior pretty significantly. Instead
> of triggering for individual NAND wait periods (very fine-grained) you
> only trigger for entire write/read/erase operations.

Hm, I don't think the blinking frequency can be considered a stable
ABI :-). Anyway, most of the time, read/write coming from FS are
done on a per-page basis (except for the UBI/UBIFS maintenance
operations), so it should pretty much match the existing behavior.

> That may be OK,
> especially if it's modelled after IDE.
>=20
> I'd also note that you missed a few APIs (e.g., mtd_{read,write}_oob()).

Yep, I forgot to mention that in my review.


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
