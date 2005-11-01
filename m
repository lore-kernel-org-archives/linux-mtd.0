Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWvXt-0001yN-Q9
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2005 07:47:28 -0500
Message-ID: <43676442.5010407@ru.mvista.com>
Date: Tue, 01 Nov 2005 15:49:06 +0300
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Pantelis Antoniou <panto@intracom.gr>,  linux-mtd@lists.infradead.org
References: <4363DF17.6080906@ru.mvista.com> <43672CFA.1060907@intracom.gr>
In-Reply-To: <43672CFA.1060907@intracom.gr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pantelis Antoniou wrote:
> Sergei Shtylylov wrote:
> 
> [snip]
> 
> I have the exact same problem on a different board, which I
> fix by disabling interrupts (and hacking out the yield() call
> in nand_base.c).

    In my understanding, you can't yield() as the other process may be 
accessing NOR flash at the same time, so we'll get what we're trying to
avoid.

> I'd very much like to see it addressed properly.
> 
> Regards
> 
> Pantelis

WBR, Sergei
