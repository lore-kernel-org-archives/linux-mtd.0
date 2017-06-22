Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO9cT-0003rC-Pj
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 21:26:31 +0000
Received: by mail-pg0-x233.google.com with SMTP id e187so12932406pgc.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 14:26:09 -0700 (PDT)
Date: Thu, 22 Jun 2017 14:26:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] mtd: Fallback to ->_read/write_oob() when
 ->_read/write() is missing
Message-ID: <20170622212606.GF14148@google.com>
References: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 11, 2017 at 10:42:55PM +0200, Boris Brezillon wrote:
> Some MTD sublayers/drivers are implementing ->_read/write_oob() and
> providing dummy wrappers for their ->_read/write() implementations.
> Let the core handle this case instead of duplicating the logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Note that the goldfish_nand driver (currently in staging) has not been
> updated because some the ops->len != mtd->writesize check done in
> goldfish_nand_read/write_oob() prevents us from using this function as
> a fallback for ->_read/write().
> 
> This behavior is buggy anyway, because the core expects drivers
> implementing ->_read_oob() to support reading more than ->writesize in
> a single call. Probably something we should fix.

Looks OK to me:

Acked-by: Brian Norris <computersforpeace@gmail.com>

This touches NAND drivers more than core MTD stuff, so feel free to take
it in your branch.
