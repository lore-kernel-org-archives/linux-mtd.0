Received: from mail.nanl.de ([217.115.11.12])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbTqw-0001sF-9C
 for linux-mtd@lists.infradead.org; Sun, 12 May 2013 10:50:06 +0000
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
 [209.85.212.45]) by mail.nanl.de (Postfix) with ESMTPSA id 6C92C45F8A
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 10:48:58 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id 12so4509789vbf.4
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 03:49:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368189407.26780.159.camel@sauron.fi.intel.com>
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
 <1364044070-10486-3-git-send-email-jogo@openwrt.org>
 <1368189407.26780.159.camel@sauron.fi.intel.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Sun, 12 May 2013 12:48:54 +0200
Message-ID: <CAOiHx=m+ZuBcj=qmTtytWouCbtbj+_OX3dS8x_0=kHEBFZ+TmA@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: BCM63XX: export PSI size from nvram
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Maxime Bizon <mbizon@freebox.fr>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 10, 2013 at 2:36 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2013-03-23 at 14:07 +0100, Jonas Gorski wrote:
>> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
>> ---
>>  arch/mips/bcm63xx/nvram.c                          |   11 +++++++++++
>>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |    2 ++
>>  2 files changed, 13 insertions(+)
>
> Acks from MIPS folks would be nice to have, but I pushed this patch to
> the l2-mtd.git tree, thanks!

I had expected Florian's valid comment from preventing this series
from going in, but if you pushed it already then I will fix the return
type problem  that Florian pointed out in a separate patch (or rather
add add some range check for nvram.psi_size). Luckily it is a
theoretical issue only, as I haven't seen a device yet with an invalid
value.


Regards
Jonas
