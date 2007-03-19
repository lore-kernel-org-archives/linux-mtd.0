Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTGEX-0008Lb-FD
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 07:41:04 -0400
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext11.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2JBdgZU009211
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 13:40:58 +0200
Subject: Re: [PATCH] [MTD] NAND: Enhance nandsim to allow arbitrary NAND size
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <45FE6AA7.7000200@nokia.com>
References: <45FE6AA7.7000200@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 Mar 2007 13:40:14 +0200
Message-Id: <1174304414.17249.11.camel@sauron>
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

On Mon, 2007-03-19 at 12:49 +0200, Adrian Hunter wrote:
> A new module parameter has been added called 'overridesize',
> which overrides the size that would be determined by the
> ID bytes. 'overridesize' is specified in erase blocks and
> as the exponent of a power of two e.g. 5 means a size of
> 32 erase blocks.

All four patches look good for me, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
