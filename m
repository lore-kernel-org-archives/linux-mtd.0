Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALjm-0004vM-GO
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:33:31 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3ECXRVk023535
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2011 15:33:27 +0300
Subject: Re: [PATCHv1 5/5] tests: ubi-tests: clean libubi.a and *.o
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <5dca68dbcc29a1bdc8a866b9c3d1f19853ddde3c.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<8aa731c3a7a071bb9216500d72c9a8d7a7e2b830.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<6cb173d447de7eb92ead54f450da7752a40e476c.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<5dca68dbcc29a1bdc8a866b9c3d1f19853ddde3c.1302700658.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:30:15 +0300
Message-ID: <1302784215.2796.31.camel@localhost>
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
> The common.mk contains clean target that removes *.o and $(TARGETS). Thus, make
> custom clean target only for libubi.a
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
