Received: from mail-cys01nam02on0085.outbound.protection.outlook.com
 ([104.47.37.85] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxW1K-00041R-JZ
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 09:21:47 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "michal.simek@xilinx.com"
 <michal.simek@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: UBIFS with dma on 4.6 kernel is not working
Date: Fri, 21 Oct 2016 09:21:03 +0000
Message-ID: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

This is regarding UBIFS on 4.6 kernel.
We have tested UBIFS on our ZynqMP SOC QSPI Controller, the UBIFS is not wo=
rking with dma on this kernel.
Controller driver: https://github.com/torvalds/linux/commits/master/drivers=
/spi/spi-zynqmp-gqspi.c
If I replace all vmalloc allocations in fs/ubifs/ to kmalloc then UBIFS wit=
h dma is working fine.
But whereas kernel before 4.6 without changing vmalloc to kmalloc, UBIFS is=
 working fine with dma.
So is there any change in UBIFS in 4.6 kernel that to dma related?

May I know some info regarding this?
Why UBIFS on kernels before 4.6 is working with dma but not with 4.6?
Now a days, most of QSPI controllers have internal dmas.

Could you please provide some info regrading this dma issue?
We can change our controller driver to operate in IO mode (doesn't use dma)=
 but performance wise it's not a preferred one.

Thanks,
Naga Sureshkumar Relli
