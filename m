Subject: Re: [patch 1/2] MTD: use list_for_each_entry() in add_mtd_device()
From: David Woodhouse <dwmw2@infradead.org>
To: matthias@kaehlcke.net
In-Reply-To: <20080531132808.984625508@kaehlcke.net>
References: <20080531132808.644758754@kaehlcke.net>
	<20080531132808.984625508@kaehlcke.net>
Content-Type: text/plain
Date: Wed, 04 Jun 2008 17:34:08 +0100
Message-Id: <1212597248.32207.126.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-05-31 at 15:28 +0200, matthias@kaehlcke.net wrote:
> -                       struct list_head *this;
> +                       struct mtd_notifier *not

That's not even going to compile, surely?

-- 
dwmw2
