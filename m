Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH42y-0006KL-Lb
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 09:41:22 +0000
Date: Mon, 29 Oct 2018 10:40:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org
Subject: Re: FIX Re: GPMI IMX6ull timeout on dma
Message-ID: <20181029104057.30428a2a@xps13>
In-Reply-To: <CAOf5uwnPnh3ZP932BGJkb_u10-WHwmq5srKaLdKbcFqs4A6mXg@mail.gmail.com>
References: <CAOf5uwku9Nx5-5h77yCtYwNxKHfZSfD+Dk3Fe41Ry45Lf+MdNw@mail.gmail.com>
 <CAOf5uwmZkjF1Xp8vekBYnuBZZJhYk+n+=K7QW_8MAJJ6gw5xWw@mail.gmail.com>
 <CAOf5uwnPnh3ZP932BGJkb_u10-WHwmq5srKaLdKbcFqs4A6mXg@mail.gmail.com>
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

Hi Michael,

Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
Fri, 5 Oct 2018 12:32:18 +0200:

> Hi Boris
>=20
> I have reverted for now
>=20
> Revert "mtd: rawnand: gpmi: support ->setup_data_interface()"
> This reverts commit 76e1a0086a0c3276b384f77905345e0fcc886fdd.
>=20
> Revert "mtd: rawnand: gpmi: use core timings instead of an empirical
> derivation"
> This reverts commit b1206122069aadabe1a8c50789277a978aaa4df7.

Sorry for the delay, I've been very busy lately.

Please also Cc: me in your e-mails to the MTD ML.

AFAIR I'm the author of these patches so I would like to understand and
fix what's wrong there. As a start, can you discriminate which patch
actually makes the timings inconsistent? Are you ready to do more
testing to find what's wrong?


Thanks,
Miqu=C3=A8l
