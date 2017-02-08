Received: from mail-it0-f66.google.com ([209.85.214.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbaMP-0003eg-JD
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 22:05:16 +0000
Received: by mail-it0-f66.google.com with SMTP id 203so460603ith.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 14:04:49 -0800 (PST)
Date: Wed, 8 Feb 2017 14:03:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Message-ID: <20170208220345.GG94627@google.com>
References: <1484076621-7789-1-git-send-email-zach.brown@ni.com>
 <1484076621-7789-3-git-send-email-zach.brown@ni.com>
 <acc83b35-6dd6-9cd0-6f7c-e0aa3f866ed0@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acc83b35-6dd6-9cd0-6f7c-e0aa3f866ed0@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 07, 2017 at 08:33:53PM +0100, Richard Weinberger wrote:
> Am 10.01.2017 um 20:30 schrieb Zach Brown:
> > From: Jeff Westfahl <jeff.westfahl@ni.com>
> > 
> > If the user has not set max_beb_per1024 using either the cmdline or
> > Kconfig options for doing so, use the MTD function 'max_bad_blocks' to
> > compute the UBI bad_peb_limit.
> > 
> > Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> > Signed-off-by: Zach Brown <zach.brown@ni.com>
> > Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
> 
> Does this patch go via the MTD tree?
> In this case:
> Acked-by: Richard Weinberger <richard@nod.at>

I thought we had said something about going through the UBI tree. But I
don't care.

I'm not sure what's happening with patches 3-5 yet either.

I'm applying patch 1 to l2-mtd.git. Depending on the following, I can
apply patch 2 as well...

...but this is still a bit awkward; AFAICT, if you use the default
Kconfig (MTD_UBI_BEB_LIMIT == 20) then this won't take effect. Accepting
the default seems a little different than "I chose a value in Kconfig."

I think we could probably reconcile this by dropping the Kconfig (as
Richard suggested), and defaulting to 20 if neither cmdline nor
autodetect (e.g., ONFI) have said otherwise.

Or if y'all agree that the behavior I mentioned is fine, I can still
take this on behalf of Richard.

Brian
