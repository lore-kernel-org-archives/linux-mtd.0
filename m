Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmfFx-0007DP-1Y
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 08:18:41 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so104633pbb.19
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 01:18:20 -0700 (PDT)
Date: Tue, 20 May 2014 01:18:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
Message-ID: <20140520081816.GG2413@norris-Latitude-E6410>
References: <1398991879-2448-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398991879-2448-1-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 01, 2014 at 08:51:19PM -0400, Kamal Dasu wrote:
> nand_base can be passed a kmap()'d buffers from highmem by
> filesystems like jffs2. This results in failure to map the
> physical address of the DMA buffer on various contoller
> driver on different platforms. This change adds a chip option
> to use preallocated databuf as bounce buffers used in
> nand_do_read_ops() and nand_do_write_ops().
> This allows for specific nand controller driver to set this
> option as needed.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
> 
> Changes since v4:
> * Made code more readable as per review comments

Pushed to l2-mtd.git. Thanks!

Brian
