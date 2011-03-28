Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46KN-0000oC-DZ
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 06:53:28 +0000
Received: by eyh6 with SMTP id 6so1125984eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 27 Mar 2011 23:53:25 -0700 (PDT)
Subject: Re: [PATCH 1/1] ubifs: debugfs operations may return both ERRs and
	NULLs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>
In-Reply-To: <1300887304-20932-1-git-send-email-ext-phil.2.carmody@nokia.com>
References: <20110323131614.GC18296@esdhcp04044.research.nokia.com>
	<1300887304-20932-1-git-send-email-ext-phil.2.carmody@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Mar 2011 09:51:27 +0300
Message-ID: <1301295087.2816.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-23 at 15:35 +0200, Phil Carmody wrote:
> I knew I invented IS_ERR_OR_NULL for something, and this was probably
> it. NULL has lost all information about what the error was, and the most
> appropriate error code is ENODEV. However, that's the only error code
> that the debugfs functions can return. So basically, any error = ENODEV.

This is not true that any error is -ENODEV. There are many other errors
possible, e.g., due to an invocation of simple_pin_fs().

I think the right fix would be to fix debugfs and return an error code
in any case.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
