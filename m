Received: from mgw-ext04.nokia.com ([131.228.20.96])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq3bh-00081O-9y
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 03:18:55 -0500
Subject: Re: MTD pointer alignment
From: Artem Bityutskiy <dedekind@infradead.org>
To: Gavin Lambert <gavinl@compacsort.com>
In-Reply-To: <01e801c7134a$9c33da20$4800a8c0@gavinlpc>
References: <01e801c7134a$9c33da20$4800a8c0@gavinlpc>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Dec 2006 10:18:40 +0200
Message-Id: <1164961120.576.79.camel@sauron>
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

On Wed, 2006-11-29 at 13:09 +1300, Gavin Lambert wrote:
> Given that mtdchar assumes that it can mess with the low 2 bits of the
> MTD pointer it keeps around with impunity, add_mtd_device in mtdcore.c
> should probably refuse to add any MTD device pointer that doesn't fall
> on a 4-byte boundary.

Hmm, I personally I do not understand what is this about.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
