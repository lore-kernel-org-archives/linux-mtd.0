Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZThY-00070y-5s
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 20:07:04 +0000
Date: Wed, 22 Jun 2011 22:06:21 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: Preventing JFFS2 partial page writes?
Message-ID: <20110622200621.GA26973@parrot.com>
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>
	<4E020A36.6070708@gmail.com> <20110622170747.GC25928@parrot.com>
	<4E023FCD.9010800@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4E023FCD.9010800@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 22, 2011 at 08:17:33PM +0100, Peter Barada wrote:
> On 06/22/2011 01:07 PM, Ivan Djelic wrote:
> >
> > On one hand it sure would be nice (and a bit complicated) to accurately
> > describe OOB write constraints, for easier JFFS2/YAFFS2 integration.
> > On the other hand, I am not sure such a complication is really worth the
> > trouble, given that on next nand generation:
> > - OOB areas will not be usable anymore for metadata storage (8-bit ecc leaves
> >    only 6 spare bytes out of 64)
> > - partial writes will probably be limited to 1 (like in MLC), meaning that
> >    JFFS2 clean marking step will be forbidden anyway
> > Furthermore, userspace will probably need to handle case 3) anyway (no
> > protected oob bytes) to stay portable...
> >
> SLC parts (including this one) look to be around for a while, as well as 
> the products they are already in.  So I think the issue of JFFS2's 
> cleanmarker in the context of this Micron NAND needs to be solved, 
> preferably in a general way so the next oddball NAND chip that comes 
> along doesn't cause MTD, mtd-utils, JFFS2 (and other NAND FS) fits.
> 
> Does UBIFS do any of the "partial writes" (i.e. write OOB/data area 
> multiple times) as JFFS2 does?
 
No it doesn't. UBIFS relies on UBI, which itself does not rely on oob for
storing metadata. BTW, have you considered using UBIFS instead of JFFS2/YAFFS2?

--
Ivan
