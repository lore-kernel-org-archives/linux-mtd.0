Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxJ2R-0002Hv-29
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 11:26:07 +0000
Subject: Re: [PATCH] panic.c: export panic_on_oops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ingo Molnar <mingo@elte.hu>
In-Reply-To: <20091012111545.GB8857@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Oct 2009 14:25:31 +0300
Message-Id: <1255346731.9659.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-10-12 at 13:15 +0200, ext Ingo Molnar wrote:
> > We use the mtdoops module which stores oopses on the Flash partition,
> > in order to make it possible to analyze them later. And mtdoops needs
> > to know whether 'panic_on_oops' is on or off. Thus, we need this
> > variable to be exported.
> 
> hm, why does it need it? Could you send the patch please that makes use 
> of it (as an easy way to explain the need for the export) - current 
> upstream drivers/mtd/mtdoops.c doesnt need it so it must be some pending 
> change.

Yes, current drivers/mtd/mtdoops.c does not need it, but we have this
patch:

http://lists.infradead.org/pipermail/linux-mtd/2009-October/027450.html

which makes sure mtdoops writes the oops log immediately, because we
have 'panic_on_oops' set so this is our last chance to save the oops.

Here is the patch inlined as well:

Author: Aaro Koskinen <aaro.koskinen@nokia.com>
Date:   Thu Oct 1 18:16:55 2009 +0300

    mtd: mtdoops: do not schedule work if we are going to die

    If panic_on_oops is set, the log should be written right away
    because this is not going to be a second chance.

    Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1060337..ac67833 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
        cxt->ready = 0;
        spin_unlock_irqrestore(&cxt->writecount_lock, flags);

-       if (mtd->panic_write && in_interrupt())
+       if (mtd->panic_write && (in_interrupt() || panic_on_oops))
                /* Interrupt context, we're going to panic so try and log */
                mtdoops_write(cxt, 1);
        else

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
