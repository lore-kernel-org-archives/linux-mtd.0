Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oa1vo-0005wK-GS
	for linux-mtd@lists.infradead.org; Sat, 17 Jul 2010 07:35:33 +0000
Received: by fxm3 with SMTP id 3so1638941fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Jul 2010 00:35:31 -0700 (PDT)
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <1279018143.31639.33.camel@localhost>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279018143.31639.33.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 17 Jul 2010 10:35:28 +0300
Message-Id: <1279352128.7515.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 13:49 +0300, Artem Bityutskiy wrote:
> On Wed, 2010-07-07 at 17:30 -0700, Kevin Cernekee wrote:
> > Change mtd_erase() so that it attempts to use MEMERASE64 first, then falls
> > back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.
> > 
> > Add mtd_read_oob(), mtd_write_oob() functions to wrap the OOB ioctls.
> > Similar ioctl fallback logic is used in these functions as well.
> > 
> > Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> > ---
> >  include/libmtd.h |   36 ++++++++++++++++++++++-
> >  lib/libmtd.c     |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++---
> >  2 files changed, 111 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/libmtd.h b/include/libmtd.h
> > index 0aea966..292d8c3 100644
> > --- a/include/libmtd.h
> > +++ b/include/libmtd.h
> > @@ -66,6 +66,7 @@ struct mtd_info
> >   * @region_cnt: count of additional erase regions
> >   * @writable: zero if the device is read-only
> >   * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
> > + * @legacy_ioctls: non-zero if the kernel lacks MEMERASE64, MEM*OOB64
> >   */
> >  struct mtd_dev_info
> >  {
> > @@ -84,6 +85,7 @@ struct mtd_dev_info
> >  	int region_cnt;
> >  	unsigned int writable:1;
> >  	unsigned int bb_allowed:1;
> > +	unsigned int legacy_ioctls:1;
> >  };
> 
> Kevin, I'm sorry, but thinking about this some more, this is not a
> property of mtd device, this is a property of whole mtd subsystem. So
> this flag should live in 'struct mtd_info', just like the 'unsigned int
> sysfs_supported:1;' field.
> 
> You should find out whether the new ioctl's are supported in
> 'libmtd_open()'. This also means that all libmtd calls which need this
> flag will need a 'libmtd_t desc' parameter.
> 
> Also, is it possible to have 2 separate patches - 1st adds support for
> 64-bit offest, second adds OOB calls.
> 
> Is this doable? I think this should not be too difficult to change.

I thought some more, and no, this is not doable because you need a
device node, which you do not have when the library is being
initialized. I'll take a look at these patches once again.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
