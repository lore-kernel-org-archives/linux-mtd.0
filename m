Message-ID: <4EB7C084.4060706@gmail.com>
Date: Mon, 07 Nov 2011 12:27:00 +0100
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Missing patches for pxa3xx_nand
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Lei Wen <leiwen@marvell.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In June, there have been important patches submitted for the pxa3xx_nand 
driver after it was broken by Lei's rework series. These patches were 
discussed in June, and they are present in

   git://git.infradead.org/mtd-2.6.git linux-fallback

but not in the master branch of the same git. Also, they have not been 
merged to Linus' master tree which renders the pxa3xx_nand driver 
unusable in 3.0 and 3.1.

A selection of the patches I'm talking about are titled

   mtd: pxa3xx_nand: Fix blank page ECC mismatch
   mtd: pxa3xx_nand: fix nand detection issue
   mtd: pxa3xx_nand don't specify default parsing options

and of course they depend on others that aren't merged yet either.

Can anyone explain what went wrong here and how we can get out of this?


Thanks,
Daniel
