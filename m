Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfnmP-0001ka-Hu
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 09:27:34 +0000
Message-ID: <5280A3AC.4020305@freescale.com>
Date: Mon, 11 Nov 2013 17:30:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: fix the NULL pointer
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <20131108175119.GA20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, stable@vger.kernel.org,
 festevam@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8809=E6=97=A5 01:51, Brian Norris =E5=86=99=
=E9=81=93:
> Thanks for looking into this quickly, BTW.
this patch is not good, it uses the data in the stack to do the DMA=20
transfer.

I will send a new patch to fix this NULL issue.

thanks
Huang Shijie
