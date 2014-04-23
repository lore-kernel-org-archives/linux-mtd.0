Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wd75F-0006pi-03
 for linux-mtd@lists.infradead.org; Thu, 24 Apr 2014 00:00:09 +0000
Date: Wed, 23 Apr 2014 20:59:11 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH for v3.15 0/2] UBI: block: Support very large volumes
Message-ID: <20140423235911.GB1628@arch.cereza>
References: <1397741023-2122-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397741023-2122-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Apr 17, Ezequiel Garcia wrote:
> This is a re-spin of Richard's work [1]. I've added a patch for some minor
> clean-up, so the large volume fix is a less intrusive one.
> 
> The proposed returned value E2BIG has been changed for EFBIG, which results
> in a slightly more accurate error. Also, the user messages have been removed
> entirely; returning an error seems enough.
> 
> This bug was reported on #mtd IRC. I don't have to reporter name to give proper
> credit. It should be applied as a fix for v3.15.
> 
> Richard: Thanks a lot for hunting this down, and feel free to disagree about
> my changes.
> 
> [1] https://lkml.org/lkml/2014/3/19/333
>  
> Ezequiel Garcia (1):
>   UBI: block: Set disk_capacity out of the mutex
> 
> Richard Weinberger (1):
>   UBI: block: Avoid disk size integer overflow
> 
>  drivers/mtd/ubi/block.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Do you think you can pick this for v3.15-rc3?

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
