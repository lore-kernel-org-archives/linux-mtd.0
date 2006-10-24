Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GcPag-0003lV-2K
	for linux-mtd@lists.infradead.org; Tue, 24 Oct 2006 12:57:37 -0400
Subject: Re: [PATCH] MTD: fix printk format warning
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Randy.Dunlap" <randy.dunlap@oracle.com>
In-Reply-To: <453E315B.8090801@oracle.com>
References: <20061023214826.d54fc7c6.randy.dunlap@oracle.com>
	<1161681850.3260.167.camel@sauron>
	<20061024100245.GA21695@home.fluff.org>
	<453E315B.8090801@oracle.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 24 Oct 2006 19:57:13 +0300
Message-Id: <1161709033.3260.188.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: akpm <akpm@osdl.org>, Ben Dooks <ben@fluff.org>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-10-24 at 08:29 -0700, Randy.Dunlap wrote:
> which I suppose is what Artem missed.  I.e., it's not always unsigned lon=
g.
> However, I won't deny that gcc seems odd here.

I just wanted to say that (unsigned long)a - b + 1 has "unsigned long"
type even if "a" and "b" are u32 or u64. I would have understood you if
you had said that you cut "a" because of the u64->unsigned long casting,
but I understood that the rationale for the change was to fix print
format warning...

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
