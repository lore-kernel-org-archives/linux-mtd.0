Received: from mail-db8lp0189.outbound.messaging.microsoft.com
 ([213.199.154.189] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY65f-0006JI-BI
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 02:51:20 +0000
Message-ID: <51832685.8030503@freescale.com>
Date: Fri, 3 May 2013 10:52:53 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V4 4/9] mtd: get the ECC info from the Extended Parameter
 Page
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>	<1366967337-5534-5-git-send-email-b32955@freescale.com>
 <CAN8TOE8NnbDTvLPyi5=dciLmLBP2EfSpvYN1GLscy+L0roP6jw@mail.gmail.com>
In-Reply-To: <CAN8TOE8NnbDTvLPyi5=dciLmLBP2EfSpvYN1GLscy+L0roP6jw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, "Gupta,
 Pekon" <pekon@ti.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8803=E6=97=A5 07:39, Brian Norris =E5=86=99=
=E9=81=93:
> only run the extended parameter page function after that point.
sorry, I prefer to run the extended parameter page function here just=20
following the case
"p-> ecc_bits !=3D 0xff". IMHO, the two cases should be put together as=20
the onfi spec tells, rather be split out
far away. The extended parameter page function is just the case=20
"p->ecc_bits =3D=3D 0xff".

If we put the nand_flash_detect_ext_param_page() after the point we=20
reassign the chip->cmdfunc,
It's a little discrete in logic which makes the code not compact enough.

btw: Could you check you email client? I failed several times for the=20
HTML issue.

thanks
Huang Shijie
