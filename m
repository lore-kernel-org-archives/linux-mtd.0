Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P95Cv-0007ui-9v
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 00:10:06 +0000
Received: by bwz5 with SMTP id 5so579724bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 17:10:00 -0700 (PDT)
Subject: Re: pwrite() to nand in raw mode fails with EINVAL
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: mbizon@freebox.fr
In-Reply-To: <1287701651.8965.0.camel@maxim-laptop>
References: <1285699650.32420.70.camel@sakura.staff.proxad.net>
	<1285764747.2437.116.camel@localhost>
	<1285768684.32420.91.camel@sakura.staff.proxad.net>
	<1287701651.8965.0.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Oct 2010 02:09:58 +0200
Message-ID: <1287706198.12734.16.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-22 at 00:54 +0200, Maxim Levitsky wrote:
> On Wed, 2010-09-29 at 15:58 +0200, Maxime Bizon wrote:
> > On Wed, 2010-09-29 at 15:52 +0300, Artem Bityutskiy wrote:
> > 
> > > Maxime, I've cleaned up comments, added your signed-off-by and cc
> > > stable. Is this OK?
> > 
> > Yep
> > 
> > > It would also be nice to get an ack from Maxim Levitsky.
> > 
> > The patch fixes the problem, but I let Maxim decides if that's the
> > correct way to fix it.
> 
> Very sorry for not noticing this.
> I will look very carefully at this tomorrow.
> 
> Best regards,
> 	Maxim Levitsky
> 
I don't see any reason for that patch to be wrong.
I can't test it on my xD card, because like I said before its OOB is
fake, and it probably just emulates the NAND interface.

So of course:

Acked-by: Maxim Levitsky <maximlevitsky@gmail.com>

Best regards,
	Maxim Levitsky
