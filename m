Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUTGh-0006JS-F9
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 02:47:43 +0000
Message-ID: <5175F6B0.1080907@freescale.com>
Date: Tue, 23 Apr 2013 10:49:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: add a helper to get the supported features
 for ONFI nand
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>	<1366616878-29481-3-git-send-email-b32955@freescale.com>
 <CAN8TOE8EwK1iaDOjBPpUhQmzn=AK-2LufufwwMON6gf=-zZa+Q@mail.gmail.com>
In-Reply-To: <CAN8TOE8EwK1iaDOjBPpUhQmzn=AK-2LufufwwMON6gf=-zZa+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8823=E6=97=A5 05:04, Brian Norris =E5=86=99=
=E9=81=93:
> return chip->onfi_version ? le16_to_cpu(chip->onfi_params.features) : 0=
;
it's ok to me. I will use 0 as the unknow feature in the next version.

thanks
Huang Shijie
