Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5qoK-0004b7-2B
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2014 05:57:12 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <shijie8@gmail.com>, Stefan Roese <sr@denx.de>
Subject: RE: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Date: Wed, 22 Jan 2014 05:56:42 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA68C53@DBDE04.ent.ti.com>
References: <1389089083-29694-1-git-send-email-sr@denx.de>
 <20140120190441.GJ8919@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
 <20140121155432.GA1416@gmail.com>
In-Reply-To: <20140121155432.GA1416@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shijie,

>From: Huang Shijie [mailto:shijie8@gmail.com]
>>On Tue, Jan 21, 2014 at 07:33:04AM +0000, Gupta, Pekon wrote:
[...]
>> But sincerely, why is Toshiba doing all this ?
>> It would hit them only, as their devices will lack support on mainline k=
ernels and u-boots.
>> (Or their customers would have to carry custom patches all along).
>> I tried convincing Toshiba to get their parts ONFI compliant, but they w=
ere too reluctant.
>In actullay, Toshiba has began to support the JEDEC standard now.
>
>see my patch set.
>
Hope you are referring to patch-set given at [1]
Thanks for pointing this out.. I missed it.

Yes, but your patch comment also mentions same issue with Toshiba NANDs=20
"	 Tested with Toshiba TH58TEG7DDKTA20(16K + 1280).
	(Unfortuately, this ECC info of its JEDEC parameter page is zero,
	 i hope toshiba can fix it in future.)"

So, I think the basic problem remains the same..=20
However, I let Stefan comment about it more, as his NAND part is different
from the one you tested.
=20
[1] http://lists.infradead.org/pipermail/linux-mtd/2013-December/051266.htm=
l

with regards, pekon
