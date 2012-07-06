Received: from kirsty.vergenet.net ([202.4.237.240])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Smw8D-0000PN-Og
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 00:10:47 +0000
Date: Fri, 6 Jul 2012 09:10:37 +0900
From: Simon Horman <horms@verge.net.au>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH 1/2] mtd: sh_flctl: Use memcpy() instead of using a loop
Message-ID: <20120706001037.GE11036@verge.net.au>
References: <1341484862-24033-1-git-send-email-hechtb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341484862-24033-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>, linux-mtd@lists.infradead.org,
 Linux-SH <linux-sh@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 05, 2012 at 12:41:01PM +0200, Bastian Hecht wrote:
> Elemets have been copied "manually" in a loop. Better use memcpy().
> 
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

Reviewed-by: Simon Horman <horms@verge.net.au>
