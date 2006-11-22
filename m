Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmtdi-0000iv-M2
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 10:04:00 -0500
Subject: Re: mtd_debug usage
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0611221544030.18210@lnxricardw.se.axis.com>
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
	<Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
	<79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
	<Pine.LNX.4.64.0611221544030.18210@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 22 Nov 2006 17:03:11 +0200
Message-Id: <1164207791.19298.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Duke <ezbonites@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-11-22 at 15:46 +0100, Ricard Wanderlof wrote:
> The minor numbers for /dev/mtdX are wrong. /dev/mtd0 should have a minor=20
> no. of 0, /dev/mtd1 should have 2, /dev/mtd2 should have 4 etc. The=20
> odd-numbered minor numbers are intended for read-only devices.

There is MKDEVS scripts an mtd-utils which can create these.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
