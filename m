Received: from c17870.thoms1.vic.optusnet.com.au ([210.49.248.224]
	helo=mail.kolivas.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M1bF-0002S2-0e
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 09:20:25 +0100
From: Con Kolivas <kernel@kolivas.org>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
	"David S. Miller" <davem@redhat.com>
Date: Sat, 31 May 2003 18:22:21 +1000
References: <20030530174319.GA16687@wohnheim.fh-wedel.de>
	<20030530.235505.23020750.davem@redhat.com>
	<20030531075615.GA25089@wohnheim.fh-wedel.de>
In-Reply-To: <20030531075615.GA25089@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200305311822.21823.kernel@kolivas.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

On Sat, 31 May 2003 17:56, J=F6rn Engel wrote:
> CC List pruned a little.
>
> On Fri, 30 May 2003 23:55:05 -0700, David S. Miller wrote:
> >    From: J=F6rn Engel <joern@wohnheim.fh-wedel.de>
> >
> >    How about preemption?  zlib operations take their time, so at least =
on
> >    up, it makes sense to preempt them, when not in softirq context.  Can
> >    this still be done lockless?
> >
> > You'll need to disable preemption.
>
> My gut feeling claims that this would hurt interactivity.  Con, would
> contest on a jffs2 (zlib compressed) filesystem be able to show
> interactivity problems wrt zlib?

The only way I could think of was perhaps using a load on another disk=20
(io_other which is in contest) that is using jffs2 when the contest baselin=
e=20
is running on a normal filesystem - this has shown very little differences=
=20
between filesystems normally. Otherwise if everything in contest is run on=
=20
jffs2 it would affect every layer and hard to be sure you had a control to=
=20
compare with.

Con
