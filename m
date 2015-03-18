Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYHVM-0004Ro-Il
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 17:11:41 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Andrea Marson <andrea.marson@dave.eu>
Subject: RE: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest,
 Vol 144, Issue 70)
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973EA09@NTXBOIMBX03.micron.com>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu> <20150318100645.1babecfd@bbrezillon>
 <55096A75.8080207@nod.at>
In-Reply-To: <55096A75.8080207@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 18 Mar 2015 17:11:46 -0000

Disturb is a block level affect, but in operation data is often layout in c=
ontinuous blocks, so if one block is seeing a lot of reads or P/E cycles, t=
here's a high probability the blocks around it are also seeing very similar=
 read and P/E patterns.=20



Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit



-----Original Message-----
From: Richard Weinberger [mailto:richard@nod.at]=20
Sent: Wednesday, March 18, 2015 5:07 AM
To: Boris Brezillon; Andrea Marson
Cc: Jeff Lauruhn (jlauruhn); linux-mtd@lists.infradead.org; Andrea Scian; d=
edekind1@gmail.com
Subject: Re: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest=
, Vol 144, Issue 70)

Am 18.03.2015 um 10:06 schrieb Boris Brezillon:
>> 1) IIUC read/program disturb effects exhibit at block level.
>> In a typical embedded linux systems there are software parts -=20
>> bootloader, kernel image etc. - that virtually are never changed=20
>> (almost
>> ...) but are read many times. Other parts - application libraries,=20
>> log files etc. - are read and wrote many times instead.
>> If these two kinds of software are stored in different MTD partitions=20
>> - ket's say partition A for bootloader, kernel etc. and partition B=20
>> for application libraries, log files etc. - can we say that=20
>> read/write operations performed on partition B have no disturb effects o=
n partition A?
>=20
> AFAIK, read/write disturb effects only occur on pages of the same=20
> block, so we shouldn't see bitflips on partition A caused by=20
> read/write on partition B.

I already saw corruptions on nearby blocks but I'm not sure if really plain=
 read disturb was the root cause as this NAND chips showed in general funny=
 symptoms.

Jeff, can you tell us more?

Thanks,
//richard
