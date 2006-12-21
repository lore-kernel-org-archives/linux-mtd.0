Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxLtL-0002vM-1G
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 06:15:20 -0500
Subject: Re: OneNAND: Update OOB free table
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com, Timo Teras <timo.teras@solidboot.com>
In-Reply-To: <14053092.180201166415887159.JavaMail.weblogic@ep_ml21>
References: <14053092.180201166415887159.JavaMail.weblogic@ep_ml21>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Dec 2006 13:15:03 +0200
Message-Id: <1166699703.3939.37.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Vitaly Wool <vwool@ru.mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Mon, 2006-12-18 at 04:24 +0000, Kyungmin Park wrote:
> How about the this patch?
> It skips the ecc position which is defined in ecc layout in mtd drivers.

Here is my understanding of the problem.

Nowadays MTD supports nicer interface to work with OOB. This is the
MTD_OOB_AUTO command. Currently JFFS2 uses old MTD_OOB_PLACE command.

The idea behind the MTD_OOB_AUTO command is that user provides buffer
with his data, and MTD takes care about how to put it to the OOB area,
MTD knows which OOB bytes may be used. Similar for reading OOB - MTD
automatically reads data bytes, skips ECC, and returns the data.

So what we should do is to teach JFFS2 using MTD_OOB_AUTO instead of
MTD_OOB_PLACE.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
