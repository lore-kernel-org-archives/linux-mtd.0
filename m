Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C92KF-00060f-8Z
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2004 10:06:01 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <414D901A.3000703@yandex.ru>
References: <414D901A.3000703@yandex.ru>
Content-Type: text/plain
Message-Id: <1095602310.28388.368.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Sun, 19 Sep 2004 15:58:31 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND_NO_AUTOINCR
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-09-19 at 15:56, Artem B. Bityuckiy wrote:
> It seems that NAND_NO_AUTOINCR option isn't really used in mtd, anyway...

It is used. :)
nand.h
#define NAND_CANAUTOINCR(chip) (!(chip->options & NAND_NO_AUTOINCR))

> What does the NAND_NO_AUTOINCR mean? I suspect that this means that in 
> read operations we can continue reading next consequitive pages without 
> new read operation cycle. Is it this?

Yes, most of the 1st generation chips (256/512 byte pagesize) have this
feature. It's important to be aware of this.
After reading a page, those chips are automatically transferring the
next page into the read buffer.
The 2nd generation chips (2K pagesize and a couple of the newer 512byte
pagesize chips) do not have this feature, so you must explicitely issue
a new page read command to get the next page data.

tglx
