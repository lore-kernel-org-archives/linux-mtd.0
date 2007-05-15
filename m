Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnroA-0006Ou-ON
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 03:51:06 -0400
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
In-Reply-To: <1179215126.21753.40.camel@localhost.localdomain>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179189724.3482.24.camel@shinybook.infradead.org>
	<1179215126.21753.40.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 15 May 2007 10:50:37 +0300
Message-Id: <1179215437.3642.8.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-15 at 09:45 +0200, Hans-Christian Egtvedt wrote:
> For development systems it would be a great feature, hence my original
> email. But for an embedded system this should not be present at all.

Sorry, I did not find an explanation what for do you need different
endianess? Why not just to live with the default one?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
