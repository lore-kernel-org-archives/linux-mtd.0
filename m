Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6f6x-00007O-JJ
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 08:26:15 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p348Q9xN026817
	for <linux-mtd@lists.infradead.org>; Mon, 4 Apr 2011 11:26:09 +0300
Subject: Re: [PATCH] mkfs.ubifs: check output first
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1301905275-2087-1-git-send-email-ext-andriy.shevchenko@nokia.com>
References: <1301905275-2087-1-git-send-email-ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 11:23:16 +0300
Message-ID: <1301905396.2760.43.camel@localhost>
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

On Mon, 2011-04-04 at 11:21 +0300, Andy Shevchenko wrote:
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> ---
>  mkfs.ubifs/mkfs.ubifs.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)

Added the following commit message:
"Artem: this is jut a clean-up, no functional changes."
and pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
