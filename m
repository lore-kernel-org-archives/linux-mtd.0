Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVyyI-0004QY-NW
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2012 06:18:43 +0000
Message-ID: <5099FE29.1010400@freescale.com>
Date: Wed, 7 Nov 2012 14:22:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH] mtd nand : print flash size during detection
References: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B411=E6=9C=8806=E6=97=A5 19:03, Matthieu CASTET =E5=86=
=99=E9=81=93:
> This help to detect bad flash identification in case the size is not pr=
esent
> on the name (ONFI).
>
I think you should give us a example of "bad flash identification".

I also want to add this patch to print out the flash size during=20
detection, but not for the "bad flash identification" reason,

Best Regards
Huang Shijie
