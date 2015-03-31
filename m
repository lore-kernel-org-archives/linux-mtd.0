Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yckko-0000Qt-5v
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 01:14:06 +0000
Received: by pactp5 with SMTP id tp5so3012065pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 18:13:45 -0700 (PDT)
Date: Mon, 30 Mar 2015 18:13:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH] mtd: nand: gpmi: fixup return type of
 wait_for_completion_timeout
Message-ID: <20150331011341.GO32500@ld-irv-0074>
References: <1423413453-5254-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423413453-5254-1-git-send-email-hofrat@osadl.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie.huang@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

Pushed to l2-mtd.git.

Brian
