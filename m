Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEW7x-0005TV-Bu
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 03:09:01 +0000
Message-ID: <521D6A02.2030401@freescale.com>
Date: Wed, 28 Aug 2013 11:09:54 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: rename the cellinfo to bits_per_cell
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-2-git-send-email-b32955@freescale.com>
 <521CDD97.6070203@gmail.com> <521D6382.2080403@gmail.com>
 <521D6434.3020604@freescale.com> <521D64ED.5090109@gmail.com> <521D662C
 <521D6853.20109@gmail.com>
In-Reply-To: <521D6853.20109@gmail.com>
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

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8828=E6=97=A5 11:02, Brian Norris =E5=86=99=
=E9=81=93:
> Not if you "first add the nand_is_slc() helper in one patch (using the=20
> existing 'cellinfo' field), then introduce the simple patch to change=20
> 'cellinfo' to 'bits_per_cell'"
ok. I will re-arange this patch set.

thanks
Huang Shijie
