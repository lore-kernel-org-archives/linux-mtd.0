Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q775M-00051d-Ce
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:18:28 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35EIM99031923
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 17:18:22 +0300
Subject: Re: [PATCHv1 2/5] tests: checkfs: fix linker warnings
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 17:15:18 +0300
Message-ID: <1302012918.2760.132.camel@localhost>
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

On Tue, 2011-04-05 at 16:55 +0300, Andy Shevchenko wrote:
> The sys_errlist[errno] is deprecated. We should use strerror(errno) instead.
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> ---
>  tests/checkfs/checkfs.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Pushed this one, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
