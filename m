Received: from mail-cys01nam02on0082.outbound.protection.outlook.com
 ([104.47.37.82] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byus3-0007QV-6H
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 06:06:00 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: Christoph Hellwig <hch@infradead.org>, Richard Weinberger <richard@nod.at>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "Punnaiah Choudary
 Kalluri" <punnaia@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: UBIFS LEB properties tree with odd addresses
Date: Tue, 25 Oct 2016 06:05:32 +0000
Message-ID: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are testing UBIFS (NOR) on Zynq Ultrascale+ MPSoC GQSPI controller drive=
r.
Apart from my previous mail thread about UBIFS, i.e along with dma issue I =
am facing one more
Problem related to offsets.

Info about GQSPI Controller:
This controller can access the flash device in the following modes.
1. Single flash mode
2. Two spi flash memories with separate buses (dual parallel)

Single flash mode: it is normal configuration, one controller and one flash=
 memory

In dual parallel mode following are the functionalities:
1) Supporting two SPI flash memories operating in parallel. 8 I/O lines.
2) Chip selects and clock are shared to both the flash devices
3) This mode is targeted for faster read/write speed and also doubles the s=
ize
4) Commands/data can be transmitted/received from both the devices(mirror),=
 or only upper or only lower flash memory devices.
5) Data arrangement:
=A0=A0=A0 With stripe (controller configuration) enabled,
=A0=A0=A0 Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
=A0=A0=A0 Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.

Kernel version : 4.4.0
Controller limitation: ZynqMP gqspi controller supports only even addresses=
 when two flash devices are connected (dual parallel mode).

Issue I am facing:
-> Since our controller supports even addresses in dual parallel mode
We are seeing issues with ubifs in dual parallel mode and jffs2 is working =
fine and we observed the following:

IN dual parallel mode, the Erase block size was 128KiB whereas single flash=
 mode the Erase block size was 64KiB.
In single flash mode, we are getting pnode_sz value as 16 and for dual para=
llel mode we are getting an odd value 17
And ltab_sz value in single mode as 12 and in dual parallel mode as 11.
Because of these odd values, check_lpt_type  offset argument is odd address=
 and hence lpt_type error.

When I ran the mnt command, I am getting the following error
"UBIFS error (ubi0:0 pid 1882): check_lpt_type: invalid type (4) in LPT nod=
e type 2"
Ran the below commands:
a)ubiformat /dev/mtd0 -e 0 -y
b)ubiattach -p /dev/mtd0
c)ubimkvol -N data -m /dev/ubi0
d)mount -t ubifs ubi0:data /mnt

So for temporary hack we did the following change
In fs/ubifs/lpt.c
In do_calc_lpt_geom(), added the following
+=A0=A0=A0=A0=A0=A0 if (c->pnode_sz % 2)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c->pnode_sz +=3D 1;=20
+=A0=A0=A0=A0=A0=A0 if (c->ltab_sz % 2)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c->ltab_sz +=3D 1;

Please kindly suggest, I need your inputs, changing the pnode_sz and ltab_s=
z to even in lpt.c, will it impact on any others?
We can do the same change in spi layer (change the address to even) but the=
 above properties won't reflect in ubi layer.
Kindly please suggest.
If I haven't provided sufficient information, please let me know.

Thanks,
Naga Sureshkumar Relli
