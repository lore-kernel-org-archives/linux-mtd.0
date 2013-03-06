Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDAZ7-0006ia-Sc
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 09:23:14 +0000
Message-ID: <1362561831.21850.26.camel@sauron>
Subject: Re: [PATCH 1/3] mtd: bcm47xxsflash: store info about flash type
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 06 Mar 2013 11:23:51 +0200
In-Reply-To: <1361341929-11153-1-git-send-email-zajec5@gmail.com>
References: <1361341929-11153-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-20 at 07:32 +0100, Rafał Miłecki wrote:
> It's going to be needed for erase and write operations, they differ
> between Atmel and ST flashes.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Aiaiai!

--------------------------------------------------------------------------------

Bisectability test results for configuration "mips-bcm47xx_defconfig,mips,mips-linux-"

Failed to build the following commit for configuration "mips-bcm47xx_defconfig"":

ab61426 mtd: bcm47xxsflash: store info about flash type


drivers/mtd/devices/bcm47xxsflash.c: In function 'bcm47xxsflash_bcma_probe':
drivers/mtd/devices/bcm47xxsflash.c:64:14: error: 'struct bcm47xxsflash' has no member named 'bcma_cc'
make[4]: *** [drivers/mtd/devices/bcm47xxsflash.o] Error 1

--------------------------------------------------------------------------------

-- 
Best Regards,
Artem Bityutskiy
