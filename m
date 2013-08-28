Received: from mail-db8lp0188.outbound.messaging.microsoft.com
 ([213.199.154.188] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEVL3-0004Yv-Md
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 02:18:31 +0000
Message-ID: <521D5E20.5030007@freescale.com>
Date: Wed, 28 Aug 2013 10:19:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH V2 2/4] mtd: gpmi: use DMA channel 0 for all the nand chips
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
 <1377595747-21033-3-git-send-email-b32955@freescale.com>
 <521CDC55.60602@gmail.com>
In-Reply-To: <521CDC55.60602@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8828=E6=97=A5 01:05, Vikram Narayanan =E5=
=86=99=E9=81=93:
> IIRC, We have 4 DMA channels. Don't we?=20
yes, we have. But we only have one gpmi.

I ever tried to use different dma channels for different chip selects.
But after discussed with our IC guy, it is proved to be meaningless.
We only have one gpmi, and so we only have one data bus. Even we have 4=20
dma channels
, we have to do the DMA operations one by one.



thanks
Huang Shijie
