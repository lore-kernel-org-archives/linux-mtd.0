Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALgH-0004qq-9x
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:29:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3ECTolR024776
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2011 15:29:51 +0300
Subject: Re: [PATCHv1 3/5] tests: fs-tests: read() returns ssize_t value
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <8aa731c3a7a071bb9216500d72c9a8d7a7e2b830.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<8aa731c3a7a071bb9216500d72c9a8d7a7e2b830.1302700658.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:26:33 +0300
Message-ID: <1302783993.2796.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 16:20 +0300, Andy Shevchenko wrote:
> Use ssize_t instead of size_t.
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>

Pushed this one, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
