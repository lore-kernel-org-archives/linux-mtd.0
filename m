Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kkb8O-0007sh-6K
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 09:03:09 +0000
Subject: Re: What is in ubifs-2.6.git
From: Artem Bityutskiy <dedekind@infradead.org>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
In-Reply-To: <EC8994007A40495FA924271106803A63@sisodomain.com>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
	<EC8994007A40495FA924271106803A63@sisodomain.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Sep 2008 12:02:43 +0300
Message-Id: <1222765363.8051.10.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Adrian Hunter <ext-adrian.hunter@nokia.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2008-09-30 at 14:25 +0530, Amit Kumar Sharma wrote:
> Hi Artem
>=20
> OneNAND can support for full block read also in sync burst=20
> block read mode ,so why u want to limit bulk read only for 4=20
> pages , with sync burst enable u can read max 64 pages.
> so in place of max 4 pages , u can set max to 64 it will be=20
> improve performance if sync burst mode is upported.

Actually UBIFS reads up to whole eraseblock. So if you have
a file, and it is resided in consecutive NAND pages of an
eraseblock, and UBIFS has decided to do read-ahead, it would
read whole eraseblock. So for OneNAND, indeed UBIFS may read
up to 64 NAND pages at one go.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
