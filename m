Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q76yi-0004uu-Fk
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:11:36 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35EBUvf023971
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 17:11:30 +0300
Subject: Re: [PATCHv1 1/5] tests: checkfs: fix compiler warnings
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 17:08:40 +0300
Message-ID: <1302012520.2760.131.camel@localhost>
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
> There are two warnings:
>  - strlen() is used without prototype
>  - argument of printf() is unsigned long, but used specifier is for int
> 
> This patch fixes them.
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>

Pushed to mtd-utils.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
