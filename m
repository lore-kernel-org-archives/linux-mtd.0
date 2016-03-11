Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeR4o-0001jH-Vk
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2016 17:42:15 +0000
Received: by mail-pa0-x236.google.com with SMTP id fl4so103999951pad.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2016 09:41:53 -0800 (PST)
Date: Fri, 11 Mar 2016 09:41:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] mtd: nand: remove kerneldoc for removed function parameter
Message-ID: <20160311174150.GE2545@google.com>
References: <1457642843-16935-1-git-send-email-computersforpeace@gmail.com>
 <20160311104728.77725c12@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160311104728.77725c12@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 11, 2016 at 10:47:28AM +0100, Boris Brezillon wrote:
> On Thu, 10 Mar 2016 12:47:23 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > The 'getchip' parameter is gone as of commit 9f3e04297b08 ("mtd: nand:
> > don't select chip in nand_chip's block_bad op"), so kill the doc with
> > it.
> > 
> > Reported-by: kbuild test robot <fengguang.wu@intel.com>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied
