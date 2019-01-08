Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggmmB-0006E4-0C
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2019 08:30:22 +0000
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Alban Bedel <albeu@free.fr>
Subject: Re: [1/2] mtd: Fix the check on nvmem_register() ret code
Date: Tue,  8 Jan 2019 09:30:10 +0100
Message-Id: <20190108083010.20937-1-bbrezillon@kernel.org>
In-Reply-To: <20190102143654.24362-1-bbrezillon@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@bootlin.com>

On Wed, 2019-01-02 at 14:36:53 UTC, Boris Brezillon wrote:
> Commit 20167b70c894 ("nvmem: use EOPNOTSUPP instead of ENOSYS") changed
> the nvmem_register() ret code from ENOSYS to EOPNOTSUPP when
> CONFIG_NVMEM is not enabled, but the check in mtd_nvmem_add() was not
> adjusted accordingly.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Alban Bedel <albeu@free.fr>
> Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
