Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BuWUg-0007S5-3F
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2004 09:16:46 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
In-Reply-To: <20040810005204.GA15714@mobilesoft.com.cn>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
	<1091962414.1438.977.camel@imladris.demon.co.uk>
	<20040809015950.GA20408@mobilesoft.com.cn>
	<1092057472.4383.5155.camel@hades.cambridge.redhat.com>
	<20040810005204.GA15714@mobilesoft.com.cn>
Content-Type: text/plain
Message-Id: <1092143795.4383.8195.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 10 Aug 2004 14:16:36 +0100
Content-Transfer-Encoding: 7bit
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] 2.6.8-rc3 slab corruption (jffs2?)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-10 at 08:52 +0800, Wu Jian Feng wrote:
> On Mon, Aug 09, 2004 at 02:17:53PM +0100, David Woodhouse wrote:
> > 
> > Please could you test this....
> > 
> 
> It doesn't compile :-(

Doh. I committed that fix too -- I'll send it to Linus today. Thanks.

-- 
dwmw2
