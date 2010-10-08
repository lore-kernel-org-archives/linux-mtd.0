Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P463T-0004QI-HQ
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 06:03:47 +0000
Received: by mail-fx0-f49.google.com with SMTP id 15so451532fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 23:03:43 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand.h: little more cleanup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20101007194827.GA5512@www.tglx.de>
References: <20101005104101.GA18714@www.tglx.de>
	<20101005182656.GA21067@pengutronix.de>
	<1286304506.1797.2.camel@brekeke>
	<20101006210614.GA18551@www.tglx.de> <1286479829.1797.12.camel@brekeke>
	<20101007194827.GA5512@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Oct 2010 09:00:54 +0300
Message-ID: <1286517654.2095.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-07 at 21:48 +0200, Sebastian Andrzej Siewior wrote:
> - remove tabs between type and name.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> - replaced hipsize with chipsize.
> 
>  include/linux/mtd/nand.h |  315 +++++++++++++++++++++------------------------
>  1 files changed, 147 insertions(+), 168 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
