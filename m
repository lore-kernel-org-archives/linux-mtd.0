Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sor1l-0004pH-1O
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 07:08:03 +0000
Message-ID: <4FFD27A1.9000008@freescale.com>
Date: Wed, 11 Jul 2012 15:13:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-59M6UCW91QS0_ZKzBO-HUyXrUXcmW3avOd8=4CmE4Fg@mail.gmail.com>
In-Reply-To: <CAN8TOE-59M6UCW91QS0_ZKzBO-HUyXrUXcmW3avOd8=4CmE4Fg@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, dedekind1@gmail.com, Jan Weitzel <j.weitzel@phytec.de>,
 =?windows-1252?Q?Marek_Va=9Aut?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian:
> Wood [1]; I don't see a good reason not to just kill the
> NAND_CHIPOPTIONS_MSK instead of adding more flags. As long as we
> perform a few sanity tests, I think it'd be safe.
>
I think it's more clear in logic to add this new macro:
    The NAND_NO_SUBPAGE_WRITE can be used only by the MLC nands which do 
no support the subpage write;
    The NAND_CONTROLLER_NO_SUBPAGE_WRITE only used by the nand 
controller such as gpmi nand.

But I will be happy if you submit a patch to fix this issue by removing 
the NAND_CHIPOPTIONS_MSK.

thanks
Huang Shijie
