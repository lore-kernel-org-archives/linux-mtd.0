Received: from wproxy.gmail.com ([64.233.184.197])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEeJw-0007KW-7D
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 21:13:09 -0500
Received: by wproxy.gmail.com with SMTP id 68so681337wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 18:13:07 -0800 (PST)
Message-ID: <7e75d411050324181317498525@mail.gmail.com>
Date: Thu, 24 Mar 2005 20:13:07 -0600
From: Matthew Hudson <hexsane@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: mtd0 problem - debug level 3
Reply-To: Matthew Hudson <hexsane@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mar 24 20:45:42 notebook cardmgr[1289]: error parsing CIS on socket 3:
Invalid argument
Mar 24 20:45:42 notebook cardmgr[1289]: socket 3: Anonymous Memory
Mar 24 20:45:42 notebook kernel: cs: memory probe
0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa00fffff
Mar 24 20:45:43 notebook kernel: pcmciamtd: PCMCIA Flash memory card
driver $Revision: 1.52 $
Mar 24 20:45:44 notebook kernel: 3.0: ParseTuple: Bad CIS tuple
Mar 24 20:45:44 notebook kernel: reset unlock called 555 2aa 
Mar 24 20:45:44 notebook kernel: Search for id:(89 a0) interleave(2) type(1)
Mar 24 20:45:44 notebook kernel: jedec_match(): ID is not 8bit
Mar 24 20:45:44 notebook last message repeated 20 times
Mar 24 20:45:44 notebook kernel: MTD jedec_match(): Check fit
0x00000000 + 0x00200000 = 0x00200000
Mar 24 20:45:44 notebook kernel: MTD jedec_match(): check unlock addrs
0x0555 0x02aa
Mar 24 20:45:44 notebook kernel: MTD jedec_match(): check ID's
disappear when not in ID mode
Mar 24 20:45:44 notebook kernel: reset unlock called 555 2aa 
Mar 24 20:45:44 notebook kernel: MTD jedec_match(): return to ID mode
Mar 24 20:45:44 notebook kernel: MTD jedec_probe_chip(): matched
device 0x89,0xa0 unlock_addrs: 0x0555 0x02aa
Mar 24 20:45:44 notebook kernel: PCMCIA Memory card: Found 2 x8
devices at 0x0 in 16-bit bank
Mar 24 20:45:44 notebook kernel: PCMCIA Memory card: Found 2 x8
devices at 0x400000 in 16-bit bank
Mar 24 20:45:44 notebook kernel: PCMCIA Memory card: Found 2 x8
devices at 0x800000 in 16-bit bank
Mar 24 20:45:44 notebook kernel: PCMCIA Memory card: Found 2 x8
devices at 0xc00000 in 16-bit bank
Mar 24 20:45:44 notebook kernel: mtd: Giving out device 0 to 16MiB
PCMCIA Memory card
Mar 24 20:45:44 notebook kernel: pcmciamtd: mtd0: 16MiB PCMCIA Memory card

I've also been getting command set 0003 not found errors.

-Matt
