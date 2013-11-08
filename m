Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VegGv-0004YD-71
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 07:14:26 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH 2/2] mtd: cmdlinepart: use cmdline partition parser lib
Date: Fri, 8 Nov 2013 07:13:21 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F1C08B2A8@szxeml512-mbs.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F1C0643B8@szxeml512-mbx.china.huawei.com>
 <20131020120603.GA18678@localhost>
 <C3050A4DBA34F345975765E43127F10F1C084C81@szxeml512-mbs.china.huawei.com>
 <20131105144328.fb5a6a1d423776b324771706@linux-foundation.org>
 <CAN8TOE8CoSsUSGaLG5Z_-xVLhhnm052Hp2Rqzs3Hr3cU8Lp-8g@mail.gmail.com>
In-Reply-To: <CAN8TOE8CoSsUSGaLG5Z_-xVLhhnm052Hp2Rqzs3Hr3cU8Lp-8g@mail.gmail.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Shmulik
 Ladkani <shmulik.ladkani@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Nobody has had time to test this on MTD, it seems, and as such, I
> strongly recommend you do not force it through -mm. We are perfectly
> capable of merging it through the MTD tree if it ever gets proper
> vetting by people in MTD (not just on block devices), and I am well
> aware of this patch set's existence.
>=20
> However, the patch really provides little to no benefit to the MTD
> subsystem at the moment, at the added cost of reviewing the small
> differences in parsing. For some reason, Cai decided to make small
> differences in the parser between drivers/mtd/cmdlinepart.c and
> block/cmdline-parser.c, and it is not obvious that these differences
> retain the same parsing. For instance, according to my code
> read-through, the block device parser seems to accept multiple
> partitions to be specified with "-" (meaning "fill the remaining
> device"). MTD already has code that rejects such a parser string
> outright.

The next '-' partition be ignore at function "cmdline_parts_set", and the c=
lient will get a right result.
Is there any other worry about '-' I don't know ?

>=20
> So, I'd recommend one of the following:
> (1) We (MTD users) make more time to properly test this patch and post
> relevant results (i.e., tested partition strings) or
> (2) Somebody (Cai?) spend time to actually make block/cmdline-parser.c
> fully equivalent to the parser in drivers/mtd/cmdlinepart.c. That
> means it should be trivial to compare the two and say "yes, these are
> equivalent". That is currently not the case, AFAICT.

I understand your worry about, we use cmdlinepart many years.
I will spend time to make block/cmdline-parser.c fully equivalent to the
parser in drivers/mtd/cmdlinepart.c.

>=20
> Without one of those two, I will give my NAK.
>=20
> Brian
