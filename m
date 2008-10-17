Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqn85-0001uv-LD
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 11:04:25 +0000
Subject: Re: nandwrite/ubi memory corruption?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Michal Ludvig <mludvig@logix.net.nz>
In-Reply-To: <48F7BBC1.8090804@logix.net.nz>
References: <48F71315.5080707@logix.net.nz> <1224168560.4466.2.camel@sauron>
	<1224168977.4466.4.camel@sauron>  <48F7BBC1.8090804@logix.net.nz>
Content-Type: text/plain; charset=utf-8
Date: Fri, 17 Oct 2008 14:02:55 +0300
Message-Id: <1224241375.4466.11.camel@sauron>
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

On Fri, 2008-10-17 at 11:10 +1300, Michal Ludvig wrote:
> Nothing was apparently broken after ubiformat, system kept running
> smoothly. But I can't use ubiformat for writing kernel image, can I?

No, but I do not think it would be very difficult to add this
functionality.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
