Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q777I-00054s-BF
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:20:28 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35EKM2p031405
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 17:20:22 +0300
Subject: Re: [PATCHv1 3/5] tests: fs-tests: check return value of functions
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <aeae7a7b14f785f1bd3ee5fd74dea8e7521a160b.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<aeae7a7b14f785f1bd3ee5fd74dea8e7521a160b.1302011698.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 17:17:15 +0300
Message-ID: <1302013035.2760.133.camel@localhost>
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
> chdir() returns negative value in case of error.
> fscanf() returns amount of successfully parsed parameters.
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> ---
>  tests/fs-tests/lib/tests.c           |    3 ++-
>  tests/fs-tests/stress/atoms/pdfrun.c |    5 ++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Pushed this one, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
