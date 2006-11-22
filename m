Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmvlg-0002xs-LZ
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 12:20:23 -0500
Subject: Re: jffs2_truncate_fragtree does not handle NULL return from
	jffs2_lookup_node_frag
From: Artem Bityutskiy <dedekind@infradead.org>
To: Dragan Marinkovic <marinkovic.dragan@gmail.com>
In-Reply-To: <d33135570611220849o7775a594o151d02583df9c1e5@mail.gmail.com>
References: <d33135570611212335p76f32b82k13c3a8a0671d4e24@mail.gmail.com>
	<1164212824.19298.21.camel@sauron>
	<d33135570611220849o7775a594o151d02583df9c1e5@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 22 Nov 2006 19:19:01 +0200
Message-Id: <1164215941.19298.29.camel@sauron>
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

On Wed, 2006-11-22 at 08:49 -0800, Dragan Marinkovic wrote:
> The erase block size on the JFFS2 partition is set to 128K (131072
> bytes) . I can post USB stick and kernel config specific details if
> needed.

This encouraged me to write this FAQ entry. If you use JFFS2 on top of
an USB stick, please read it.

file:///home/dedekind/opensource/git/mtd-www.git/faq/jffs2.html#L_stick_jff=
s2

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
