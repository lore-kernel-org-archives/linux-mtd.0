Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CANA4-0007pD-HX
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 02:33:01 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41515E42.3020900@yandex.ru>
References: <41515E42.3020900@yandex.ru>
Content-Type: text/plain
Message-Id: <1095920707.2925.3.camel@thomas>
Mime-Version: 1.0
Date: Thu, 23 Sep 2004 08:25:08 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand_command
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

On Wed, 2004-09-22 at 13:13, Artem B. Bityuckiy wrote:

> Chips with 256-byte page support only one programm operation like this:
> NAND_CMD_SEQIN, <addr>, <data>, NAND_CMD_PAGEPRG
> Correct? (I can't find any 256-byte page Flash manual to check)

Yes, those chips are out of production.

> If I'm correct, I propose to change a little the default command 
> function for "small page" devices (nand_base.c, nand_command). The code 
> is like this:

As this is legacy only and it does not influence the functionality, why
bother to have an additional check for something which isnt available
anyway.

tglx
