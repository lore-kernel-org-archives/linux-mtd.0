Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6kgQ-0004dI-Hr
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 02:51:28 -0400
Message-ID: <4145434B.90406@yandex.ru>
Date: Mon, 13 Sep 2004 10:50:51 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <414490B8.8050304@yandex.ru>
	<1095014499.13571.166.camel@thomas.tec.linutronix.de>
In-Reply-To: <1095014499.13571.166.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND page programm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> 
> NAND_CMD_READ0 sets the offset to the start of a page.
> NAND_CMD_READ1 sets the offset to 256. This is only available on chips
> with a pagesize = 512.
Thanks, this is what I thought.

Do all NAND chips support the second half page reads? It seems for me - not.

> 
> What are you looking for ?
Nothing special, I'm just writing a NAND flash driver (which simulates 
NAND flash in RAM) and was a little bit confused since there is no 
comments (concerning NAND commands)in nand.h ...
> 
> tglx
> 
Thanks for reply.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
