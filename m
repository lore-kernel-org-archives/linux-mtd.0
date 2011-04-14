Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAMoR-0005eW-0S
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 13:42:24 +0000
Received: by ewy3 with SMTP id 3so530898ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 06:42:21 -0700 (PDT)
Subject: Re: [PATCH 1/2] atmel_nand: add missing include of linux/dmaengine.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
In-Reply-To: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 16:39:26 +0300
Message-ID: <1302788366.2796.37.camel@localhost>
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

On Wed, 2011-04-13 at 15:55 +0200, Hans-Christian Egtvedt wrote:
> Including linux/dmaengine.h fixes the missing definition of the enum
> dma_ctrl_flags type used in atmel_nand_dma_op function.
> 
> Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

I do not see how it is a problem. C does not support strict types
checking anyway. This all is just 'int'.

IMHO, the enums you invented only make code less readable for C
programmers.

I'd suggest to turn all you enums into anonymous enums and stop using
them as types. That would only make things more readable and easier to
follow.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
