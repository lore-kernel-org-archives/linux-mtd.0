Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTGXu-0006KK-Sf
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 17:23:43 +0000
Received: by wwe32 with SMTP id 32so1778936wwe.18
 for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 09:23:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322017153-6783-1-git-send-email-Shengzhou.Liu@freescale.com>
References: <1322017153-6783-1-git-send-email-Shengzhou.Liu@freescale.com>
Date: Wed, 23 Nov 2011 09:23:39 -0800
Message-ID: <CAN8TOE-kgmNy+t0ZBW8c8Goj2HGwBVMHU2c55NUGDJYwWn3PMw@mail.gmail.com>
Subject: Re: [PATCH] mtd/nand: Add NAND chip ID to support Micron 4k pagesize
 NAND chip
From: Brian Norris <computersforpeace@gmail.com>
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Nov 22, 2011 at 6:59 PM, Shengzhou Liu
<Shengzhou.Liu@freescale.com> wrote:
> Add NAND chip ID 0x38 in ids table to support Micron 4k large-page NAND chip.

Do you have an example part number for which this patch is necessary?
I see that Micron MT29F8G08ABABA, for instance, has this ID, but
listing its ID in nand_ids.c is useless because there is no ID
decoding pattern for the rest of its ID string. AFAIK, all 0x38 chips
are ONFI-only and should not be included in nand_ids.c.

Brian
