Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO9mW-0007SC-Ia
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 20:00:05 +0000
Received: by mail-pa0-x22e.google.com with SMTP id yy13so102373401pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 11:59:44 -0800 (PST)
Date: Tue, 26 Jan 2016 11:59:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <xhnjupt@gmail.com>, Huang Shijie <shijie.huang@arm.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove deprecated oobinfo retrieval
Message-ID: <20160126195941.GA118766@google.com>
References: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
 <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 07:42:16AM +0100, Boris Brezillon wrote:
> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
> 
> This remove OOB info retrieval, which is not used anywhere else in the code
> and can generate errors when called on newer NAND that have more than 32
> bytes of ECC or 16 bytes available for user usage in the OOB area.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> ---
>  src/mtd.c | 8 --------
>  src/mtd.h | 1 -
>  2 files changed, 9 deletions(-)

What source are you trying to patch? Doesn't look like Linux or
mtd-utils.
