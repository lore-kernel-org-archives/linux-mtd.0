From: Russ.Dill@asu.edu (Russ Dill)
Date: Mon, 03 Mar 2003 12:39:39 -0700
Subject: AMD - Am29LV160B
In-Reply-To: <04C8EDC5AE3FD611ABE40002B39CF69B07F2D9@ntah901e.savan.com>
References: <04C8EDC5AE3FD611ABE40002B39CF69B07F2D9@ntah901e.savan.com>
Message-ID: <1046720379.1638.5.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-03 at 07:08, Amit.Lubovsky at infineon.com wrote:
> Hi,
> 
> Has anyone used the mtd device with the AMD
> Am29LV160B chips? They are 16 Megabit (2M x 8-Bit/1M x 16-Bit) chips
> and are CFI-compatible.
> 
> I work with kernel 2.4.6 and am trying to detect 4MB,
> 2 x16 bit devices in parallel (32 bit access) at address 0,

they work great on my device (as well as the Am29LV800B, which are not
CFI)

> #define BUSWIDTH 2

I'm away from my code right now, but shouldn't this be 32?

> purple flash device: 400000 at b0000000
> purple_map.map_priv_1=0xb0000000
> -----------------> FLASH #2
> --------------------------->file: chipreg.c name=cfi drv=8020c970
> -----------@@@@@@@@@@ CFIDEV_BUSWIDTH_2 CFIDEV_INTERLEAVE_1
> --------########## func: cfi_probe_chip CFI_DEVICETYPE_X16
> -----------@@@@@@@@@@ CFIDEV_BUSWIDTH_2 CFIDEV_INTERLEAVE_2
> --------########## func: cfi_probe_chip CFI_DEVICETYPE_X8
> --------########## func: cfi_probe_chip CFI_DEVICETYPE_X16
> --------------> file: cfi_probe.c func: cfi_cfi_probe index=-1
> Physically mapped flash: Found no CFI device at location zero
> --------------> file: cfi_probe.c  cfi=0
> mymtd=0x00000000
> 


printing out the addresses and data read/written is helpfull in these
cases.
