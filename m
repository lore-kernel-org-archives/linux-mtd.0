Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19l3qn-0004Or-Fo
	for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2003 10:47:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "\"David" =?ISO-8859-1?Q?M=FCller?= "(ELSOFT AG)\"" <d.mueller@elsoft.ch>
In-Reply-To: <3F336DA8.4040706@elsoft.ch>
References: <3F336DA8.4040706@elsoft.ch>
Message-Id: <1060336062.25209.299.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 08 Aug 2003 10:47:43 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: Tips and Tricks for S3C2410 NAND controller?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-08 at 10:30, "David M=C3=BCller (ELSOFT AG)" wrote:
> Hello
>=20
> I have written a hardware driver for the NAND controller built in
> Samsung's S3C2410 SoC. I followed the instruction on
> http://linux-mtd.infradead.org/tech/nand.html to implement it but it
> doesn't seem to work correctly.

Show code and describe symptoms. I've changed the interface to the core
NAND code recently -- the docs will be slightly out of date.=20

--=20
dwmw2
