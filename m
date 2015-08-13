Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPhGa-0004sA-CM
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 01:25:13 +0000
Received: by pawu10 with SMTP id u10so25944114paw.1
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2015 18:24:51 -0700 (PDT)
Date: Wed, 12 Aug 2015 18:24:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, antoine.tenart@free-electrons.com,
 robert.jarzmik@free.fr
Subject: Re: [PATCH 0/2] nand: pxa3xx: A couple device identification fixes
Message-ID: <20150813012448.GC104137@google.com>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 03, 2015 at 11:31:24AM -0300, Ezequiel Garcia wrote:
> Brian,
> 
> A couple fixes. The first one to increase the size of the READ_ID
> buffer, which is required to read 'ONFI' and 'JEDEC'.
> The second one, to allow to read the ONFI and JEDEC PARAM pages.
> 
> This is tested on:
>  * Armada XP GP board (w/ONFI device)
>  * PXA3xx CM-X300 board (non-ONFI/JEDEC device)
> 
> Can't test on any JEDEC device, but at least I can't see any regressions.

Applied both to l2-mtd.git.
