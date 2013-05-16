Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uco5C-0005hM-4S
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 02:38:18 +0000
Message-ID: <5194470D.9040902@freescale.com>
Date: Thu, 16 May 2013 10:40:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH v5 09/11] mtd: parse out the ECC info for the full-id
 nand chips
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-10-git-send-email-b32955@freescale.com>
 <5193BDAA.8040909@gmail.com>
In-Reply-To: <5193BDAA.8040909@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8816=E6=97=A5 00:54, Vikram Narayanan =E5=
=86=99=E9=81=93:
> Does all NAND chips define this? I mean the patch 10/11 "mtd: add the=20
> ecc info for some full-id nand chips". What does the above result for=20
> the other chips? Does it get populated at runtime?=20
it does not influence other nand , except the full-id nand case.

yes, it gets populated at runtime.

thanks
Huang Shijie
