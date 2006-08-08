Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GAUvK-0004DK-7d
	for linux-mtd@lists.infradead.org; Tue, 08 Aug 2006 12:59:28 -0400
Message-ID: <44D8C331.8080800@ru.mvista.com>
Date: Tue, 08 Aug 2006 21:00:33 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>, tglx@linutronix.de
Subject: Re: [MTD] NAND: Fix ams-delta after core conversion
References: <20060808153944.GA8126@earth.li> <44D8C0E0.9070800@ru.mvista.com>
In-Reply-To: <44D8C0E0.9070800@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Sergei Shtylyov wrote:

>>The recent hwctrl core conversion for MTD NAND devices broke the Amstrad
>>Delta driver. This fixes it up and uses the existing control line
>>defines rather than unclear magic numbers.

>     Ugh, au1550nd.c also looks broken by this change. No time to fix now though...

   OTOH, it was too hasty conclusion. This driver overrides both select_chip 
and cmdfunc, so probably not. I'll try it somewhat later for real...

WBR, Sergei
