Date: Sat, 28 Feb 2015 01:28:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 01/10] mtd: pxa3xx_nand: initialiaze pxa3xx_flash_ids
 to 0
Message-ID: <20150228092808.GC12966@brian-ubuntu>
References: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
 <1423752816-26219-2-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423752816-26219-2-git-send-email-antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 12, 2015 at 03:53:27PM +0100, Antoine Tenart wrote:
> pxa3xx_flash_ids wasn't initialized to 0, which in certain cases could
> end up containing corrupted values in its members. Fix this to avoid
> possible issues.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Applied this patch to l2-mtd.git. The others are TBD still. (Haven't
examined all of them too closely.)

Brian
