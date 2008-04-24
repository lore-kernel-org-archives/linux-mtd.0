Subject: Re: physmap and "request_module: runaway loop modprobe net-pf-1"
From: David Woodhouse <dwmw2@infradead.org>
To: David Miller <davem@davemloft.net>
In-Reply-To: <20080424.002038.201593352.davem@davemloft.net>
References: <1209016143.9212.910.camel@pmac.infradead.org>
	<20080423.231055.193687131.davem@davemloft.net>
	<1209021399.9212.927.camel@pmac.infradead.org>
	<20080424.002038.201593352.davem@davemloft.net>
Content-Type: text/plain
Date: Thu, 24 Apr 2008 08:24:12 +0100
Message-Id: <1209021852.9212.936.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: netdev@vger.kernel.org, akpm@linux-foundation.org,
	gordonfarquharson@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-24 at 00:20 -0700, David Miller wrote:
> But won't the request_module() for AF_UNIX spit out that warning too?

Yes. If you build AF_UNIX as a module, it will. Just once though, before
loading it (assuming it's available).

> Actually, I think I need a clarification.  It is the modular loader
> utility in userspace which is trying to open up AF_UNIX sockets,
> right?

Yes. Or probably libc.

-- 
dwmw2
