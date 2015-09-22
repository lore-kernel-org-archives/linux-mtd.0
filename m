Date: Mon, 21 Sep 2015 17:15:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 Priit Laes <plaes@plaes.org>, Hans de Goede <hdegoede@redhat.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: sunxi: fix sunxi_nand_chips_cleanup()
Message-ID: <20150922001528.GL31505@google.com>
References: <1442160883-29011-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442160883-29011-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 13, 2015 at 06:14:43PM +0200, Boris Brezillon wrote:
> The sunxi_nand_chips_cleanup() function is missing a call to list_del()
> which generates a double free error.

And if you could manage to get past that...an infinite loop, no?

> Reported-by: Priit Laes <plaes@plaes.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: <stable@vger.kernel.org> # 3.19+
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")

Applied to linux-mtd.git, as this is a -stable fix.

Brian
