Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AA0ku-0004ue-US
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 06:33:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: J B <mad_flasher@hotmail.com>
In-Reply-To: <Law11-F88qfH4OWXoGR0001766a@hotmail.com>
References: <Law11-F88qfH4OWXoGR0001766a@hotmail.com>
Message-Id: <1066282313.18189.17.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 16 Oct 2003 06:31:53 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi_cmdset_0020.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-15 at 20:54 -0500, J B wrote:
> 2.  According to the data sheet for the M58LW032A, the erase operation can 
> complete in the period between issuing the suspend command and the time the 
> erase controller stops.  The last part ot the patch checks the erase 
> suspended bit in the status register and only sets the suspended variable if 
> the bit is on.  This keeps the software state machine in sync with the 
> actual state of the hardware.

Consider the case where you have two chips side by side on the bus. One
completes and the other doesn't; your if() statement doesn't match that
but we still needed to restart the erase.

cfi_cmdset_0001.c issues an erase resume and then a status command, to
ensure that the chip goes into status mode even if it had previously
completed the erase.

-- 
dwmw2
