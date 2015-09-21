Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze9q3-0007Y5-6P
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 22:45:36 +0000
Received: by pacex6 with SMTP id ex6so128816220pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 15:45:14 -0700 (PDT)
Date: Mon, 21 Sep 2015 15:45:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [RESEND PATCH v3 1/5] mtd: nand: add nand_check_erased helper
 functions
Message-ID: <20150921224511.GE31505@google.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441296222-14989-2-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 03, 2015 at 06:03:38PM +0200, Boris Brezillon wrote:
> Add two helper functions to help NAND controller drivers test whether a
> specific NAND region is erased or not.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed this patch to l2-mtd.git. Still looking at the rest.
