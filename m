Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkrTc-0001MY-HP
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 11:38:41 +0000
Date: Fri, 16 Sep 2016 13:38:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/17] UBI: hide EBA internals
Message-ID: <20160916133808.1dd5db40@bbrezillon>
In-Reply-To: <646e09d9-d148-b21b-d411-75ebb05dd121@nod.at>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-17-git-send-email-boris.brezillon@free-electrons.com>
 <646e09d9-d148-b21b-d411-75ebb05dd121@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 Sep 2016 12:43:48 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris,
> 
> On 05.09.2016 17:05, Boris Brezillon wrote:
> > Create a private ubi_eba_table struct to hide EBA internals and provide
> > helpers to allocate, destroy, copy and assing an EBA table to a volume.
> > 
> > Now that external EBA users are using helpers to query/modify the EBA
> > state we can safely change the internal representation, which will be
> > needed to support the LEB consolidation concept.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/ubi/build.c |   2 +-
> >  drivers/mtd/ubi/eba.c   | 166 ++++++++++++++++++++++++++++++++++++++++--------
> >  drivers/mtd/ubi/ubi.h   |   8 ++-
> >  drivers/mtd/ubi/vmt.c   |  40 +++++-------
> >  4 files changed, 165 insertions(+), 51 deletions(-)
> > 
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index 0680516bb472..45ea1ddebc5c 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -574,7 +574,7 @@ void ubi_free_internal_volumes(struct ubi_device *ubi)
> >  
> >  	for (i = ubi->vtbl_slots;
> >  	     i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
> > -		kfree(ubi->volumes[i]->eba_tbl);
> > +		ubi_eba_set_table(ubi->volumes[i], NULL);  
> 
> Why not ubi_eba_destroy_table()? We don't have to reset the pointer to NULL
> here.

ubi_eba_destroy_table() would work, but as said in the commit message,
I'm trying to hide EBA's internals from other part of the UBI
implementation, and thus, I'd like to avoid having external code
(everything that is outside of eba.c) reference/manipulate the
ubi->eba_tbl field directly.

ubi_eba_destroy_table() was only exported (made non-static) to let vmt
code free an EBA table if the resize operation fails in the middle
(between ubi_eba_create_table() and ubi_eba_set_table() calls).

> I'm also not really happy with the name ubi_eba_set_table() because it does
> more the setting the table. It destroys also the old one.

I can definitely rename the function. How about ubi_eba_replace_table().

> 
> What I'm trying to say is, when we bite the bullet and introduce lots of new wrapper
> functions to hide internals I want very clear and describing names for them.

I understand and I agree.
I thought ubi_eba_set_table() was accurately describing the function
purpose: assigning an EBA table to a volume. The fact that the old
table (if any) is freed when the new one is assigned is just an
internal detail, and that should not impact the user behavior.
But I'm perfectly fine renaming this function.

> I agree that this is a matter of taste but I had a few "Oh this looks wrong" moments
> while reviewing this patch just because the naming confused me. After looking
> up the code behind the wrapper it was clear.
> 
> Thanks,
> //richard
