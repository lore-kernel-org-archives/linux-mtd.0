Received: from alias-1.uta.edu ([129.107.56.97])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CkbFR-0006pv-81
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2004 23:52:18 -0500
Received: from gamma2.uta.edu (gamma2.uta.edu [129.107.8.1])
	by alias-1.uta.edu (8.12.11/8.12.11) with ESMTP id j014qDgl010141
	for <linux-mtd@lists.infradead.org>; Fri, 31 Dec 2004 22:52:13 -0600
Received: from localhost (txb8879@localhost)
	by gamma2.uta.edu (8.11.7p1+Sun/8.11.7) with ESMTP id j014qCo05982
	for <linux-mtd@lists.infradead.org>;
	Fri, 31 Dec 2004 22:52:12 -0600 (CST)
Date: Fri, 31 Dec 2004 22:52:12 -0600 (CST)
From: Todor  Boinovski <txb8879@gamma2.uta.edu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.GSO.4.58.0412312232480.4310@gamma2>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Centennial linear flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am trying to get an old centennial linear card working but
/etc/pcmcia/memory fails to create the mtd devices. Kernel is 2.6.10 and
the stab contents are:

Socket 0: 3Com 572/574 Fast Ethernet
0       network 3c574_cs        0       eth0
Socket 1: Memory Card
1       memory  pcmciamtd       0       mtd0

lsmod's output is:

Module                  Size  Used by
cfi_cmdset_0002        23936  1
cfi_util                3168  1 cfi_cmdset_0002
mtdpart                 9184  1 cfi_cmdset_0002
jedec_probe            19872  0
gen_probe               2752  1 jedec_probe
pcmciamtd              18456  1
mtdcore                 5764  3 mtdpart,pcmciamtd
chipreg                 2368  2 jedec_probe,pcmciamtd
3c574_cs               13092  1
pcmcia                 18912  6 pcmciamtd,3c574_cs
yenta_socket           19104  2
pcmcia_core            49856  4 pcmciamtd,3c574_cs,pcmcia,yenta_socket
:
:

cardctl ident:
Socket 0:
  product info: "3Com", "Megahertz 574B", "B", "001"
  manfid: 0x0101, 0x0574
  function: 6 (network)
Socket 1:
  product info: "Cetennial TechnologieY,", "Inc.", "FL16M-20-11119", "16
MEG FLASH w/16 Mbit AMD devc"

cardctl config:
Socket 0:
  Vcc 5.0V  Vpp1 0.0V  Vpp2 0.0V
  interface type is "memory and I/O"
  irq 3 [exclusive] [level]
  function 0:
    config base 0x10000
      option 0x41 status 0x00
    io 0x0300-0x031f [16bit]
Socket 1:
  Vcc 5.0V  Vpp1 0.0V  Vpp2 0.0V
  interface type is "memory-only"
  function 0:
    config base 0xd423
      option 0x00 status 0x23 pin 0xd4 copy 0x00 ext 0xff
  memory 0x3800000-0x3ffffff @ 0xa0002000 [16bit]

I am new to mtd. Could somebody give me a hint why there are
no major/minor numbers in the stab file?

Thanks,


****************************
* Todor Boinovski 	   *
****************************
