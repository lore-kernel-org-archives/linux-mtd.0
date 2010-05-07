Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OAPQC-0002TA-Em
	for linux-mtd@lists.infradead.org; Fri, 07 May 2010 15:25:01 +0000
Subject: Re: UBIFS: Oops while rebooting 2.6.34-rc6
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Mack <daniel@caiaq.de>
In-Reply-To: <20100507131652.GT30801@buzzloop.caiaq.de>
References: <20100507131652.GT30801@buzzloop.caiaq.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 07 May 2010 18:23:46 +0300
Message-ID: <1273245826.4537.294.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sven Neumann <s.neumann@raumfeld.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-05-07 at 15:16 +0200, Daniel Mack wrote:
> Hi,
> 
> We've had a kernel Oops today when rebooting an ARM PXA based machine
> while file I/O via SSH was outstanding.
> 
> Daniel
> 
> # reboot
> # [  671.190085] UBIFS: un-mount UBI device 0, volume 1
> The system is going down NOW!
> Sent SIGTERM to all processes
> [  672.083833] Unable to handle kernel NULL pointer dereference at virtual address 000000ac
> [  672.094587] pgd = c0004000
> [  672.097301] [000000ac] *pgd=00000000
> [  672.100850] Internal error: Oops: 817 [#1]
> [  672.104919] last sysfs file: /sys/devices/platform/spi_gpio.0/spi0.2/value

It's Firday, and I want to go home, so here is another quick idea for
you where to dig.

When the system reboots it re-mounts the FS to RO mode, usually. And
there is some emergency remount business (see do_emergency_remount()),
which will re-mount the FS even if there are files opened for writing.

So, if there is a UBIFS or VFS bug, and somehow one process is in
make_reservation() and is about to write something, and another process
managed to re-mount the FS to R/O mode, then we may ooops, because UBIFS
frees these 'wbuf' objects when it is mounted to R/O (see
ubifs_remount_ro()).

So, inject printks to ubifs_remount_ro() to check this theory.

Have a nice weekend and bughunting!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
