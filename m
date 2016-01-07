Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHH9t-00044x-Qp
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 20:27:46 +0000
Received: by mail-pa0-x236.google.com with SMTP id uo6so248682756pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 12:27:25 -0800 (PST)
Date: Thu, 7 Jan 2016 12:27:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nandsim: use nand_get_controller_data()
Message-ID: <20160107202723.GI109450@google.com>
References: <1452193606-96031-1-git-send-email-computersforpeace@gmail.com>
 <20160107203614.731f760b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160107203614.731f760b@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 07, 2016 at 08:36:14PM +0100, Boris Brezillon wrote:
> On Thu,  7 Jan 2016 11:06:46 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > Commit d699ed250c07 ("mtd: nand: make use of
> > nand_set/get_controller_data() helpers") overlooked some uses of
> > nand_chip::priv.
> 
> Oops. Apparently my coccinelle script is not detecting those
> mtd_to_nand(mtd)->priv statements.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks! Applied to l2-mtd.git
