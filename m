Received: from mail-pa0-f50.google.com ([209.85.220.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUnmz-0004JM-2f
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 01:46:58 +0000
Received: by mail-pa0-f50.google.com with SMTP id kq14so9047633pab.37
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 18:46:30 -0700 (PDT)
Date: Mon, 31 Mar 2014 18:46:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sasha Levin <sasha.levin@oracle.com>
Subject: Re: [PATCH] mtd: diskonchip: mem resource name is not optional
Message-ID: <20140401014627.GG29542@ld-irv-0074>
References: <1395267877-15223-1-git-send-email-sasha.levin@oracle.com>
 <1395477572.57478225@f224.i.mail.ru> <533765F8.2090700@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <533765F8.2090700@oracle.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 29, 2014 at 08:31:52PM -0400, Sasha Levin wrote:
> On 03/22/2014 04:39 AM, Alexander Shiyan wrote:
> >Wed, 19 Mar 2014 18:24:37 -0400 от Sasha Levin <sasha.levin@oracle.com>:
> >>Passing a name to request_mem_region() isn't optional and can't just
> >>be NULL. Passing NULL causes a NULL ptr deref later in the boot
> >>process.
> >>
> >>Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
> >>---
> >>  drivers/mtd/nand/diskonchip.c |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >>diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> >>index b9b4db6..f68a7bc 100644
> >>--- a/drivers/mtd/nand/diskonchip.c
> >>+++ b/drivers/mtd/nand/diskonchip.c
> >>@@ -1439,7 +1439,7 @@ static int __init doc_probe(unsigned long physadr)
> >>  	int reg, len, numchips;
> >>  	int ret = 0;
> >>
> >>-	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, NULL))
> >>+	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, "DiskOnChip"))
> >>  		return -EBUSY;
> >>  	virtadr = ioremap(physadr, DOC_IOREMAP_LEN);
> >>  	if (!virtadr) {
> >>--
> >
> >Tested-by: Alexander Shiyan <shc_work@mail.ru>
> 
> It seems that no one pulled this patch anywhere. It fixes a straightforward
> boot failure on boot when diskonchip is enabled in the config.
> 
> Someone grab it please?

Pushed to l2-mtd.git, marked for stable >= 3.14.

Brian
