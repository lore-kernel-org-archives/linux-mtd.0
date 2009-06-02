Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBTwO-0002Kl-Ce
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 13:22:14 +0000
Subject: Re: [PATCH 1/2] Blackfin NFC Driver: remove pointless return value
	in  bf5xx_nand_dma_rw
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0906012057q66472e48ode918ea4ca92224b@mail.gmail.com>
References: <1243333454-673-1-git-send-email-vapier@gentoo.org>
	<1243435592.11172.37.camel@localhost.localdomain>
	<8bd0f97a0906012057q66472e48ode918ea4ca92224b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Jun 2009 16:19:14 +0300
Message-Id: <1243948754.5847.32.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
	Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-01 at 23:57 -0400, Mike Frysinger wrote:
> On Wed, May 27, 2009 at 10:46, Artem Bityutskiy wrote:
> > On Tue, 2009-05-26 at 06:24 -0400, Mike Frysinger wrote:
> >> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> >> Signed-off-by: Bryan Wu <cooloney@kernel.org>
> >> ---
> >>  drivers/mtd/nand/bf5xx_nand.c |    4 +---
> >>  1 files changed, 1 insertions(+), 3 deletions(-)
> >
> > I've taken these 2 patches to my l2-mtd-2.6.git.
> 
> looks like a typo was made when you rewrote the subject line ?
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=f6f3799ed7d93bbfef8fc96013a22121580ee233
> "NFCr" rather than "NFC" ...

Let me re-phrase it as "when you amended the subject line for
unification purposes". I'll fix that. This tree is anyway
throw-away. I'm just being an intelligent patchwork for dwmw2
in this case. :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
