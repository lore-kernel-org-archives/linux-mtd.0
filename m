Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V94DV-00031U-6S
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 02:20:14 +0000
Message-ID: <520997F3.4010202@freescale.com>
Date: Tue, 13 Aug 2013 10:20:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 08/10] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-9-git-send-email-b32955@freescale.com>
 <20130813010502.GF7267@brian-ubuntu>
In-Reply-To: <20130813010502.GF7267@brian-ubuntu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8813=E6=97=A5 09:05, Brian Norris =E5=86=99=
=E9=81=93:
> The current convention uses lower-case, single-word names. And your
> selection isn't very consistent with the SLC NAND case (but I see that
> you're trying to change the SLC NAND case). I'd go with "mlc-nand" or
> just "mlc".
>
> But more importantly, this is probably a break in ABI. At a minimum,
> this needs documentation here in Documentation/ABI. I know tools which
> currently check only for "nand", and if the name suddely becomes
> different for MLC, that is a breakage.
thanks for pointing this. If the tool may check the "nand", I prefer to=20
do not change the ABI.

> But really, does user-space need to know SLC vs. MLC? If so, this needs
I expose it to user-space only for mtd-info.
But if these two patches will break current tools (not the mtd-info), i
will abandon these two patches.

thanks
Huang Shijie


> a clear argument for why in the patch description. Perhaps to
> differentiate whether or not JFFS2 support is even possible? I'm not
> opposed to adding a new name, especially since the MTD_MLCNANDFLASH
> macro has existed in mtd/mtd-abi.h for a long time (but it was rotten).
> Just do it sensibly (i.e., better name string, proper ABI documentation
> inlcuded in this patch, explain the reason for the ABI addition in this
> patch, etc.).
