Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bu3qw-0003fj-BH
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2004 02:41:50 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
In-Reply-To: <20040809015950.GA20408@mobilesoft.com.cn>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
	<1091962414.1438.977.camel@imladris.demon.co.uk>
	<20040809015950.GA20408@mobilesoft.com.cn>
Content-Type: text/plain
Message-Id: <1092033702.1438.2169.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 09 Aug 2004 07:41:42 +0100
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

On Mon, 2004-08-09 at 09:59 +0800, Wu Jian Feng wrote:
> I see the same thing as rmk, used both gcc-3.3.2 and 3.4.0,
> on a OMAP730 (arm926ejs).

Russell hasn't been able to reproduce it. Can you? If so, how -- and can
you do same with CONFIG_JFFS2_FS_DEBUG=1 and show me the output?

-- 
dwmw2
