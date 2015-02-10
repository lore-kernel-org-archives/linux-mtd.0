Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL237-0004NB-7q
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 04:04:15 +0000
Date: Tue, 10 Feb 2015 12:01:07 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH] mtd: nand: gpmi: fixup return type of
 wait_for_completion_timeout
Message-ID: <20150210040107.GB19195@hsj.sh.intel.com>
References: <1423413453-5254-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423413453-5254-1-git-send-email-hofrat@osadl.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 08, 2015 at 11:37:33AM -0500, Nicholas Mc Guire wrote:
> return type of wait_for_completion_timeout is unsigned long not int. The
> return variable is renamed to reflect its use and the type adjusted to
> unsigned long.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Acked-by: Huang Shijie <shijie.huang@intel.com>
