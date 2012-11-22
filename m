Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbahA-0001wp-0R
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:36:15 +0000
Message-ID: <50AE6289.3070001@parrot.com>
Date: Thu, 22 Nov 2012 18:36:09 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd nand : print flash size during detection
References: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
 <1353054248.3618.3.camel@sauron.fi.intel.com>
 <50A5FB79.3030305@freescale.com>
In-Reply-To: <50A5FB79.3030305@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang Shijie a écrit :
>>
> In multi chip enables nand chips, such as some Micron nand chips, you 
> will find half size is printed
> after this patch is applied. Why? because we only scan one #CE, but this 
> nand chip has two #CE, the #CE0 and #CE1.
> 
> 
> a little confused.
nand_get_flash_type probe only one chip.

For multi chip, you should see the log :
"x NAND chips detected".

The resulting mtd size will be x * the chip size.
