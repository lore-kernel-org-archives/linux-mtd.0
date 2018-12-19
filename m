Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZcfk-0003No-6w
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 14:18:05 +0000
Date: Wed, 19 Dec 2018 15:17:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, "Bean Huo (beanhuo)"
 <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Message-ID: <20181219151751.74931b39@xps13>
In-Reply-To: <SN6PR08MB502421AE43E6824C3CC5C1E4CBBE0@SN6PR08MB5024.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20181219141732.3e09bdc9@bbrezillon>
 <SN6PR08MB502421AE43E6824C3CC5C1E4CBBE0@SN6PR08MB5024.namprd08.prod.outlook.com>
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

Hi Zoltan,

"Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com> wrote on
Wed, 19 Dec 2018 13:59:49 +0000:

> Boris,
>=20
> Are there  non UBI/UBIFS cases?
> Can you please be specific?

UBI is one user of MTD.

What about direct accesses to MTD devices? Squashfs?

In any case, I don't think it is exaggerated to say that Linux has been
built on "layering". This issue is NAND chip specific, hence must be
handled at the NAND core level. In the NAND erase path I would like to
see a call to a vendor specific hook that:
1/ checks if the part is affected by comparing its ID to a list,
2/ if yes, checks if the block must be filled before erasing.

The logic of 1/ and 2/ should probably reside in
drivers/mtd/nand/raw/nand_micron.c


Thanks,
Miqu=C3=A8l
