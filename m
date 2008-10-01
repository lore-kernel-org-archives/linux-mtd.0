Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkyNk-0001XF-Q7
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 09:52:33 +0000
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
In-Reply-To: <345B25C679EA4DFBB90BA8B29B1BCC14@sisodomain.com>
References: <30508484.52991221827822859.JavaMail.weblogic@epml16>
	<9c9fda240809212333n76fa6cc6jbf1025f4f272d3f4@mail.gmail.com>
	<001101c9222e$1914e6d0$3dd66c6b@sisodomain.com>
	<e8775dd00809300507l44ccb38dg1dff2fb6edc7641a@mail.gmail.com>
	<A51468EF349E43489C7D33B47B8A3A24@sisodomain.com>
	<1222840332.8051.26.camel@sauron>
	<345B25C679EA4DFBB90BA8B29B1BCC14@sisodomain.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 01 Oct 2008 12:52:08 +0300
Message-Id: <1222854728.8051.35.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Jason Liu <liu.h.jason@gmail.com>, apgmoorthy <moorthy.apg@samsung.com>,
	Kyungmin Park <kmpark@infradead.org>, David.Woodhouse@intel.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-10-01 at 15:14 +0530, Amit Kumar Sharma wrote:
> no we have started working for UBIFS , very soon we will=20
> start working for UBIFS , let u know results.

Note, JFFS2 is not really suitable for MLC because it has
random wear-leveling algorithm, and it may erase one eraseblock
thousands of times, while erasing the other eraseblock only hundreds of
times.

In UBI you may set the WL threshold to control this. Also, JFFS2
does not really help with read-disturb problem, but this is fixable.

UBI refreshes data when it meets a bit-flip.

However, UBIFS is not really ready to handle this paired page problem.
I mean, in MLC, if you interrupt power during write operation, this
may result in corruptions in one of the previous NAND page. The only
simple way to fix this is to make UBIFS assume that min. I/O unit size
is not one NAND page, but several pages, so that both paired NAND pages
were in one min. I/O unit.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
