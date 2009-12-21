Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMr6P-0000qX-0q
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 22:51:49 +0000
Received: by ewy23 with SMTP id 23so5001700ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 14:51:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
Date: Mon, 21 Dec 2009 17:51:43 -0500
Message-ID: <dbdb2ea60912211451vda39800t803891a2acf9528a@mail.gmail.com>
Subject: Re: UBI - exclude bootloader blocks from wear levelling
From: twebb <taliaferro62@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1
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
