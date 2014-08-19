Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJoe1-0007wP-QX
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 19:00:34 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa1so10473088pad.41
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 12:00:05 -0700 (PDT)
Date: Tue, 19 Aug 2014 12:00:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: fix DocBook warnings on nand_sdr_timings doc
Message-ID: <20140819190000.GU18411@ld-irv-0074>
References: <1408264182-31830-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408264182-31830-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 17, 2014 at 10:29:42AM +0200, Boris BREZILLON wrote:
> Change the comment type (from /** to /*) to prevent DocBook from
> complaining about missing description for nand_sdr_timings fields.
> 
> There is currently no need in documenting those fields because they are
> fully described in the ONFI specification (which is pointed out in the
> comment).
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

Pushed to linux-mtd.git. Thanks!

Brian
