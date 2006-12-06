Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrvQl-0002KA-7L
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 06:59:21 -0500
Subject: Re: Finding flash type...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0612060929280.29536@lnxricardw.se.axis.com>
References: <20061206014432.56808.qmail@web30201.mail.mud.yahoo.com>
	<1165370753.2679.5.camel@crusty.rchland.ibm.com>
	<Pine.LNX.4.64.0612060929280.29536@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 06 Dec 2006 13:58:59 +0200
Message-Id: <1165406340.20337.48.camel@sauron>
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

On Wed, 2006-12-06 at 09:31 +0100, Ricard Wanderlof wrote:
> For NAND flash chips I think it would also be nice to get a list of bad=20
> blocks. This can be most useful when debugging.

Yeah. Once sysfs support is there we could export many useful
information without need to call these syscalls.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
