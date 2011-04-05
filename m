Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75z4-00044H-4Q
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:07:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35D7nN7016455
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:07:49 +0300
Subject: Re: [PATCHv1 3/3] tests: fix compiler warnings
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem.Bityutskiy@nokia.com
In-Reply-To: <1302007944.2760.126.camel@localhost>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<bbd26145dfa5e5c63c323e01cbd4917002bdde89.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<1302007944.2760.126.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 16:08:25 +0300
Message-ID: <1302008905.29819.127.camel@fs-test.research.nokia.com>
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

On Tue, 2011-04-05 at 15:52 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-04-05 at 14:33 +0300, Andy Shevchenko wrote:
> > Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> > ---
> >  tests/checkfs/checkfs.c              |    8 ++++----
> >  tests/checkfs/comm.c                 |    2 +-
> >  tests/fs-tests/lib/tests.c           |    3 ++-
> >  tests/fs-tests/stress/atoms/pdfrun.c |    5 ++++-
> >  tests/jittertest/JitterTest.c        |   11 ++++++++---
> >  tests/ubi-tests/integ.c              |    5 +++--
> >  6 files changed, 22 insertions(+), 12 deletions(-)
> 
> Would it please be possible to split this patch on a series of per-test
> patches and may be write which warnings are fixed. For some of the
> changes it is difficult to figure out what is being fixed.
Makes sense. Will do.


-- 
With Best Regards,
Andy Shevchenko
