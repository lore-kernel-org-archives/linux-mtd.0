Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpmQJ-0004eH-Ng
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 22:34:16 +0000
Received: by mail-ie0-f169.google.com with SMTP id at1so11087388iec.0
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 15:33:53 -0700 (PDT)
Date: Wed, 28 May 2014 15:33:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] mtd: maps: remove check for CONFIG_MTD_SUPERH_RESERVE
Message-ID: <20140528223349.GF3599@ld-irv-0074>
References: <1400855394.31526.37.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400855394.31526.37.camel@x220>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 23, 2014 at 04:29:54PM +0200, Paul Bolle wrote:
> Since (a few releases before) v2.6.0 there have been checks for
> CONFIG_MTD_SUPERH_RESERVE. One check is still present. But a Kconfig
> symbol MTD_SUPERH_RESERVE has never been added. So a few lines of dead
> code can be removed.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested.

Compile-tested and pushed to l2-mtd.git. Thanks!

Brian
