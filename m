Date: Mon, 18 Dec 2017 11:22:08 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Robert Jarzmik
 <robert.jarzmik@free.fr>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171218112208.0057634d@xps13>
In-Reply-To: <20171218070617.GA16559@1wt.eu>
References: <20171217150043.GA1403@1wt.eu>
 <CAAEAJfD47bGTSppEqcRszjAgBUjiCevmdYLKfsQTPYMcVu8VDA@mail.gmail.com>
 <20171217162342.GA1833@1wt.eu> <20171217190746.2a61232c@bbrezillon>
 <20171217190056.GA1107@1wt.eu>
 <CAAEAJfArtxcWgcjHAb__3BQxWEBgWU8uWtHGYETc-m9eUs91nA@mail.gmail.com>
 <20171217211650.GA6815@1wt.eu> <20171217222611.59f9031b@bbrezillon>
 <20171217224617.1f9b8b84@xps13> <20171218063715.GA20461@1wt.eu>
 <20171218070617.GA16559@1wt.eu>
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

Hello Willy,

On Mon, 18 Dec 2017 08:06:17 +0100
Willy Tarreau <w@1wt.eu> wrote:

> On Mon, Dec 18, 2017 at 07:37:15AM +0100, Willy Tarreau wrote:
> > > As Boris said, we would really welcome a test of this branch,
> > > because you almost have the same setup as Sean in the thread
> > > "pxa3xx: wait time out when scanning for bb" and I am running out
> > > of explanation for his problem unless it is related to U-Boot. So
> > > if you could try booting with and without the on-flash-bbt
> > > property and report whether it fails or not it would be of great
> > > help! =20
> >=20
> > Yes, I noticed your work mentionned in some of the threads I've read
> > during my troubleshooting session and considered giving it a try.
> > I'll probably do this next week-end. =20
>=20
> Finally I figured the test was quick enough and could help you, so I
> built and booted it, I'm getting this at boot :
>=20
> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal
> nand_bbt: error while writing BBT block -110
> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal
> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal
> nand_bbt: error -110 while marking block 1023 bad
> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal
> nand_bbt: error while writing BBT block -110
> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal
> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal

Thanks for testing.

I fixed two problems happening during read/write of 2kiB page NAND
chips, I am quite confident this would solve the issues you report
here. Could you please give it a try?

Same branch as before [1], just some more fixups! on it :)

Thank you,
Miqu=C3=A8l


[1] https://github.com/miquelraynal/linux/tree/marvell/nand-next/nfc
