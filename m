Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bu80n-0004FQ-5A
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2004 07:08:17 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Wu Jian Feng <jianfengw@mobilesoft.com.cn>, Dan Brown <dan_brown@ieee.org>
In-Reply-To: <1092033702.1438.2169.camel@imladris.demon.co.uk>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
	<1091962414.1438.977.camel@imladris.demon.co.uk>
	<20040809015950.GA20408@mobilesoft.com.cn>
	<1092033702.1438.2169.camel@imladris.demon.co.uk>
Content-Type: text/plain
Message-Id: <1092049678.4383.5149.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 09 Aug 2004 12:07:59 +0100
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

On Mon, 2004-08-09 at 07:41 +0100, David Woodhouse wrote:
> Russell hasn't been able to reproduce it. Can you? If so, how -- and can
> you do same with CONFIG_JFFS2_FS_DEBUG=1 and show me the output?

Don't bother, thanks. I found the problem, in the part_erase() code.
Waiting for the culprit to wake up and fix it... :)

-- 
dwmw2
