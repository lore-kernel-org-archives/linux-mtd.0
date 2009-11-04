Received: from correo12.acens.net ([217.116.0.112])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5cxu-0003oS-3h
	for linux-mtd@lists.infradead.org; Wed, 04 Nov 2009 10:19:50 +0000
From: Pep Talens <pep.talens@f1-connecting.com>
To: linux-pcmcia@lists.infradead.org
Subject: PETEC 2MB SRAM
Date: Wed, 4 Nov 2009 11:20:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200911041120.25305.pep.talens@f1-connecting.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: "Mr. Pep Talens" <pep.talens@f1-connecting.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this is my scenario:

Laptop: BenQ Joybook A33E
OS: OpenSuse 10.2
Kernel: 2.6.18.8-0.13-default
PCMCIA Card: PRETEC 2MB SRAM =A0 =A0=20
http://pan8.fotovista.com/dev/8/6/03573268/l_03573268.jpg
pcmcia-cs version: 3.2.8
Socket: yenta-socket
IRQ: 169

After reading the Howto, mini-howto and some other stuff I still trying to=
=20
figure out how to mount it and write in. Sorry if redundant but I'm a littl=
e=20
lost. I can provide the output of some commands:

Monk:/opt/pcmcia-cs-3.2.8/cardmgr #=20
udevinfo -a -p =A0/sys/bus/pcmcia/devices/0.0

Udevinfo starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

=A0 looking at device '/devices/pci0000:00/0000:00:1e.0/0000:01:02.0/0.0':
=A0 =A0 KERNEL=3D=3D"0.0"
=A0 =A0 SUBSYSTEM=3D=3D"pcmcia"
=A0 =A0 DRIVER=3D=3D""
=A0 =A0=20
ATTR{modalias}=3D=3D"pcmcia:m0000c0000f00fn00pfn00paEBF91155pb805360CApc000=
00000pd00000000"
=A0 =A0 ATTR{prod_id2}=3D=3D" =A02MB SRAM CARD"
=A0 =A0 ATTR{prod_id1}=3D=3D"PRETEC"
=A0 =A0 ATTR{pm_state}=3D=3D"on"
=A0 =A0 ATTR{function}=3D=3D"0x00"

=A0 looking at parent device '/devices/pci0000:00/0000:00:1e.0/0000:01:02.0=
':
=A0 =A0 KERNELS=3D=3D"0000:01:02.0"
=A0 =A0 SUBSYSTEMS=3D=3D"pci"
=A0 =A0 DRIVERS=3D=3D"yenta_cardbus"
=A0 =A0 ATTRS{broken_parity_status}=3D=3D"0"
=A0 =A0 ATTRS{enable}=3D=3D"1"
=A0 =A0 ATTRS{modalias}=3D=3D"pci:v0000104Cd00008031sv00001071sd00008048bc0=
6sc07i00"
=A0 =A0 ATTRS{local_cpus}=3D=3D"ffffffff"
=A0 =A0 ATTRS{irq}=3D=3D"169"
=A0 =A0 ATTRS{class}=3D=3D"0x060700"
=A0 =A0 ATTRS{subsystem_device}=3D=3D"0x8048"
=A0 =A0 ATTRS{subsystem_vendor}=3D=3D"0x1071"
=A0 =A0 ATTRS{device}=3D=3D"0x8031"
=A0 =A0 ATTRS{vendor}=3D=3D"0x104c"

=A0 looking at parent device '/devices/pci0000:00/0000:00:1e.0':
=A0 =A0 KERNELS=3D=3D"0000:00:1e.0"
=A0 =A0 SUBSYSTEMS=3D=3D"pci"
=A0 =A0 DRIVERS=3D=3D""
=A0 =A0 ATTRS{broken_parity_status}=3D=3D"0"
=A0 =A0 ATTRS{enable}=3D=3D"1"
=A0 =A0 ATTRS{modalias}=3D=3D"pci:v00008086d00002448sv00000000sd00000000bc0=
6sc04i01"
=A0 =A0 ATTRS{local_cpus}=3D=3D"ffffffff"
=A0 =A0 ATTRS{irq}=3D=3D"0"
=A0 =A0 ATTRS{class}=3D=3D"0x060401"
=A0 =A0 ATTRS{subsystem_device}=3D=3D"0x0000"
=A0 =A0 ATTRS{subsystem_vendor}=3D=3D"0x0000"
=A0 =A0 ATTRS{device}=3D=3D"0x2448"
=A0 =A0 ATTRS{vendor}=3D=3D"0x8086"

