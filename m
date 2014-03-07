Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLph2-00057t-3z
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:59:46 +0000
Message-ID: <53197C8D.3010604@freescale.com>
Date: Fri, 7 Mar 2014 16:00:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 2/3] mtd: nand: add new parsing rule for Hynix's
 H27UBG8T2CTR
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
 <1388736518-5934-3-git-send-email-b32955@freescale.com>
 <20140307074657.GF31517@norris-Latitude-E6410>
In-Reply-To: <20140307074657.GF31517@norris-Latitude-E6410>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8807=E6=97=A5 15:46, Brian Norris =E5=86=99=
=E9=81=93:
> Are you sure you need to use the device ID (0xD7)? It's best if we don'=
t
> have to constrain ourselves to particular flash sizes here... Are there
> Hynix MLC that don't follow the id_data[5] pattern for differentiating
> technology types (>20nm vs<=3D20nm)? I'll have to check my datasheets
> when I get back in the office.
>
The H27UCG8T2ATR is also a 20nm chip whose device ID is 0xDE. Its=20
id_data[5] is 0xc4.
But it also use the old parsing rule: the page size is the multiple of 2K=
.

that's why i checked the device ID.

thanks
Huang Shijie
