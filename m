Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JiqHP-00029t-8x
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 12:16:55 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <1207570534.8040.94.camel@sauron>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron> <20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron> <20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron> <20080407112010.GA8942@cloud.net.au>
	<1207570534.8040.94.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 15:16:24 +0300
Message-Id: <1207570584.8040.96.camel@sauron>
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

On Mon, 2008-04-07 at 15:15 +0300, Artem Bityutskiy wrote:
> Well, NAND allows reading it PAGE_SIZE units. So it reads whole page.
OH, what do I tell. It allows to read in NAND page size units of course.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
