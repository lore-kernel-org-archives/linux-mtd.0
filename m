Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OcJRE-0008Ko-7m
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2010 14:41:25 +0000
Received: by wwb31 with SMTP id 31so2335878wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jul 2010 07:41:20 -0700 (PDT)
Sender: Rogan Dawes <rogan.dawes@gmail.com>
Message-ID: <4C49AA07.5050603@dawes.za.net>
Date: Fri, 23 Jul 2010 16:41:11 +0200
From: Rogan Dawes <rogan@dawes.za.net>
MIME-Version: 1.0
To: Alexey Korolev <akorolev@infradead.org>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Guillaume LECERF <glecerf@gmail.com>,
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>,
	Jiri Slaby <jslaby@suse.cz>,
	linux-mtd@lists.infradead.org, Massimo Cirillo <maxcir@gmail.com>,
	Nicolas Pitre <nico@fluxnic.net>, Stefani Seibold <stefani@seibold.net>,
	Wolfram Sang <w.sang@pengutronix.de>
Subject: Programming the flash chip in the Dlink DNS323
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I sent this mail to the linux-mtd list a few days ago, but got no 
response. The kernel get_maintainers script indicated that you had all 
had something to do with the CFI code in the past. If I have been 
excessive in my addressing, I apologize sincerely.

I'm trying to find out whether there is any special-casing in the kernel 
CFI code for the Spansion S29GL064M90TFIR4 used in my DNS-323. I am 
trying to build an up-to-date (U-Boot) bootloader, that has more 
functionality than the seriously crippled one that ships by default with 
the device.

Unfortunately, the current U-Boot CFI code can not detect the flash 
chip, which has led me to investigate how Linux controls it. From my 
initial reading of the setup code in 
arch/arm/mach-orion5x/dns323-setup.c, there doesn't seem to be anything 
special about the DNS-323's flash part, but I'd appreciate it if anyone 
could confirm that?

If there is nothing special-cased in the kernel CFI code, then I guess I 
will have to try to port the kernel CFI code to U-Boot.

See below for some info about how the Spansion flash part behaves in 
U-Boot, if you are interested.

Many thanks for reading this (and more if you respond! :-) )

Rogan

-------- Original Message --------
Subject: Programming the flash chip in the Dlink DNS323
Date: Tue, 20 Jul 2010 17:34:10 +0200
From: Rogan Dawes <rogan@dawes.za.net>
To: linux-mtd@lists.infradead.org
Newsgroups: gmane.linux.drivers.mtd

Hi folks,

I am trying to add support for the DNS323 to U-Boot, but am struggling
with the flash chip, a Spansion S29GL064M90TFIR4. I am unable to get it
to generate the appropriate CFI responses. In fact, I cannot even get it 
to react to the sequence to trigger the manufacturer ID, although I can 
get it to show the QRY response.

This is what I get (from the u-boot command line):

DNS323B1> mw.b 0xf4000000 0xF0          // send a reset
DNS323B1> md.b 0xf4000000 0x40          // display the first bytes
f4000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
f4000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
f4000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
f4000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
DNS323B1> mw.b 0xf40000aa 0x98         // enable QRY mode
DNS323B1> md.b 0xf4000000 0x40         // display the QRY info
f4000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
f4000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
f4000020: 51 51 52 52 59 59 02 02 00 00 40 40 00 00 00 00
QQRRYY....@@....
f4000030: 00 00 00 00 00 00 27 27 36 36 00 00 00 00 04 04
......''66......

The apparently odd thing is that rather than "QRY" at 0x10, I get
"QQRRYY" at 0x20, but the device should be in 8-bit mode, from all the
info I've found (including the kernel sources).

It seems that there is support for it in the mainstream kernel, and as
far as I can see, it is being detected using CFI.

Here is where it is set up:

arch/arm/mach-orion5x/dns323-setup.c

which simply defines the flash addresses and bus width:

static struct physmap_flash_data dns323_nor_flash_data = {
         .width          = 1,
         .parts          = dns323_partitions,
         .nr_parts       = ARRAY_SIZE(dns323_partitions)
};

static struct resource dns323_nor_flash_resource = {
         .flags          = IORESOURCE_MEM,
         .start          = DNS323_NOR_BOOT_BASE,
         .end            = DNS323_NOR_BOOT_BASE + DNS323_NOR_BOOT_SIZE - 1,
};

static struct platform_device dns323_nor_flash = {
         .name           = "physmap-flash",
         .id             = 0,
         .dev            = {
                 .platform_data  = &dns323_nor_flash_data,
         },
         .resource       = &dns323_nor_flash_resource,
         .num_resources  = 1,
};

Does anyone have any insight into this chip, and could help me add
support for it to U-Boot?

Many thanks.

Rogan
