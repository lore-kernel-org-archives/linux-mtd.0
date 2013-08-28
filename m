Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEVk4-00054X-TK
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 02:44:21 +0000
Message-ID: <521D6434.3020604@freescale.com>
Date: Wed, 28 Aug 2013 10:45:08 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: rename the cellinfo to bits_per_cell
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-2-git-send-email-b32955@freescale.com>
 <521CDD97.6070203@gmail.com> <521D6382.2080403@gmail.com>
In-Reply-To: <521D6382.2080403@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Vikram Narayanan <vikram186@gmail.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8828=E6=97=A5 10:42, Brian Norris =E5=86=99=
=E9=81=93:
> Or, I guess it's helpful to first add the nand_is_slc() helper in one=20
> patch (using the existing 'cellinfo' field), then introduce the simple=20
> patch to change 'cellinfo' to 'bits_per_cell'. Maybe that's what you=20
> were recommending?=20
I ever thought of this method, but it will add more patches.

thanks
Huang Shijie
