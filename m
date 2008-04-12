Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jkfp6-00035S-It
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 13:31:16 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: "'Alexey Korolev'" <akorolev@infradead.org>,
	"'Jean Pihet'" <jpihet@mvista.com>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>	<200804101918.21362.jpihet@mvista.com>
	<Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
Subject: RE: [BUG] JFFS2 usage of write_begin and write_end functions
	causes	kernel panic
Date: Sat, 12 Apr 2008 15:31:08 +0200
Message-ID: <030201c89ca1$77c75900$67560b00$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: sv
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Alexey Korolev
> Sent: den 11 april 2008 20:01
> To: Jean Pihet
> Cc: nickpiggin@yahoo.com.au; joern@logfs.org; linux-mtd@lists.infradead.org; dwmw2@infradead.org;
> akpm@linux-foundation.org
> Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes kernel panic
> 
> Hi Jean,
> > Alexey,
> >
> > Here is the patch (attached) I applied to get a stable JFFS2 filesystem.
> > The changes have been cherry picked from
> > http://sourceforge.net/projects/mtd-mods.
> >
> > I stressed it with intensive read/write, flash fill-up and data removal. A few
> > GB's of data have been transferred without any problem. I didn't try the tool
> > you mentionned though.
> > Tested on OMAP3 platform.
> >
> > Now I am testing with PREEMPT_RT config.
> 
> Oh very interesting link. I'm glad to hear that people use it - even
> before announce. Actually I know this project very well - I'm the author and maintainer of this ;-).
> The project will be announced soon.
> 
> You can find the workaround  for the kernel panic problem which disables write_begin and write_end in
> JFFS2 already exists in the newest release. But fix for the problem does not ready yet. We found one
> bug in implementation but post validation is not completed yet.
> 
> The patch you have sent is intended to fix another kernel panic issue. It doesn't depend on
> write_begin/write_end functionalities. Sometime ago we posted the fix to get included, but it was
> rejected.

Alexey,
are there other patches in your repo that isn't in Linus git tree? If so, which
ones and are they for NOR, NAND or both?

   Jocke
