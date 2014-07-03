Date: Wed, 2 Jul 2014 17:26:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] mtd: s3c2410: Move to
 clk_prepare_enable/clk_disable_unprepare
Message-ID: <20140703002641.GP3599@ld-irv-0074>
References: <1404155536-3032-1-git-send-email-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1404155536-3032-1-git-send-email-anarsoul@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>,
 linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 30, 2014 at 10:12:16PM +0300, Vasily Khoruzhick wrote:
> Use clk_prepare_enable/clk_disable_unprepare to make the driver
> work properly with common clock framework.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
