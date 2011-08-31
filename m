Received: from a.mail.sonic.net ([64.142.16.245])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyeqi-0008IO-Uh
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 07:04:37 +0000
Received: from [192.168.0.128] (70-36-184-83.dsl.static.sonic.net
	[70.36.184.83]) (authenticated bits=0)
	by a.mail.sonic.net (8.13.8.Beta0-Sonic/8.13.7) with ESMTP id
	p7V74Tjh018414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2011 00:04:29 -0700
Message-ID: <4E5DDCFD.8080207@keensupport.net>
Date: Wed, 31 Aug 2011 00:04:29 -0700
From: Joe Knapp <joeknapp@keensupport.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Mount SRAM card without CIS
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear MTD team,

I have been searching for many hours now on how to enable a 256 KByte
PCMCIA SRAM card. Some details:

Linux 2.6.35-30-generic #56-Ubuntu SMP Mon Jul 11 20:01:08 UTC 2011
x86_64 GNU/Linux

lspci:
03:06.0 CardBus bridge: Texas Instruments PCI1225 (rev 01)
03:06.1 CardBus bridge: Texas Instruments PCI1225 (rev 01)

dmesg after inserting the card and running /lib/udev/pcmcia-socket-startup:
[142469.220134] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card
inserted into slot 0
[142483.684063] pcmcia_socket pcmcia_socket0: cs: memory probe
0x0c0000-0x0fffff: excluding 0xc0000-0xcffff 0xe0000-0xfffff
[142483.684191] pcmcia_socket pcmcia_socket0: cs: memory probe
0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[142483.684308] pcmcia_socket pcmcia_socket0: cs: memory probe
0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[142483.684542] pcmcia_socket pcmcia_socket0: cs: memory probe
0x0d0000-0x0dffff: clean.

lspcmcia:
Socket 0 Bridge:        [yenta_cardbus]         (bus ID: 0000:03:06.0)
        Configuration:  state: on       ready: yes
                        Voltage: 5.0V Vcc: 5.0V Vpp: 5.0V

pccardctl info:
PRODID_1=""
PRODID_2=""
PRODID_3=""
PRODID_4=""
MANFID=0000,0000
FUNCID=255


I have successfully used this HW to mount a CompactFlash device via a
PCMCIA to CF adapter, and the SRAM card works correctly in some other
test equipment. So, I believe that the HW is OK.

I have tried some variations to /etc/pcmcia/config, including:
device "pcmciamtd" needs_mtd
  class "memory" module "pcmciamtd"

card "Anonymous Memory"
  anonymous
#  bind "memory_cs"
  bind "pcmciamtd"

card "Memory Card"
  function memory_card
#  bind "memory_cs"
  bind "pcmciamtd"

Can you please provide some clues as to the current method to enable a
SRAM card without CIS?

Thank you in advance,

Joe Knapp
