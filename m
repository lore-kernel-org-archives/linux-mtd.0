Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UmfWA-0006Xf-IG
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 07:30:55 +0000
Message-ID: <51B82388.2000909@ti.com>
Date: Wed, 12 Jun 2013 13:00:16 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: <u-boot@lists.denx.de>, <linux-mtd@lists.infradead.org>
Subject: U-boot: Erase/read/write issue with S25fl256S flash device
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Tom Rini <trini@ti.com>, jagannadha.sutradharudu-teki@xilinx.com,
 Felipe Balbi <balbi@ti.com>, Rajendra nayak <rnayak@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am working on qspi flash device S25FL256S at u-boot level. I am trying to
make use of the existing spi_flash.c framework available at u-boot for 
erasing/reading/writing
into the flash device.

There are several issues(mentioned below), which I faced while using 
S25FL256s flash device
with my dra7xx board which has a qspi controller to which the above 
mentioned flash device is attached.

1. Erase (spi_flash_cmd_erase)

Issuing a command something like this..

sf erase 0x0 0x50000
  - erases only first 0x20000 bytes of flash device, anything above that 
is not erase. I need to
    issue separate commands after 0x20000 for every 0x10000 bytes.

Am i missing anything here?

2. read

sf read 81000000 0 0x10000

Read is not happening properly. The last few byte along the 4k boundary 
always shows zero.
Above 4k bytes, read is not happening.

For ex:
  DRA752 EVM # md 81000f00
81000f00: ffffffff ffffffff ffffffff ffffffff    ................
81000f10: ffffffff ffffffff ffffffff ffffffff    ................
81000f20: ffffffff ffffffff ffffffff ffffffff    ................
81000f30: ffffffff ffffffff ffffffff ffffffff    ................
81000f40: ffffffff ffffffff ffffffff ffffffff    ................
81000f50: ffffffff ffffffff ffffffff ffffffff    ................
81000f60: ffffffff ffffffff ffffffff ffffffff    ................
81000f70: ffffffff ffffffff ffffffff ffffffff    ................
81000f80: ffffffff ffffffff ffffffff ffffffff    ................
81000f90: ffffffff ffffffff ffffffff ffffffff    ................
81000fa0: ffffffff ffffffff ffffffff ffffffff    ................
81000fb0: ffffffff ffffffff ffffffff ffffffff    ................
81000fc0: ffffffff ffffffff ffffffff ffffffff    ................
81000fd0: ffffffff ffffffff ffffffff ffffffff    ................
81000fe0: ffffffff ffffffff ffffffff ffffffff    ................
81000ff0: ffffffff ffffffff 00ffffff 00000000    ................

In this dump, if you see 81000ff0 the last column shows 000000 which is
not expected. and it happens along every 4k bytes.


So, to get rid of the above issue, I switched to page read with the 
below patch[1],
which is giving me the correct result.
[1]:
@@ -147,17 +153,40 @@ int spi_flash_read_common(struct spi_flash *flash, 
const u8 *cmd,
  int spi_flash_cmd_read_fast(struct spi_flash *flash, u32 offset,
                 size_t len, void *data)
  {
-       u8 cmd[5];
+       unsigned long page_addr, byte_addr, page_size;
+       size_t chunk_len, actual;
+       int ret = 0;
+       u8 cmd[4];

         /* Handle memory-mapped SPI */
         if (flash->memory_map)
                 memcpy(data, flash->memory_map + offset, len);
+       page_size = flash->page_size;
+       page_addr = offset / page_size;
+       byte_addr = offset % page_size;
+
+       cmd[0] = CMD_READ_ARRAY_SLOW;
+       for (actual = 0; actual < len; actual += chunk_len) {
+               chunk_len = min(len - actual, page_size - byte_addr);
+
+               cmd[1] = page_addr >> 8;
+               cmd[2] = page_addr;
+               cmd[3] = byte_addr;
+
+               ret = spi_flash_read_common(flash, cmd, sizeof(cmd), 
data + actual, chunk_len);
+               if (ret < 0) {
+                       debug("SF: read failed");
+                       break;
+               }

-       cmd[0] = CMD_READ_ARRAY_FAST;
-       spi_flash_addr(offset, cmd);
-       cmd[4] = 0x00;
+               byte_addr += chunk_len;
+               if (byte_addr == page_size) {
+                       page_addr++;
+                       byte_addr = 0;
+               }
+       }

-       return spi_flash_read_common(flash, cmd, sizeof(cmd), data, len);
+       return ret;
  }

Any idea about this?

3.  write (spi_flash_cmd_write_multi)
   write not happening properly.

observations: only able to write single page, anything after a page is 
not getting
         written.
Workaround:
I did a write disable latch at the end of every write cycle(page 
program) and enable it
again for the next loop. With this, I see I get rid of the above issue.

  @@ -117,6 +117,12 @@ int spi_flash_cmd_write_multi(struct spi_flash 
*flash, u32 offset,
                 if (ret)
                         break;

+               ret = spi_flash_cmd_write_disable(flash);
+               if (ret < 0) {
+                       printf("SF: disabling write failed\n");
+                       break;
+               }
+


Have anyone seen the above mentioned issues regarding read/write/erase? 
OR is there any
configurations that I might be missing ?
