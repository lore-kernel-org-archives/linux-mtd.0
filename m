Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCtQx-0001q4-OD
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 12:56:36 +0000
Received: by eyh6 with SMTP id 6so563796eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 05:56:33 -0700 (PDT)
Subject: Re: [PATCHv4 1/3] mkfs.jffs2: fix casting of __off64_t
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
References: <BANLkTi=gsiTx9PHQ7HJpzuZT2DvzGU_OqA@mail.gmail.com>
	<54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Apr 2011 15:53:40 +0300
Message-ID: <1303390420.2757.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-20 at 12:35 +0300, Andy Shevchenko wrote:
> The casting of __off64_t to unsigned long potentially wrong for values higher
> than ULONG_MAX.  Let's fix that by using PRIu64 classifier.
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> ---
>  mkfs.jffs2.c |   25 +++++++++++++------------
>  1 files changed, 13 insertions(+), 12 deletions(-)

Pushed, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
