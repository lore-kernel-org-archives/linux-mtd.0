From: "Tim Anderson" <tanderson@mvista.com>
To: <Bruce_Leonard@selinc.com>, "'Andrew Morton'" <akpm@linux-foundation.org>
Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
Date: Tue, 26 Aug 2008 18:40:26 -0700
Message-ID: <008601c907e5$e1bac9f0$9101320a@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <OF7C027ED9.D9F1F324-ON882574B2.0007025B-882574B2.000767B6@selinc.com>
Cc: linux-mtd-bounces@lists.infradead.org,
	'David Woodhouse' <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	'Bruce Leonard' <brucle@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bruce,

Since you don't want to change the ABI you need to extend it. Andrew, should
he add an new ioctl that passes a new structure definition? That way the
original code works and you have to do a new ioctl to get the new size data.

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Bruce_Leonard@selinc.com
> Sent: Tuesday, August 26, 2008 6:21 PM
> To: Andrew Morton
> Cc: linux-mtd-bounces@lists.infradead.org; 
> linux-mtd@lists.infradead.org; David Woodhouse; 
> linux-kernel@vger.kernel.org; Bruce Leonard
> Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
> 
> linux-mtd-bounces@lists.infradead.org wrote on 08/26/2008 04:55:36 PM:
> 
> > On Thu, 21 Aug 2008 19:00:55 -0700 (GMT-07:00)
> > Bruce Leonard <brucle@earthlink.net> wrote:
> > 
> > > --- a/include/mtd/mtd-abi.h
> > > +++ b/include/mtd/mtd-abi.h
> > > @@ -6,7 +6,7 @@
> > >  #define __MTD_ABI_H__
> > > 
> > >  struct erase_info_user {
> > > -   uint32_t start;
> > > +   uint64_t start;
> > >     uint32_t length;
> > >  };
> > > 
> > > @@ -50,7 +50,7 @@ struct mtd_oob_buf {
> > >  struct mtd_info_user {
> > >     uint8_t type;
> > >     uint32_t flags;
> > > -   uint32_t size;    // Total size of the MTD
> > > +   uint64_t size;    // Total size of the MTD
> > >     uint32_t erasesize;
> > >     uint32_t writesize;
> > >     uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
> > 
> > This changes the kernel<->userspace ABI and is hence a big no-no.  I
> > assume that this change will cause old userspace to 
> malfunction on new
> > kernels, and vice versa.
> > 
> 
> Well, in my posting I noted that the mtd-utils were broken 
> because of this 
> but I didn't really have any idea as to how to fix things.  I 
> can see why 
> it would be a big no-no to change this.  Do you have any 
> suggestions on 
> what I could do differently to prevent making that change?
> 
> > Supporting >2Gb MTD devices sounds useful (I'm surprised 
> that we don't
> > already do so).
> > 
> 
> There was a LOT of interest in this over the last few months 
> while I was 
> working on it, but a very suprising silence has developed 
> since I posted 
> the patches.  I guess I'm more cutting edge than I thought :).
> 
> > Please cc linux-mtd@lists.infradead.org (at least) on MTD-related
> > patches, thanks.
> 
> I started with the MTD list and then also posted to lkml when 
> I realized I 
> had forgotten to CC it.
> 
> Thanks.
> 
> Bruce
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
