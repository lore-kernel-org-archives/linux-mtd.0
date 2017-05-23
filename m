Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD2ML-0004Ha-GY
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 05:27:56 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: pxa3xx-nand failing to find device on linux-next
Date: Tue, 23 May 2017 05:27:25 +0000
Message-ID: <b36366e358904310aee4970b77f57dba@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=
=0A=
I'm doing some testing on linux-next and I'm finding that my nand flash =0A=
has disappeared.=0A=
=0A=
pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device=0A=
pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
On-die ECC forcefully enabled, not supported=0A=
nand: No NAND device found=0A=
pxa3xx-nand f10d0000.flash: failed to scan nand at cs 0=0A=
=0A=
This was working around 4.11. I'll try to do some more digging tomorrow =0A=
to narrow down a failure point but I thought I'd send this out now just =0A=
in case it rings any bells.=0A=
=0A=
The board I'm using (DB-88F6820-AMC) is unfortunately out-of tree but it =
=0A=
should be pretty close to the armada-388-db. I can make my dts available =
=0A=
if it's helpful.=0A=
=0A=
Thanks,=0A=
Chris=0A=
