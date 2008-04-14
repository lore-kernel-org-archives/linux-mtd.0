Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlOrO-0008AH-KA
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 13:36:39 +0000
Subject: Re: NAND: Verify probe by retrying to checking the results match
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ben Dooks <ben-linux@fluff.org>
In-Reply-To: <20080414131603.950238663@fluff.org.uk>
References: <20080414131603.950238663@fluff.org.uk>
Content-Type: text/plain; charset=utf-8
Date: Mon, 14 Apr 2008 16:33:47 +0300
Message-Id: <1208180027.5965.212.camel@sauron>
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

On Mon, 2008-04-14 at 14:16 +0100, Ben Dooks wrote:
> With modern systems using bus-hold instead of bus pull-up, it can
> often lead to erroneous reporting of NAND devices where there are
> none. Do a double probe to ensure that the result we got the first
> time is repeatable, and if it is not then return that there is no
> chip there.
>=20
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Could you please put the same comment to the code, to make it easier for
the curious code reader understand why is the second read?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
