Received: from [206.162.170.236] (helo=gateway.wavesat.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AzxE-0001eX-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 22:17:00 +0100
Message-ID: <007401c2029f$8c95ac30$0200010a@WT0136>
From: "Ho-Kuo Chan" <hchan@wavesat.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <009c01c1fce9$4415bf60$0200010a@WT0136>  <008101c1fce3$ae6588b0$0200010a@WT0136> <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com> <14029.1021558521@redhat.com>  <19099.1021561319@redhat.com>
Subject: Re: Trouble indetifying FLASH part 
Date: Thu, 23 May 2002 17:19:39 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi David,
    I have partially solved the problem. The PPC405GP multiplexes its GPIO
lines with the External Bus Chip Select lines. In fact, what was occurring
was that my GPIO's were misconfigured and were not acting as Chip Select
Lines. However, it's not quite working:

physmap flash device: 400000 at 8000000
HKC: Map Priv 1 = 0xc2003000
HKC: Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 8
HKC: Output Reg: 0x45480000        -------> Correct value
HKC: TCR: 0x750a0000                    -------> Correct value
HKC: ODR: 0x20000                        -------> Correct value
Control 0: 0x17ee616                        -------> Correct value
Addr = 0x0
Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x2, type = 0x1
Val = 0xf0f0
Addr = 0xaa
Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x2, type = 0x1
Val = 0x9898
Read 0x=51, cmd = 0x5151   -----> the correct value is read, but it is being
compared to a value returned by cfi_build_cmd('Q',map,cfi) in qry_present
Read 0x=52, cmd = 0x5252
Read = 0x59, cmd = 0x5959
CFI Query Failed for driver
Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 16
Output Reg: 0x45480000
TCR: 0x750a0000
ODR: 0x20000
Control 0: 0x17ee616
Addr = 0x0
Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x2, type = 0x2
Val = 0xf0f0
Addr = 0x154
Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x2, type = 0x2
Val = 0x9898
Read 0x=ffff, cmd = 0x5151
Read 0x=3000, cmd = 0x5252
Read = 0x3000, cmd = 0x5959
CFI Query Failed for driver
CFI: Found no Physically mapped flash device at location zero

The value read above is the return value of cfi_read as in the qry_present
function. I am no expert but should the comparison in qry_present:

if (cfi_read(map, base+osf*0x10)==cfi_buil_cmd('Q', map, cfi) &&
    cfi_read(map, base+osf*0x11)==cfi_buil_cmd('R', map, cfi) &&
    cfi_read(map, base+osf*0x12)==cfi_buil_cmd('Y', map, cfi))

be simply:

if (cfi_read(map, base+osf*0x10)=='Q' &&
    cfi_read(map, base+osf*0x11)=='R' &&
    cfi_read(map, base+osf*0x12)=='Y')

Thanks for all your help!!!!

Ho-Kuo Chan
Software Designer, Digital Division
Wavesat Wireless Inc.
(514) 956-6322
----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Ho-Kuo Chan" <hchan@wavesat.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, May 16, 2002 11:01 AM
Subject: Re: Trouble indetifying FLASH part


>
> hchan@wavesat.com said:
> >  The result was a continuous stream of 0xf0's. In VxWorks I get
> > 0x1303434953463900 which is "..CIS59.". Does this tell you anything?
>
> Yeah. It really does look like the chip isn't where you think it is.
>
> Can you get Linux to boot anyway, with NFSroot or something?
>
> od -A x -t x1 /dev/mem | grep "13 03 43 49 53 46 39 00"
>
> Or you could code the equivalent in the kernel.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
