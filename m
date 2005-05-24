Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaeSC-00046d-4B
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 14:48:37 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <42935087.3000108@ru.mvista.com>
References: <42933C35.3040305@ru.mvista.com>
	<1116946904.6736.212.camel@tglx.tec.linutronix.de>
	<42935087.3000108@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 24 May 2005 20:48:18 +0200
Message-Id: <1116960498.6736.215.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: last commit breaks the AMD NOR flash functionality?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly,

On Tue, 2005-05-24 at 20:04 +0400, Vitaly Wool wrote:
> which won't work in my case (16-bit flash access).
> The suggested fix is the following:

Thanks for pointing that out. I fixed it in CVS so it is working for
64bit machines too.

tglx
