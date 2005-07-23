Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dw7sy-0003vn-Iq
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2005 20:29:09 -0400
Received: from 203-96-62-34-tollfree.actrix.co.nz
	(203-96-62-34-tollfree.actrix.co.nz [203.96.62.34])
	by blood.actrix.co.nz (Postfix) with ESMTP id 8E3DD4AF3
	for <linux-mtd@lists.infradead.org>;
	Sat, 23 Jul 2005 12:28:49 +1200 (NZST)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Sat, 23 Jul 2005 12:31:03 +1200
References: <20050722171510.55261.qmail@web51007.mail.yahoo.com>
In-Reply-To: <20050722171510.55261.qmail@web51007.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507231231.03610.manningc2@actrix.gen.nz>
Subject: Re: Flash memory PCI Add in card
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 23 July 2005 05:15, Shankari wrote:

>
> My end objective is to simulate a flash file system.
> For this, I want to know if there are easy ways to
> interface the flash (via the PCI)

Sometimes I really miss the old days of ISA cards :-(.

Building an adequate environment for simulation/development is something I 
have struggled with too for the development of YAFFS.

Why not just use nandsim. Just create a 128MB or whatever lump of "NAND" in 
RAM. Adding an extra SIM of RAM to your system will be a lot cheaper and 
easier.

Someone on mtd list also built a simple board that attaches NAND to the IDE 
disk interface. Seems a lot simpler than messing about with PCI.

Another alternative is to use a parallel card interface. This will be a bit 
slower though.

If you really want to do a PCI card, then you might find something like a 
Xilinx or similar PCI evaluation board makes the job simpler.

-- Charles
