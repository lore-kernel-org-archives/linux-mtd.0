Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t1ZY-0005LV-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 08:22:16 +0100
Subject: Re: how to use amd_flash.c
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <008801c1dba7$55a5b8b0$5501a8c0@synso.com.tw>
References: <008801c1dba7$55a5b8b0$5501a8c0@synso.com.tw>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Apr 2002 09:23:42 +0200
Message-Id: <1017905022.23995.13.camel@pcjonashg>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 2002-04-04 at 09:07, Steve Tsai wrote:
> I'd want to use mtd and jffs2 in our ARM7  board.  The flash is MX29LV160B/T
> and it is similar to am29LV160, but it does not support CFI. How many files
> do I to modify or add to mtd tree? It seems I can modify amd_flash.c to fit
> my flash, but I can not probe the chip at booting time. Does anyone know how
> to use amd_flash.c? thanks.

You need to find out the manufacturer ID and device ID for your chip. It
can usually be found in some datasheet at the manufacurer's site. Then
add an element to the amd_flash_info table[] in amd_flash_probe().

But the amd_flash driver is obsolete and you should use jedec_probe
instead. It works about the same way as amd_flash_probe. The only thing
that amd_flash does better than jedec_probe + CFI-driver is that it
handles different types of chips in the same map. But with the new MTD
concat layer you don't need to use amd_flash in that case either.

/Jonas
