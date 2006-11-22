Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GmuwZ-0004Jw-TZ
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 16:27:32 +0000
Subject: Re: jffs2_truncate_fragtree does not handle NULL return from
	jffs2_lookup_node_frag
From: Artem Bityutskiy <dedekind@infradead.org>
To: Dragan Marinkovic <marinkovic.dragan@gmail.com>
In-Reply-To: <d33135570611212335p76f32b82k13c3a8a0671d4e24@mail.gmail.com>
References: <d33135570611212335p76f32b82k13c3a8a0671d4e24@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 22 Nov 2006 18:27:04 +0200
Message-Id: <1164212824.19298.21.camel@sauron>
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

On Tue, 2006-11-21 at 23:35 -0800, Dragan Marinkovic wrote:
> Digging a bit deeper, I found that jffs2_truncate_fragtree is not
> handling the NULL as a return value from jffs2_lookup_node_frag . It look=
s
> like that NULL return is perfectly legal. The patch to fix this is attach=
ed.
> I'm not really sure if this is the right place to fix this problem but
> it should be OK from the correctness prospective (can't use NULL
> pointers).

The NULL is legal, but JFFS2 does handle it. Look at the latest git
version. Please, point which particular C operation in the
jffs2_truncate_fragtree() function causes the oops.

> More to it, I've noticed that if I remove the system power while file
> on JFFS2 partition is being updated (it takes a bit of time to hit the
> right moment), I'll completely lose the file (it just disappears). Any
> ideas?

What does "JFFS2 partition is being updated" mean?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
