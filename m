Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMrQR-0003j4-8S
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 23:12:32 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: twebb <taliaferro62@gmail.com>
Date: Mon, 21 Dec 2009 15:12:20 -0800
Subject: RE: UBI - exclude bootloader blocks from wear levelling
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFC175CF@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
	<dbdb2ea60912211451vda39800t803891a2acf9528a@mail.gmail.com>
In-Reply-To: <dbdb2ea60912211451vda39800t803891a2acf9528a@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lauren Del Giudice <lauren@wyplay.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My understanding is that wear levelling occurs across each ubi device, and =
if there were 4 volumes on it, then the wear levelling would be spread effi=
ciently over the single large device. Then you probably get better wear lev=
elling than if you had 4 smaller devices and 4 volumes.=20

I'm guessing that statistically it is better to wear level across as large =
a device as possible, since the wearing would be shared among many more blo=
cks and all logical volumes reap the benefit.

A small device/volume with heavy activity would wear itself out quicker tha=
n if it were part of a larger management scheme.

Of course, having separate mtd partitions may make sense for other reasons.

Darwin

-----Original Message-----
From: twebb [mailto:taliaferro62@gmail.com]=20
Sent: Monday, December 21, 2009 2:52 PM
To: Darwin Rambo
Cc: Lauren Del Giudice; linux-mtd@lists.infradead.org
Subject: Re: UBI - exclude bootloader blocks from wear levelling

> Wear levelling is done across a "ubi device" (not the whole nand device) =
which is associated with a mtd partition. Your bootloader and kernel mtd pa=
rtitions will not be wear levelled, only your ubi file system partitions. i=
.e. ubi doesn't know about non-ubi mtd partitions.
>
> I think that's the gist of it.
>
> Darwin
>

That's my understanding also.

Could you maybe clarify another point?  If I wanted to exclude some
blocks that contain boot code (like Lauren's question), and the
leftover space on the NAND device was ultimately going to be used for
four different volumes, does it make the most sense to...

a) define one MTD partition that includes all NAND space (except the
blocks reserved for boot code); and then define one UBI device that
attaches to the MTD device and includes the four volumes (ubi0_0,
ubi0_1, ubi0_2, ubi0_3)

OR

b) define four MTD partitions that include all NAND space (except the
blocks reserved for boot code); and then define four UBI devices that
attach to the MTD devices and each UBI device has one volume
associated with it (ubi0_0, ubi1_0, ubi2_0, ubi3_0)?

Thanks,
twebb
