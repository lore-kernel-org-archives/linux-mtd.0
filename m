Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj7xJ-0007bj-Go
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 07:09:21 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080407073227.GA6317@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron> <20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron> <20080407073227.GA6317@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Apr 2008 10:07:57 +0300
Message-Id: <1207638477.8040.114.camel@sauron>
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

On Mon, 2008-04-07 at 17:32 +1000, Hamish Moffatt wrote:
> which is fine. Although if there was any way to speed it up I would be
> interested, particularly the UBI attach time.

One more thing I could suggest is profiling UBI - this may help
improving it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
