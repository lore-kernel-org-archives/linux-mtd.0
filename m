Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAtDM-00021I-2U
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 12:18:48 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Wolter Kamphuis <wolter.kamphuis@opticon.com>
In-Reply-To: <4235B6B9.9030608@opticon.com>
References: <422EDE03.4080803@opticon.com> <423125F5.3070804@snapgear.com>
	<4235B6B9.9030608@opticon.com>
Content-Type: text/plain
Date: Mon, 14 Mar 2005 18:18:42 +0100
Message-Id: <1110820722.4814.47.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can't load DOC driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolter, 

please do not top post and snip the irrelevant bits.
http://www.infradead.org/~dwmw2/email.html

On Mon, 2005-03-14 at 17:07 +0100, Wolter Kamphuis wrote:
> Now, for some reason the nand-chip id isn't found correctly, it should
> be 0x75 (Toshiba:NAND 32MiB 3,3V 8-bit) but the driver find's 0xa5
> (Toshiba:NAND 2GiB 1,8V 8-bit). If I hardcode the chip id to 0x75 and 

Hardcoding seems not to be a bright idea to me. If something is read
wrong then there is usually a reason.

> load the ftl module I'm able to read from /dev/mtdblock/0, however it's 
> difficult to see if the information is correct.
> 
> I can't use the diskonchip module since that one doesn't support the 
> 32/64Mb DOC M+. I need to inftl module to be able to install a root 
> filesystem right?

Not inevitably.

> Will it be difficult to port the 32/64Mb DOC M+ to the new diskonchip 
> driver? I'm certainly not an expert...

I have no hardware to attack it myself, but lately somebody showed
interest to make it work. I have no clue how far it has evolved.

tglx
