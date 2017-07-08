Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTe5B-00027k-Lc
 for linux-mtd@lists.infradead.org; Sat, 08 Jul 2017 00:58:51 +0000
Received: by mail-pf0-x232.google.com with SMTP id q85so24271547pfq.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 17:58:28 -0700 (PDT)
Date: Fri, 7 Jul 2017 17:58:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Fix check in mtd_unpoint()
Message-ID: <20170708005824.GD55942@google.com>
References: <20170625182257.20867-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170625182257.20867-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 25, 2017 at 08:22:57PM +0200, Boris Brezillon wrote:
> The code checks that ->_point is not NULL, but we should actually check
> ->_unpoint value which is dereferenced a few lines after the check.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Found while checking that nobody except the core was directly calling
> ->_xxx().
> Note that I didn't had a Fixes tag because it's hard to tell when
> mtd_point() was introduced (code has been moved from mtd.h to mtdcore.c
> in commit 8273a0c911d8 "mtd: add offset and length checks to the API
> function"), and all drivers implementing ->_point() also implement
> ->_unpoint (the only exception being drivers/mtd/maps/uclinux.c).

Applied
