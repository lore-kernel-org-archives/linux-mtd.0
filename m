Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXr2Z-0008J0-Fo
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2008 05:24:27 +0000
Subject: Re: [PATCH] mtd-utils: fixed and enhanced '--flash-image' option
From: Artem Bityutskiy <dedekind@infradead.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1219691391-15149-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1219691391-15149-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset=utf-8
Date: Tue, 26 Aug 2008 08:21:33 +0300
Message-Id: <1219728093.18027.112.camel@sauron>
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

On Mon, 2008-08-25 at 21:09 +0200, Enrico Scholz wrote:
> The '--flash-image' option of 'ubiformat' requires an argument and
> '.has_arg' must not be 0 hence.  The patch adds this option to the
> commandline synopsis too.

applied and pushed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
