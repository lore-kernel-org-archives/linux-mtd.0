Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6krS-0004np-Uy
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 03:02:54 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4145434B.90406@yandex.ru>
References: <414490B8.8050304@yandex.ru>
	<1095014499.13571.166.camel@thomas.tec.linutronix.de>
	<4145434B.90406@yandex.ru>
Content-Type: text/plain
Message-Id: <1095058510.27820.1.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Mon, 13 Sep 2004 08:55:10 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND page programm
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-09-13 at 08:50, Artem B. Bityuckiy wrote:
> Thomas Gleixner wrote:
> > 
> > NAND_CMD_READ0 sets the offset to the start of a page.
> > NAND_CMD_READ1 sets the offset to 256. This is only available on chips
> > with a pagesize = 512.
> Thanks, this is what I thought.
> 
> Do all NAND chips support the second half page reads? It seems for me - not.

Only the ones with 512byte pagesize.

> > 
> > What are you looking for ?
> Nothing special, I'm just writing a NAND flash driver (which simulates 
> NAND flash in RAM) and was a little bit confused since there is no 
> comments (concerning NAND commands)in nand.h ...
> > 
AFAICS, we use this command no more, as we always read / write page
aligned.

tglx
