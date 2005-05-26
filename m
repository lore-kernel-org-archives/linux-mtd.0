Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbC6w-0003YR-EZ
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 02:44:55 -0400
From: Andrew Victor <andrew@sanpeople.com>
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
In-Reply-To: <4294D4F2.6010105@cetrtapot.si>
References: <4294D4F2.6010105@cetrtapot.si>
Content-Type: text/plain
Message-Id: <1117089331.6175.19.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 26 May 2005 08:35:32 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Serial flash memory support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Hinko,

> Has anybody done something on the SPI flash memory devices already?

Yes, there is a driver for Atmel's DataFlash.

The driver is included in the 2.4 ARM-Linux kernels
(www.arm.linux.org.uk) and the 2.6 patches for the AT91RM9200 processor
(http://maxim.org.za/AT91RM9200/2.6/).


Regards,
  Andrew Victor
