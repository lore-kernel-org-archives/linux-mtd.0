Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Lu1Z-0000Z0-Hx
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 01:15:05 +0100
Date: Fri, 30 May 2003 17:14:10 -0700 (PDT)
Message-Id: <20030530.171410.104043496.davem@redhat.com>
To: joern@wohnheim.fh-wedel.de
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030530174319.GA16687@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
	<20030530174319.GA16687@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
cc: matsunaga_kazuhisa@yahoo.co.jp
cc: linux-mtd@lists.infradead.org
cc: dwmw2@infradead.org
cc: linux-kernel@vger.kernel.org
cc: jmorris@intercode.com.au
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

   From: J=F6rn Engel <joern@wohnheim.fh-wedel.de>
   Date: Fri, 30 May 2003 19:43:19 +0200
   =

   What contention were you talking about? :)

Actually, your idea is interesting.  Are you going to use
per-cpu workspaces?

I think the best scheme is 2 per-cpu workspaces, one for
normal and one for softirq context.

No locking needed whatsoever.  I hope it can work :-)