=A0 looking at parent device '/devices/pci0000:00':
=A0 =A0 KERNELS=3D=3D"pci0000:00"
=A0 =A0 SUBSYSTEMS=3D=3D""
=A0 =A0 DRIVERS=3D=3D""

Monk:/opt/pcmcia-cs-3.2.8/cardmgr # cat /proc/interrupts
=A0 =A0 =A0 =A0 =A0 =A0CPU0
=A0 0: =A0 =A03803200 =A0 =A0IO-APIC-edge =A0timer
=A0 1: =A0 =A0 =A0 =A0 44 =A0 =A0IO-APIC-edge =A0i8042
=A0 8: =A0 =A0 =A0 =A0 =A02 =A0 =A0IO-APIC-edge =A0rtc
=A0 9: =A0 =A0 =A022488 =A0 IO-APIC-level =A0acpi
=A012: =A0 =A0 =A0 1044 =A0 =A0IO-APIC-edge =A0i8042
=A014: =A0 =A0 559838 =A0 =A0IO-APIC-edge =A0libata
=A015: =A0 =A0 168263 =A0 =A0IO-APIC-edge =A0libata
169: =A0 =A0 =A0 =A0 =A06 =A0 IO-APIC-level =A0yenta
177: =A0 =A0 =A0 =A0 =A03 =A0 IO-APIC-level =A0uhci_hcd:usb2, ohci1394
193: =A0 =A0 149076 =A0 IO-APIC-level =A0uhci_hcd:usb1, ehci_hcd:usb4
201: =A0 =A0 =A0 =A0 =A00 =A0 IO-APIC-level =A0uhci_hcd:usb3
209: =A0 =A0 =A0 =A0865 =A0 IO-APIC-level =A0HDA Intel
217: =A0 =A03688954 =A0 IO-APIC-level =A0eth0
NMI: =A0 =A0 =A0 =A0 =A00
LOC: =A0 =A03820527
ERR: =A0 =A0 =A0 =A0 =A00
MIS: =A0 =A0 =A0 =A0 =A00

Monk:/proc/bus/pccard # cardctl config
Socket 0:
=A0 Vcc 5.0V =A0Vpp1 5.0V =A0Vpp2 5.0V

Monk:/proc/bus/pccard # cardctl ident
Socket 0:
=A0 product info: "PRETEC", " =A02MB SRAM CARD", "", ""

But I guess that this card is not supported in /etc/pcmcia/config. More ove=
r,=20
I can see this in /var/log/messages:

Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: IO ports=20
0x100-0x3af: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: IO ports=20
0x3e0-0x4ff: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: IO ports=20
0x820-0x8ff: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: IO ports=20
0xc00-0xcf7: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: memory=20
0xc0000-0xfffff: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: memory=20
0xa0000000-0xa0ffffff: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: memory=20
0x60000000-0x60ffffff: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5688]: could not adjust resource: IO ports=20
0xa00-0xaff: Function not implemented
Oct 29 09:11:47 Monk cardmgr[5689]: unsupported card in socket 0
Oct 29 09:11:47 Monk cardmgr[5689]: =A0 product info: "PRETEC", " =A02MB SR=
AM=20
CARD", "", ""

After see this, as you will guess, my config.opts is:

include port 0x100-0x3af
include port 0x3e0-0x4ff
include port 0x820-0x8ff
include port 0xc00-0xcf7

include memory 0xc0000-0xfffff
include memory 0xa0000000-0xa0ffffff
include memory 0x60000000-0x60ffffff


Now I'm trying to migrate from cardmgr to pcmciautils but I don't know if=20
after migration I'll be able to make this card writable. Am I in the right=
=20
way? Could someone guide me?

Thank you very much

=2D-=20
Pep Talens

Wincor-Nixdorf
46022 Valencia (Spain)
Tel. +34 902 15 38 27 Ext. 117
pep.talens@f1-connecting.com
