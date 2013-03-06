Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD3ui-0006AV-0S
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 02:17:05 +0000
Message-ID: <5136A737.2090701@freescale.com>
Date: Wed, 6 Mar 2013 10:17:27 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>	
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>	
 <CAMiH66GvpQZ36wLvB_cyiSk79sPPJ+vBKba1Z6WZvi5UD4X=2g@mail.gmail.com>	
 <1362480128.2943.51.camel@sauron>	
 <CAMiH66EZ_grVAWa99rZoLdq1cQGbr3FrBt2SdKb8UNND96YbFw@mail.gmail.com>
 <1362495303.2943.56.camel@sauron>
In-Reply-To: <1362495303.2943.56.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8805=E6=97=A5 22:55, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Tue, 2013-03-05 at 22:36 +0800, Huang Shijie wrote:
>>>> We can add a new helper like compare_nand_with_devid() to remove the
>>>> mfr_id and dev_id, only left the id[8].
>>> Huang, did you miss the "union { ... }" part or you think using 'id[N=
]'
>>> directly is readable enough?
>> =EF=BD=89=E3=80=80=EF=BD=94=EF=BD=88=EF=BD=89=EF=BD=8E=EF=BD=8B=E3=80=80=
=EF=BD=95=EF=BD=93=EF=BD=89=EF=BD=8E=EF=BD=87=E3=80=80=EF=BD=94=EF=BD=88=EF=
=BD=85=E3=80=80=EF=BD=89=EF=BD=84=EF=BC=BB=EF=BC=BD=E3=80=80=EF=BD=89=EF=BD=
=93=E3=80=80=EF=BD=85=EF=BD=8E=EF=BD=8F=EF=BD=95=EF=BD=87=EF=BD=88=EF=BC=8E
>> =EF=BD=94=EF=BD=88=EF=BD=85=E3=80=80=EF=BD=95=EF=BD=8E=EF=BD=89=EF=BD=8F=
=EF=BD=8E=E3=80=80=EF=BD=89=EF=BD=93=E3=80=80=EF=BD=92=EF=BD=85=EF=BD=84=EF=
=BD=95=EF=BD=8E=EF=BD=84=EF=BD=81=EF=BD=8E=EF=BD=94=EF=BC=8E
> I just find 'type->dev_id' more readable than 'type->id[1]'...
Just a suggestion, add more comments to the code will also make it readab=
le.

But it's ok to me if you keep the union.

thanks
Huang Shijie
