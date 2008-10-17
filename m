Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqn92-0004YC-Qd
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 11:05:25 +0000
Subject: Re: nandwrite/ubi memory corruption?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ben Dooks <ben-linux@fluff.org>
In-Reply-To: <20081016215616.GE22711@trinity.fluff.org>
References: <48F71315.5080707@logix.net.nz>
	<20081016150135.GA11063@fluff.org.uk> <48F7B59D.9000200@logix.net.nz>
	<20081016215616.GE22711@trinity.fluff.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 17 Oct 2008 14:03:54 +0300
Message-Id: <1224241434.4466.13.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Michal Ludvig <mludvig@logix.net.nz>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-10-16 at 22:56 +0100, Ben Dooks wrote:
> there should be a Kconfig entry to do it when the s3c2410 nand driver
> is selected.

Ben,

is that right that s3c2410-nand does not support sub-pages?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
