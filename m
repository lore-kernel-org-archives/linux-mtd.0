Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195T2C-0001Yq-9d
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 17:11:48 +0100
Date: Tue, 15 Apr 2003 17:11:44 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <20030415153934.GD7721@wohnheim.fh-wedel.de>
Message-Id: <F3B9D6B6-6F5C-11D7-B468-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: Esben Nielsen <esn@cotas.dk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, Apr 15, 2003, at 16:39 Europe/London, J=F6rn Engel wrote:
>
> On NOR, there is absolutely no point in avoiding many writes.

Unless it would cause many erases, which would slow things down a lot...
If data integrity is the crucial issue (which it usually is) there's no=20=

way to avoid
this, though.

The only other issue I can foresee is the overhead of the jffs=20
structures at the
start of each write;  if there are only a few bytes being written each=20=

time, it
quickly becomes very significant.

Jas.
