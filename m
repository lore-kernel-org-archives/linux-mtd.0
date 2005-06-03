Received: from moutvdom.kundenserver.de ([212.227.126.249]
	helo=moutvdomng.kundenserver.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DeFMu-0002Pd-S4
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 12:50:03 -0400
Message-ID: <42A0879F.9090905@anagramm.de>
Date: Fri, 03 Jun 2005 18:38:55 +0200
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <42A05775.3010102@anagramm.de>
	<20050603142930.GB18748@wohnheim.fh-wedel.de>
In-Reply-To: <20050603142930.GB18748@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD for FPGA framegrabber
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Joern!

Okay... it seems to be my lucky day.
I know that using map_rom was bullsomething.

 > Since you want to access sram, you want to create a standalone mtd
 > driver, similar to phram.  As a starter, you can simply use phram and
 > switch from memcpy() to dma later.

Well, my idea was to use map_ram also instead of map_rom... and
instead of patching around in physmap, I copied the code which looked
essential to me out of physmap and phram and some others like the sram
part of cdb89712.c... into my own driver... and... voila!
It works! Which means that I get read and write accesses on my local
bus. :-)

Just FYI:
-----8<-----------------------------------------------------------------
static struct mtd_info *ecam_mtd;

struct map_info ecam_map = {
         .name = "eCam FPGA-SRAM",
         .phys = 0xfc000000,
         .size = 0x00100000,
         .bankwidth = 4,
         .virt = NULL,
};

static int mminfo_mtdinit(void)
{
         int err;

         DBG("----- mtdinit()\n");
         DBG("Anagramm eCam MTD: FPGA-SRAM 0x%lX at 0x%lX\n",ecam_map.size,ecam_map.phys);

         ecam_map.virt = ioremap(ecam_map.phys, ecam_map.size);
         if (!ecam_map.virt) {
                 DBG("Failed to ioremap FPGA-SRAM space\n");
                 err = -EIO;
                 goto out;
         }
         simple_map_init(&ecam_map);
         ecam_mtd = do_map_probe("map_ram", &ecam_map);
         if (!ecam_mtd) {
                 DBG("FPGA-SRAM probe failed\n");
                 err = -ENXIO;
                 goto out_ioremap;
         }
         ecam_mtd->owner = THIS_MODULE;
         ecam_mtd->erasesize = 16;
         if (add_mtd_device(ecam_mtd)) {
                 DBG("FGPA-SRAM device addition failed\n");
                 err = -ENOMEM;
                 goto out_probe;
         }
         return 0;
out_probe:
         map_destroy(ecam_mtd);
         ecam_mtd = 0;
out_ioremap:
         iounmap((void *)ecam_map.virt);
out:
         return err;
}

static void mminfo_mtdexit(void)
{

         DBG("----- mtdexit()\n");
         del_mtd_device(ecam_mtd);
         map_destroy(ecam_mtd);
         iounmap((void *)ecam_map.virt);
}
-----8<-----------------------------------------------------------------

I don't have separate read and write routines yet... I'll see
if there is room for more optimization as I want to copy the data
from the SRAM directly to the application's memory. (via DMA)
As I want to achieve some 100 MBytes/sec.

Maybe I need some special point() functions and this direct io flags?
Well... I will see.

Okay, there are still some open questions, but I will have to continue to
fix some other things in my hardware first.

Thanks so far,

Clemens Koller
_______________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Str. 45/1
81379 Muenchen
Germany

http://www.anagramm.de
Phone: +49-89-741518-50
Fax: +49-89-741518-19
