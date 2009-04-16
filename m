From: David Howells <dhowells@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Bug in physmap driver?
Date: Thu, 16 Apr 2009 16:00:19 +0100
Message-ID: <5680.1239894019@redhat.com>
Sender: dhowells@redhat.com
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



In physmap_flash_probe(), isn't the '+ 1' in:

		info->map[i].size = dev->resource[i].end - dev->resource[i].start + 1;

incorrect?  It results in an artificially inflated size:

(gdb) p info->map[0]
$7 = {name = 0xc08aa520 "physmap-flash.0", size = 0x200001, phys = 0xff000000, virt = 0x0, cached = 0x0, bankwidth = 0x4, read = 0, copy_from = 0, write = 0, copy_to = 0, inval_cache = 0, set_vpp = 0, pfow_base = 0x0, map_priv_1 = 0x0, map_priv_2 = 0x0, fldrv_priv = 0x0, fldrv = 0x0}

which is then handed to devm_ioremap().

David
