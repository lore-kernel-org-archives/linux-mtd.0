Received: from [200.73.64.66] (helo=apolo.virtuabyte.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bvo09-0000Zv-42
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2004 22:10:34 -0400
Received: from cm-vina3-148-69.cm.vtr.net ([200.104.148.69])
	by apolo.virtuabyte.com (apolo.virtuabyte.com) with ASMTP id CQA74038
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 22:10:30 -0400
From: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Aug 2004 22:19:38 +0200
References: <200408131855.16376.lucasvr@gobolinux.org>
In-Reply-To: <200408131855.16376.lucasvr@gobolinux.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200408132219.39195.carlos@embedded.cl>
Subject: Re: CRC errors and DMA
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi,
>

Hi,

> What happens when the processor tryies to read data from memory while the
> bus is being used for DMA transfers by another device? Is it possible that

it depends on the processor, but that situation shouldn't happen... there must 
be some kind of bus master or some way to manage the bus (by using a token, 
by using a master-slave bus, ...). In most cases the DMA controller takes 
control of the bus during the DMA transfer, so the rest of the devices cannot 
use it

> this kind of situation turns into CRC errors when trying to read data from
> a flash device (JFFS2)?
> Given that this problem can happen, is there a way to make JFFS2, or the
> MTD subsystem to try to execute the operation again?
>

_IF_ you have that situation it is better to check your hardware or use 
another one, having a DMA controller that cannot take control of the bus to 
do its work is not a good situation...

-- 
Carlos Manuel Duclos Vergara
carlos@embedded.cl
