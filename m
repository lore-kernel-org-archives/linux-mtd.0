Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaCp3-0003xh-Ms
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 20:50:06 +0000
Received: by lahc1 with SMTP id c1so674439lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 12:50:01 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 12 Dec 2011 22:49:48 +0200
In-Reply-To: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323723000.2297.4.camel@koala>
Mime-Version: 1.0
Cc: Jim Quinlan <jim2101024@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-12-07 at 13:08 -0800, Brian Norris wrote:
> Add and option (NAND_BBT_WRITE_BBM) for writing bad block markers to
> proper OOB area on each block in addition to flash-based BBT. This is
> useful when:
> 
>  * bootloader cannot read the flash-based BBT format
>  * BBT is corrupted and the flash must be rescanned for bad
>    blocks; we want to remember bad blocks that were marked from Linux
> 
> Adapted from code by Matthieu CASTET.
> 
> Cc: Matthieu CASTET <matthieu.castet@parrot.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

2 questions, perhaps silly, but still:

1. Why wouldn't you make this the only and the default behavior? Why
adding more options instead?

2. Would the case of inconsistency between BBT and OOB markers be
possible to fix-up after the power cut?

Artem.
