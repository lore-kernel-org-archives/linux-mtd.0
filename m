Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6ZPJ-0003Qx-LS
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2004 14:49:04 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <414490B8.8050304@yandex.ru>
References: <414490B8.8050304@yandex.ru>
Content-Type: text/plain
Message-Id: <1095014499.13571.166.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Sun, 12 Sep 2004 20:41:39 +0200
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

On Sun, 2004-09-12 at 20:08, Artem B. Bityuckiy wrote:
> Hello guys.
> 
> As I understand the NAND_CMD_READ0 command is the "read whole page" 
> command. What doed the NAND_CMD_READ1 command exactly mean? Is there 
> some fixed semantic? (see linux/mtd/nand.h)

NAND_CMD_READ0 sets the offset to the start of a page.
NAND_CMD_READ1 sets the offset to 256. This is only available on chips
with a pagesize = 512. 

What are you looking for ?

tglx
