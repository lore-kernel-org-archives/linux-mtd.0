Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M1HU-00027L-RH
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 09:00:01 +0100
Date: Sat, 31 May 2003 00:59:09 -0700 (PDT)
Message-Id: <20030531.005909.68051039.davem@redhat.com>
To: joern@wohnheim.fh-wedel.de
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030531075615.GA25089@wohnheim.fh-wedel.de>
References: <20030531064851.GA20822@wohnheim.fh-wedel.de>
	<20030530.235505.23020750.davem@redhat.com>
	<20030531075615.GA25089@wohnheim.fh-wedel.de>
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
   Date: Sat, 31 May 2003 09:56:15 +0200

   On Fri, 30 May 2003 23:55:05 -0700, David S. Miller wrote:
   > You'll need to disable preemption.
   =

   My gut feeling claims that this would hurt interactivity.

You can't leave the per-cpu workspace in an indeterminate
state, you'll context switch and meanwhile that workspace will
be used by another client or you'll next get scheduled on
a different cpu and use a different workspace.
