Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEurq-0001C3-8a
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 05:34:02 +0000
Message-ID: <521EDD7F.2010103@freescale.com>
Date: Thu, 29 Aug 2013 13:34:55 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com> <20130829012403.GA4254@gmail.com>
 <521ED69F.5080203@gmail.com>
In-Reply-To: <521ED69F.5080203@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8829=E6=97=A5 13:05, Brian Norris =E5=86=99=
=E9=81=93:
> This patch (patch 6) changes the mtd->type for MLC NAND. And mtd->type=20
> is exposed to user-space via ioctl(MEMGETINFO), and (as of this=20
> patch), it is exposed as "unknown" in sysfs.
thanks.

this patch changes the mtd->type for the jffs2, and the jffs2 can uses=20
the mtd->type to do the sanity check.

If without this patch, how the jffs2 can distinguish a SLC or a MLC?

Huang Shijie
