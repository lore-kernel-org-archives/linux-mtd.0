Received: from mail1.bemta8.messagelabs.com ([216.82.243.204])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFRck-0004XL-En
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 16:32:39 +0000
Message-ID: <5220C8C4.5010305@digi.com>
Date: Fri, 30 Aug 2013 18:31:00 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
In-Reply-To: <20130831033438.GA13704@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang,

On 08/31/2013 05:34 AM, Huang Shijie wrote:
> On Fri, Aug 30, 2013 at 05:23:34PM +0200, Hector Palacios wrote:
>> On 08/31/2013 04:53 AM, Huang Shijie wrote:
>>> On Fri, Aug 30, 2013 at 04:24:53PM +0200, Hector Palacios wrote:
>> Sorry, what repo/branch did you base your original patchset on? The
>> patchset did not apply correctly and this one you sent won't apply
>> either because the function set_geometry_by_ecc_info() does not
>> exist. Instead, it is called common_nfc_set_geometry(). I'm using a
>> v3.10 kernel but this driver has not changed since then (at least in
>> the vanilla kernel).
> please apply this patch set with the l2-mtd tree or the linux-next.

Ok I merged the linux-next MTD patches.
This is what I get from the printk:

[    0.841333] [ set_geometry_by_ecc_info ] 36, 28

The partition now partially mounts (I can see a few of the folders and files) but I 
get thousands of errors like these:

[  118.210985] jffs2: mtd->read(0x100 bytes from 0x0) returned ECC error
[  118.255424] jffs2: mtd->read(0x1ff20 bytes from 0xe0) returned ECC error
[  118.255561] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x000001ec: Read 
0x00000000, calculated 0xa587e8ba
[  118.255602] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000234: 0x1cf7 instead
[  118.255628] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000238: 0x0011 instead
[  118.255654] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000240: 0xd266 instead
[  118.255680] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000250: 0x21f8 instead
[  118.255704] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000258: 0x5e99 instead
[  118.255728] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x0000025c: 0x64ee instead
[  118.255752] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000260: 0xf626 instead
[  118.255776] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000264: 0x0021 instead
[  118.255801] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x0000026c: 0x8f7f instead
[  118.255826] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000278: 0x0004 instead
[  118.255843] jffs2: Further such events for this erase block will not be printed
[  118.265711] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x0000c098: Read 
0x85aaca2a, calculated 0xe4eba16f
[  118.272740] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x000189ec: Read 
0x3f000000, calculated 0xbe2aa989
[  118.274823] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x0001c9c8: Read 
0xd4600000, calculated 0xa1dc0043
[  118.278445] jffs2: mtd->read(0xde8 bytes from 0x1f218) returned ECC error
[  118.278503] jffs2: Empty flash at 0x0001f214 ends at 0x0001f400
[  118.279858] jffs2: mtd->read(0xbec bytes from 0x1f414) returned ECC error
[  118.279904] jffs2: Empty flash at 0x0001f410 ends at 0x0001f604
[  118.281199] jffs2: mtd->read(0x9e8 bytes from 0x1f618) returned ECC error


Best regards,
--
Hector Palacios
