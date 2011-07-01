Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qckeb-0005om-Ne
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 20:49:35 +0000
Date: Fri, 1 Jul 2011 22:48:28 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Preventing JFFS2 partial page writes?
Message-ID: <20110701204828.GA4531@parrot.com>
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>
	<4E020A36.6070708@gmail.com> <1308943581.13493.15.camel@koala>
	<4E089441.3010809@gmail.com> <1309253646.23597.58.camel@sauron>
	<1309253992.23597.62.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1309253992.23597.62.camel@sauron>
Cc: Peter Barada <peter.barada@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2011 at 10:39:47AM +0100, Artem Bityutskiy wrote:
> On Tue, 2011-06-28 at 12:34 +0300, Artem Bityutskiy wrote:
> > OK, thanks for explanation. I am not very good in this area as I do not
> > have much experience dealing with OOB, but here is what I thing.
> > 
> > 1. Linux MTD code was _not_ designed for "ECC'ed OOB".
> > 2. I do not really know what MTD_OOB_RAW is, and the comment in mtd.h
> >    is not very verbose.
> > 3. But in my opinion MTD_OOB_AUTO makes most sense and should be used
> >    everywhere except for some tricky cases when you want to test things
> >    by writing incorrect ECC, or you have an image with ECC and you want
> >    to flash it as is.
> > 4. In general, OOB should be considered as belonging to the driver, and
> >    modern software should not rely on OOB at all.
> > 5. So MTD_OOB_AUTO make free bytes in OOB look like a contiguous buffer
> >    which the _user_ can freely and _independently_ use.
> > 6. In your case only this assumption does not work and your ecclayout is
> >    incorrect because the OOB areas you expose are not independent.
> > 7. So in your case your ecclayout should be changed and you should
> >    expose only independent ECC bytes.
> 
> To put it differently, I current model does not distinguish (I think,
> correct me if I am wrong) between ECC'd OOB bytes and ECC'less OOB
> bytes. BTW, does your flash has the latter?
> 
> So MTD would need some work to make it distinguish between those 2 types
> of OOB bytes - probably additional info could be added to the ooblayout
> structure, and the interfaces could be improved. How exactly - dunno,
> I'd first need to figure out what MTD_OOB_RAW is - may be Brian or Ivan
> could comment.

I agree with the idea that OOB should be considered as belonging to the driver.
I think the problem should be solved as follows:

1. Expose only unprotected (or "independent") bytes in your ecclayout. Those
bytes will be used by JFFS2 for its cleanmarker.

2. Use YAFFS2 "inband-tags" option to prevent YAFFS2 from using oob for storing
metadata.

If for some reason you really cannot use inband-tags, then patch YAFFS2 and add
an option so that it can use MTD_OOB_PLACE instead of MTD_OOB_AUTO, and
store its metadata into a specified list of protected OOB bytes.

Rationale: you would have to configure YAFFS2 for this specific device anyway,
by using YAFFS_DISABLE_TAGS_ECC or tags_ecc_off in order to let nand on-die ecc
protect metadata.

I would rather not add new complexity in mtd ecclayout to solve your problem,
because it is a bit too specific (your client insists on not using UBIFS which
would be better suited for this generation of nand devices) and this new
interface would probably be short-lived (as discussed in
http://lists.infradead.org/pipermail/linux-mtd/2011-June/036549.html).

What do you think ?

--
Best Regards,

Ivan
