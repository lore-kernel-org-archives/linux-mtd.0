Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CI0VO-0003Ov-Ma
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2004 03:58:35 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Balint Cristian <rezso@rdsor.ro>
In-Reply-To: <200410141027.44044.rezso@rdsor.ro>
References: <200410141027.44044.rezso@rdsor.ro>
Content-Type: text/plain
Message-Id: <1097740239.25287.17.camel@thomas>
Mime-Version: 1.0
Date: Thu, 14 Oct 2004 09:50:39 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MD-2811-032] DoCMilPlus32 missrecognized on pxa250.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please fix your mail client to use standard line breaks !

On Thu, 2004-10-14 at 09:27, Balint Cristian wrote:
> "Flash chip found: Manufacturer ID: 98, Chip ID: A5 
> (Toshiba: NAND 2GiB 1,8V)"

The doc is configured for 16 bit access, the driver uses 8-bit access.
That's a known issue.

Search the mail-archive for a thread with the subject "[PATCH]Probing at
0x0"

The solution is proposed in the thread

tglx
