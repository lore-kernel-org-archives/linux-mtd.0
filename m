Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jiqj4-0005pn-5f
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 12:45:30 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080407122253.GA12359@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron> <20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron> <20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron> <20080407112010.GA8942@cloud.net.au>
	<1207570534.8040.94.camel@sauron> <20080407122253.GA12359@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 15:44:19 +0300
Message-Id: <1207572259.8040.107.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-07 at 22:22 +1000, Hamish Moffatt wrote:
> My idea is that you can "ubiupdatevol /dev/ubi0_0 myimage.gz", which
> ubiupdatevol would decompress on the fly. You could decompress it
> somewhere first but it may not fit in RAM (and writing it to flash
> temporarily would be slower).

So you want some kind of "live" updates? You have your device which is
running. And you want to update one of your UBI volumes. You copy the
update image to the device and want to use ubiupdatevol to put it to the
volume.

How do you copy the file? If you have network connection, may be you
could teach ubifs to take the image from the network? dwmw2 also
recently added an utility to mtd-utils.git which _seems_ to be doing
this, so you could teach it to update the volume which should be very
easy (see recv_image and serve_image in mtd-utils.git).

> Looking at the code I see the main issue is that you need to know the
> file size before you start updating.
Yeah, that is right. This is what UBI update ictl expects. But probably
gzip has this info somewhere in its meta-data.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
