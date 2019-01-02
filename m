Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gegfr-0007Kv-PN
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2019 13:35:09 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>
Subject: RE: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 2 Jan 2019 13:34:46 +0000
Message-ID: <BYAPR08MB4533F6B79A8E2932F05778FCDB8C0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <2816846.emhzHigZ4F@blindfold>
 <BYAPR08MB4533FD42451BCEB47D46FEEDDBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <alpine.DEB.2.21.1812192323300.1651@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1812192323300.1651@nanos.tec.linutronix.de>
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

Hi, Thomas
Thanks for infor. I have backed from holiday, and been working on this from=
 now,
I will rebase my patch based on latest linux kernel version.

//bean huo

>On Wed, 19 Dec 2018, Bean Huo (beanhuo) wrote:
>>
>> As for the older UBIFS (eg, v4.2), there will result in attach
>> failure, but for the latest UBIFS, if I don't overwrite EC and VID
>> header, will this condition happen?
>
>v4.2 is a dead kernel. Nobody cares about that.
>
>The not so dead LTS kernels should have the UBIFS fixes backported because
>this problem can happen independent of the Micron specific issue. If the L=
TS
>kernels lack those backports, then they need to be done independent of thi=
s
>anyway.
>
>In general patches against the head of development are the proper way to g=
o.
>Backporting is a different problem and handled after the fixes have been
>established.
>
>Thanks,
>
>	tglx
