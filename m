Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzZsW-0007Ne-W9
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 00:48:41 +0000
Received: by padhx2 with SMTP id hx2so97640341pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 16:48:20 -0800 (PST)
Date: Thu, 19 Nov 2015 16:48:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: m25p80: fix some module and documentation issues
Message-ID: <20151120004817.GR64635@google.com>
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 02:34:49PM -0800, Brian Norris wrote:
> Hi,
> 
> There were a few mistakes and improvements pointed out at various points in
> this thread, subject:
> 
>     spi: OF module autoloading is still broken
>     (was: Re: m25p80: Commit "allow arbitrary OF matching for "jedec,spi-nor""
>     breaks module autoloading)
> 
>     http://lists.infradead.org/pipermail/linux-mtd/2015-October/062369.html
>     https://lkml.org/lkml/2015/11/12/574
> 
> That thread covers some other interesting issues that are still not solved, but
> let's fix the ones we can here in MTD right now.
> 
> Regards,
> Brian

Pushed all to l2-mtd.git
