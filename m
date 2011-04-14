Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAMRx-0005Tj-To
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 13:19:10 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3EDJ6Am015154
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2011 16:19:06 +0300
Subject: Re: [PATCHv1 1/5] mkfs.jffs2: fix casting of printf argument
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem.Bityutskiy@nokia.com
In-Reply-To: <1302783893.2796.27.camel@localhost>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<1302783893.2796.27.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 16:21:54 +0300
Message-ID: <1302787314.24954.0.camel@fs-test.research.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-14 at 15:24 +0300, Artem Bityutskiy wrote:
> On Wed, 2011-04-13 at 16:20 +0300, Andy Shevchenko wrote:
> > The compiler warns us about cast mismatch for %9lu specifier.  In original code
> > the argument has __off64_t type. Here is a simple type casting fix.
> > 
> > Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> 
> If it is off64_t then you should better change the printf() placeholder
> to %ull and cast the argument to (unsigned long long)
> 
I was waiting for such correction because I don't know the limits of the
argument, thanks.


-- 
With Best Regards,
Andy Shevchenko
