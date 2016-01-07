Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH0fV-0006Da-E1
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 02:51:18 +0000
Received: by mail-pa0-x233.google.com with SMTP id cy9so246479424pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 18:50:57 -0800 (PST)
Date: Wed, 6 Jan 2016 18:50:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
Message-ID: <20160107025054.GA109450@google.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
 <1451503927-10831-3-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451503927-10831-3-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 30, 2015 at 08:32:04PM +0100, Boris Brezillon wrote:
> The default NAND read functions are relying on the underlying controller
> driver to correct bitflips, but some of those controllers cannot properly
> fix bitflips in erased pages.
> Check for bitflips in erased pages in default core functions if the driver
> delegated the this check by setting the NAND_ECC_GENERIC_ERASED_CHECK flag.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed to l2-mtd.git
