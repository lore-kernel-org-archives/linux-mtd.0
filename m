Date: Tue, 30 Sep 2014 10:04:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: Re: [PATCH] mtd: nand: gpmi: add proper raw access support
Message-ID: <20140930100415.4834971d@bbrezillon>
In-Reply-To: <EACD232272DA4849B060F0828564D13B44955ABD82@ntcex01.corp.netcomm.com.au>
References: <1410339339-25561-1-git-send-email-boris.brezillon@free-electrons.com>
 <20140911120928.GA1585@localhost.localdomain>
 <20140911143616.3ebb025a@bbrezillon>
 <EACD232272DA4849B060F0828564D13B44955ABD82@ntcex01.corp.netcomm.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Mike Voytovich <mvoytovich@paypal.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Roy Lee <roylee@paypal.com>, Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iwo,

On Mon, 29 Sep 2014 11:22:11 +1000
Iwo Mergler <Iwo.Mergler@netcommwireless.com> wrote:

> On Thu, 11 Sep 2014 22:36:16 +1000
> Boris BREZILLON <boris.brezillon@free-electrons.com> wrote:
> >=20
> > Well, I don't know about freescale specific tools, but at least I have
> > an example with mtd_nandbiterrs module.
> > This module is assuming it can write only the data part of a NAND page
> > without modifying the OOB area (see [1]), which in GPMI controller
> > case is impossible because raw write function store the data as if
> > there were no specific scheme, while there is one:
> > (metadata + n x (data_chunk + ECC bytes) + remaining_bytes).
> >=20
>=20
> Hi Boris,
>=20
>=20
> just as an aside, only the incremental bit errors test in nandbiterrs
> positively requires raw data write.
>=20
> The overwrite test (re-write the same page data repeatedly without
> erase), only uses raw access because I was lazy. A normal ECC write
> would do just as well.

Okay.
Anyway, the test I'm really interested in is the incremental bit errors
test :-).

BTW, any reason you chose to implement this test/testsuite as a
module ?
=46rom my understanding (and tell me if I'm wrong) we could do the same
from user-space.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
