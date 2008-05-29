Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1aHQ-0003Bk-BB
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 05:02:28 +0000
Subject: Re: ubifs status?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cliff Brake <cliff.brake@gmail.com>
In-Reply-To: <f96d234e0805281014o64ac1968y1910861486292065@mail.gmail.com>
References: <f96d234e0805281014o64ac1968y1910861486292065@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 29 May 2008 08:03:59 +0300
Message-Id: <1212037439.31023.49.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
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

On Wed, 2008-05-28 at 13:14 -0400, Cliff Brake wrote:
> I'm wondering if anyone has implemented ubifs on 1-8GB NAND parts in a
> production device?  How is it working, and is it considered stable
> enough for production use?  In my experience, production devices
> always bring out the corner cases that are not seen during
> development.

We (authors) are not aware if anyone ships any devices with UBIFS. We
think UBIFS is very stable, but we do find new bugs from time to time
and fix them.

It is up to you to decide if it is production ready or not. This depends
on the product as well. You should probably do your own
testing/examination. We can only tell that we usually fix bugs quickly,
especially if the reporter is ready to assist by doing various kinds of
experiments which help catching/narrowing down the problem.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
