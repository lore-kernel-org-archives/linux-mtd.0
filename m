Received: from mail-db8lp0185.outbound.messaging.microsoft.com
 ([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZErL-0006jP-AX
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 06:57:31 +0000
Message-ID: <5268C56E.8050806@freescale.com>
Date: Thu, 24 Oct 2013 14:59:58 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
References: <1382418628-4521-1-git-send-email-b32955@freescale.com>
 <20131022185639.GK23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131022185639.GK23337@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dedekind1@gmail.com, tharvey@gateworks.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David & Mark & Brian:

    thanks for your review and comments.
> ... so why don't you just add a DT property to actually specify the ECC
> selection itself, rather than indirectly specifying it through a vague
Do you mean i should add a DT property like "fsl, gpmi-use-new-ecclayout" ?

I am not understand "the ECC selection itself".



thanks
Huang Shijie
