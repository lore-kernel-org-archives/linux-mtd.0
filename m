Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PTpS-0006Mb-W7
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 22:05:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vladimir Doukhanine <vdoukhan@cbnco.com>
In-Reply-To: <oprqimhyy07bj7b7@cbnsitar.cbnco.com>
References: <oprqimhyy07bj7b7@cbnsitar.cbnco.com>
Message-Id: <1055192753.16455.17.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 09 Jun 2003 22:05:53 +0100
Content-Type: text/plain; charset=iso-8859-7
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem mounting root jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-09 at 20:45, Vladimir Doukhanine wrote:
> Hi,
> 
> Just upgraded kernel 2.4.20 and MTD from cvs and I'm experiencing some 
> weird delay 1-2 minutes when kernel initially mounts jffs2.
> I¢d appreciate if someone can give me an idea what could be wrong.

Did you update JFFS2 from CVS too?

If not, do so.

If so, use profiling and tell me where it was spending all the time.

-- 
dwmw2
