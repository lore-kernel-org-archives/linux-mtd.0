Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HmP4M-0002YZ-TN
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 02:57:40 -0400
Subject: Re: NAND flash write goes wrong
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
References: <200705102150.31171.borasah@gmail.com>
	<Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 May 2007 09:57:27 +0300
Message-Id: <1178866648.3643.7.camel@sauron>
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

Just FYI,

we have recently fixed a bug in MTD which caused JFFS2 to mark good
eraseblocks bad. It was caused by the mtdpart module. One had to have
partitions to trigger this bug. The bug was that when JFFS2 wanted to
mark eraseblock X within its partition as bad, mtdpart did not translate
correctly to the _absolute_ number, but marked _absolute_ eraseblock
number X as bad instead.

So basically, once one met a true bad eraseblock, JFFS2 started trying
to mark it as bad, but marked other eraseblock as bad instead.

I'd recommend everybody to backport this fix.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
