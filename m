Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga7LR-0007z8-6N
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 05:04:29 -0400
Subject: Re: [PATCH] [MTD] [CORE]: Fix MEMGETOOBSEL and ECCGETLAYOUT ioctls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610180859020.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171720200.25906@lnxricardw.se.axis.com>
	<1161099911.3260.97.camel@sauron>
	<Pine.LNX.4.64.0610180859020.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 18 Oct 2006 12:04:08 +0300
Message-Id: <1161162248.3260.112.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-10-18 at 09:01 +0200, Ricard Wanderlof wrote:
> That's what I thought I did ... checked again today, yep it is based=20
> against the latest mtdchar.c from mtd-2.6.git tree (dated 2006-09-17).

Richard, apologies, the patch indeed applies smoothly. I have committed
it into my git tree and will ask David to get it into mtd-2.6.git.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
