Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoLPf-0003hy-3j
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 16:32:11 +0000
Subject: Re: ubi-utils
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804210449w14e75e0wf977815c22423358@mail.gmail.com>
References: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
	<1208769345.5965.363.camel@sauron>
	<bae050c10804210243l848eeb6m97a33c5a65d5dfc6@mail.gmail.com>
	<1208776123.5965.367.camel@sauron>
	<bae050c10804210449w14e75e0wf977815c22423358@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 22 Apr 2008 19:30:52 +0300
Message-Id: <1208881852.11721.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2008-04-21 at 19:49 +0800, Nancy wrote:
> Yes, its input file is ubi image.
> Where is the old ubi-utils' user manual? At least, hope the code
> producer give those tools' usage examples and briefly tell those
> tools' function. Thanks in advance!

I think there is no manual, sorry.

> Ok, so I have to build this tool by myself. Cause there's no tools
> like mkfs.ubifs for vfat filesystem. That's the only way to generate a
> image file the same format like the ubifs.img and all those images can
> be integrated by ubinize to generate a final ubi image file, then
> nandwrite to complete the Nand flash burn job.

I do not know how you are going to make FAT work on your MLC flash. But
if you can do this, and you can somehow create proper image, then yes,
ubinize has no problems making the image.

> Or, I make all UBIFS volumes in one MTD partition, VFAT as the only
> volume in another MTD partition, attache two MTD partition to UBI.
> Then I do not need to write any tools, but use traditional nandread,
> nandwrite(fixed FF) for VFAT. How about this? Does attach 2 MTD
> partition as 2 UBI devices eat system resources a lot? slow down the
> Nand read or write speed?

Not exactly sure what you mean. But UBI should be fine with attaching 2
MTD devices.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
