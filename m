Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEc03-0005Ro-RW
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 09:25:17 +0000
Message-ID: <521DC22F.4060206@freescale.com>
Date: Wed, 28 Aug 2013 17:26:07 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com>
In-Reply-To: <521DA6B3.9080003@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8828=E6=97=A5 15:28, Brian Norris =E5=86=99=
=E9=81=93:
> There is an alternative: that we don't pass MTD_MLCNANDFLASH through=20
> to user-space (we intercept it and change it to MTD_NANDFLASH in=20
> ioctl(MEMGETINFO)), and it just appears as "nand" in the sysfs 'type'=20
> entry. I'm not saying we should do that--I think it's useful to know=20
> SLC vs. MLC in user-space--but I am saying that we need a proper=20
> justification. So far I'm the only one who has explained why=20
> user-space needs this...=20
There is another issue if we hack the ioctl(MEMGETINFO):
      The "flash_eraseall --jffs2" can writes the marker even it is a=20
MLC nand, since the flash_eraseall
regards the MLC as the SLC.

thanks
Huang Shijie
