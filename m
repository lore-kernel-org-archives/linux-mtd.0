Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQe8S-0004Fb-Oo
 for linux-mtd@lists.infradead.org; Wed, 25 Feb 2015 15:44:29 +0000
Received: by pablf10 with SMTP id lf10so6078354pab.6
 for <linux-mtd@lists.infradead.org>; Wed, 25 Feb 2015 07:44:06 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
Date: Wed, 25 Feb 2015 21:14:06 +0530
Message-ID: <CAGnW=BbyGzQwpb0BvdNVnK+ZFfMmnKjLBmRHzTBMzJ8Vq9FDag@mail.gmail.com>
Subject: [RFC] How to configure nand address cycles in a generic way
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 michals@xilinx.com, pcrost@xilinx.com,
 sivadur@xilinx.com, Punnaiah Choudary <kpc528@gmail.com>,
 kalluripunnaiahchoudary@gmail.com, "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  We are using pl353 smc controller in our zynq soc and currently the
patches for this driver
are under review. Till now we have tested various nand parts (micron
and spansion)
and all these devices require five address cycles for read/write
operations (3 row and 2 column address cycles).Even in our driver the
address cycles value is hard coded to five.

   Recently we come across testing the new part i.e Spansion S34ML01G
and this devices requires four address cycles( 2 row and 2 column
cycles) so, now we want to generalize this by reading the address
cycles information from the onfi parameter page.

 I see that the controller driver can retrieve the address cycles
information from the nand_onfi_params structure. But the number of
address cycles to be configured is different for different commands.
like
 Page read/write operation: row + col address cycles
 Block erase                    : row address cycles
 onfi parameter page         : one address cycles.

Currently in our driver we are reading the address cycles information
from the nand_onfi_params structure and deriving the required address
cycles based on the given command. Ideally this information should
come from the nand core. So, one way i thought that the core should
pass the
required address cycles using the cmdfuncion as below. so the
controller driver can blindly program this information to the
controller.

void (*cmdfunc)(struct mtd_info *mtd, unsigned command, int column,
                             int page_addr, int address_cycles);

Please suggest is there any better solution to handle this case ?


Regards,
Punnaiah
