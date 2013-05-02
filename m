Received: from mail-db8lp0187.outbound.messaging.microsoft.com
 ([213.199.154.187] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXjE8-0008Az-U8
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 02:26:34 +0000
Message-ID: <5181CF32.1090502@freescale.com>
Date: Thu, 2 May 2013 10:28:02 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
References: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
In-Reply-To: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8801=E6=97=A5 07:39, David Mosberger-Tang=
 =E5=86=99=E9=81=93:
> The attached patch is relative to linux-mtd.  It fixes a problem with
> NAND-chips that are ONFI-compliant but don't support the SET/GET
> FEATURES commands (such as Spansion S34Mx).
>
good catch.

but could you check your patch with scripts/checkpatch.pl , and then
send out this patch?

thanks
Huang Shijie
