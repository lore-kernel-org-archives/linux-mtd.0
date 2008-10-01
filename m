Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kkudo-0006fj-Uv
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 05:52:53 +0000
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
In-Reply-To: <A51468EF349E43489C7D33B47B8A3A24@sisodomain.com>
References: <30508484.52991221827822859.JavaMail.weblogic@epml16>
	<9c9fda240809212333n76fa6cc6jbf1025f4f272d3f4@mail.gmail.com>
	<001101c9222e$1914e6d0$3dd66c6b@sisodomain.com>
	<e8775dd00809300507l44ccb38dg1dff2fb6edc7641a@mail.gmail.com>
	<A51468EF349E43489C7D33B47B8A3A24@sisodomain.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 01 Oct 2008 08:52:12 +0300
Message-Id: <1222840332.8051.26.camel@sauron>
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

Hi,

On Wed, 2008-10-01 at 09:07 +0530, Amit Kumar Sharma wrote:
> We are also facing many difficulty in robustness and=20
> reliability test with Jffs2 not only this we have tested our=20
> MLC patches on kernel 2.6.22 their Jffs2 stability was=20
> little bit higher as compare to  2.6.27 , not only this LTP=20
> file tests and rw test fails with Jffs2 and same driver=20
> works fine with yaffs2 but yaffs2 also has issue with=20
> Symlink operation  we are working for that.

Have you tries UBIFS?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
