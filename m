Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA3b1-0004HN-Lq
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 22:33:56 +0000
Received: by mail-pf0-x231.google.com with SMTP id u7so8863797pfb.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 14:33:35 -0800 (PST)
Date: Fri, 18 Dec 2015 14:33:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Vitaly Wool <vitalywool@gmail.com>
Subject: Re: [PATCH] mtd: nand: remove unused and buggy
 get_platform_nandchip() helper function
Message-ID: <20151218223332.GR10460@google.com>
References: <1450106011-25105-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450106011-25105-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2015 at 04:13:31PM +0100, Boris Brezillon wrote:
> Nobody uses the get_platform_nandchip() helper function which is supposed
> to return a pointer to a platform_nand_chip struct from an mtd_info
> pointer.
> Moreover, this function is buggy since the introduction of the plat_nand
> layer (chip->priv is now storing a pointer to an intermediate
> plat_nand_data structure allocated in plat_nand_probe(), and we have no
> way to retrieve a pointer to the provided platform_nand_chip struct from
> this plat_nand_data pointer).
> 
> While we are at it, remove the useless (and buggy, since it's pointing to
> something stored on the stack) data->chip.priv assignment.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
> Cc: Vitaly Wool <vitalywool@gmail.com>

Applied to l2-mtd.git
