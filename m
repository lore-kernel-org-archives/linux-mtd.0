Date: Tue, 19 Dec 2017 01:13:15 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Robert Jarzmik
 <robert.jarzmik@free.fr>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171219011315.2fa0f9d1@xps13>
In-Reply-To: <20171218215217.GA17755@1wt.eu>
References: <20171217162342.GA1833@1wt.eu> <20171217190746.2a61232c@bbrezillon>
 <20171217190056.GA1107@1wt.eu>
 <CAAEAJfArtxcWgcjHAb__3BQxWEBgWU8uWtHGYETc-m9eUs91nA@mail.gmail.com>
 <20171217211650.GA6815@1wt.eu> <20171217222611.59f9031b@bbrezillon>
 <20171217224617.1f9b8b84@xps13> <20171218063715.GA20461@1wt.eu>
 <20171218070617.GA16559@1wt.eu> <20171218112208.0057634d@xps13>
 <20171218215217.GA17755@1wt.eu>
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

Hi Willy,

On Mon, 18 Dec 2017 22:52:17 +0100
Willy Tarreau <w@1wt.eu> wrote:

> Hi Miquel,
>=20
> On Mon, Dec 18, 2017 at 11:22:08AM +0100, Miquel RAYNAL wrote:
> > I fixed two problems happening during read/write of 2kiB page NAND
> > chips, I am quite confident this would solve the issues you report
> > here. Could you please give it a try? =20
>=20
> So I just tested right now, and good news, it now works pretty fine
> here, and my jffs2 properly mounted (without requiring Boris' fix
> for oob)

Great! Thanks for testing.

Boris' fix wouldn't apply anyway as it was written for pxa3xx_nand.c
and here you are using marvell_nand.c and the code is really different.

>=20
> # dmesg|grep -i nand
> [    0.770395] nand: device found, Manufacturer ID: 0x01, Chip ID:
> 0xf1 [    0.775474] nand: AMD/Spansion S34ML01G2
> [    0.778103] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 64 [    0.794080] 10 ofpart partitions found on MTD
> device pxa3xx_nand-0 [    0.798975] Creating 10 MTD partitions on
> "pxa3xx_nand-0": [    3.245034] jffs2: version 2.2. (NAND) (SUMMARY)
> \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.
>=20
> I was first surprized seeing this "pxa3xx_nand-0" still appearing
> until I realized that it's how it's called in the device tree :-)

That is right, but if you create a DTS for your own board feel free to
change it, this is just a default name. Giving it some meaning (like
"main-storage" or "backup-storage") is how you could use this label.

Thanks again for your help, reviews or tested-by's are welcome for this
driver ;)

Miqu=C3=A8l
