Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcHMw-0000jK-4W
 for linux-mtd@lists.infradead.org; Mon, 21 Apr 2014 16:46:58 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so3903502pbb.14
 for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2014 09:46:33 -0700 (PDT)
Date: Mon, 21 Apr 2014 09:46:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2] include/common.h: fix build against recent 0.9.33
 uClibc
Message-ID: <20140421164630.GT32070@ld-irv-0074>
References: <2c54c99957bae293249f9ab2a6077570d8671260.1397623968.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c54c99957bae293249f9ab2a6077570d8671260.1397623968.git.baruch@tkos.co.il>
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 16, 2014 at 07:52:48AM +0300, Baruch Siach wrote:
> An implementation of rpmatch() was backported to the 0.9.33 branch of uClibc.
> So the uClibc version check introduced in commit 50c9e11f7e (include/common.h:
> fix build against current uClibc) is not enough. Rename the local rpmatch()
> implementation to avoid collision.
> 
> Cc: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    #undef rpmatch before redefining it (Mike Frysinger)

Pushed to mtd-utils.git. Thanks!

Brian
