Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K326d-0007UK-Lw
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 04:57:16 +0000
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m524umAn005893
	for <linux-mtd@lists.infradead.org>; Sun, 1 Jun 2008 23:57:12 -0500
Subject: Re: [PATCH 1/4] [MTD] nandsim: fix size bug
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <483FF972.9010707@nokia.com>
References: <483FF972.9010707@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 02 Jun 2008 07:58:12 +0300
Message-Id: <1212382692.31023.144.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-30 at 15:56 +0300, Adrian Hunter wrote:
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
>  drivers/mtd/nand/nandsim.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Looks good to me, ack for whole series.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
