Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9Ya9-0006xz-5y
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 06:59:46 +0000
Date: Wed, 5 May 2010 08:59:37 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?iso-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>
Subject: Re: Some questions on bit-flips and JFFS2
In-Reply-To: <201005031505.18604.muehlfelder@enertex.de>
Message-ID: <Pine.LNX.4.64.1005050851070.22753@lnxricardw.se.axis.com>
References: <201005031505.18604.muehlfelder@enertex.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 3 May 2010, Thorsten M=FChlfelder wrote:

> PS: I could not reproduce the bit-flip problem. It just happens in rare c=
ases.
> Furthermore some of my devices are using Samsung NAND instead of the Micr=
on
> NAND and did not show any problems yet. So perhaps my problem are just so=
me
> bad NAND chip? But still I have to find a solution for the problem.

In our experience, which is limited to 32 MiB and 128 MiB SLC flashes,=20
Micron, Hynix and Numonyx have much worse bit read error rates that=20
Samsung and Toshiba, even though the data sheets hint at the same level of=
=20
data integrity. We made some random tests, reading again and again from=20
the same flash partition, and the first group above tended to show=20
uncorrectable ECC errors already after less than a million reads, whereas=
=20
the second group showed only single-bit errors even after 20 or even 60=20
million reads.

Of course, reading that many times from a flash partition, especially a=20
boot partition, is hardly realistic, but in our experience, it simulates=20
quite well the situation of a having a seldom-read boot partition in a=20
flash where there is activity going on in other parts of the flash, i.e.=20
an embedded system where a single flash chip provides all non-volatile=20
storage, over a long period of time.

Of course these are random samples only, but they've been very consistent=
=20
so far. Lately a new batch of Numonyx 128 MiB flashes arrived which seem=20
to have better error rates. One can speculate as to why but I'll leave=20
that discussion off this mailing list.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
