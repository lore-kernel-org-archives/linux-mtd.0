Date: Thu, 7 May 2015 00:06:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx: Switch FIFO draining to
 jiffies-based timeout
Message-ID: <20150507070603.GG6055@norris-Latitude-E6410>
References: <1428413565-27644-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428413565-27644-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Boris Brezillon <boris@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 07, 2015 at 03:32:45PM +0200, Maxime Ripard wrote:
> Now that the driver handles the FIFO draining in a threaded interrupt, we can
> base our timeout on jiffies and sleeping, instead of using mdelay.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> Changes from v1:
>   - Switch to readl_relaxed_poll_timeout() instead of using our own custom
>     implementation of it.

Pushed to l2-mtd.git
