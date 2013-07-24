Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1syu-0002SP-Hs
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2013 06:55:29 +0000
Message-ID: <51EF7B4E.5090100@freescale.com>
Date: Wed, 24 Jul 2013 14:59:26 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/4] mtd: nand: refactor chip->block_markbad interface
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
 <1374647279-14083-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1374647279-14083-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA07=D4=C224=C8=D5 14:27, Brian Norris =D0=B4=B5=C0:
> The chip->block_markbad pointer should really only be responsible for
> writing a bad block marker for new bad blocks. It should not take care
> of BBT-related functionality, nor should it handle bookkeeping of bad
> block stats.
yes.
the gpmi driver should not do the BBT-related jobs.

> This patch refactors the 3 users of the block_markbad interface (plus
> the default nand_base implementation) so that the common code is kept i=
n
> nand_block_markbad_lowlevel(). It removes some inconsistencies between
> the various implementations and should allow for more centralized
> improvements in the future.
>
> Because gpmi-nand no longer needs the nand_update_bbt() function, let's
> stop exporting it as well.
for the gpmi-nand part:
Acked-by: Huang Shijie <b32955@freescale.com>

thanks
Huang Shijie
