Received: from ip101.enterness.net ([195.138.130.101] helo=empdc.emness)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JxIw-0006JD-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2001 14:11:54 +0100
Content-Type: text/plain;
  charset="windows-1251"
From: Anton Todorov <a.todorov@emness.com>
To: Steve Kranz <skranz@ridgerun.com>
Subject: Re: MTD on MBX860
Date: Tue, 10 Jul 2001 16:13:54 -0200
References: <01071015225100.01159@ronin> <3B4AF9E1.92E1A0FD@ridgerun.com>
In-Reply-To: <3B4AF9E1.92E1A0FD@ridgerun.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-Id: <01071016135401.01159@ronin>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tuesday 10 July 2001 10:49, you wrote:
> > I am using linuxppc_2_4 (2.4.6) with current mtd
> > support from cvs tree.  The board is with JEDEC AMD
> > 29F016 x4 flash chips (8M Flash space).  Map file which
> > I use for this board is attached (I use rpxlite.c and
> > tqm8xxl.c (for partitioning) as reference).  The
> > problem I found is that mtd says:
> >
> > "mtd: Failed. Cannot handle unsymetric banking"
>
> Did you mean AMD29F160 (instead of AMD29F016)? If so,
> I have a data sheet on my desk here that shows block sizes of:
>
>   #1  8K
>   #2  4K
>   #3  4K
>   #4  16K
>   #5  32K
>    ....
>   #35 32K
>

no. iIt is exactly AM29F016B-90EC and is only JEDEC compatible.

Regards,
Anton Todorov
Emness Technology
