Received: from smtprelay0169.hostedemail.com ([216.40.44.169]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDdU6-0004BR-2P
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 20:34:06 +0000
Message-ID: <1480883619.4534.6.camel@perches.com>
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
From: Joe Perches <joe@perches.com>
To: Marek Vasut <marek.vasut@gmail.com>, Pan Bian <bianpan201604@163.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,  Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>,  Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Pan Bian <bianpan2016@163.com>
Date: Sun, 04 Dec 2016 12:33:39 -0800
In-Reply-To: <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
 <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2016-12-04 at 13:48 +0100, Marek Vasut wrote:
> On 12/04/2016 07:12 AM, Pan Bian wrote:
> > From: Pan Bian <bianpan2016@163.com>
> > 
> > When __vmalloc() returns a NULL pointer, the region is not checked, and
> > we cannot make sure that only 0xFF bytes are present at offset. Thus,
> > returning 0 seems improper.
> > 
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=189081
> > 
> > Signed-off-by: Pan Bian <bianpan2016@163.com>
> > ---
> >  drivers/mtd/ubi/io.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
[]
> > @@ -1413,7 +1413,7 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
> >  	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
> >  	if (!buf) {
> >  		ubi_err(ubi, "cannot allocate memory to check for 0xFFs");
> > -		return 0;
> > +		return -ENOMEM;
> 
> I wonder if you shouldn't also nuke the ubi_err() , because when you run
> out of memory, printk() will likely also fail.

No, not really.  printk doesn't allocate memory.

But the ubi_err should be removed because all memory
allocations that fail without a specific GFP_NOWARN
flag already have a dump_stack() call.
