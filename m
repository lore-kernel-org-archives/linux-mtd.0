Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M0HY-0001nh-NY
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 07:56:01 +0100
Date: Fri, 30 May 2003 23:55:05 -0700 (PDT)
Message-Id: <20030530.235505.23020750.davem@redhat.com>
To: joern@wohnheim.fh-wedel.de
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030531064851.GA20822@wohnheim.fh-wedel.de>
References: <20030530174319.GA16687@wohnheim.fh-wedel.de>
	<20030530.171410.104043496.davem@redhat.com>
	<20030531064851.GA20822@wohnheim.fh-wedel.de>
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
   Date: Sat, 31 May 2003 08:48:51 +0200

   > No locking needed whatsoever.  I hope it can work :-)
   =

   How about preemption?  zlib operations take their time, so at least =
on
   up, it makes sense to preempt them, when not in softirq context.  Ca=
n
   this still be done lockless?

You'll need to disable preemption.
