Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GkQRH-00011X-El
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 14:28:57 -0500
Subject: Re: 2.6 Kernel not mounting JFFS2 partition.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Glen Johnson <gjohnson@valcom.com>
In-Reply-To: <455B3857.50405@valcom.com>
References: <455B3857.50405@valcom.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 15 Nov 2006 21:27:44 +0200
Message-Id: <1163618864.5597.7.camel@sauron>
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

Hello Glen,

On Wed, 2006-11-15 at 10:55 -0500, Glen Johnson wrote:
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
> 0x9b9a instead

Your problem is quite common so you inspired me to add a FAQ entry about
it. Please, read

http://www.linux-mtd.infradead.org/faq/jffs2.html#L_magicnfound

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
