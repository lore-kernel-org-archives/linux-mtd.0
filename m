From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>, Huang Shijie
 <shijie8@gmail.com>
Date: Mon, 29 Sep 2014 11:22:11 +1000
Subject: RE: [PATCH] mtd: nand: gpmi: add proper raw access support
Message-ID: <EACD232272DA4849B060F0828564D13B44955ABD82@ntcex01.corp.netcomm.com.au>
References: <1410339339-25561-1-git-send-email-boris.brezillon@free-electrons.com>
 <20140911120928.GA1585@localhost.localdomain>,
 <20140911143616.3ebb025a@bbrezillon>
In-Reply-To: <20140911143616.3ebb025a@bbrezillon>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mike Voytovich <mvoytovich@paypal.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Roy Lee <roylee@paypal.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 Sep 2014 22:36:16 +1000
Boris BREZILLON <boris.brezillon@free-electrons.com> wrote:
>=20
> Well, I don't know about freescale specific tools, but at least I have
> an example with mtd_nandbiterrs module.
> This module is assuming it can write only the data part of a NAND page
> without modifying the OOB area (see [1]), which in GPMI controller
> case is impossible because raw write function store the data as if
> there were no specific scheme, while there is one:
> (metadata + n x (data_chunk + ECC bytes) + remaining_bytes).
>=20

Hi Boris,


just as an aside, only the incremental bit errors test in nandbiterrs
positively requires raw data write.

The overwrite test (re-write the same page data repeatedly without
erase), only uses raw access because I was lazy. A normal ECC write
would do just as well.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended=20solely for the use of the individual =
or entity named above.  If you are not the intended recipient, be aware th=
at any disclosure, copying, distribution or use of the contents of this in=
formation is prohibited.  If you have received this communication in error=
, please notify me by telephone immediately.
______________________________________________________________________
