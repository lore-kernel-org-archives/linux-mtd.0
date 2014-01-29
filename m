Date: Tue, 28 Jan 2014 16:23:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 4/4] mtd: nand: remove the
 NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE
Message-ID: <20140129002346.GE8919@ld-irv-0074>
References: <1387555350-989-1-git-send-email-shijie8@gmail.com>
 <1387555350-989-5-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387555350-989-5-git-send-email-shijie8@gmail.com>
Cc: s.hauer@pengutronix.de, akinobu.mita@gmail.com, josh@joshtriplett.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 21, 2013 at 12:02:30AM +0800, Huang Shijie wrote:
> There is no reference to these two macros now.
> Just remove them.
> 
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Now that patch 3 is fixed, I've pushed this patch as well. Thanks for
cleaning this up!

Brian
