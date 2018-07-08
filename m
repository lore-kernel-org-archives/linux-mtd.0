Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHsx-0004rP-4l
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 22:10:29 +0000
Date: Mon, 9 Jul 2018 00:10:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mtd: rawnand: marvell: add suspend and resume hooks
Message-ID: <20180709001014.1f725add@xps13>
In-Reply-To: <4a3d847e-16c4-f53a-1e36-7f891823a0ba@zonque.org>
References: <20180707064631.799-1-daniel@zonque.org>
 <20180708140439.75170f37@xps13>
 <4a3d847e-16c4-f53a-1e36-7f891823a0ba@zonque.org>
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

Hi Daniel,

Daniel Mack <daniel@zonque.org> wrote on Sun, 8 Jul 2018 22:13:36 +0200:

> On Sunday, July 08, 2018 02:04 PM, Miquel Raynal wrote:
> > Do you mind if I apply all the patches to nand/next? This fix will only
> > appear in mainline after the merge window (in a few weeks). Otherwise
> > I'll have to apply patches 2 and 3 for the next-next-release
> > (supposedly 4.20). =20
>=20
> I don't quite understand the options, but the thing that's important for =
me is that 1/3 lands for 4.19. I don't care for the other two really, as th=
ey have no functional impact.

Usually, accepted fixes are part of a specific pull request that can be
sent at any time during the -rc's cycles, this is the fixes branch.
Otherwise, for regular patches (or "features"), only one pull request
is sent at the time of the merge window, this is the "next" branch.

Fixes are based on the last -rc while features are usually based only
on -rc1. Problem is, when a fix and another change are done on the
same code section, this would produce a merge conflict in Linus's
tree. To avoid it, two solutions:
- take all the patches (including non-urgent fixes) in the -next branch
- rebase/merge the -rc that contains the fix before applying the other
  patches.=20

In this case, series applied to nand/next (will be out for 4.19).

Thanks,
Miqu=C3=A8l
