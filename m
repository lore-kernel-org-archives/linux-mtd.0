Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD6xS-0004yS-9M
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 05:32:07 +0000
Message-ID: <5136D4EE.2020806@freescale.com>
Date: Wed, 6 Mar 2013 13:32:30 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>	
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>	
 <CAN8TOE_Sb-h7zTp4rUCrx5e0rZHg44iDMM5_zKsgHQORXf3B0g@mail.gmail.com>
 <1362479827.2943.49.camel@sauron>
In-Reply-To: <1362479827.2943.49.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8805=E6=97=A5 18:37, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> I was thinking about
>
> if (type->mfr_id =3D=3D 0)
> 	/* this is device-only ID */
> else
> 	/* this is full ID */
>
> or
>
> static inline bool is_full_nand_id(type) {
> 	return type->mfr_id;
> }
okay. If you think we should not add another table for the full-id nand.
I will follow your advice.

thanks
Huang Shijie
