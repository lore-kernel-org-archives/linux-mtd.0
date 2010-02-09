Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NetoB-0004FY-UE
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 17:23:36 +0000
Received: by fg-out-1718.google.com with SMTP id e12so273433fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Feb 2010 09:23:30 -0800 (PST)
Subject: Re: [PATCH 01/17] MTD: create lockless versions of
	{get,put}_mtd_device This will be used to resolve deadlock in block
	translation layer.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <1265735693.11509.253.camel@laptop>
References: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
	<1265734665-22656-2-git-send-email-maximlevitsky@gmail.com>
	<1265735693.11509.253.camel@laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 19:23:26 +0200
Message-ID: <1265736206.9195.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-09 at 18:14 +0100, Peter Zijlstra wrote: 
> On Tue, 2010-02-09 at 18:57 +0200, Maxim Levitsky wrote:
> > These functions can be used as long as we don't need access to global mtd table, but have
> > a pointer to the mtd device.
> > 
> > Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> > ---
> >  drivers/mtd/mtdcore.c   |   60 ++++++++++++++++++++++++++++++----------------
> >  include/linux/mtd/mtd.h |    3 +-
> >  2 files changed, 41 insertions(+), 22 deletions(-)
> 
> > +int __get_mtd_device(struct mtd_info *mtd)
> > +{
> > +	int err;
> > +
> > +	if (!try_module_get(mtd->owner))
> > +		return -ENODEV;
> > +
> > +	if (mtd->get_device) {
> > +
> > +		err = mtd->get_device(mtd);
> > +
> > +		if (err) {
> > +			module_put(mtd->owner);
> > +			return err;
> > +		}
> > +	}
> > +	mtd->usecount++;
> > +	return 0;
> >  }
> 
> > +void __put_mtd_device(struct mtd_info *mtd)
> > +{
> > +	--mtd->usecount;
> > +	BUG_ON(mtd->usecount < 0);
> > +
> >  	if (mtd->put_device)
> >  		mtd->put_device(mtd);
> >  
> >  	module_put(mtd->owner);
> >  }
> 
> That's racy, use kref.
> 
Couldn't agree with you more.

However, these functions aren't intended for general use, and probably
will be used by mtd translation layer only. I do have a lock that
protects concurrent use of these functions.

Thus, I better add a comment about this?

Best regards,
Maxim Levitsky
