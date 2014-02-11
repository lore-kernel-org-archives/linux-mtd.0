Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDIKB-0006cl-TJ
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 18:44:52 +0000
Received: by mail-ie0-f181.google.com with SMTP id to1so4832548ieb.40
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 10:44:30 -0800 (PST)
Date: Tue, 11 Feb 2014 10:44:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix erronous read_buf call in
 nand_write_page_raw_syndrome
Message-ID: <20140211184426.GF18440@ld-irv-0074>
References: <1391278228-12701-1-git-send-email-b.brezillon.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391278228-12701-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 01, 2014 at 07:10:28PM +0100, Boris BREZILLON wrote:
> read_buf is called in place of write_buf in the
> nand_write_page_raw_syndrome function.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>

Good catch! I guess no one really tests this function. I can understand
that, since it's in the "raw" version (i.e., without ECC), which should
really only be used for special debugging purposes. And many drivers
don't use the defaults for page writes.

Pushed to l2-mtd.git.

Brian
