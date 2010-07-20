Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ObEpn-0008IY-Uk
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 15:34:21 +0000
Received: by ewy9 with SMTP id 9so2084809ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2010 08:34:17 -0700 (PDT)
Sender: Rogan Dawes <rogan.dawes@gmail.com>
Message-ID: <4C45C1F2.7050202@dawes.za.net>
Date: Tue, 20 Jul 2010 17:34:10 +0200
From: Rogan Dawes <rogan@dawes.za.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
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

I am trying to add support for the DNS323 to U-Boot, but am struggling 
with the flash chip, a Spansion S29GL064M90TFIR4. I am unable to get it 
to generate the appropriate CFI responses. In fact, I cannot even get it 
to react to the sequence to trigger the manufacturer ID, although I can 
get it to show the QRY response.

This is what I get (from the u-boot command line):

DNS323B1> mw.b 0xf4000000 0xF0
DNS323B1> md.b 0xf4000000 0x40
f4000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
f4000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
f4000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
f4000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
DNS323B1> mw.b 0xf40000aa 0x98
DNS323B1> md.b 0xf4000000 0x40
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
