Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5DoC-0001da-UD
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 07:28:10 +0000
Date: Tue, 3 Nov 2009 08:27:54 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH v12 3/4]: mtdoops: Make page (record) size configurable
Message-ID: <20091103082754.3481e9ed@marrow.netinsight.se>
In-Reply-To: <1257229438.21596.28.camel@localhost>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134119.7452f327@marrow.netinsight.se>
	<1257229438.21596.28.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 03 Nov 2009 08:23:58 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> > The main justification for this is to allow catching long messages
> > during a panic, where the top part might otherwise be lost since moving
> > to the next block can require a flash erase.
> > 
> > Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> > Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> > ---
> > ChangeLog:
> >  * Rebased over "[PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size"
> > 
> >  drivers/mtd/mtdoops.c |   75 ++++++++++++++++++++++++++++--------------------
> >  1 files changed, 44 insertions(+), 31 deletions(-)
> 
> Pushed this one to my tree, on top of the previous patch which I
> tweaked, thanks.

Thanks! I was going to send an updated patch in, but I've had some
other work to do lately. I'll send in a new version of the final patch
before the end of the day.


I noticed a small issue in your updated patch:

> +/* Maximum MTD partition size, MiB */
> +#define MTDOOPS_MAX_MTD_SIZE 32

> @@ -310,6 +312,12 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
>  		return;
>  	}
>  
> +	if (mtd->size > MTDOOPS_MAX_MTD_SIZE) {
> +		printk(KERN_ERR "mtdoops: mtd%d is too large (limit is %d MiB)\n",
> +		       mtd->index, MTDOOPS_MAX_MTD_SIZE);

mtd->size should be in bytes, right? So this will only check that it's
larger than 32 bytes, which most users will probably want ;-)

// Simon
