Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVFnm-0001O3-3U
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 06:37:06 +0000
Message-ID: <5178CF71.8010302@freescale.com>
Date: Thu, 25 Apr 2013 14:38:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V3 4/9] mtd: get the ECC info from the Extended Parameter
 Page
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>	<1366707297-31309-5-git-send-email-b32955@freescale.com>
 <CAN8TOE-yrawXsZzUX-SfNq+COJsRfPNJZJiJBZ=e7uavBPis5g@mail.gmail.com>
In-Reply-To: <CAN8TOE-yrawXsZzUX-SfNq+COJsRfPNJZJiJBZ=e7uavBPis5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8825=E6=97=A5 14:20, Brian Norris =E5=86=99=
=E9=81=93:
> No, you cannot do this. Some drivers will provide their own cmdfunc,
> so nand_command_lp() is unexpected for those drivers.
ok. got it.
> Your problem seems, instead, that you are executing this function too
> early, before nand_flash_get_type() is able to assign
yes. This is just the case i meet.
> nand_command_lp() to be your cmdfunc. You might just want to call this
> function after the following lines in nand_flash_get_type():
>
>          /* Do not replace user supplied command function! */
>          if (mtd->writesize>  512&&  chip->cmdfunc =3D=3D nand_command)
>                  chip->cmdfunc =3D nand_command_lp;
>
I will send a fix patch about this patch.

thanks
Huang Shijie
