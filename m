Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QANA3-0005s8-Kw
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 14:04:44 +0000
Received: by eyh6 with SMTP id 6so537637eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 07:04:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] atmel_nand: add missing include of linux/dmaengine.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
In-Reply-To: <1302788366.2796.37.camel@localhost>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1302788366.2796.37.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 17:01:46 +0300
Message-ID: <1302789706.2796.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-14 at 16:39 +0300, Artem Bityutskiy wrote:
> On Wed, 2011-04-13 at 15:55 +0200, Hans-Christian Egtvedt wrote:
> > Including linux/dmaengine.h fixes the missing definition of the enum
> > dma_ctrl_flags type used in atmel_nand_dma_op function.
> > 
> > Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
> 
> I do not see how it is a problem. C does not support strict types
> checking anyway. This all is just 'int'.

Sorry, I was too fast. Pushed to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
