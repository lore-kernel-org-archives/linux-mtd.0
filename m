Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M1Uk-0002JC-Gx
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 09:13:42 +0100
Date: Sat, 31 May 2003 01:12:51 -0700 (PDT)
Message-Id: <20030531.011251.02293594.davem@redhat.com>
To: joern@wohnheim.fh-wedel.de
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030531081129.GA26179@wohnheim.fh-wedel.de>
References: <20030531075615.GA25089@wohnheim.fh-wedel.de>
	<20030531.005909.68051039.davem@redhat.com>
	<20030531081129.GA26179@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
cc: kernel@kolivas.org
cc: linux-mtd@lists.infradead.org
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
   Date: Sat, 31 May 2003 10:11:29 +0200
   =

   In softirq context you would be right.  Preempt is disabled anyway
   and cpu affinity comes for free.

Looks ok to me then.
