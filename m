Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DpPFc-0000wn-4z
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 07:36:37 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "A.U.T Information" <louis@auttw.com>
In-Reply-To: <001501c58085$df316850$6fd4e43d@notebook>
References: <001501c58085$df316850$6fd4e43d@notebook>
Content-Type: text/plain
Date: Mon, 04 Jul 2005 13:39:22 +0200
Message-Id: <1120477162.18862.74.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to mount flash disk to /dev/mtd*
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-04 at 18:48 +0800, A.U.T Information wrote:
>              I have a usb flash disk.I want to read/write/erase  the
> USB flash disk.But the linux(Fedora 4 kernel2.6.12)automount it
> to /dev/sda.So,can i mount it to /dev/mtd*  and use MTD util to
> read/write/erase the flash disk(nand flash)?How do i it?

The usb sticks have an own controller chip, which handles the FLASH and
provides a block device interface. I'm not aware of a stick, which lets
you access the FLASH transparently.

tglx
