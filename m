Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0dCg-0007TE-Vk
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 05:11:43 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: dedekind@infradead.org
In-Reply-To: <1108371513.26412.7.camel@sauron.oktetlabs.ru>
References: <0IBW007DE84BOU@mmp1.samsung.com>
	<1108371513.26412.7.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 11:11:40 +0100
Message-Id: <1108375900.16612.280.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] adding support for OneNAND flash memory
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 11:58 +0300, Artem B. Bityuckiy wrote:
> And one more offer: the AG-AND support has been added directly to the
> nand, but seems it would be nice to separate it and put to
> drivers/mtd/nand/ag-and/ stuff - because ASFAICS, some of AG-AND code
> doesn't fit nicely to NAND stuff.

I don't see a real good reason to remove AG-AND from the NAND code. It
fits quite well and ripping it out would just duplicate 95% of the NAND
driver code. The tweaks to integrate AG-AND are really simple

tglx
