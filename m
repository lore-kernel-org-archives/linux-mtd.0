Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiFan-0008EI-GS
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 05:42:46 +0000
Received: by pacex6 with SMTP id ex6so125104623pac.0
 for <linux-mtd@lists.infradead.org>; Fri, 02 Oct 2015 22:42:23 -0700 (PDT)
Date: Sat, 3 Oct 2015 11:12:09 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
Message-ID: <20151003054209.GA4428@sudip-pc>
References: <1443631303-22057-1-git-send-email-sudipm.mukherjee@gmail.com>
 <560E50B6.5060103@cn.fujitsu.com> <20151002100133.GC9346@sudip-pc>
 <20151002173847.GG107187@google.com>
 <560F4BF8.7070408@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560F4BF8.7070408@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 03, 2015 at 11:31:04AM +0800, Dongsheng Yang wrote:
> On 10/03/2015 01:38 AM, Brian Norris wrote:
> >On Fri, Oct 02, 2015 at 03:31:33PM +0530, Sudip Mukherjee wrote:
> >>On Fri, Oct 02, 2015 at 05:39:02PM +0800, Dongsheng Yang wrote:
> >>>On 10/01/2015 12:41 AM, Sudip Mukherjee wrote:
> >>>>We should prevent user to erasing mtd device with an unaligned offset
> >>>>or length.
> >>>>
> >>>>Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> >>>>---
> >>>>
> >>>>I am not sure if I should add the Signed-off-by of
> >>>>Dongsheng Yang <yangds.fnst@cn.fujitsu.com> . He is the original author
> >>>>and he should get the credit for that.
> >>>
> >>>But I had sent a a patch out to fix this problem before your v1.
> >>>
> >>>http://lists.infradead.org/pipermail/linux-mtd/2015-September/062234.html
> >>I didn't know that. I think your v1 was applied.
> >
> >Sorry if I left any confusion. Dongsheng's v1 was applied and reverted.
> >v2 is still under review (and was sent slightly before (?) your v1).
> 
> Yea, sorry I should have mentioned it earlier. But I was and am still
> in a vacation, then I did not point it out in time.
> 
> Sudip, any comment or test for my patch there is always welcome.
Sorry, I donot know anything about this driver to comment. My main patch
was to fix the build failure. And since by that time your patch was
reverted so I sent another path with my patch and your patch combined
together.

regards
sudip
