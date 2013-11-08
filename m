Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VecfY-0001Wo-6y
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 03:23:37 +0000
Message-ID: <527C59E4.9080902@freescale.com>
Date: Fri, 8 Nov 2013 11:26:28 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: only scan two chips for imx6
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>	<1383817597-31992-2-git-send-email-b32955@freescale.com>
 <CAOMZO5AohNc7Z41AApMHugsApQxS3J+1jUZyFrjjAJ8PXuB_aQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AohNc7Z41AApMHugsApQxS3J+1jUZyFrjjAJ8PXuB_aQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8807=E6=97=A5 21:22, Fabio Estevam =E5=86=
=99=E9=81=93:
> On Thu, Nov 7, 2013 at 7:46 AM, Huang Shijie<b32955@freescale.com>  wro=
te:
>> We cannot scan two chips for imx23 and imx28:
>>    imx23: the Ready-Busy1 line is not connected for some board.
>>    imx28: we do not set the pinctrl for Ready-Busy1
>>
>> So we only scan two chips for imx6.
> What happens if Ready-Busy1 line is not connected on some mx6 board?
> You cannot assume that all boards
we will meet a DMA timeout.

All the imx6's boards supporting the gpmi have the RB1 now.
the customer's boards will follow our boards, so their boards also=20
should have the RB1 line too.

> have this line connected and configured in pinctrl just like you
> mentioned for mx23 and mx28.
Please check the schematics for imx23/imx28/imx6x.
For imx6, the line is OR-combined with the RB0.
For imx23-evk,imx28-evk, the RB1 line is a seperate line, not OR with=20
the RB0.
     and the pinctrls does not have RB1.

thanks
Huang Shijie
