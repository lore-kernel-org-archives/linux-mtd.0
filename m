Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JilYl-0001Wg-DX
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:14:32 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080407051259.GA3584@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron> <20080407051259.GA3584@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 10:13:49 +0300
Message-Id: <1207552429.8040.33.camel@sauron>
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

Hi,

On Mon, 2008-04-07 at 15:12 +1000, Hamish Moffatt wrote:
> Just to finish this old discussion, it's a 512Mb SLC part. ie not very
> big. I have tried UBIFS and I am very pleased with it. Performance is
> much better than JFFS2, which was slow to mount and slow during early
> reads (even when the image was processed with sumtool).

"Mb" looks like Maga-bit, is that right?


> I noticed that the on-chip format just changed (nanoseconds etc). Do you
> plan any more incompatible changes? This is the sort of maturity issue I
> was worried about.

Well, we will try not to change it anymore, but we cannot guarantee this
so far. That particular change was requested by LKML. We may have more
requests - we want to get into the mainline.

But if we'll have users who may be hurt by the changes, we may try
provide a program to convert the media formats.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
